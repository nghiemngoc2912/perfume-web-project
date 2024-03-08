<%-- 
    Document   : order
    Created on : Feb 4, 2024, 3:26:45 PM
    Author     : DELL
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="dal.OrderDetailDAO"%>
<%@page import="model.OrderDetail"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Order</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://kit.fontawesome.com/48a04e355d.js" crossorigin="anonymous"></script>
        <link href="css/style.css" rel="stylesheet">
        <script type="text/javascript">

            function doDelete(id, status) {
                if (status == 'confirming' || status == 'denied') {
                    if (confirm("Are you sure to delete this item")) {
                        window.location = "removeorder?id=" + id;
                    }
                } else {
                    window.alert("Your order are confirmed!");
                }
            }
        </script>
    </head>
    <body>
        <jsp:include page="template/header.jsp"/>
        <div class="card container-fluid">
            <h1>Order</h1>
            <span>${requestScope.ms}</span>
            <div class="border-top">
                <%OrderDetailDAO odd = new OrderDetailDAO();
                request.setAttribute("odd",odd);
                %>
                <c:forEach items="${orders}" var="o">
                    <div class="row main border-bottom">
                        <div class="col-1">
                            <button class="btn px-2" onclick="doDelete('${o.id}', '${o.status}')">&#10005;</button> 
                        </div>
                        <div class="col">
                            ${o.address}
                        </div>
                        <div class="col">
                            ${o.orderdate}
                        </div>
                        <div class="col">
                            ${o.status}
                        </div>
                        <c:set var="id" value="${o.id}"/>
                        <c:set var="sum" value="${0}"/>
                        <c:forEach items="${odd.getOrderDetailsByOrderID(o.id)}" var="od">
                            <div class="row main align-items-center">
                                <div class="col-1"><img class="img-fluid" src="images/perfume/${od.getPerfume().image}"></div>
                                <div class="col">
                                    <!--<div class="row text-muted"></div>-->
                                    <div class="row">${od.getPerfume().name}</div>
                                </div>
                                <div class="col ">
                                    Quantity: ${od.quantity}
                                </div>
                                <div class="col"> ${od.total}&dollar;
                                    <c:set var="price" value="${od.total}"/> 
                                    <c:set var="sum" value="${sum+price}"/>
                                </div>
                            </div>
                        </c:forEach>
                        Total: ${sum}&dollar;
                    </div>
                </c:forEach>
            </div>
        </div>     
        <jsp:include page="template/footer.jsp"/>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
    </body>
</html>
