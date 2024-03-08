<%-- 
    Document   : statistic
    Created on : Feb 27, 2024, 10:36:36 AM
    Author     : DELL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="model.Stock"%>
<%@page import="model.Selling"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Statistic</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://kit.fontawesome.com/48a04e355d.js" crossorigin="anonymous"></script>
        <link href="css/style.css" rel="stylesheet">
        <script
        src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.4/Chart.js"></script>
    </script>
</head>
<body>
    <jsp:include page="template/adminheader.jsp"/>
    <div class="row">
        <div class="col-sm-6">
            <div class="card my-2 shadow-0">
                <div class="mask" style="height: 50px;">
                    <div class="d-flex justify-content-start align-items-start h-100 m-2">
                        Customers: ${ccount}
                    </div>
                </div>
            </div>
        </div>
        <div class="col-sm-6">
            <div class="card my-2 shadow-0">
                <div class="mask" style="height: 50px;">
                    <div class="d-flex justify-content-start align-items-start h-100 m-2">
                        Products: ${pcount}
                    </div>
                </div>
            </div>
        </div>
        <div class="col-sm-6">
            <div class="card my-2 shadow-0">
                <div class="mask" style="height: 50px;">
                    <div class="d-flex justify-content-start align-items-start h-100 m-2">
                        Complete Orders : ${ocount}
                    </div>
                </div>
            </div>
        </div>
        <div class="col-sm-6">
            <div class="card my-2 shadow-0">
                <div class="mask" style="height: 50px;">
                    <div class="d-flex justify-content-start align-items-start h-100 m-2">
                        Total earning: ${totalprice}$
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="row content">
        <canvas id="stock" style="width:100%;max-width:700px;" ></canvas>
        <canvas id="selling" style="width:100%;max-width:700px;" ></canvas>
    </div>
    <%
    // Retrieve data from request attribute
    List<Stock> stocks = (List<Stock>) request.getAttribute("stocks");
    List<Selling> sellings = (List<Selling>) request.getAttribute("sellings");
    %>
    <script>

        var quantity = [];
        var perfume_name = [];
        var totalprice = [];
        var date = [];
        const barColors = ["red", "green", "blue", "orange"];
        <% for (Stock stock : stocks) { %>
        perfume_name.push('<%= stock.getPerfume_name() %>');
        quantity.push('<%= stock.getQuantity() %>');
        <% }%>
        <% for (Selling selling : sellings) { %>
        totalprice.push('<%= selling.getTotalprice() %>');
        date.push('<%= selling.getDate() %>');
        <% }%>
        new Chart("stock", {
            type: "bar",
            data: {
                labels: perfume_name,
                datasets: [{
                        backgroundColor: barColors,
                        data: quantity
                    }]
            },
            options: {
                scales: {
                    yAxes: [{ticks: {min: 0}}]
                },
                legend: {display: false},
                title: {
                    display: true,
                    text: "Top selling perfume"
                }
            }
        });
        new Chart("selling", {
            type: "line",
            data: {
                labels: date,
                datasets: [{
                        fill: false,
                        lineTension: 0,
                        backgroundColor: "rgba(0,0,255,1.0)",
                        borderColor: "rgba(0,0,255,0.1)",
                        data: totalprice
                    }]
            },
            options: {
                scales: {
                    yAxes: [{ticks: {min: 0}}]
                },
                legend: {display: false},
                title: {
                    display: true,
                    text: "Total earning recently"
                }
            }
        });
    </script>
    <jsp:include page="template/footer.jsp"/>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
</body>
</html>
