<%-- 
    Document   : perfumedetail
    Created on : Jan 13, 2024, 9:20:36 AM
    Author     : DELL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>${perfume.name}</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://kit.fontawesome.com/48a04e355d.js" crossorigin="anonymous"></script>
        <link href="css/style.css" rel="stylesheet">
    </head>
    <body>
        <jsp:include page="template/header.jsp"/>
        <div class="row container-fluid">

            <div class="col-md-5" style="text-align: center">
                <img src="images/perfume/${requestScope.perfume.image}" width="60%" alt="${requestScope.perfume.name}"/>
            </div>
            <div class="col-md-7">
                <span class="name">${perfume.name}</span><br/>
                <a href="productfilter?bid=${perfume.brand.id}">${perfume.brand.name}</a><br>
                <span>Size: ${perfume.size}ml</span><br/>
                <span>Price: ${perfume.price}$</span><br>
                Quantity:${perfume.quantity}<br/>
                Release Date: ${perfume.releaseDate}<br/>
                <a href="addcart?pid=${perfume.id}"><button class="btn btn-outline-success">Add to Cart</button></a><br/>
                <span style="color:red">${ms}</span>
            </div>
        </div>
        <jsp:include page="template/footer.jsp"/>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
    </body>
</html>
