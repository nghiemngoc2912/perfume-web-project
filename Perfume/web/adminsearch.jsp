<%-- 
    Document   : home
    Created on : Jan 1, 2024, 3:57:25 PM
    Author     : DELL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>PerfumePod Search</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://kit.fontawesome.com/48a04e355d.js" crossorigin="anonymous"></script>
        <link href="css/style.css" rel="stylesheet">
    </head>
    <body>
        <jsp:include page="template/adminheader.jsp"/>
        <div class="container-fluid">
            <h1>Search result</h1>
            <span><c:if test="${requestScope.list.isEmpty()}">No product found</c:if></span>
                <hr>
                <div class="row">
                <c:forEach items="${requestScope.list}" var="item">
                    <div class="row main align-items-center">
                        <div class="col-1"><img class="img-fluid" src="images/perfume/${item.image}"></div>
                        <div class="col-2">
                            ${item.name}
                        </div>
                        <div class="col-1">
                            Quantity:${item.quantity}
                        </div>
                        <div class="col-1">
                            ${item.size}ml
                        </div>
                        <div class="col-1">
                            ${item.price}$
                        </div>
                        <div class="col-1">
                            ${item.category.name}
                        </div>
                        <div class="col-1">
                            ${item.brand.name}
                        </div>
                        <div class="col">
                            <!-- khong co delete vi delete se lam khach hang khong xem duoc don hang da mua -->
                            <a href="update_perfume?id=${item.id}"><button class="btn px-2">Update</button></a>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>
        <jsp:include page="template/footer.jsp"/>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
    </body>
</html>
