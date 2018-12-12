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
        <title></title>
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
                            <li class="s-header__nav-menu-item"><a class="s-header__nav-menu-link s-header__nav-menu-link-divider" href="user_home.jsp">User Home</a></li>
                            <li class="s-header__nav-menu-item"><a class="s-header__nav-menu-link s-header__nav-menu-link-divider -is-active" href="my_prof.jsp">My Profile</a></li>
                            <li class="s-header__nav-menu-item"><a class="s-header__nav-menu-link s-header__nav-menu-link-divider" href="view_places.jsp">View All Places</a></li>
                            <li class="s-header__nav-menu-item"><a class="s-header__nav-menu-link s-header__nav-menu-link-divider" href="search_interest.jsp">Search Places By Interest</a></li>
                            <li class="s-header__nav-menu-item"><a class="s-header__nav-menu-link s-header__nav-menu-link-divider" href="search_city.jsp">Search Places By City</a></li>

                        </ul>
                        <ul class="list-unstyled s-header__nav-menu">
                            <li class="s-header__nav-menu-item"><a class="s-header__nav-menu-link s-header__nav-menu-link-divider" href="top_places.jsp">Top k Searched Places</a></li>
                            <li class="s-header__nav-menu-item"><a class="s-header__nav-menu-link s-header__nav-menu-link-divider" href="top_city.jsp">Search Places By City</a></li>
                            <li class="s-header__nav-menu-item"><a class="s-header__nav-menu-link s-header__nav-menu-link-divider" href="top_ranked_places.jsp">Most Recommended Places</a></li>
                            <li class="s-header__nav-menu-item"><a class="s-header__nav-menu-link s-header__nav-menu-link-divider" href="index.jsp">Logout</a></li>
                        </ul>
                    </div>
                </nav>
                <!-- End Nav -->
            </div>
            <!-- End Overlay -->
        </header>
        <!-- Process -->

        <% String uid = request.getParameter("id");
            Connection con = SQLconnection.getconnection();
            Statement st = con.createStatement();
            try {
                ResultSet rs = st.executeQuery("SELECT * FROM places where id='" + uid + "' ");
                if (rs.next()) {
        %>
        <div id="reg" class="s-promo-block-v7 g-bg-position--center" style="background: url('img/1920x1080/06.jpg') no-repeat;">
            <div class="g-container--sm g-padding-y-80--xs g-padding-y-125--xsm">
                <form action="book1.jsp" method="get">
                <div class="g-text-center--xs g-margin-b-60--xs">
                    <p class="text-uppercase g-font-size-14--xs g-font-weight--700 g-color--white-opacity g-letter-spacing--2 g-margin-b-25--xs"></p>
                    <h2 class="g-font-size-32--xs g-font-size-36--md g-color--white">Cab Booking</h2>
                </div>
                    <div class="g-margin-b-30--xs">
                        <label>Place Name</label>
                        <input type="text" name="p_name" required="" class="form-control s-form-v3__input" value="<%=rs.getString("p_name")%>" placeholder="* Name">
                        <input type="text" name="pid" hidden="" value="<%=rs.getString("id")%>" >                    </div>
                    <div class="row g-margin-b-50--xs">
                        <div class="col-sm-6 g-margin-b-30--xs g-margin-b-0--md">
                            <label>Place Address</label>
                            <input type="text" name="address" class="form-control s-form-v3__input" value="<%=rs.getString("address")%>" placeholder="* Email" required="">
                        </div>
                        <div class="col-sm-6">
                            <label>Point Of Interest</label>
                            <input type="text" name="poi" class="form-control s-form-v3__input" value="<%=rs.getString("poi")%>"  placeholder="* Phone" required="">
                        </div>
                    </div>
                    <div class="g-margin-b-30--xs">
                        <label>Select Vehicle Types</label>
                        <select class="form-control s-form-v3__input" name="vehicle" required="" >
                            <option value="#">---------------Select the Vehicle Type-------------</option>
                            <option value="Bus Non A/C(Pushback)">Bus Non A/C(Pushback)</option>
                            <option value="Bus A/C(Pushback)">Bus A/C(Pushback)</option>
                            <option value="Mini Bus Non A/C(Pushback)">Mini Bus Non A/C(Pushback)</option>
                            <option value="Mini Bus A/C(Pushback)">Mini Bus A/C(Pushback)</option>
                            <option value="12 Seater Tempo Traveller Non A/C(Pushback)">12 Seater Tempo Traveller Non A/C(Pushback)</option>
                            <option value="13 Seater Tempo Traveller A/C">13 Seater Tempo Traveller A/C</option>
                            <option value="11 Seater Tempo Traveller A/C">17 Seater Tempo Traveller A/C</option>
                            <option value="6 Seater AC car">6 Seater AC car</option>
                        </select>
                    </div>
                     <div class="g-margin-b-80--xs">
                         <label>Members</label>
                         <input type="text"  name="members" class="form-control s-form-v3__input" required="" placeholder="* Members">
                    </div>
                     <div class="g-margin-b-80--xs">
                         <label>Days</label>
                         <input type="text"  name="days" class="form-control s-form-v3__input" required="" placeholder="* Days">
                    </div>
                    <div class="g-margin-b-80--xs">
                        <label>Pickup Location</label>
                        <input type="text"  name="location" class="form-control s-form-v3__input" required="" placeholder="* Location">
                    </div>
                    <div class="g-text-center--xs">
                        <button type="submit" class="text-uppercase s-btn s-btn--md s-btn--white-bg g-radius--50 g-padding-x-70--xs">Request Booking Charges</button>
                    </div>
                </form>
            </div>
        </div>
                    <%                                        }
            } catch (Exception ex) {
                ex.printStackTrace();
            }

        %>
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

