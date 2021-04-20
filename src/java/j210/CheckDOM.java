
package j210;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "CheckDOM", urlPatterns = {"/CheckDOM"})
public class CheckDOM extends HttpServlet {


    protected void processRequest(HttpServletRequest request, HttpServletResponse response)            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        
        HttpSession session = request.getSession();
        
        String domButton = request.getParameter("DOMbutton");
        String findDOM = request.getParameter("findDOM");
        String previousFindDOM = (String)session.getAttribute("previousFindDOM");
        Integer testCounterDOM = (Integer)session.getAttribute("testCounterDOM");
        Boolean hasChangedDOM = (Boolean)session.getAttribute("hasChangedDOM");
        
        if("".equals(previousFindDOM)){
            previousFindDOM = findDOM;
        }
        
        if(!findDOM.equals(previousFindDOM)){
            hasChangedDOM = true;
            previousFindDOM = findDOM;
        }else{
            hasChangedDOM = false;
        }
        
        session.setAttribute("previousFindDOM", previousFindDOM);
        
        List<User> list = DemoDOM.parseXMLByDOM();
        
        if(hasChangedDOM){
            testCounterDOM = 0;
            hasChangedDOM = false;
        }
        
        session.setAttribute("hasChangedDOM", hasChangedDOM);
        
        if(testCounterDOM >= 0){
            testCounterDOM++;
        }
        if(testCounterDOM > list.size()){
            testCounterDOM = -1;
        }

        session.setAttribute("testCounterDOM", testCounterDOM);

        if(domButton != null){
            if(findDOM != null){
                    //findDOM это id, role, title, first-name, family, department;
                    switch(findDOM){
                        case "role":
                            //for()
                            System.out.println("case role сработал!!!");
                            request.setAttribute("fd", "role");
                            break;
                        case "first-name":
                            System.out.println("case first-name сработал!!!");
                            request.setAttribute("fd", "first-name");
                            break;
                        case "family":
                            System.out.println("case family сработал!!!");
                            request.setAttribute("fd", "family");
                            break;
                        case "department":
                            System.out.println("case department сработал!!!");
                            request.setAttribute("fd", "department");
                            break;
                        case "title":
                            System.out.println("case title сработал!!!");
                            request.setAttribute("fd", "title");
                            break;
                        default:
                            System.out.println("case default сработал!!!");
                            request.setAttribute("fd", "");
                    }
            }
            else{
                System.out.println("class CheckDOM: findDOM = null");
            }
        }
        else{
            System.out.println("class CheckDOM: domButton = null");
        }

        request.setAttribute("list", list);
        request.getRequestDispatcher("index.jsp").forward(request, response);
        
        
//        try (PrintWriter out = response.getWriter()) {
//            /* TODO output your page here. You may use following sample code. */
//            out.println("<!DOCTYPE html>");
//            out.println("<html>");
//            out.println("<head>");
//            out.println("<title>Servlet CheckDOM</title>");            
//            out.println("</head>");
//            out.println("<body>");
//            out.println("<h1>Servlet CheckDOM at " + request.getContextPath() + "</h1>");
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
