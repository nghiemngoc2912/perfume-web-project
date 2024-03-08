<%-- 
    Document   : cart
    Created on : Jan 19, 2024, 4:47:44 PM
    Author     : DELL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="model.Perfume"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cart</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://kit.fontawesome.com/48a04e355d.js" crossorigin="anonymous"></script>
        <link href="css/style.css" rel="stylesheet">
        <script type="text/javascript">

            function doDelete(id) {
                if (confirm("Are you sure to delete this item")) {
                    window.location = "removecartdetail?id=" + id;
                }
            }
            function increase(id, q) {
                var quantity = document.getElementById(id + 'q');
                var qu = parseInt(quantity.value) + 1;
                if (qu <= q) {
                    quantity.value = parseInt(quantity.value) + 1;
                    var formq = document.getElementById(id);
                    formq.submit();
                } else {
                    window.alert("Not enough quantity!");

                }
            }
            function decrease(id) {
                var quantity = document.getElementById(id + 'q');
                var q = parseInt(quantity.value) - 1;
                if (q == 0) {
                    doDelete(id);
                } else {
                    quantity.value = q;
                    var formq = document.getElementById(id);
                    formq.submit();
                }

            }

        </script>
    </head>

    <body>
        <jsp:include page="template/header.jsp"/>
        <div class="card">
            <div class="row">
                <div class="col-md-8 cart">
                    <div class="title">
                        <div class="row">
                            <div class="col"><h4><b>Shopping Cart</b></h4></div>
                        </div>
                    </div>
                    <span>${requestScope.ms}</span>
                    <div class="row border-top border-bottom">
                        <c:set var="sum" value="${0}"/>
                        <c:forEach items="${sessionScope.cart}" var="item">
                            <div class="row main align-items-center">
                                <div class="col-2"><img class="img-fluid" src="images/perfume/${item.getPerfume().image}"></div>
                                <div class="col">
                                    <div class="row">${item.getPerfume().name}</div>
                                </div>
                                <div class="col d-flex">
                                    <form id="${item.id}" action="updatecartdetail" class="d-flex">
                                        <input name="id" value="${item.id}" type="hidden"/>
                                        <button type="button" class="btn btn-link px-2"
                                                onclick="decrease('${item.id}');">
                                            <i class="fas fa-minus"></i>
                                        </button>
                                        <input id="${item.id}q" readonly name="quantity" value="${item.quantity}" type="number"
                                               class="form-control form-control-sm" />
                                        <button type="button" class="btn btn-link px-2"
                                                onclick="increase('${item.id}', '${item.perfume.quantity}');">
                                            <i class="fas fa-plus"></i>
                                        </button>
                                    </form>
                                </div>
                                <div class="col">&dollar; ${item.total}
                                    <c:set var="price" value="${item.total}"/> 
                                    <c:set var="sum" value="${sum+price}"/>
                                </div>
                                <div class="col">
                                    <button class="btn px-2" onclick="doDelete('${item.id}')">&#10005;</button> 
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </div>
                <div class="col-md-4 summary">
                    <div><h5><b>Summary</b></h5></div>
                    <div class="row" style="border-top: 1px solid rgba(0,0,0,.1); padding: 2vh 0;">
                        <div class="col">TOTAL PRICE</div>
                        <div class="col text-right">&dollar; ${sum}</div>
                    </div>
                    <a href="checkout"><button class="btn btn-outline-success">CHECKOUT</button></a>
                </div>
            </div>
        </div>
        <jsp:include page="template/footer.jsp"/>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
    </body>
</html>
