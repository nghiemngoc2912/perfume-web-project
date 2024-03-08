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
<%@page import="model.Order"%>
<%@page import="model.Perfume"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Order</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://kit.fontawesome.com/48a04e355d.js" crossorigin="anonymous"></script>
        <link href="css/style.css" rel="stylesheet">
        <script type="text/javascript">

            function changeStatus(id, old_status, new_status) {
                if (old_status == 'denied') {
                } else if (old_status == 'complete') {
                } else if (old_status == 'confirming') {
                    if (new_status == 'denied' || new_status == 'preparing') {
                        window.location = "changeorderstatus?id=" + id + "&new_status=" + new_status;
                    }
                } else if (old_status == 'preparing') {
                    if (new_status == 'shipping') {
                        window.location = "changeorderstatus?id=" + id + "&new_status=" + new_status;
                    }
                } else {
                    if (new_status == 'complete') {
                        window.location = "changeorderstatus?id=" + id + "&new_status=" + new_status;
                    }
                }
            }
        </script>
    </head>
    <body>
        <jsp:include page="template/adminheader.jsp"/>
        <div class="card container-fluid">
            <h1>Order</h1>
            <div>
                <a href="adminvieworder"><button class="btn btn-outline-success">All</button></a>
                <a href="searchorder?status=denied"><button class="btn btn-outline-success">Denied</button></a>
                <a href="searchorder?status=confirming"><button class="btn btn-outline-success">Confirming</button></a>
                <a href="searchorder?status=preparing"><button class="btn btn-outline-success">Preparing</button></a>
                <a href="searchorder?status=shipping"><button class="btn btn-outline-success">Shipping</button></a>
                <a href="searchorder?status=complete"><button class="btn btn-outline-success">Complete</button></a>
            </div>
            <span>${requestScope.ms}</span>
            <br/>
            <div>
                <%         OrderDetailDAO od= new OrderDetailDAO();
                        request.setAttribute("od",od);
                %>
                <c:forEach items="${adminorders}" var="o">
                    <div class="col main border-top">
                        <br/>
                        <button class="btn px-2" onclick="changeStatus(${o.id}, '${o.status}', 'denied')">Denied</button> 
                        <button class="btn px-2" onclick="changeStatus(${o.id}, '${o.status}', 'preparing')">Prepare order</button>
                        <button class="btn px-2" onclick="changeStatus(${o.id}, '${o.status}', 'shipping')">Shipping</button> 
                        <button class="btn px-2" onclick="changeStatus(${o.id}, '${o.status}', 'complete')">Complete</button> 
                    </div>
                    <div class="row ">
                        <div class="col">
                            ${o.customer.username}
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
                    </div>
                    <c:set var="sum" value="0"/>
                    <c:forEach items="${od.getOrderDetailsByOrderID(o.id)}" var="item">
                        <div class="row main align-items-center">
                            <div class="col-1"><img class="img-fluid" src="images/perfume/${item.getPerfume().image}"></div>
                            <div class="col">
                                <!--<div class="row text-muted"></div>-->
                                <div class="row">${item.getPerfume().name}</div>
                            </div>
                            <div class="col ">
                                Quantity: ${item.quantity}
                            </div>
                            <div class="col"> ${item.total}&dollar;
                                <c:set var="price" value="${item.total}"/> 
                                <c:set var="sum" value="${sum+price}"/>
                            </div>
                        </div>
                    </c:forEach>
                    Total: ${sum}&dollar;

                </c:forEach>
            </div>
        </div>     
        <jsp:include page="template/footer.jsp"/>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
    </body>
</html>
