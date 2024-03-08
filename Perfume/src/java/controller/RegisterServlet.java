/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dal.CustomerDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 *
 * @author chi
 */
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
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet RegisterController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet RegisterController at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
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
//        processRequest(request, response);
        request.getRequestDispatcher("register.jsp").forward(request, response);
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
        // processRequest(request, response);
        try {
            String username = request.getParameter("username");
            String password = request.getParameter("password");
            String repassword = request.getParameter("repassword");
            String name = request.getParameter("cusname");
            String phone = request.getParameter("phone");
            String email = request.getParameter("email");
            CustomerDAO cdao = new CustomerDAO();
            if (cdao.getCustomerByUsername(username)!=null) {
                request.setAttribute("registerError", "Username exists. Choose another username!");
                request.getRequestDispatcher("register.jsp").forward(request, response);
                return;
            }
            if (cdao.checkEmailExist(email)) {
                request.setAttribute("registerError", "Email exists. Choose another email!");
                request.getRequestDispatcher("register.jsp").forward(request, response);
                return;
            }

            if (!password.equals(repassword)) {
                request.setAttribute("registerError", "Password and re-password are different!");
                request.getRequestDispatcher("register.jsp").forward(request, response);
                return;
            }
            if (!password.matches(".*[a-zA-Z].*") || !password.matches(".*\\d.*")) {
                request.setAttribute("registerError", "Password needs contain number and character");
                request.getRequestDispatcher("register.jsp").forward(request, response);
                return;
            }
            if (!phone.matches("[0-9]{10}")) {
                request.setAttribute("registerError", "Wrong phone format!");
                request.getRequestDispatcher("register.jsp").forward(request, response);
                return;
            }
            if (cdao.insertUser(username, password, name, phone, email)) {
                response.sendRedirect("login");
            } else {
                request.setAttribute("registerError", "Something wrong happened! Failed to create account");
                request.getRequestDispatcher("register.jsp").forward(request, response);
                return;
            }
        } catch (Exception e) {
//            request.setAttribute("mess", "Invalid input.Please Try again!");
//            request.getRequestDispatcher("register.jsp").forward(request, response);

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
