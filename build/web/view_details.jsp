<%-- 
    Document   : view_details
    Created on : Nov 27, 2017, 3:30:56 PM
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
        <link href="css/animate.css" rel="stylesheet" type="text/css"/>
        <link href="vendor/themify/themify.css" rel="stylesheet" type="text/css"/>
        <link href="vendor/scrollbar/scrollbar.min.css" rel="stylesheet" type="text/css"/>
        <link href="vendor/magnific-popup/magnific-popup.css" rel="stylesheet" type="text/css"/>
        <link href="vendor/swiper/swiper.min.css" rel="stylesheet" type="text/css"/>
        <link href="vendor/cubeportfolio/css/cubeportfolio.min.css" rel="stylesheet" type="text/css"/>

        <!-- Theme Styles -->
        <link href="css/style.css" rel="stylesheet" type="text/css"/>
        <link href="css/global/global.css" rel="stylesheet" type="text/css"/>

        <!-- Theme Skins -->
        <link href="css/theme/red.css" rel="stylesheet" type="text/css"/>

        <!-- Favicon -->
        <link rel="shortcut icon" href="img/favicon.ico" type="image/x-icon">
        <link rel="apple-touch-icon" href="img/apple-touch-icon.png">
    </head>
    <%
        String city = request.getParameter("city");
    %>
    <!-- End Head -->

    <!-- Body -->
    <body class="s-promo-block-user g-fullheight--md" >

        <!--========== HEADER ==========-->
        <header class="navbar-fixed-top s-header js__header-sticky js__header-overlay">
            <!-- Navbar -->
            <div class="s-header__navbar">
                <div class="s-header__container">
                    <div class="s-header__navbar-row">
                        <div class="s-header__navbar-row-col">
                            <!-- Logo -->
                            <div class="s-header__logo">
                                <a href="user_home.jsp" class="s-header__logo-link">
                                   
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
        <!--========== END HEADER ==========-->
        <%                      String pid = request.getParameter("pid");
            Connection con = SQLconnection.getconnection();
            Statement st = con.createStatement();
            try {
                ResultSet rs = st.executeQuery("SELECT * FROM places where id='" + pid + "' ");
                while (rs.next()) {
                    String id =rs.getString("id");
                    //
                    session.setAttribute("pid", rs.getString("id"));
                    session.setAttribute("pname", rs.getString("p_name"));
        %>


        <div class="container g-padding-y-50--xs g-padding-y-50--xs s-promo-block-user">
            <div class="row g-margin-b-30--xs">
                <div class="col-sm-4">
                    <div class="g-margin-t-20--md g-margin-b-40--xs">
                        <p class="text-uppercase g-font-size-14--xs g-font-weight--700 g-color--primary g-letter-spacing--2 g-margin-b-25--xs"></p>
                        <h2 class="g-font-size-32--xs g-font-size-36--md" style="color: white"><%=rs.getString("p_name")%></h2>
                        <p style="color:white"><%=rs.getString("address")%></p>
                    </div>
                </div>

                    <br><div class="col-sm-8">
                    <!-- Portfolio Gallery -->
                    <div id="js__grid-portfolio-gallery" class="s-portfolio__paginations-v1 cbp">
                        <!-- Item -->
                        <div class="s-portfolio__item cbp-item motion graphic">
                            <div class="s-portfolio__img-effect">
                                <img src="pic.jsp?uid=<%=rs.getString("id")%>" width="367px" height="276px" alt="Portfolio Image">
                            </div>
                            <div class="s-portfolio__caption-hover--cc">
                                <div class="g-margin-b-25--xs">
                                    <h3 class="g-font-size-18--xs g-color--white g-margin-b-5--xs"></h3>
                                    <p class="g-color--white-opacity"></p>
                                </div>
                                <ul class="list-inline g-ul-li-lr-5--xs g-margin-b-0--xs">
                                    <li>
                                        <a href="pic.jsp?uid=<%=rs.getString("id")%>" class="cbp-lightbox s-icon s-icon--sm s-icon--white-bg g-radius--circle" data-title="">
                                            <i class="ti-fullscreen"></i>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="" class="s-icon s-icon--sm s-icon s-icon--white-bg g-radius--circle">
                                            <i class="ti-link"></i>
                                        </a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                        <!-- Item -->
                        <div class="s-portfolio__item cbp-item logos graphic">
                            <div class="s-portfolio__img-effect">
                                <img src="pic2.jsp?uid=<%=rs.getString("id")%>" width="367px" height="276px"  alt="Portfolio Image">
                            </div>
                            <div class="s-portfolio__caption-hover--cc">
                                <div class="g-margin-b-25--xs">

                                </div>
                                <ul class="list-inline g-ul-li-lr-5--xs g-margin-b-0--xs">
                                    <li>
                                        <a href="pic2.jsp?uid=<%=rs.getString("id")%>" class="cbp-lightbox s-icon s-icon--sm s-icon--white-bg g-radius--circle" data-title="">
                                            <i class="ti-fullscreen"></i>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="" class="s-icon s-icon--sm s-icon s-icon--white-bg g-radius--circle">
                                            <i class="ti-link"></i>
                                        </a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                        <!-- Item -->
                        <div class="s-portfolio__item cbp-item logos motion">
                            <div class="s-portfolio__img-effect">
                                <img src="pic3.jsp?uid=<%=rs.getString("id")%>" width="367px" height="276px"  alt="Portfolio Image">
                            </div>
                            <div class="s-portfolio__caption-hover--cc">
                                <div class="g-margin-b-25--xs">
                                    <h4 class="g-font-size-18--xs g-color--white g-margin-b-5--xs"></h4>
                                    <p class="g-color--white-opacity"></p>
                                </div>
                                <ul class="list-inline g-ul-li-lr-5--xs g-margin-b-0--xs">
                                    <li>
                                        <a href="pic3.jsp?uid=<%=rs.getString("id")%>" class="cbp-lightbox s-icon s-icon--sm s-icon--white-bg g-radius--circle" data-title="">
                                            <i class="ti-fullscreen"></i>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="" class="s-icon s-icon--sm s-icon s-icon--white-bg g-radius--circle">
                                            <i class="ti-link"></i>
                                        </a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                        <!-- Item -->
                        <div class="s-portfolio__item cbp-item graphic">
                            <div class="s-portfolio__img-effect">
                                <img src="pic.jsp?uid=<%=rs.getString("id")%>" width="367px" height="276px"  alt="Portfolio Image">
                            </div>
                            <div class="s-portfolio__caption-hover--cc">
                                <div class="g-margin-b-25--xs">
                                    <h4 class="g-font-size-18--xs g-color--white g-margin-b-5--xs"></h4>
                                    <p class="g-color--white-opacity"></p>
                                </div>
                                <ul class="list-inline g-ul-li-lr-5--xs g-margin-b-0--xs">
                                    <li>
                                        <a href="pic.jsp?uid=<%=rs.getString("id")%>" class="cbp-lightbox s-icon s-icon--sm s-icon--white-bg g-radius--circle" data-title="">
                                            <i class="ti-fullscreen"></i>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="" class="s-icon s-icon--sm s-icon s-icon--white-bg g-radius--circle">
                                            <i class="ti-link"></i>
                                        </a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <!-- End Portfolio Gallery -->
                    <br>
                    <br>
                    <br>
                    <a href="trajectories.jsp?dest=<%=rs.getString("address")%>&id=<%=id%>" class="text-uppercase s-btn s-btn--md s-btn--white-bg g-radius--50 g-padding-x-70--xs">View Route</a><br><br><br>
                   
                    <a href="recommend.jsp?id=<%=id%>" class="text-uppercase s-btn s-btn--md s-btn--white-bg g-radius--50 g-padding-x-70--xs">Recommend This Place</a><br><br><br>
                     <a href="book.jsp?place=<%=rs.getString("p_name")%>&id=<%=id%>" class="text-uppercase s-btn s-btn--md s-btn--white-bg g-radius--50 g-padding-x-70--xs">Book Cab</a>
                </div>
            </div>
        </div>
        <div class="container g-text-center--xs g-padding-y-50--xs s-promo-block-user">
            <h2 class="g-font-size-32--xs g-font-size-36--sm" style="color:  white">Place Description</h2>
            <br>
            <div class="container g-padding-y-50--xs g-padding-y-50--sm">
                <div class="row g-margin-b-60--xs g-margin-b-70--md">
                    <p align="justify" style="color: white"><%=rs.getString("des")%></p>
                </div>
            </div>
        </div>
        <div class="container g-padding-y-50--xs g-padding-y-50--sm s-promo-block-user">
            <div class="row g-margin-b-60--xs g-margin-b-70--md">
                <div class="col-sm-4 g-margin-b-60--xs g-margin-b-0--md">
                    <div class="clearfix">
                        <div class="g-media g-width-30--xs">
                            <div class="wow fadeInDown" data-wow-duration=".3" data-wow-delay=".1s">
                                <i class="g-font-size-28--xs g-color--primary ti-desktop"></i>
                            </div>
                        </div>
                        <div class="g-media__body g-padding-x-20--xs">
                            <h3 class="g-font-size-18--xs">City</h3>
                            <p class="g-margin-b-0--xs" style="color: white"><%=rs.getString("p_city")%></p>
                        </div>
                    </div>
                </div>
                <div class="col-sm-4 g-margin-b-60--xs g-margin-b-0--md">
                    <div class="clearfix">
                        <div class="g-media g-width-30--xs">
                            <div class="wow fadeInDown" data-wow-duration=".3" data-wow-delay=".2s">
                                <i class="g-font-size-28--xs g-color--primary ti-settings"></i>
                            </div>
                        </div>
                        <div class="g-media__body g-padding-x-20--xs">
                            <h3 class="g-font-size-18--xs">State</h3>
                            <p class="g-margin-b-0--xs" style="color: white"><%=rs.getString("p_state")%></p>
                        </div>
                    </div>
                </div>
                <div class="col-sm-4">
                    <div class="clearfix">
                        <div class="g-media g-width-30--xs">
                            <div class="wow fadeInDown" data-wow-duration=".3" data-wow-delay=".3s">
                                <i class="g-font-size-28--xs g-color--primary ti-ruler-alt-2"></i>
                            </div>
                        </div>
                        <div class="g-media__body g-padding-x-20--xs">
                            <h3 class="g-font-size-18--xs">Famous For</h3>
                            <p class="g-margin-b-0--xs" style="color: white"><%=rs.getString("fam")%></p>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-sm-4 g-margin-b-60--xs g-margin-b-0--md">
                    <div class="clearfix">
                        <div class="g-media g-width-30--xs">
                            <div class="wow fadeInDown" data-wow-duration=".3" data-wow-delay=".4s">
                                <i class="g-font-size-28--xs g-color--primary ti-package"></i>
                            </div>
                        </div>
                        <div class="g-media__body g-padding-x-20--xs">
                            <h3 class="g-font-size-18--xs">Point Of Interest</h3>
                            <p class="g-margin-b-0--xs" style="color: white"><%=rs.getString("poi")%></p>
                        </div>
                    </div>
                </div>
                <div class="col-sm-4 g-margin-b-60--xs g-margin-b-0--md">
                    <div class="clearfix">
                        <div class="g-media g-width-30--xs">
                            <div class="wow fadeInDown" data-wow-duration=".3" data-wow-delay=".5s">
                                <i class="g-font-size-28--xs g-color--primary ti-star"></i>
                            </div>
                        </div>
                        <div class="g-media__body g-padding-x-20--xs">
                            <h3 class="g-font-size-18--xs">Opening Time</h3>
                            <p class="g-margin-b-0--xs" style="color: white"><%=rs.getString("open")%></p>
                        </div>
                    </div>
                </div>
                <div class="col-sm-4">
                    <div class="clearfix">
                        <div class="g-media g-width-30--xs">
                            <div class="wow fadeInDown" data-wow-duration=".3" data-wow-delay=".6s">
                                <i class="g-font-size-28--xs g-color--primary ti-panel"></i>
                            </div>
                        </div>
                        <div class="g-media__body g-padding-x-20--xs">
                            <h3 class="g-font-size-18--xs">Closing Time</h3>
                            <p class="g-margin-b-0--xs" style="color: white"><%=rs.getString("close")%></p>
                        </div>
                    </div>
                </div>
                        <br>
                <div class="col-sm-4">
                    <div class="clearfix">
                        <div class="g-media g-width-30--xs">
                            <div class="wow fadeInDown" data-wow-duration=".3" data-wow-delay=".6s">
                                <i class="g-font-size-28--xs g-color--primary ti-star"></i>
                            </div>
                        </div>
                        <div class="g-media__body g-padding-x-20--xs">
                            <h3 class="g-font-size-18--xs">Clues</h3>
                            <p class="g-margin-b-0--xs" style="color: white"><%=rs.getString("clues")%></p>
                        </div>
                    </div>
                </div>
                        
            </div>
        </div>
        <br>
        <br><br><br><br><br><br>
        <%                                        }
            } catch (Exception ex) {
                ex.printStackTrace();
            }

        %>
        <%
            String uid = (String) session.getAttribute("uid");
            Statement st1 = con.createStatement();
            try {
                ResultSet rs1 = st1.executeQuery("SELECT * FROM users where id='" + uid + "' ");
                if (rs1.next()) {
                    String source = rs1.getString("cur_address");
                    session.setAttribute("source", source);
        %>
        <%                                        }
            } catch (Exception ex) {
                ex.printStackTrace();
            }

        %>
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
        <!-- End Features -->

        <!-- Upcoming Event -->
        <div class=" js__parallax-window s-promo-block-user g-fullheight--md" style="background: url(img/1920x1080/03.jpg) 50% 0 no-repeat fixed; background-size: cover;">
            <div class="container">
                <div class="row g-hor-centered-row--md">
                    <div class="col-md-7 g-hor-centered-row__col g-padding-y-80--xs">
                        <div class="panel-body table-responsive">
                            <table class="table table-hover">
                                <thead>
                                    <tr>
                                        <th class="text-center">Pic</th>
                                        <th class="text-center">Name</th>
                                        <th class="text-center">Feedback</th>
                                        <th class="text-center">Rating</th>
                                    </tr>
                                </thead>
                                <%
                                    Connection conn = SQLconnection.getconnection();
                                    Statement st3 = conn.createStatement();
                                    Statement st5 = conn.createStatement();
                                    try {
                                        ResultSet rs = st3.executeQuery("SELECT * FROM review where p_id='" + pid + "' ");
                                        ArrayList<Integer> list = new ArrayList<Integer>(); 
                                            ResultSet rs0 = st.executeQuery("Select count(*) from review where p_id='" + pid + "' and rating='5'");
                                            rs0.next();
                                            Integer in = rs0.getInt(1);
                                            ResultSet rs1 = st.executeQuery("Select count(*) from review where p_id='" + pid + "' and rating='4' ");
                                            rs1.next();
                                            Integer inn = rs1.getInt(1);
                                            ResultSet rs2 = st.executeQuery("Select count(*) from review where p_id='" + pid + "' and rating='3' ");
                                            rs2.next();
                                            Integer innn = rs2.getInt(1);
                                            ResultSet rs3 = st.executeQuery("Select count(*) from review where p_id='" + pid + "' and rating='2' ");
                                            rs3.next();
                                            Integer innnn = rs3.getInt(1);
                                            ResultSet rs4 = st.executeQuery("Select count(*) from review where p_id='" + pid + "' and rating='1' ");
                                            rs4.next();
                                            Integer innnnn = rs4.getInt(1);
                                            ResultSet rs5 = st.executeQuery("Select count(*) from review where p_id='" + pid + "' ");
                                            rs5.next();
                                            Integer total_rev = rs5.getInt(1);
                                            System.out.println("------------------" + in);
                                            System.out.println("------------------" + inn);
                                            System.out.println("------------------" + innn);
                                            System.out.println("------------------" + innnn);
                                            System.out.println("------------------" + innnnn);
                                            System.out.println("------------------" + total_rev);

                                            long e = in * 5;
                                            final long g = inn * 4;
                                            final long a = innn * 3;
                                            final long p = innnn * 2;
                                            final long t = innnnn * 1;
                                            System.out.println("------------------" + e);
                                            System.out.println("------------------" + g);
                                            System.out.println("------------------" + a);
                                            System.out.println("------------------" + p);
                                            System.out.println("------------------" + t);

                                             long sum = e + g + a + p + t;
                                            System.out.println("SUM------------------" + sum);
                                           long avg = sum/total_rev;
                                            System.out.println("Average------------------" + avg);
                                            int av= st5.executeUpdate("Update places set avg='"+avg+"' where id='"+pid+"'");
                                %>
                                <h3 class="text-uppercase s-btn s-btn--md s-btn--white-bg g-radius--50 g-padding-x-70--xs">Overall Rating&nbsp;<%=avg%>&nbsp;&nbsp;&nbsp;Out Of&nbsp;&nbsp;<%=total_rev%></h3>
                                <%
                                while (rs.next()) {
                                    %>
                                <tbody>
                                    <tr class="edit" id="detail">
                                        <td id="no" class="text-center"><img width="50px" height="50px" src="user_pic.jsp?uid=<%=rs.getString("uid")%>" alt="Image"></td>
                                        <td id="name" class="text-center"><%=rs.getString("uname")%></td>
                                        <td id="mobile" class="text-center"><%=rs.getString("feedback")%></td>
                                        <td id="mail" class="text-center"><%=rs.getString("rating")%></td>
                                    </tr>
                                </tbody>
                                <%                                        }
                                    } catch (Exception ex) {
                                        ex.printStackTrace();
                                    }

                                %>
                            </table>
                        </div>
                    </div>
<!--                    <div class="col-md-5 g-hor-centered-row__col g-margin-b-80--xs">
                        <form class="center-block s-promo-block-v2__form g-width-100-percent--xs g-width-400--sm g-bg-color--dark-light g-padding-x-50--xs g-padding-y-80--xs g-radius--4" action="review.jsp" method="get">
                            <div class="g-text-center--xs g-margin-b-40--xs">
                                <h2 class="g-font-size-30--xs g-color--white">Review This Place</h2>
                            </div>
                            <div class="g-margin-b-40--xs">
                                <input type="text" name="feedback" class="form-control s-form-v3__input" placeholder="* Feeback">
                            </div>
                            <div class="g-margin-b-40--xs">
                                <input type="text" name="density" class="form-control s-form-v3__input" placeholder="* How many people Gather Here ">
                            </div>
                            <div class="g-margin-b-40--xs">
                                <input type="text" name="rating" class="form-control s-form-v3__input" placeholder="* Your Rating out Of 5">
                            </div>
                            <div class="g-text-center--xs">
                                <button type="submit" class="text-uppercase btn-block s-btn s-btn--md s-btn--white-bg g-radius--50 g-padding-x-50--xs g-margin-b-20--xs">Submit Review</button>
                            </div>
                        </form>
                    </div>-->
                </div>
            </div>
        </div>
        <!-- End Upcoming Event -->


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
        <script type="text/javascript" src="vendor/swiper/swiper.jquery.min.js"></script>
        <script type="text/javascript" src="vendor/masonry/jquery.masonry.pkgd.min.js"></script>
        <script type="text/javascript" src="vendor/masonry/imagesloaded.pkgd.min.js"></script>
        <script type="text/javascript" src="vendor/jquery.parallax.min.js"></script>
        <script type="text/javascript" src="vendor/jquery.wow.min.js"></script>
        <script type="text/javascript" src="vendor/cubeportfolio/js/jquery.cubeportfolio.min.js"></script>
        <script type="text/javascript" src="js/components/portfolio-4-col-slider.min.js"></script>
        <!-- General Components and Settings -->
        <script type="text/javascript" src="js/global.min.js"></script>
        <script type="text/javascript" src="js/components/header-sticky.min.js"></script>
        <script type="text/javascript" src="js/components/scrollbar.min.js"></script>
        <script type="text/javascript" src="js/components/magnific-popup.min.js"></script>
        <script type="text/javascript" src="js/components/swiper.min.js"></script>
        <script type="text/javascript" src="js/components/masonry.min.js"></script>
        <script type="text/javascript" src="js/components/parallax.min.js"></script>
        <script type="text/javascript" src="js/components/google-map2.min.js"></script>
        <script type="text/javascript" src="js/components/wow.min.js"></script>
        <!--========== END JAVASCRIPTS ==========-->

    </body>
    <!-- End Body -->
</html>
