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
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author gabriele
 */
@WebServlet(name = "RegisterServlet", urlPatterns = {"/register"})
public class RegisterServlet extends HttpServlet {

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

        String name = request.getParameter("firstname");
        String surname = request.getParameter("surname");
        String mail = request.getParameter("mail");
        String city = request.getParameter("city");
        String user = request.getParameter("user");
        String psw = request.getParameter("pass");

        try {
            Utils.checkString("nome", name, 2, 20);
            Utils.checkString("cognome", surname, 2, 20);
            Utils.checkString("email", mail, 10, 30);
            Utils.checkString("città", city, 4, 30);
            Utils.checkString("username", user, 5, 20);
            Utils.checkString("password", psw, 5, 20);

            if (addUser(name, surname, mail, city, user, psw)) {
                request.setAttribute("user", user);
                request.setAttribute("pass", psw);

                request.getRequestDispatcher("/login").forward(request, response);
            }

        } catch (InvalidParamException e) {
            //salviamo degli attributi nella richiesta
            request.setAttribute("errMsg", e.getMessage());
            request.setAttribute("link", "login.jsp");
            request.getRequestDispatcher("error.jsp").forward(request, response);
        }
    }

    public boolean addUser(String name, String surname, String mail, String city, String user, String psw) throws InvalidParamException {

        //se non è già presente nel db questo username
        if (!checkDuplicates(user)) {

            UtenteFactory.getInstance().addUserToDb(name, surname, mail, city, user, psw);

            return true;
        }

        throw new InvalidParamException("Questo username è già in uso, scegline un altro");
    }

    public boolean checkDuplicates(String username) {
        List<Utente> utenti = UtenteFactory.getInstance().getAllUsers();

        for (Utente u : utenti) {
            if (username.equals(u.getUsername())) {
                return true;
            }
        }

        return false;
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
