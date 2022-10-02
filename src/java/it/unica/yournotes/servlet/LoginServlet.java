/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package it.unica.yournotes.servlet;

import it.unica.yournotes.exceptions.InvalidParamException;
import it.unica.yournotes.model.Utente;
import it.unica.yournotes.model.UtenteFactory;
import it.unica.yournotes.utils.Utils;
import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author gabriele
 */
@WebServlet(name = "LoginServlet", urlPatterns = {"/login"})
public class LoginServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     * @throws it.unica.yournotes.exceptions.InvalidParamException
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, InvalidParamException {

        response.setContentType("text/html;charset=UTF-8");

        //crea una nuova sessione se non esiste, altrimenti recupera la vecchia
        HttpSession session = request.getSession();

        //salviamo i parametri inviati nella richiesta username e password
        String user = request.getParameter("user");
        String psw = request.getParameter("pass");

        try {
            //validazione dei parametri
            Utils.checkString("username", user, 5, 20);
            Utils.checkString("password", psw, 5, 20);

            Utente utente = UtenteFactory.getInstance().getUserByUserAndPsw(user, psw);

            //se questi parametri coincidono con uno degli user presenti
            if (utente != null) {
                //salviamo gli attributi nella sessione
                session.setAttribute("username", utente.getUsername());
                session.setAttribute("firstname", utente.getNome());
                session.setAttribute("cognome", utente.getCognome());
                session.setAttribute("email", utente.getEmail());
                session.setAttribute("citta", utente.getCitta());

                //un minuto di inattività prima che la sessione venga invalidata
                session.setMaxInactiveInterval(60 * 5);

                //redirect alla servlet che prende i prodotti caricati da questo utente
                //e che reindirizza alla pagina area personale
                response.sendRedirect("getProductsByUser");
            } else {
                throw new InvalidParamException("Errore, username o password non validi");
            }
        } catch (InvalidParamException e) {
            //se il login non va a buon fine invalidiamo la sessione
            session.invalidate();

            //salviamo degli attributi nella richiesta
            request.setAttribute("errMsg", e.getMessage());
            request.setAttribute("link", "login.jsp");
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
        try {
            processRequest(request, response);
        } catch (InvalidParamException ex) {
            Logger.getLogger(LoginServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
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
        try {
            processRequest(request, response);
        } catch (InvalidParamException ex) {
            Logger.getLogger(LoginServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
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
