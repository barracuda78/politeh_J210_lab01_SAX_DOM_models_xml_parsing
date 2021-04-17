<%-- 
    Document   : index
    Created on : Apr 17, 2021, 10:12:23 AM
    Author     : ENVY
--%>

<%@page import="java.util.List"%>
<%@page import="j210.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>J210 LAB</title>
    </head>
    <body>
        <h1>Index.jsp</h1>

        <form action="CheckSAX">
            <p>
                Введите поле для поиска с помощью SAX:
                <input type="text" name="findSAX" value="" />
                <input type="submit" value="Искать" name="SAXbutton" />
            </p>
        </form>
        
        <form action="CheckDOM">
            <p>
                Введите поле для поиска с помощью DOM:
                <input type="text" name="findDOM" value="" />
                <input type="submit" value="Искать" name="DOMbutton" />
            </p>
        </form>
        
        <%
        List<User> list = (List<User>)request.getAttribute("list");
        if(list != null){ %>
        <ul>
        <%for(User u : list){ %>
                
         <%= "<li>" + u.toString() %>"      
         <%}%>
         </ul>
         <%
        }
        %>


    </body>
</html>
