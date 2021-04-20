<%@page import="java.util.List"%>
<%@page import="j210.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="css/style01.css"/>
        <title>J210 LAB</title>
    </head>
    <body>
        <header id="main-header">
            <h1>XML PARSING WEB SERVICE</h1>
        </header>
       
        <%
            Integer testCounter;
            Integer testCounterDOM;
            Boolean hasChanged = (Boolean)session.getAttribute("hasChanged");
            Boolean hasChangedDOM = (Boolean)session.getAttribute("hasChangedDOM");
            if(hasChanged == null){
                hasChanged = true;
            }
            if(hasChangedDOM == null){
                hasChangedDOM = true;
            }
            
            String previousFinfSAX = (String)session.getAttribute("previousFindSAX");
            if(previousFinfSAX == null){
                previousFinfSAX = "";
            }
            //----------DOM:------------
            String previousFinfDOM = (String)session.getAttribute("previousFindDOM");
            if(previousFinfDOM == null){
                previousFinfDOM = "";
            }
            //--------------------------
            
            testCounter = (Integer)session.getAttribute("testCounter");
            if(testCounter == null){
                testCounter = 0;
            }
            
            testCounterDOM = (Integer)session.getAttribute("testCounterDOM");
            if(testCounterDOM == null){
                testCounterDOM = 0;
            }
            
            session.setAttribute("testCounter", testCounter);
            session.setAttribute("hasChanged", hasChanged);
            session.setAttribute("previousFindSAX", previousFinfSAX);
            //----------DOM:------------
            session.setAttribute("testCounterDOM", testCounterDOM);
            session.setAttribute("hasChangedDOM", hasChangedDOM);
            session.setAttribute("previousFindDOM", previousFinfDOM);
            //--------------------------
        %>
        
              
        <%
            String fs = (String)request.getAttribute("fs");
            List<User> list = (List<User>)request.getAttribute("list");
            //----------DOM:------------
            String fd = (String)request.getAttribute("fd");
            //--------------------------
        %>
        
        <div class="container">
            <div class="box-2">
                <form action="CheckSAX">
                    <p1>
                        Введите поле для поиска с помощью SAX:
                        <%
                        if(fs == null || "".equals(fs)){
                            %>
                            <input type="text" name="findSAX" value="" class="b1"/>
                            <%
                        }else{
                            %>
                            <%= "<input type=\"text\" name=\"findSAX\" value=\"" + fs +  "\" class=\"b1\"/>"%>
                            
                            <%
                        }
                        %>
                        
                        <input type="submit" value="Искать" name="SAXbutton" class="b1"/>
                    </p1>
                </form>
                <br>

                <form action="CheckDOM">
                    <p1>
                        Введите поле для поиска с помощью DOM:
                        <%
                        if(fd == null || "".equals(fd)){
                            %>
                            <input type="text" name="findDOM" value="" class="b1"/>
                            <%
                        }else{
                            %>
                            <%= "<input type=\"text\" name=\"findDOM\" value=\"" + fd +  "\" class=\"b1\"/>"%>
                            
                            <%
                        }
                        %>                            
                        <input type="submit" value="Искать" name="DOMbutton" class="b1"/>
                    </p1>
                </form>
            </div>
        </div>
                        
        <br>                
        
        <div class="container">
            
                
        <%

        if (list != null && "role".equals(fs)) {
            %>
            <div class="box-3">
            <ul>
            <%
            for(int i = 0; i < list.size(); i++){
                if(testCounter != 0 && i == testCounter){
                    testCounter = 0;
                    break;
                }    
                User user = list.get(i);
                %>
                <li>
                <%= "Найдено значение " + user.getRole() + " поля \"" + fs + "\" для пользователя \"" + user.getFamily() + "\"" %>
                </li>
                <%
            }
            %>
            </ul>
            <%
            if(testCounter == - 1){%>
            
                <%= "<p1>Больше значений поля \"role\" не найдено</p1>" %>
                
            <%}
            %>
            </div>
            <%
        }
        %>
        
        <%
        if(list != null && "first-name".equals(fs)){

            %>
            <div class="box-3">
            <ul>
            <%
            for(int i = 0; i < list.size(); i++){
                if(testCounter != 0 && i == testCounter){
                    testCounter = 0;
                    break;
                } 
                User user = list.get(i);
                %>
                <li>
                    <%= "Найдено значение " + user.getFirstName() + " поля \"" + fs + "\" для пользователя \"" + user.getFamily() + "\"" %>
                </li>
                <%
            }
            %>
            <ul>
                
            <%
            if(testCounter == - 1){%>
            
                <%= "<p1>Больше значений поля \"first-name\" не найдено</p1>" %>
                
            <%}
            %>  
            </div>
            <%
        }
        %>
        
        <%
        if(list != null && "family".equals(fs)){

            %>
            <div class="box-3">
            <ul>
            <%
            for(int i = 0; i < list.size(); i++){
                if(testCounter != 0 && i == testCounter){
                    testCounter = 0;
                    break;
                } 
                User user = list.get(i);
                %>
                <li>
                    <%= "Найдено значение " + user.getFamily() + " поля \"" + fs + "\" для пользователя \"" + user.getFirstName() + "\"" %>
                </li>
                <%
            }
            %>
            <ul>
                
            <%
            if(testCounter == - 1){%>
            
                <%= "<p1>Больше значений поля \"family\" не найдено</p1>" %>
                
            <%}
            %>  
            </div>
            <%
        }
        %>
        
        <%
        if((list != null && "department".equals(fs)) || (list != null && "title".equals(fs))){

            %>
            <div class="box-3">
            <ul>
            <%
            for(int i = 0; i < list.size(); i++){
                if(testCounter != 0 && i == testCounter){
                    testCounter = 0;
                    break;
                } 
                User user = list.get(i);
                %>
                <li>
                    <%= "Найдено значение " + user.getDepartment() + " поля \"" + fs + "\" для пользователя \"" + user.getFamily() + "\"" %>
                </li>
                <%
            }
            %>
            <ul>
                
            <%
            if(testCounter == - 1){%>
            
                <%= "<p1>Больше значений поля \"department\" не найдено</p1>" %>
                
            <%}
            %>  
            </div>
            <%
        }
        %>
        
         <%
        if(list != null && "".equals(fs)){ %>
            <div class="box-3">
            <ul>
            <%for(User u : list){ %>

             <%= "<li>" + u.toString() %>"      
             <%}%>
             </ul>
             </div>
        <%
        }%>

      </div>
        <!--//----------DOM:----------------------------------------------------------------------------------->
                
        <%

        if (list != null && "role".equals(fd)) {
            %>
            <div class="box-3">
            <ul>
            <%
            for(int i = 0; i < list.size(); i++){
                if(testCounterDOM != 0 && i == testCounterDOM){
                    testCounterDOM = 0;
                    break;
                }    
                User user = list.get(i);
                %>
                <li>
                <%= "Найдено значение " + user.getRole() + " поля \"" + fd + "\" для пользователя \"" + user.getFamily() + "\"" %>
                </li>
                <%
            }
            %>
            </ul>
            <%
            if(testCounterDOM == - 1){%>
            
                <%= "<p1>Больше значений поля \"role\" не найдено</p1>" %>
                
            <%}
            %>
            </div>
            <%
        }
        %>
        
        <%
        if(list != null && "first-name".equals(fd)){

            %>
            <div class="box-3">
            <ul>
            <%
            for(int i = 0; i < list.size(); i++){
                if(testCounterDOM != 0 && i == testCounterDOM){
                    testCounterDOM = 0;
                    break;
                } 
                User user = list.get(i);
                %>
                <li>
                    <%= "Найдено значение " + user.getFirstName() + " поля \"" + fd + "\" для пользователя \"" + user.getFamily() + "\"" %>
                </li>
                <%
            }
            %>
            <ul>
                
            <%
            if(testCounterDOM == - 1){%>
            
                <%= "<p1>Больше значений поля \"first-name\" не найдено</p1>" %>
                
            <%}
            %>  
            </div>
            <%
        }
        %>
        
        <%
        if(list != null && "family".equals(fd)){

            %>
            <div class="box-3">
            <ul>
            <%
            for(int i = 0; i < list.size(); i++){
                if(testCounterDOM != 0 && i == testCounterDOM){
                    testCounterDOM = 0;
                    break;
                } 
                User user = list.get(i);
                %>
                <li>
                    <%= "Найдено значение " + user.getFamily() + " поля \"" + fd + "\" для пользователя \"" + user.getFirstName() + "\"" %>
                </li>
                <%
            }
            %>
            <ul>
                
            <%
            if(testCounterDOM == - 1){%>
            
                <%= "<p1>Больше значений поля \"family\" не найдено</p1>" %>
                
            <%}
            %>  
            </div>
            <%
        }
        %>
        
        <%
        if((list != null && "department".equals(fd)) || (list != null && "title".equals(fd))){

            %>
            <div class="box-3">
            <ul>
            <%
            for(int i = 0; i < list.size(); i++){
                if(testCounterDOM != 0 && i == testCounterDOM){
                    testCounterDOM = 0;
                    break;
                } 
                User user = list.get(i);
                %>
                <li>
                    <%= "Найдено значение " + user.getDepartment() + " поля \"" + fd + "\" для пользователя \"" + user.getFamily() + "\"" %>
                </li>
                <%
            }
            %>
            <ul>
                
            <%
            if(testCounterDOM == - 1){%>
            
                <%= "<p1>Больше значений поля \"department\" не найдено</p1>" %>
                
            <%}
            %>  
            </div>
            <%
        }
        %>
        
         <%
        if(list != null && "".equals(fd)){ %>
            <div class="box-3">
            <ul>
            <%for(User u : list){ %>

             <%= "<li>" + u.toString() %>"      
             <%}%>
             </ul>
             </div>
        <%
        }%>
        
        

      </div>  
        
      <!--//---------end-DOM----------------------------------------------------------------------------------->
      
        

    </body>
</html>
