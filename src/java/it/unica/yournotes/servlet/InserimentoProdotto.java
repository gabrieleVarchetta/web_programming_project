/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package it.unica.yournotes.servlet;

import it.unica.yournotes.exceptions.InvalidParamException;
import it.unica.yournotes.model.ProdottoFactory;
import it.unica.yournotes.utils.Utils;
import java.io.IOException;
import java.util.Calendar;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

/**
 *
 * @author gabriele
 */
@WebServlet(name = "InserimentoProdotto", urlPatterns = {"/inserimentoProdotto"})
@MultipartConfig
public class InserimentoProdotto extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        //cerco una sessione esistente
        HttpSession session = request.getSession(false);

        //se non esiste, rimando l'utente alla pagina del login
        if (session == null) {
            //response.sendRedirect("login.jsp");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }

        //salvataggio dei parametri della richiesta
        String name = request.getParameter("name");
        String description = request.getParameter("description");
        String price = request.getParameter("price");
        String pages = request.getParameter("pages");
        String year = request.getParameter("year");
        String size = request.getParameter("dim");
        String format = request.getParameter("format");

        //recupero l'anno corrente
        int currentYear = Calendar.getInstance().get(Calendar.YEAR);

        try {
            //se questi check passano, allora controllo se questo prodotto esiste già
            Utils.checkString("nome", name, 2, 40);
            Utils.checkString("descrizione", description, 5, 50);
            Utils.checkInteger("prezzo", price, 1, 100);
            Utils.checkInteger("numero pagine", pages, 1, 1000);
            Utils.checkInteger("anno accademico", year, 1900, currentYear);
            Utils.checkInteger("dimensione", size, 1, 150);
            Utils.checkString("formato", format, 0, 5);

            Part file = request.getPart("file");

            String path = Utils.uploadImageToServer(file);
            String relativePath = "images/";

            for (String s : path.split("/")) {
                if (s.endsWith("png") || s.endsWith("jpeg") || s.endsWith("jpg")) {
                    relativePath += s;
                }
            }

            Utils.checkString("immagine", relativePath, 0, 500);

            ProdottoFactory.getInstance().addProductToDb(name, description, price, pages, year, size, format, relativePath, session);

            //salvo nella sessione il nome del prodotto
            session.setAttribute("nome", name);

            //se tutto è andato a buon fine reindirizzo l'utente a questa pagina
            response.sendRedirect("prodotto_inserito.jsp");
        } catch (InvalidParamException e) {

            //salviamo degli attributi nella richiesta
            request.setAttribute("errMsg", e.getMessage());
            request.setAttribute("link", "insertProducts.jsp");
            request.getRequestDispatcher("error.jsp").forward(request, response);
        }

    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
