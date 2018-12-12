<%-- 
    Document   : my_prof
    Created on : Nov 28, 2017, 12:37:58 PM
    Author     : java3
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="CLUE.SQLconnection"%>
<%@page import="java.sql.Statement"%>
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
        <link href="css/animate.css" rel="stylesheet" type="text/css"/>
        <link href="vendor/themify/themify.css" rel="stylesheet" type="text/css"/>
        <link href="vendor/scrollbar/scrollbar.min.css" rel="stylesheet" type="text/css"/>
        <link href="vendor/magnific-popup/magnific-popup.css" rel="stylesheet" type="text/css"/>
        <link href="vendor/swiper/swiper.min.css" rel="stylesheet" type="text/css"/>

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
                            <li class="s-header__nav-menu-item"><a class="s-header__nav-menu-link s-header__nav-menu-link-divider" href="add_places.jsp">Add Places</a></li>
                            <li class="s-header__nav-menu-item"><a class="s-header__nav-menu-link s-header__nav-menu-link-divider" href="view_all_places.jsp">Place Details</a></li>
                            <li class="s-header__nav-menu-item"><a class="s-header__nav-menu-link s-header__nav-menu-link-divider" href="all_users.jsp">Users Details</a></li>
                            <li class="s-header__nav-menu-item"><a class="s-header__nav-menu-link s-header__nav-menu-link-divider" href="Users_location.jsp">Users Locations</a></li>
                            <li class="s-header__nav-menu-item"><a class="s-header__nav-menu-link s-header__nav-menu-link-divider" href="booking.jsp">Booking Details</a></li>
                            <li class="s-header__nav-menu-item"><a class="s-header__nav-menu-link s-header__nav-menu-link-divider" href="Most_searched_city.jsp">Top k Searched City</a></li>
                            <li class="s-header__nav-menu-item"><a class="s-header__nav-menu-link s-header__nav-menu-link-divider" href="Top_k_graph.jsp">Top K Interest</a></li>
                            <li class="s-header__nav-menu-item"><a class="s-header__nav-menu-link s-header__nav-menu-link-divider" href="most_trajectories.jsp">Users Trajectories</a></li>
                            <li class="s-header__nav-menu-item"><a class="s-header__nav-menu-link s-header__nav-menu-link-divider" href="index.jsp">Logout</a></li>
                        </ul>
                    </div>
                </nav>
                <!-- End Nav -->
            </div>
            <!-- End Overlay -->
        </header>
        <style>
            .panel
            {
                margin: 5%;
                background: transparent;
            }


            tr
            {
                transition: all 0.5s;
            }
            tr:hover
            {
                background-color: #f0ad4e;
                transition: 0.5s;
            }
            .btn-warning
            {
                transition: all 0.8s;
            }

            .btn-warning:hover, .btn-warning:focus
            {
                transition: 0.8s;
                background-color: #428bca;
                border-color: #428bca;
            }

            .panel-footer
            {
                background-color: #5bc0de;
                color: white;
            }
        </style>
        <!-- Process -->
        <div class="s-promo-block-user">
            
            <div class="container g-padding-y-80--xs g-padding-y-125--sm">
                <div class="g-text-center--xs g-margin-b-100--xs">
                    <h2 style="color: white">Users Details</h2>
<div class="panel-body table-responsive">
                            <table class="table table-hover">
                                <thead>
                                    <tr>
                                        <th class="text-center">User Id</th>
                                        <th class="text-center">Name</th>
                                        <th class="text-center">Email</th>
                                        <th class="text-center">Phone</th>
                                        <th class="text-center">Street</th>
                                        <th class="text-center">City</th>
                                        <th class="text-center">State</th>
                                        <th class="text-center">Current Location</th>
                                    </tr>
                                </thead>
        <%   //String uid = (String) session.getAttribute("uid");
            Connection con = SQLconnection.getconnection();
            Statement st = con.createStatement();
            try {
                ResultSet rs = st.executeQuery("SELECT * FROM users");
                while(rs.next()) {
        %>
        <tbody>
                                    <tr class="edit" id="detail">
                                        <td id="no" class="text-center"><img width="50px" height="50px" src="user_pic.jsp?uid=<%=rs.getString("id")%>" alt="Image"></td>
                                        <td id="name" class="text-center"><%=rs.getString("name")%></td>
                                        <td id="mobile" class="text-center"><%=rs.getString("email")%></td>
                                        <td id="mail" class="text-center"><%=rs.getString("phone")%></td>
                                        <td id="city" class="text-center"><%=rs.getString("street")%></td>
                                        <td id="city" class="text-center"><%=rs.getString("city")%></td>
                                        <td id="city" class="text-center"><%=rs.getString("state")%></td>
                                        <td id="city" class="text-center"><%=rs.getString("cur_address")%></td>
                                    </tr>
                                </tbody>
        
        <%                                        }
            } catch (Exception ex) {
                ex.printStackTrace();
            }

        %>
                            </table>
</div></div>
            </div>
        </div>
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
        <script type="text/javascript" src="vendor/magnific-popup/jquery.magnific-popup.min.js"></script>
        <script type="text/javascript" src="vendor/jquery.parallax.min.js"></script>
        <script type="text/javascript" src="vendor/swiper/swiper.jquery.min.js"></script>
        <script type="text/javascript" src="vendor/jquery.wow.min.js"></script>

        <!-- General Components and Settings -->
        <script type="text/javascript" src="js/global.min.js"></script>
        <script type="text/javascript" src="js/components/header-sticky.min.js"></script>
        <script type="text/javascript" src="js/components/scrollbar.min.js"></script>
        <script type="text/javascript" src="js/components/magnific-popup.min.js"></script>
        <script type="text/javascript" src="js/components/swiper.min.js"></script>
        <script type="text/javascript" src="js/components/wow.min.js"></script>
        <!--========== END JAVASCRIPTS ==========-->

    </body>
    <!-- End Body -->
</html>
