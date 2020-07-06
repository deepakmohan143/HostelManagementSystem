/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;

/**
 *
 * @author Deepak
 */
public class adminservlet extends HttpServlet {

    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
//     request.getRequestDispatcher("loginjsp.jsp").include(request, response);  

        String name = request.getParameter("uname");
        String pass = request.getParameter("pname");

        if (validate.checkUser(name, pass)) {
            RequestDispatcher rd = request.getRequestDispatcher("/admin/headdrop.jsp");
            rd.forward(request, response);
        } else {
            out.print("");
            out.println("<script language=\"javascript\">");
            out.println("alert('Sorry UserName or Password Error!')");
            out.println("</script>");
            RequestDispatcher rd = request.getRequestDispatcher("loginjsp.jsp");
            rd.include(request, response);

        }
    }

}
