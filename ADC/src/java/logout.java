/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;  
import java.io.PrintWriter;  
   
 
  
import javax.servlet.http.HttpSession;


public class logout extends HttpServlet {

   protected void doGet(HttpServletRequest request, HttpServletResponse response)  
                                throws ServletException, IOException {  
            response.setContentType("text/html");  
            PrintWriter out=response.getWriter();  
              
            request.getRequestDispatcher("headdrop.jsp").include(request, response);  
              
            HttpSession session=request.getSession();  
            session.invalidate();  
              
            response.sendRedirect("loginjsp.jsp");    
              
            out.close();  
    }  
}
