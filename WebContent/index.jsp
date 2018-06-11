<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html5>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <link rel="icon" href="images/favicon-16x16.png">
    <link rel="stylesheet" href="css/bootstrap.min.css" />
    <link rel="stylesheet" href="css/style.css" />
    <script defer src="https://use.fontawesome.com/releases/v5.0.4/js/all.js"></script>
    <title>Exam Viral | Welcome</title>
    <link rel="stylesheet" href="css/animate.css" />
    <script src="js/wow.min.js"></script>
    <script>new WOW().init();</script>
</head>
<body>
    <header>
        <nav class="navbar navbar-default navbar-fixed-top">
                <div class="container">
                <!-- Brand and toggle get grouped for better mobile display -->
                <div class="navbar-header">
                  <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                  </button>
                  <a class="navbar-brand" href="index.jsp"><img src="images/logo.jpg" alt=""> Exam Viral</a>
                </div>

                <!-- Collect the nav links, forms, and other content for toggling -->
                <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                  <ul class="nav navbar-nav">
                    <li class="active"><a href="index.jsp">Home</a>
                    <li><a href="about.jsp">About</a>
                    <!-- <li><a href="contact.jsp">Contact</a> -->
                    <li><a href="reg.jsp">Sign Up <i class="fas fa-user-plus"></i></a>
                    <li class="dropdown">
                      <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Login <span class="caret"></span></a>
                      <ul class="dropdown-menu">
                         <li><a href="login.jsp">Student Login</a></li>
                        <li><a href="adminLogin.jsp">Admin Login</a></li>
                      </ul>
                    </li>
                   </ul>
                  <!-- <form class="navbar-form navbar-right">
                    <div class="form-group">
                      <input type="text" class="form-control" placeholder="Search by Student Id">
                    </div>
                    <button type="submit" class="btn btn-default">Submit</button>
                  </form> -->
                </div><!-- /.navbar-collapse -->
              </div><!-- /.container-fluid -->
        </nav>
    </header>
<!--
    <section id="showcase">
        <div class="container">
            <h1>Exam Viral - An Affordable Web Application For Taking Online Test</h1>
            <p>Today Online Examination System has become a fast growing examination method because of its speed and accuracy. It is also needed less manpower to execute the examination. Almost all organizations now-a-days, are conducting their objective exams by online examination system, it saves students time in examinations. Organizations can also easily check the performance of the student that they give in an examination. As a result of this, organizations are releasing results in less time. It also helps the environment by saving paper.
            </p>
        </div>
    </section>
 -->
    <div class="row">
        <div class="col-lg-12">
            <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
              <!-- Indicators -->
              <ol class="carousel-indicators">
                <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
                <li data-target="#carousel-example-generic" data-slide-to="1"></li>
                <li data-target="#carousel-example-generic" data-slide-to="2"></li>
                <li data-target="#carousel-example-generic" data-slide-to="3"></li>
                <li data-target="#carousel-example-generic" data-slide-to="4"></li>
              </ol>

              <!-- Wrapper for slides -->
              <div class="carousel-inner" role="listbox">
                <div class="item active">
                  <img src="images/BannerImages/homepageImage.jpg" alt="..." class="banner1">
                  <div class="carousel-caption homepagecaption">
                    <h1 class="wow slideInLeft" data-wow-duration="0.5s" data-wow-delay="0.5s">Exam Viral - An Affordable Web Application For Taking Online Test</h1>
                  </div>
                </div>
                <div class="item">
                  <img src="images/BannerImages/banner2.png" alt="...">
                  <div class="carousel-caption">
                    
                  </div>
                </div>
                <div class="item">
                  <img src="images/BannerImages/banner3.jpg" alt="...">
                  <div class="carousel-caption">
                    
                  </div>
                </div>
                <div class="item">
                  <img src="images/BannerImages/Online-Exam.jpg" alt="...">
                  <div class="carousel-caption">
                  
                  </div>
                </div>
                <div class="item">
                  <img src="images/BannerImages/passfail.gif" alt="...">
                  <div class="carousel-caption">
                    <h1 class="wow slideInRight">Get Results Instantly</h1>
                  </div>
                </div>
              </div>

              <!-- Controls -->
              <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
                <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
                <span class="sr-only">Previous</span>
              </a>
              <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
                <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
                <span class="sr-only">Next</span>
              </a>
            </div>
        </div>
     </div>
    <div class="row">
       <div class="col-lg-12 col-md-6 col-sm-3 wow">
        <div class="wrapper-fix">
            <div class="box-main-heading">
                <h2 class="wow bounceInDown" data-wow-duration="2s" data-wow-delay="0.5s"><span>How it works?</span></h2>
            </div>
            <div class="product-box" id="hwwrk">
                <div class="hw_wrk wow bounceInUp bounce1">
                    <div class="circleshvr">
                        <div class="que_database sprite3">
                            
                        </div>
                        <div class="hw_wrk_text">Register</div>
                    </div>
                </div>
                <img src="images/HowItWorksSection/arrow.png" class="wrk_nxt wow slideInLeft slideleft" alt="">
                <div class="hw_wrk wow bounceInUp bounce2">
                    <div class="circleshvr">
                        <div class="test_design sprite3">
                            
                        </div>
                        <div class="hw_wrk_text">Log In</div>
                    </div>
                </div>
                <img src="images/HowItWorksSection/arrow.png" class="wrk_nxt wow slideInLeft slideleft1" alt="">
                <div class="hw_wrk wow bounceInUp bounce3">
                    <div class="circleshvr">
                        <div class="take_test sprite3">
                            
                        </div>
                        <div class="hw_wrk_text">Take Test</div>
                    </div>
                </div>
                <img src="images/HowItWorksSection/arrow.png" class="wrk_nxt wow slideInLeft slideleft2" alt="">
                <div class="hw_wrk wow bounceInUp bounce4">
                    <div class="circleshvr">
                        <div class="get_result sprite3">
                            
                        </div>
                        <div class="hw_wrk_text">Get Result</div>
                    </div>
                </div>
            </div><!--product box end--->
            </div><!--wrapper fix end--->
        </div><!--col div-->
    </div><!--row div-->
    <div class="row">
        <div class="col-lg-12">
            
        </div>
    </div>
    <footer id="footer">
       <div class="col-sm-12">
            <div class="footer-social">
                <ul>
                    <li><a href="http://www.facebook.com" class="WOW bounceInUp"><img src="images/FooterImages/facebook.png" alt=""/></a></li>
                    <li><a href="http://www.twitter.com"><img src="images/FooterImages/twitter.png" alt=""></a></li>
                    <li><a href="http://www.google.com"><img src="images/FooterImages/google-plus.png" alt=""></a></li>
                    <li><a href="http://www.linkedin.com"><img src="images/FooterImages/linkedin.png" alt=""></a></li>
                </ul>
            </div>
            <div class="footer-content">
                <a href="about.jsp">About us </a>|
                <a href="contactus.jsp">Contact Us</a>|
                <a href="">Support</a>|
                <a href="">Privacy Policy</a>|
                <a href="">Terms of use</a>
            </div>
            <div class="footer-cpyright">
                <p>&copy; 2018 Brain Mentors Pvt. Ltd, All Rights Reserved | <a href="index.jsp" class="footer-link">Powered by Exam Viral</a></p>
            </div>
        </div>        
    </footer>
	<script type="text/javascript" src="js/jquery-3.2.1.min.js"></script>
	<script type="text/javascript" src="js/bootstrap.min.js"></script>
</body>
</html>