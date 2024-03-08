<%-- 
    Document   : checkoutf
    Created on : Jan 28, 2024, 10:48:34 PM
    Author     : DELL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Check-out</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://kit.fontawesome.com/48a04e355d.js" crossorigin="anonymous"></script>
        <link href="css/style.css" rel="stylesheet">
        <link rel="stylesheet" href="https://unpkg.com/leaflet/dist/leaflet.css" />
        <script src="https://unpkg.com/leaflet/dist/leaflet.js"></script>
    </head>
    <body>
        <jsp:include page="template/header.jsp"/>
        <div class=" row container d-lg-flex">
            <div class="col-md-7">
                <div class="title">
                    <div class="row">
                        <div class="col"><h4><b>Order Details</b></h4></div>
                    </div>
                </div>
                <span>${requestScope.ms}</span>
                <div class="row border-top border-bottom">
                    <c:set var="sum" value="${0}"/>
                    <c:forEach items="${sessionScope.cart}" var="item">
                        <div class="row main align-items-center">
                            <div class="col-2"><img class="img-fluid" src="images/perfume/${item.getPerfume().image}"></div>
                            <div class="col">
                                <!--<div class="row text-muted"></div>-->
                                <div class="row">${item.getPerfume().name}</div>
                            </div>
                            <div class="col d-flex">
                                <input id="${item.id}q" readonly name="quantity" value="${item.quantity}" type="number"
                                       class="form-control form-control-sm" />
                            </div>
                            <div class="col">&dollar; ${item.total}
                                <c:set var="price" value="${item.total}"/> 
                                <c:set var="sum" value="${sum+price}"/>
                            </div>

                        </div>
                    </c:forEach>
                </div>
            </div>
            <div class="col-md-5">
                <div class="box-inner-2">
                    <div>
                        <p class="fw-bold">Order Information</p>
                        <p class="dis mb-3">Complete your purchase by providing your information</p>
                    </div>
                    <form action="checkout" method="post" id="checkoutForm">
                        <p class="dis fw-bold mb-3">Billing address</p>
                        <label for="address">Enter the address for shipment:</label>
                        <input type="text" id="address" name="address" placeholder="Address" />
                        <div id="error-message" style="color: red;"></div>
                        <div id="map" style="height: 400px; width: 100%;"> </div>
                        <div class="d-flex flex-column dis">
                            <div class="d-flex align-items-center justify-content-between mb-2">
                                <p class="fw-bold">Total</p>
                                <p class="fw-bold"><span class="fas fa-dollar-sign"></span>${sum}</p>
                            </div>
                            <button type="button" class="btn btn-primary mt-2" onclick="submitForm()">Check-out</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <jsp:include page="template/footer.jsp"/>
        <script>
            var map;
            map = L.map('map').setView([14.0583, 108.2772], 6);
            L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
                                        attribution: '&copy; OpenStreetMap contributors'
                                    }).addTo(map);
            var markers = [];
            function initMap() {
                clearMarkers();
                var address = document.getElementById('address').value;
                fetch('https://nominatim.openstreetmap.org/search?format=json&q=' + address)
                        .then(response => response.json())
                        .then(data => {
                            if (data.length > 0) {
                                if (!map) {
                                    map = L.map('map').setView([data[0].lat, data[0].lon], 15);
                                    L.tileLayer('https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
                                        attribution: '&copy; OpenStreetMap contributors'
                                    }).addTo(map);
                                } else {
                                    map.setView([data[0].lat, data[0].lon], 15);
                                }

                                var marker = L.marker([data[0].lat, data[0].lon]).addTo(map)
                                        .bindPopup(address).openPopup();

                                markers.push(marker);

                                document.getElementById('error-message').innerHTML = '';
                            } else {
                                document.getElementById('error-message').innerHTML = 'Check your address';
                            }
                        })
                        .catch(error => console.error('Error:', error));
            }
            function clearMarkers() {
                markers.forEach(function (marker) {
                    map.removeLayer(marker);
                });
                markers = [];
            }
            function submitForm() {
                var errorMessage = document.getElementById('error-message').innerHTML;
                if (errorMessage.trim()===''&&markers.length>0) {
                    document.getElementById('checkoutForm').submit();
                } else {
                    alert('Please check your address on the map before checking out.');
                }
            }
            document.getElementById('address').addEventListener('input', function () {
                initMap();
            });
        </script>
    </body>
</html>
