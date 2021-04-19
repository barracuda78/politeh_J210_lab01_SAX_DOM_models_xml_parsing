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
            Boolean hasChanged = (Boolean)session.getAttribute("hasChanged");
            System.out.println("======-------hasChanged = " + hasChanged);
            if(hasChanged == null){
                hasChanged = true;
            }
            System.out.println("======-------hasChanged = " + hasChanged);
            
            String previousFinfSAX = (String)session.getAttribute("previousFindSAX");
            if(previousFinfSAX == null){
                previousFinfSAX = "";
            }
            
            testCounter = (Integer)session.getAttribute("testCounter");
            if(testCounter == null){
                testCounter = 0;
            }
            
            session.setAttribute("testCounter", testCounter);
            session.setAttribute("hasChanged", hasChanged);
            session.setAttribute("previousFindSAX", previousFinfSAX);
        %>
        
        <%= "<h1>testCounter = " + testCounter + "</h1>"%>
        
        <%
            String fs = (String)request.getAttribute("fs");
            List<User> list = (List<User>)request.getAttribute("list");
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
                        <input type="text" name="findDOM" value="" class="b1"/>
                        <input type="submit" value="Искать" name="DOMbutton" class="b1"/>
                    </p1>
                </form>
            </div>
        </div>
        


        <%

        if (list != null && "role".equals(fs)) {
            %>
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
            
            <%
        }
        %>
        
        <%
        if(list != null && "first-name".equals(fs)){

            %>
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
            
            <%
        }
        %>
        


    </body>
</html>
