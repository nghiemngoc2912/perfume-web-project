<%-- 
    Document   : adminheader
    Created on : Jan 17, 2024, 7:36:09 PM
    Author     : DELL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Header</title>
    </head>
    <body>
        <header>
            <nav class="navbar navbar-expand-lg bg-body-tertiary">
                <div class="container-fluid">
                    <a class="navbar-brand" href="admin">PerfumePod</a>
                    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                    <div class="collapse navbar-collapse" id="navbarSupportedContent">
                        <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                            <li class="nav-item">
                                <a class="nav-link" aria-current="page" href="admin">Home</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="adminvieworder">Orders</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="statistic">Statistics</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" aria-current="page" href="staff">Staff</a>
                            </li>
                            <li class="nav-item dropdown">
                                <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                    Manage product
                                </a>
                                <ul class="dropdown-menu">
                                    <li><a class="dropdown-item" href="addperfume">Add perfume</a></li>
                                    <li><a class="dropdown-item" href="addbrand">Add brand</a></li>
                                </ul>
                            </li>
                            <li class="nav-item" >
                                <a class="nav-link" href="adminlogout">Log out</a>
                            </li>
                        </ul>
                        <form class="d-flex" role="search" action="adminsearchkeyword" method="get">
                            <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search" name="keyword">
                            <button class="btn btn-outline-success" type="submit">Search</button>
                        </form>
                    </div>
                </div>
            </nav>
        </header>
    </body>
</html>
