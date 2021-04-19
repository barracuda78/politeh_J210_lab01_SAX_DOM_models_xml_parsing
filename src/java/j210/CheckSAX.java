
package j210;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

//Вариант усложнения задания в Лабораторной № 1 :
//При нажатии на кнопку "Искать", например, для поля "role" (все равно, ищете ли Вы через SAX или DOM) на этой же странице под формами должно появляться:
//Найдено значение "manager" поля "role" для пользователя "Иванов"
//При этом искомое поле "role" должно сохраняться в форме, и при повторном нажатии кнопки "Искать" внизу уже должно выводиться 2 строки:
//Найдено значение "manager" поля "role" для пользователя "Иванов"
//Найдено значение "admin" поля "role" для пользователя "Петров"
//После 3-го нажатия - три строки, а после 4-го и более в конце после найденных значений должно быть написано (это для трех пользователей в файле, для другого числа пользователей тоже должны выводиться все значения)
//Больше значений поля "role" не найдено
//При изменении слова для поиска в форме старая найденная информация должна удаляться, а новая информация должна выводиться по той же схеме при повторных нажатиях.

@WebServlet(name = "CheckSAX", urlPatterns = {"/CheckSAX"})
public class CheckSAX extends HttpServlet {
    
    private int counter;
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        
        String saxButton = request.getParameter("SAXbutton");
        String findSAX = request.getParameter("findSAX");
        Integer counter = (Integer)request.getAttribute("counter");
        


        List<User> list = DemoSAX.parseXMLBySAX();
        //--------------------
        HttpSession session = request.getSession();
        Integer testCounter = (Integer)session.getAttribute("testCounter");
        if(testCounter >= 0){
            testCounter++;
        }
        if(testCounter > list.size()){
            testCounter = -1;
        }
        session.setAttribute("testCounter", testCounter);
        //--------------------
        
        if(saxButton != null){
            if(findSAX != null){
                //findSAX это id, role, title, first-name, family, department;
                switch(findSAX){
                    case "role":
                        //for()
                        System.out.println("case role сработал!!!");
                        request.setAttribute("fs", "role");
                        request.setAttribute("counter", counter);
                }
            }
            else{
                System.out.println("class CheckSAX: findSAX = null");
            }
        }
        else{
            System.out.println("class CheckSAX: saxButton = null");
        }
        
        
        request.setAttribute("list", list);
        request.getRequestDispatcher("index.jsp").forward(request, response);
        
        
        
        
//        try (PrintWriter out = response.getWriter()) {
//            /* TODO output your page here. You may use following sample code. */
//            out.println("<!DOCTYPE html>");
//            out.println("<html>");
//            out.println("<head>");
//            out.println("<title>Servlet CheckSAX</title>");            
//            out.println("</head>");
//            out.println("<body>");
//            out.println("<h1>Servlet CheckSAX at " + request.getContextPath() + "</h1>");
//            out.println("</body>");
//            out.println("</html>");
//        }
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
