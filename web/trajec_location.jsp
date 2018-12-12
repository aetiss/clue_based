<%-- 
    Document   : otp
    Created on : Nov 27, 2017, 11:00:16 AM
    Author     : java3
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="CLUE.SQLconnection"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" class="no-js">
    <!-- Begin Head -->
    <head>
        <!-- Basic -->
        <meta charset="utf-8"/>
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <title>Clue-based Route Search</title>
        <meta name="keywords" content="HTML5 Theme" />
        <meta name="description" content="Megakit - HTML5 Theme">
        <meta name="author" content="keenthemes.com">

        <!-- Web Fonts -->
        <link href="https://fonts.googleapis.com/css?family=Lato:300,400,400i|Montserrat:400,700" rel="stylesheet">

        <!-- Vendor Styles -->
        <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="vendor/themify/themify.css" rel="stylesheet" type="text/css"/>
        <link href="vendor/scrollbar/scrollbar.min.css" rel="stylesheet" type="text/css"/>

        <!-- Theme Styles -->
        <link href="css/style.css" rel="stylesheet" type="text/css"/>
        <link href="css/global/global.css" rel="stylesheet" type="text/css"/>

        <!-- Favicon -->
        <link rel="shortcut icon" href="img/favicon.ico" type="image/x-icon">
        <link rel="apple-touch-icon" href="img/apple-touch-icon.png">
    </head>
    <!-- End Head -->

    <!-- Body -->
    <body>

        <!--========== HEADER ==========-->
        <header class="navbar-fixed-top s-header js__header-sticky js__header-overlay">
            <!-- Navbar -->
            <div class="s-header__navbar">
                <div class="s-header__container">
                    <div class="s-header__navbar-row">
                        <div class="s-header__navbar-row-col">
                            <!-- Logo -->
                            <div class="s-header__logo">
                                <a href="Admin_home.jsp" class="s-header__logo-link">
                                    Admin Home
                                </a>
                            </div>
                            <!-- End Logo -->
                        </div>
                        <div class="s-header__navbar-row-col">
                            <!-- Trigger -->
                            <a href="javascript:void(0);" class="s-header__trigger js__trigger">
                                <span class="s-header__trigger-icon"></span>
                                <svg x="0rem" y="0rem" width="3.125rem" height="3.125rem" viewbox="0 0 54 54">
                                <circle fill="transparent" stroke="#fff" stroke-width="1" cx="27" cy="27" r="25" stroke-dasharray="157 157" stroke-dashoffset="157"></circle>
                                </svg>
                            </a>
                            <!-- End Trigger -->
                        </div>
                    </div>
                </div>
            </div>
            <!-- End Navbar -->

            <!-- Overlay -->
            <div class="s-header-bg-overlay js__bg-overlay">
                <!-- Nav -->
                <nav class="s-header__nav js__scrollbar">
                    <div class="container-fluid">
                        <!-- Menu List -->                                
                        <ul class="list-unstyled s-header__nav-menu">
                            <li class="s-header__nav-menu-item"><a class="s-header__nav-menu-link s-header__nav-menu-link-divider" href="Admin_home.jsp">Admin Home</a></li>
                            <li class="s-header__nav-menu-item"><a class="s-header__nav-menu-link s-header__nav-menu-link-divider -is-active" href="all_users.jsp">All Users</a></li>
                            <li class="s-header__nav-menu-item"><a class="s-header__nav-menu-link s-header__nav-menu-link-divider" href="Users_location.jsp">View Users Locations</a></li>
                            <li class="s-header__nav-menu-item"><a class="s-header__nav-menu-link s-header__nav-menu-link-divider" href="Most_searched_city.jsp">Most Searched City</a></li>
                            <li class="s-header__nav-menu-item"><a class="s-header__nav-menu-link s-header__nav-menu-link-divider" href="Top_k_graph.jsp">Top K Search Graph</a></li>
                            <li class="s-header__nav-menu-item"><a class="s-header__nav-menu-link s-header__nav-menu-link-divider" href="most_trajectories.jsp">Trajectories of Users</a></li>
                            <li class="s-header__nav-menu-item"><a class="s-header__nav-menu-link s-header__nav-menu-link-divider" href="index.jsp">Logout</a></li>

                        </ul>
                    </div>
                </nav>
                <!-- End Nav -->
            </div>
            <!-- End Overlay -->
        </header>
        <%
            //String source = request.getParameter("source");
            int i = 0;

            String sou = request.getParameter("source");
            String des = request.getParameter("dest");
            String source = sou.replace(' ', ' ');
            String dest = des.replace(' ', ' ');

        %>
        <!--========== PAGE CONTENT ==========-->
        <!-- Feedback Form -->
        <div class="g-position--relative s-promo-block-user">
            <div class="g-container--md g-padding-y-125--xs">
                <center><h2 style="color: white">Trajectory Direction And Distance</h2></center>
                <div class="g-text-center--xs g-margin-t-50--xs g-margin-b-80--xs">
                    <div class="row g-margin-b-30--xs g-margin-b-50--md">
                        <div class="col-sm-6 g-margin-b-30--xs g-margin-b-0--md">
                            <span>From Your Location</span>
                            <textarea  style="color: white" class="form-control s-form-v4__input g-padding-l-0--xs" placeholder="* From"><%=source%></textarea>
                        </div>
                        <div class="col-sm-6">
                            <span>Destination</span>
                            <textarea style="color: white" class="form-control s-form-v4__input g-padding-l-0--xs" placeholder="* To "><%=dest%></textarea>
                        </div>
                    </div>
                </div>
            </div>
            <div id="js__scroll-to-appointment" class="s-promo-block-user g-padding-y-80--xs g-padding-y-125--sm">
                <div class="container g-bg-color--white g-box-shadow__dark-lightest-v3">
                    <div class="row">
                        <!-- Form -->
                        <div class="col-md-8 js__form-eqaul-height-v1">
                            <div class="g-padding-x-40--xs g-padding-y-50--xs">
                                <h2 class="g-font-size-24--xs g-color--primary g-margin-b-50--xs">Trajectories to the Destination</h2>
                                <input hidden="" id="origin-input" value="<%=source%>" class="controls" type="text" placeholder="Enter an origin location">

                                <input hidden="" id="destination-input" class="controls" value="<%=dest%>" type="text" placeholder="Enter a destination location">

                                <div id="map" style="width: 700px; height: 1000px"></div>
                            </div>
                        </div>

                        <!-- End Form -->

                        <!-- Contacts -->
                        <div class="col-md-4 s-promo-block-user js__form-eqaul-height-v1">
                            <div class="g-overflow--hidden g-padding-x-40--xs g-padding-y-50--xs">
                                <h2 class="g-font-size-24--xs g-color--white g-margin-b-50--xs">Distance Calculation</h2>
                                <div id="right-panel" style="height: 1000px; overflow: scroll">
                                    <p>Total Distance: <span id="total"></span></p>
                                </div>

                                <i class="g-font-size-150--xs g-color--white-opacity-lightest ti-comments" style="position: absolute; bottom: -1.25rem; right: -1.25rem;"></i>
                            </div>
                        </div>
                        <!-- End Contacts -->
                    </div>
                </div>
            </div>
        </div>

        <script>
            // This example requires the Places library. Include the libraries=places
            // parameter when you first load the API. For example:
            // <script src="https://maps.googleapis.com/maps/api/js?key=YOUR_API_KEY&libraries=places">

            function initMap() {
                var map = new google.maps.Map(document.getElementById('map'), {
                    mapTypeControl: false,
                    center: {lat: 11.7447, lng: 79.7680},
                    zoom: 13
                });

      
        
                var directionsService = new 
                google.maps.DirectionsService;
                var directionsDisplay = new 
                google.maps.DirectionsRenderer({
                    draggable: true,
                    map: map,
                    panel: document.getElementById('right-panel')
                });    
                var directionsService = new 
                google.maps.DirectionsService;
                var directionsDisplay = new 
                google.maps.DirectionsRenderer({
                    draggable: true,
                    map: map,
                    panel: document.getElementById('right-panel')
                });

                directionsDisplay.addListener
                ('directions_changed', function() {
                    computeTotalDistance
                    (directionsDisplay.getDirections());
                });
                var sourcee = document.getElementById('origin-input');
                var desti = document.getElementById('destination-input');
                displayRoute('<%=source%>', '<%=dest%>', 
                directionsService,
                directionsDisplay);
                
               
            }
      
            new AutocompleteDirectionsHandler(map);
        
        
            function getallpath()
            {
                var paths = document.getElementById('right-panel').innerHTML;
                alert(paths);
                //alert(extractContent(document.getElementById('right-panel').innerHTML));

            }
            function extractContent(s) {
                var span= document.createElement('span');
                span.innerHTML= s;
                return span.textContent || span.innerText;
            };
    

            /**
             * @constructor
             */
            function AutocompleteDirectionsHandler(map) {
                this.map = map;
                this.originPlaceId = null;
                this.destinationPlaceId = null;
                this.travelMode = 'WALKING';
                var originInput = document.getElementById('origin-input');
                var destinationInput = document.getElementById('destination-input');
                var modeSelector = document.getElementById('mode-selector');
                this.directionsService = new google.maps.DirectionsService;
                this.directionsDisplay = new google.maps.DirectionsRenderer;
                this.directionsDisplay.setMap(map);

                var originAutocomplete = new google.maps.places.Autocomplete(
                originInput, {placeIdOnly: true});
                var destinationAutocomplete = new google.maps.places.Autocomplete(
                destinationInput, {placeIdOnly: true});

                this.setupClickListener('changemode-walking', 'WALKING');
                this.setupClickListener('changemode-transit', 'TRANSIT');
                this.setupClickListener('changemode-driving', 'DRIVING');

                this.setupPlaceChangedListener(originAutocomplete, 'ORIG');
                this.setupPlaceChangedListener(destinationAutocomplete, 'DEST');

                this.map.controls[google.maps.ControlPosition.TOP_LEFT].push(originInput);
                this.map.controls[google.maps.ControlPosition.TOP_LEFT].push(destinationInput);
                this.map.controls[google.maps.ControlPosition.TOP_LEFT].push(modeSelector);
                //computeTotalDistance(directionsDisplay.getDirections());
            }

            // Sets a listener on a radio button to change the filter type on Places
            // Autocomplete.
            AutocompleteDirectionsHandler.prototype.setupClickListener = function(id, mode) {
                var radioButton = document.getElementById(id);
                var me = this;
                radioButton.addEventListener('click', function() {
                    me.travelMode = mode;
                    me.route();
                });
            };

            AutocompleteDirectionsHandler.prototype.setupPlaceChangedListener = function(autocomplete, mode) {
                var me = this;
                autocomplete.bindTo('bounds', this.map);
                autocomplete.addListener('place_changed', function() {
                    var place = autocomplete.getPlace();
                    if (!place.place_id) {
                        window.alert("Please select an option from the dropdown list.");
                        return;
                    }
                    if (mode === 'ORIG') {
                        me.originPlaceId = place.place_id;
                    } else {
                        me.destinationPlaceId = place.place_id;
                    }
                    me.route();
                });

            };

            AutocompleteDirectionsHandler.prototype.route = function() {
                if (!this.originPlaceId || !this.destinationPlaceId) {
                    return;
                }
                var me = this;

                this.directionsService.route({
                    origin: {'placeId': this.originPlaceId},
                    destination: {'placeId': this.destinationPlaceId},
                    travelMode: this.travelMode
                }, function(response, status) {
                    if (status === 'OK') {
                        me.directionsDisplay.setDirections(response);
                        computeTotalDistance(me.directionsDisplay.getDirections());
                        var source = document.getElementById('origin-input');
                        var dest = document.getElementById('destination-input');
                        displayRoute(source, dest,me.directionsService,me.directionsDisplay);
                    } else {
                        window.alert('Directions request failed due to ' + status);
                    }
                });
            };
       
            function displayRoute(origin, destination, service, 
            display) {
                service.route({
                    origin: origin,
                    destination: destination,
                    //          waypoints: [{location: 'Adelaide, SA'}, 
                    //{location: 'Broken Hill, NSW'}],
                    travelMode: 'DRIVING',
                    avoidTolls: true
                }, function(response, status) {
                    if (status === 'OK') {
                        display.setDirections(response);
                    } else {
                        alert('Could not display directions due to: ' 
                            + status);
                    }
                });
            }
      
            function computeTotalDistance(result) {
                var total = 0;
                var myroute = result.routes[0];
                for (var i = 0; i < myroute.legs.length; i++) {
                    total += myroute.legs[i].distance.value;
                }
                total = total / 1000;
                document.getElementById('total').innerHTML = 
                    total + ' km';
            }
        </script>
        <!-- End Feedback Form -->
        <!--========== END PAGE CONTENT ==========-->

        <!--========== FOOTER ==========-->
        <footer class="g-bg-color--dark">
        </footer>
        <!--========== END FOOTER ==========-->

        <!-- Back To Top -->
        <a href="javascript:void(0);" class="s-back-to-top js__back-to-top"></a>

        <!--========== JAVASCRIPTS (Load javascripts at bottom, this will reduce page load time) ==========-->
        <!-- Vendor -->
        <script type="text/javascript" src="vendor/jquery.min.js"></script>
        <script type="text/javascript" src="vendor/jquery.migrate.min.js"></script>
        <script type="text/javascript" src="vendor/bootstrap/js/bootstrap.min.js"></script>
        <script type="text/javascript" src="vendor/jquery.smooth-scroll.min.js"></script>
        <script type="text/javascript" src="vendor/jquery.back-to-top.min.js"></script>
        <script type="text/javascript" src="vendor/scrollbar/jquery.scrollbar.min.js"></script>

        <!-- General Components and Settings -->
        <script type="text/javascript" src="js/global.min.js"></script>
        <script type="text/javascript" src="js/components/header-sticky.min.js"></script>
        <script type="text/javascript" src="js/components/scrollbar.min.js"></script>
        <script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCAVaRUWKRYQc96EU3RFGro_D8qq6WCRSY&libraries=places&callback=initMap"
        ></script>
        <!--========== END JAVASCRIPTS ==========-->

    </body>
    <!-- End Body -->
</html>
