<%-- 
    Document   : header
    Created on : Dec 30, 2023, 8:20:22 PM
    Author     : DELL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Customer Header</title>
    </head>
    <body>

        <header>
            <nav class="navbar navbar-expand-lg bg-body-tertiary">
                <div class="container-fluid">
                    <a class="navbar-brand" href="home">PerfumePod</a>
                    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                    <div class="collapse navbar-collapse" id="navbarSupportedContent">
                        <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                            <li class="nav-item">
                                <a class="nav-link" aria-current="page" href="home">Home</a>
                            </li>
                            <c:forEach items="${sessionScope.listC}" var="c">
                                <li class="nav-item">
                                    <a class="nav-link" href="searchproduct?cid=${c.id}&u=0">${c.name}</a>
                                </li>
                            </c:forEach>
                            <li class="nav-item">
                                <a class="nav-link" aria-current="page" href="viewcart">Cart</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" aria-current="page" href="order">Order</a>
                            </li>
                            <li class="nav-item" >
                                <c:if test="${sessionScope.account!=null}">
                                    <a class="nav-link" href="profile">Account</a>
                                </c:if>
                                <c:if test="${sessionScope.account==null}">
                                    <a class="nav-link" href="login">Login</a>
                                </c:if>
                            </li>
                        </ul>
                        <form class="d-flex" role="search" action="searchkeyword" method="get">
                            <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search" name="keyword">
                            <button class="btn btn-outline-success" type="submit">Search</button>
                        </form>
                    </div>
                </div>
            </nav>
        </header>
    </body>
</html>
