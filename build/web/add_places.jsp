<%-- 
    Document   : add_places
    Created on : Nov 25, 2017, 10:37:42 AM
    Author     : java3
--%>

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
        <!--========== END HEADER ==========-->

        <!--========== PAGE CONTENT ==========-->
        <!-- Feedback Form -->
        <div class="g-position--relative s-promo-block-user">
            <div class="g-container--md g-padding-y-125--xs">
                <div class="g-text-center--xs g-margin-t-50--xs g-margin-b-80--xs">
                    <h2 class="g-font-size-32--xs g-font-size-36--sm g-color--white">Add Places</h2>
                </div>
                <form class="center-block g-width-500--sm g-width-550--md" action="add_places" method="post" enctype="multipart/form-data">
                    <div class="g-margin-b-30--xs">
                        <input type="text" class="form-control s-form-v3__input" name="p_name" required="" placeholder="* Place Name">
                    </div>
                    <div class="row g-row-col-5 g-margin-b-50--xs">
                        <div class="col-sm-4 g-margin-b-30--xs g-margin-b-0--md">
                            <input type="file" class="form-control s-form-v3__input" name="pic1" required="" placeholder="images">
                        </div>
                        <div class="col-sm-4">
                            <input type="file" class="form-control s-form-v3__input" name="pic2" required="" placeholder="* images">
                        </div>
                        <div class="col-sm-4">
                            <input type="file" class="form-control s-form-v3__input" name="pic3" required="" placeholder="* images">
                        </div>
                    </div>
                    <div class="row g-row-col-5 g-margin-b-50--xs">
                        <div class="col-sm-6 g-margin-b-30--xs g-margin-b-0--md">
                            <input type="text" class="form-control s-form-v3__input" name="p_city" required="" placeholder="* City">
                        </div>
                        <div class="col-sm-6">
                            <input type="text" class="form-control s-form-v3__input" name="p_state" required="" placeholder="* State">
                        </div>
                    </div>
                    <div class="g-margin-b-30--xs">
                        <input type="text" class="form-control s-form-v3__input" name="p_address" required="" placeholder="* Full Address">
                    </div>
                     <div class="g-margin-b-80--xs">
                         <textarea class="form-control s-form-v3__input" rows="5" name="des" required="" placeholder="* Description"></textarea>
                    </div>
                    <div class="row g-row-col-5 g-margin-b-50--xs">
                        <div class="col-sm-6 g-margin-b-30--xs g-margin-b-0--md">
                            <input type="text" class="form-control s-form-v3__input" name="fam" required="" placeholder="Famous For??">
                        </div>
                        <div class="col-sm-6">
                            <input type="text" class="form-control s-form-v3__input" name="poi" required="" placeholder="* Point Of Interest">
                        </div>
                    </div>
                    <div class="g-margin-b-30--xs">
                        <input type="text" class="form-control s-form-v3__input" name="clue" required="" placeholder="* Clue 1">
                    </div>
                    <div class="g-margin-b-30--xs">
                        <input type="text" class="form-control s-form-v3__input" name="clue1" required="" placeholder="* Clue 2">
                    </div>
                    <div class="g-margin-b-30--xs">
                        <input type="text" class="form-control s-form-v3__input" name="clue2" required="" placeholder="* Clue 3">
                    </div>
                    <div class="row g-row-col-5 g-margin-b-50--xs">
                        <div class="col-sm-6 g-margin-b-30--xs g-margin-b-0--md">
                            <input type="text" class="form-control s-form-v3__input" name="open" required="" placeholder="Opening Time">
                        </div>
                        <div class="col-sm-6">
                            <input type="text" class="form-control s-form-v3__input" name="close" required="" placeholder="* Closing Time">
                        </div>
                    </div>
                    <div class="g-text-center--xs">
                        <button type="submit" class="text-uppercase s-btn s-btn--md s-btn--white-bg g-radius--50 g-padding-x-70--xs g-margin-b-20--xs">Submit</button>
                    </div>
                </form>
            </div>
            <img class="s-mockup-v2" src="img/travel.png" alt="Mockup Image">
        </div>
        <!-- End Feedback Form -->
        <!--========== END PAGE CONTENT ==========-->

        <!--========== FOOTER ==========-->
        <footer class="g-bg-color--dark">
 
        </footer>

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
        <!--========== END JAVASCRIPTS ==========-->

    </body>
    <!-- End Body -->
</html>

