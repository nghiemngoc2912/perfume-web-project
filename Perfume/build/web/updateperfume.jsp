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
        <title>Update Perfume</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://kit.fontawesome.com/48a04e355d.js" crossorigin="anonymous"></script>
        <link href="css/style.css" rel="stylesheet">
    </head>
    <body>
        <jsp:include page="template/adminheader.jsp"/>
        <div class="container-fluid">
            <form action="update_perfume?id=${item.id}" method="post">
                <div class="row main align-items-center">
                    <div class="col-4"><img class="img-fluid" src="images/perfume/${item.image}"></div>
                    <div class="col">
                        <div >
                            <input type="text" name="name" value="${item.name}" required/>
                        </div>
                        <div class="col-1">
                            Quantity: <input type="number" name="quantity" min="0" value="${item.quantity}" required/>
                        </div>
                        <div class="col-1">
                            Size(ml): <input type="number" min="0" name="size" value="${item.size}" required/>
                        </div>
                        <div class="col-1">
                            Price($): <input type="number" min="0" name="price" value="${item.price}" required/>
                        </div>
                        <div class="col-3">
                            <select name="cid">
                                <option value="${item.category.id}">${item.category.name}</option>
                                <c:forEach items="${sessionScope.listC}" var="c">
                                    <c:if test="${c.id!=item.category.id}">
                                        <option value="${c.id}">${c.name}</option>
                                    </c:if>
                                </c:forEach>
                            </select>
                        </div>
                        <div class="col-3">
                            <select name="bid">
                                <option value="${item.brand.id}">${item.brand.name}</option>
                                <c:forEach items="${sessionScope.listB}" var="b">
                                    <c:if test="${b.id!=item.brand.id}">
                                        <option value="${b.id}">${b.name}</option>
                                    </c:if>
                                </c:forEach>
                            </select>
                        </div>
                        <div class="col">
                            <!-- khong co delete vi delete se lam khach hang khong xem duoc don hang da mua -->
                            <button class="btn px-2">Update</button>
                            <button class="btn" type="reset">Reset</button>
                        </div>
                    </div>
                </div>
            </form>
            <span style="color:red">${ms}</span>
        </div>
        <jsp:include page="template/footer.jsp"/>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
    </body>
</html>
