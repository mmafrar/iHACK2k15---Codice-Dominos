<<<<<<< HEAD
/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.codicedominos.tow.controller.action;

import com.codicedominos.tow.connection.factory.ConnectionProviderFactory;
import com.codicedominos.tow.model.User;
import com.codicedominos.tow.service.UserService;
import com.codicedominos.tow.service.factory.ServiceFactory;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Asha
 */
public class UserSignIn extends HttpServlet {

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
        response.setContentType("text/html;charset=UTF-8");
        String em = request.getParameter("em");
        String pw = request.getParameter("pw");
        try (PrintWriter out = response.getWriter()) {
            Connection connection = (Connection) ConnectionProviderFactory.getConnection();
            UserService us = (UserService) ServiceFactory.getService("UserService");
            boolean userLogIn = us.userLogIn(em, pw, connection);
            if (userLogIn) {
                User u = (User) us.user(em, pw, connection);
                request.setAttribute("un", u.getUsername());
                Cookie myc = new Cookie("username", "true");
                response.addCookie(myc);
//                if (rem.equals("on")) {
//                    Cookie uc = new Cookie(em, pw);
//                    uc.setMaxAge(365 * 24 * 60 * 60); // one year
//                    response.addCookie(uc);
//
//                }
                out.print("right");
            } else {
                out.println("<h4 style='text-align:center;'>The email and password you entered don't match.</h4>");
            }
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(UserSignIn.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(UserSignIn.class.getName()).log(Level.SEVERE, null, ex);
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
=======
/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.codicedominos.tow.controller.action;

import com.codicedominos.tow.connection.factory.ConnectionProviderFactory;
import com.codicedominos.tow.model.User;
import com.codicedominos.tow.service.UserService;
import com.codicedominos.tow.service.factory.ServiceFactory;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Asha
 */
public class UserSignIn extends HttpServlet {

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
        response.setContentType("text/html;charset=UTF-8");
        String em = request.getParameter("em");
        String pw = request.getParameter("pw");
        try (PrintWriter out = response.getWriter()) {
            Connection connection = (Connection) ConnectionProviderFactory.getConnection();
            UserService us = (UserService) ServiceFactory.getService("UserService");
            boolean userLogIn = us.userLogIn(em, pw, connection);
            if (userLogIn) {
                User u = (User) us.user(em, pw, connection);
                request.setAttribute("un", u.getUsername());
                Cookie myc = new Cookie("username", "true");
                response.addCookie(myc);
//                if (rem.equals("on")) {
//                    Cookie uc = new Cookie(em, pw);
//                    uc.setMaxAge(365 * 24 * 60 * 60); // one year
//                    response.addCookie(uc);
//
//                }
                out.print("right");
            } else {
                out.println("<h4 style='text-align:center;'>The email and password you entered don't match.</h4>");
            }
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(UserSignIn.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(UserSignIn.class.getName()).log(Level.SEVERE, null, ex);
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
>>>>>>> b592174b925c384ece0f31f55557df5f7d33b354
