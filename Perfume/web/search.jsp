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

        <jsp:include page="template/header.jsp"/>
        <div class="container-fluid">
            <h1>Search result</h1>
            <span><c:if test="${requestScope.list.isEmpty()}">No product found</c:if></span>
            <hr>
                <div class="row">
                <c:forEach items="${requestScope.list}" var="item">
                    <div class="col-lg-3 col-md-4 col-sm-6">
                        <div class="card my-2 shadow-0">
                            <div class="mask" style="height: 50px;">
                                <div class="d-flex justify-content-start align-items-start h-100 m-2">
                                    <a href="productfilter?bid=${item.brand.id}" class="img-wrap">
                                        <h6><span class="badge bg-success pt-2">${item.brand.name}</span></h6>
                                    </a> 
                                </div>
                            </div>
                            <a href="itemdetail?id=${item.id}" class="img-wrap">
                                <img src="images/perfume/${item.image}" class="card-img-top" style="aspect-ratio: 1 / 1"> 
                            </a>
                            <div class="card-body p-0 pt-3" style="text-align: center">
                                <!--                                <a href="#!" class="btn btn-light border px-2 pt-2 float-end icon-hover"><i class="fas fa-heart fa-lg px-1 text-secondary"></i></a>-->
                                <h6 class="card-title">${item.name}</h6>
                                <p class="card-text mb-0">${item.price}$</p>
                                <p class="text-muted">
                                    Size: ${item.size}ml
                                </p>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </div>
        <jsp:include page="template/footer.jsp"/>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
    </body>
</html>
