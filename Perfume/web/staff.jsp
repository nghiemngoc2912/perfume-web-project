<%-- 
    Document   : staff
    Created on : Feb 21, 2024, 8:24:09 AM
    Author     : DELL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Staff Page</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://kit.fontawesome.com/48a04e355d.js" crossorigin="anonymous"></script>
        <link href="css/style.css" rel="stylesheet">
        <script type="text/javascript">

            function doDelete(username) {
                if (confirm("Are you sure to delete this account")) {
                    window.location = "deletestaff?username=" + username;
                }
            }
            function promoted(username) {
                if (confirm("Are you sure to promote " + username)) {
                    window.location = "promotestaff?username=" + username;
                }
            }
        </script>
    </head>
    <body>
        <jsp:include page="template/adminheader.jsp"/>
        <div class="card container-fluid">
            <h1>Staff</h1>
            <a href="createstaff"><button class="btn btn-lg" style="background: #512da8;color: white;">Create Staff</button></a><br/>
            <span>${requestScope.ms}</span>
            <div class="row border-top">
                <c:forEach items="${requestScope.staffs}" var="s">
                    <div class="row main align-items-center border-bottom">
                        <div class="col">
                            <button class="btn px-2" onclick="doDelete('${s.username}')">&#10005;</button> 
                            <button class="btn px-2" onclick="promoted('${s.username}')">Promoted</button>
                        </div>
                        <div class="col">
                            ${s.username}<br/>
                        </div>
                    </div>
                </c:forEach>
            </div>     
        </div>
        <jsp:include page="template/footer.jsp"/>   
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
    </body>
</html>
