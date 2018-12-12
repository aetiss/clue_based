<%-- 
    Document   : my_prof
    Created on : Nov 28, 2017, 12:37:58 PM
    Author     : java3
--%>

<%@page import="java.text.DateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
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
        <title>Megakit - HTML5 Theme</title>
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
            <script type="text/javascript" src="js/canvas.js"></script>
        
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
                            <div class="s-header__logo" style="color: white">
                                My Profile
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
                            <li class="s-header__nav-menu-item"><a class="s-header__nav-menu-link s-header__nav-menu-link-divider" href="recom_places.jsp">Recommended Place in Your Location</a></li>
                            <li class="s-header__nav-menu-item"><a class="s-header__nav-menu-link s-header__nav-menu-link-divider" href="top_ranked_places.jsp">Top k Ranked Places</a></li>
                            <li class="s-header__nav-menu-item"><a class="s-header__nav-menu-link s-header__nav-menu-link-divider" href="index.jsp">Logout</a></li>
                        </ul>
                    </div>
                </nav>
                <!-- End Nav -->
            </div>
            <!-- End Overlay -->
        </header>
  <div class="g-bg-color--primary-to-blueviolet-ltr">
            <div class="container g-padding-y-80--xs g-padding-y-125--xsm">
                <div class="g-text-center--xs g-margin-b-80--xs">
                    <p class="text-uppercase g-font-size-14--xs g-font-weight--700 g-color--primary g-letter-spacing--2 g-margin-b-25--xs">Plan</p>
                    <h2 class="g-font-size-32--xs g-font-size-36--md">Top K Searched Places</h2>
                </div>
                <%      DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd");
                Date date = new Date();
                String time = dateFormat.format(date);
                String val1 = "", val2 = "", val3 = "", val4 = "", val5 = "", val6 = "";
                String val11 = "", val22 = "", val33 = "", val44 = "", val55 = "", val66 = "";
                int i = 0;
                System.out.println("Date and Time : " + time);
                
                try {
                    Connection con = SQLconnection.getconnection();
                   
                Statement st = con.createStatement();
                    ResultSet rs0 = st.executeQuery("SELECT search, COUNT(search) AS value_occurrence FROM  search GROUP BY search ORDER BY value_occurrence DESC LIMIT 6");
                    while(rs0.next()) {
                        i++;
                        if (i == 1) {
                            val1 = rs0.getString("search");
                            val11 = rs0.getString("value_occurrence");
                        } else if (i == 2) {
                            val2 = rs0.getString("search");
                            val22 = rs0.getString("value_occurrence");
                        } else if (i == 3) {
                            val3 = rs0.getString("search");
                            val33 = rs0.getString("value_occurrence");
                        }
                         else if (i == 4) {
                            val4 = rs0.getString("search");
                            val44 = rs0.getString("value_occurrence");
                        }
                         else if (i == 5) {
                            val5 = rs0.getString("search");
                            val55 = rs0.getString("value_occurrence");
                        }
                         else if (i == 6) {
                            val6 = rs0.getString("search");
                            val66 = rs0.getString("value_occurrence");
                        }
                    }

                   //Integer sii = rs0.getInt("value_occurrence");
                    System.out.println("count------------------> " + val1);
                    System.out.println("count------------------> " + val2);
                    System.out.println("count------------------> " + val3);
                    System.out.println("count------------------> " + val4);
                    System.out.println("count------------------> " + val5);
                    System.out.println("count------------------> " + val6);
                    System.out.println("count------------------> " + val11);
                    System.out.println("count------------------> " + val22);
                    System.out.println("count------------------> " + val33);
                    System.out.println("count------------------> " + val44);
                    System.out.println("count------------------> " + val55);
                    System.out.println("count------------------> " + val66);

                }

        catch(Exception ex) {
                                    ex.printStackTrace();
                                }
                
        %>

                <div class="row g-row-col--5">
                    <div id="chartContainer" style="height: 700px; width: 100%;"></div>
             <script>
window.onload = function () {
	
var chart = new CanvasJS.Chart("chartContainer", {
	animationEnabled: true,
	
	title:{
		text:"Top Searched Places"
	},
	axisX:{
		interval: 1
	},
	axisY2:{
		interlacedColor: "rgba(1,77,101,.2)",
		gridColor: "rgba(1,77,101,.1)",
		title: "Number of Times"
	},
	data: [{
		type: "bar",
		name: "companies",
		axisYType: "secondary",
		color: "#014D65",
		dataPoints: [
			{ y: <%=val11%>, label: "<%=val1%>" },
			{ y: <%=val22%>, label: "<%=val2%>" },
			{ y: <%=val33%>, label: "<%=val3%>" },
			{ y: <%=val44%>, label: "<%=val4%>" },
			{ y: <%=val55%>, label: "<%=val5%>" },
			{ y: <%=val66%>, label: "<%=val6%>" }
		]
	}]
});
chart.render();

}
</script>
                </div>
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
