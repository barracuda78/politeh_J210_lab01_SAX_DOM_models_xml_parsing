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
        
        <div class="container">
            <div class="box-2">
                <form action="CheckSAX">
                    <p1>
                        Введите поле для поиска с помощью SAX:
                        <input type="text" name="findSAX" value="" class="b1"/>
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
