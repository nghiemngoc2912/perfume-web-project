<%-- 
    Document   : SettingProfile
    Created on : Jun 7, 2023, 1:57:02 AM
    Author     : Hoang Anh
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<head>
    <title>Profile</title>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <link href="css/style.css" rel="stylesheet">
    <script src="https://kit.fontawesome.com/48a04e355d.js" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
    <jsp:include page="template/header.jsp"/>
    <hr>

    <div class="container bootstrap snippet">
        <h1>Profile</h1>
        <a href="changepassword"><button class="btn btn-lg">Change Password</button></a>
        <a href="logout"><button class="btn btn-lg">Logout</button></a>
        <!--Form edit-->
        <div class="row">
            <div class="col-sm-9">
                <form action="profile" method="post">
                    <div class="tab-content">
                        <div class="tab-pane active" id="home">
                            <hr>
                            <div class="form-outline">
                                <div class="col-xs-6">
                                    <h4>Name</h4>
                                    <input type="text" class="form-control" name="name" value="${account.name}" placeholder="Name">
                                </div>
                            </div>
                            <div class="form-outline">
                                <div class="col-xs-6">
                                    <h4>Phone</h4>
                                    <input type="text" class="form-control" name="phone" value="${account.phone}" placeholder="Phone" >
                                </div>
                            </div>
                            <div class="form-outline">
                                <div class="col-xs-6">
                                    <h4>Email</h4>
                                    <input type="text" class="form-control" name="email" value="${account.email}"  >
                                </div>
                            </div>
                            <div class="form-outline">
                                <div class="col-xs-6">
                                    <h4>Username</h4>
                                    <input type="text" class="form-control" name="username" value="${account.username}"  >
                                </div>
                            </div>
                            <br>
                            <button class="btn btn-lg btn-success" type="submit"><i class="glyphicon glyphicon-ok-sign"></i> Save</button>
                            <button class="btn btn-lg btn-reset" type="reset"><i class="glyphicon glyphicon-repeat"></i> Reset</button>
                            <h3 style="color: red;">${mess}</h3>
                        </div><!--/tab-pane-->
                    </div><!--/tab-pane-->
                </form>


            </div>

        </div>

    </div>
    <jsp:include page="template/footer.jsp"/>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
</body>

