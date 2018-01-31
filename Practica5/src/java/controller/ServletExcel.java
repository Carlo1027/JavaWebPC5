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
import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFDataFormat;
import org.apache.poi.hssf.usermodel.HSSFRichTextString;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;

/**
 *
 * @author debianita
 */
public class ServletExcel extends HttpServlet {

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
            
            int num_filas = Integer.parseInt(request.getParameter("nfilas"));
            int nproy =Integer.parseInt(request.getParameter("nproy"));
        try{
            response.setContentType("application/vnd.ms-excel");
            HSSFWorkbook wb = new HSSFWorkbook();       // crea libro
            HSSFSheet sheet = wb.createSheet("archivoProyecto"+nproy);// crea hoja
            HSSFCellStyle csInt = wb.createCellStyle();
            HSSFDataFormat df = wb.createDataFormat();
            csInt.setDataFormat(df.getFormat("0"));
            
            int num_row=0;
            int i_celda=0;
            HSSFRow row;
            HSSFCell nom;
            
            row = sheet.createRow(num_row++);
            
            nom = row.createCell(i_celda++);
            nom.setCellValue(new HSSFRichTextString("Tarea Actividad"));
            nom = row.createCell(i_celda++);
            nom.setCellValue(new HSSFRichTextString("Unidades"));
            nom = row.createCell(i_celda++);
            nom.setCellValue(new HSSFRichTextString("Totales"));
            
            for(i_celda=3; i_celda<=38; i_celda++){
                nom = row.createCell(i_celda);
                nom.setCellValue(new HSSFRichTextString("Mes"+(i_celda-2)));
            }
            
            for (int fila=1; fila<=num_filas; fila++){
                row = sheet.createRow(num_row++);
                for(i_celda=0; i_celda<=1; i_celda++){
                    nom = row.createCell(i_celda);
                    nom.setCellValue(new HSSFRichTextString(request.getParameter("celda"+fila+""+(i_celda+1))));
                }
                for(i_celda=2; i_celda<=38; i_celda++){
                    nom = row.createCell(i_celda);
                    nom.setCellValue(Integer.parseInt(request.getParameter("celda"+fila+""+(i_celda+1))));
                    nom.setCellStyle(csInt);
                }
            }
            
            OutputStream out = response.getOutputStream();
            wb.write(out);
            out.close();
        }catch(NumberFormatException e){
            System.err.println("Tenemos una excepción ");
            System.err.println(e.getMessage());
        }catch (IOException e) {
            System.err.println("Tenemos una excepción ");
            System.err.println(e.getMessage());
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
