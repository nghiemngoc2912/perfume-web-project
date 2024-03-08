<%-- 
    Document   : login
    Created on : May 29, 2023, 11:01:57 AM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="en">
    <head>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>Add perfume</title>
        <script src="https://kit.fontawesome.com/48a04e355d.js" crossorigin="anonymous"></script>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
        <link href="css/style.css" rel="stylesheet">
    </head>
    <body>
        <jsp:include page="template/adminheader.jsp"/>
        <section class="h-100 gradient-form" style="background-color: #eee;">
            <div class="container py-5 h-100">
                <div class="row d-flex justify-content-center align-items-center h-100">
                    <div class="col-xl-10">
                        <div class="card rounded-3 text-black">
                            <div class="row g-0">
                                <div class="col-lg-3"></div>
                                <div class="col-lg-6">
                                    <div class="card-body p-md-5 mx-md-4">
                                        <div class="text-center">
                                            <img src="images/logo.jpg"
                                                 style="width: 20%;" alt="logo" class="logo">
                                            <h4 class="mt-1 mb-5 pb-1">We are PerfumePod</h4>
                                        </div>

                                        <div class="container" id="container">
                                            <div class="form-container sign-in">
                                                <form enctype="multipart/form-data" action="addperfume" method="post">
                                                    <h1 style="font-size: 150%">Adding Perfume</h1>
                                                    <div class="form-outline mb-4">
                                                        <input type="text" class="form-control" name="name" placeholder="Name" required id="name">
                                                    </div>
                                                    <div class="form-outline mb-4">
                                                        Quantity: <br/><input type="number" name="quantity" min="0"  required/>
                                                    </div>
                                                    <div class="form-outline mb-4">
                                                        Size(ml): <br/><input type="number" min="0" name="size" required/>
                                                    </div>
                                                    <div class="form-outline mb-4">
                                                        Price($): <br/><input type="number" min="0" name="price" required/>
                                                    </div>
                                                    <div class="form-outline mb-4">
                                                        <label class="col-sm-4 control-label">Category</label>
                                                        <select name="cid">
                                                            <c:forEach items="${sessionScope.listC}" var="c">
                                                                <option value="${c.id}">${c.name}</option>
                                                            </c:forEach>
                                                        </select>
                                                    </div>

                                                    <div class="form-outline mb-4">
                                                        <label class="col-sm-4 control-label">Brand</label>
                                                        <select name="bid">
                                                            <c:forEach items="${sessionScope.listB}" var="b">
                                                                <option value="${b.id}">${b.name}</option>
                                                            </c:forEach>
                                                        </select>
                                                    </div>
                                                    <div class="form-outline mb-4">
                                                        Release Date:
                                                        <input type="date" name="releaseDate"/>
                                                    </div>
                                                    <div class="form-outline mb-4">
                                                        <label for="image">Select a file:</label>
                                                        <input type="file" id="image" name="image" accept=".jpg" required  multiple><br>
                                                    </div>
                                                    <div class="text-center pt-1 mb-5 pb-1">
                                                        <button class="btn btn-primary btn-block fa-lg gradient-custom-2 mb-3" type="submit">
                                                            Add</button><br/>
                                                        <span style="color: red;">${requestScope.ms}</span>
                                                    </div>
                                                </form>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <jsp:include page="template/footer.jsp"/>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
    </body>
</html>
