package com.codicedominos.tow.controller.action;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


import com.codicedominos.tow.connection.factory.ConnectionProviderFactory;
import com.codicedominos.tow.dao.factory.DaoFactory;
import com.codicedominos.tow.model.User;
import com.codicedominos.tow.other.CryptWithMD5;
import com.codicedominos.tow.service.UserService;
import com.codicedominos.tow.service.factory.ServiceFactory;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javafx.scene.control.Alert;
import javax.jms.ConnectionFactory;
import javax.naming.NamingException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Asha
 */
public class UserRegistration extends HttpServlet {

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
        try (PrintWriter out = response.getWriter()) {
            final int userID = 0;
            String firstName = request.getParameter("fn");
            String lastName = request.getParameter("ln");
            String sex = request.getParameter("sex");
            String email = request.getParameter("em");
            String userName = request.getParameter("un");
            String password = request.getParameter("pwd");
            String dob = request.getParameter("dob");//
            System.out.println(dob);

            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet NewServlet</title>");
            out.println("</head>");
            out.println("<body>");

            try {
                Connection connection=(Connection) ConnectionProviderFactory.getConnection();
                System.out.println("connection = " + connection);
                CryptWithMD5.cryptWithMD5(password);
                User ub = new User(userID, userName, password,  firstName, lastName, sex, email,dob);
                
                if (ub!=null) {
                    int add = DaoFactory.getDao("UserDao").add(ub, connection);
                    if (add > 0) {
                        
                        out.print("Added");
                    }
                } else {
                    request.setAttribute("em", email);
                    request.getRequestDispatcher("usersignin.jsp").forward(request, response);
                }
            } catch (SQLException | ClassNotFoundException ex) {
                ex.getMessage();
            }

           
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
