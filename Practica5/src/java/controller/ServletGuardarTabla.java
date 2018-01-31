/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.io.OutputStream;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.DriverManager;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
/**
 *
 * @author debianita
 */
public class ServletGuardarTabla extends HttpServlet {

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
            
        try{
            int num_filas = Integer.parseInt(request.getParameter("nfilas"));
            Integer nproy =Integer.parseInt(request.getParameter("nproy"));
            response.setContentType("text/html;charset=UTF-8"); //haremos una observacion a esto
            // Coneccion con la base de datos
            Connection conn = getDBConnection();
            // Nuestra peticion a la base de datos
            String query = "INSERT INTO meta_fisica_proyecto(numeroProyecto, tareaActividad, unidades, totales, "
                    + "mes1, mes2, mes3, mes4, mes5, mes6, mes7, mes8, mes9, mes10,"
                    + "mes11, mes12, mes13, mes14, mes15, mes16, mes17, mes18, mes19, mes20,"
                    + "mes21, mes22, mes23, mes24, mes25, mes26, mes27, mes28, mes29, mes30, mes31,"
                    + "mes32, mes33, mes34, mes35, mes36) "
                    + "VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
            
            // crear una sentencia de java
            PreparedStatement  ps;
            for(int fila=1; fila<=num_filas; fila++){
                ps = conn.prepareStatement(query);
                ps.setInt(1, nproy);
                for(int i_celda=2; i_celda<=3; i_celda++){
                    ps.setString(i_celda, request.getParameter("celda"+fila+""+(i_celda-1)));
                }
                for(int i_celda=4; i_celda<=40; i_celda++){
                    ps.setInt(i_celda, Integer.parseInt(request.getParameter("celda"+fila+""+(i_celda-1))));
                }
                ps.executeUpdate();
            }
            
            OutputStream out = response.getOutputStream();
            out.close();
        }catch(SQLException e){
            System.err.println("Tenemos una excepción ");
            System.err.println(e.getMessage());
        } catch (IOException e) {
            System.err.println("Tenemos una excepción ");
            System.err.println(e.getMessage());
        }
        
    }

    private Connection getDBConnection() {
        Connection conn = null;
        String driver = "com.mysql.jdbc.Driver";
        String url = "jdbc:mysql://localhost:3306/basepc5";
        
        try {
            Class.forName(driver);
        } catch (ClassNotFoundException e) {
            System.out.println(e.getMessage());
        }
        try {
            conn = DriverManager.getConnection(url, "root", "");
            return conn;
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return conn;
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
