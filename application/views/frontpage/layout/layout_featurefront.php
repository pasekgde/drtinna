<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Home Five || Dentallox || Health & Medical HTML Template</title>
    <link rel="apple-touch-icon" sizes="57x57" href="<?php echo $this->common->theme_custome(); ?>\assets\images\favicon\apple-icon-57x57.png">
    <link rel="apple-touch-icon" sizes="60x60" href="<?php echo $this->common->theme_custome(); ?>\assets\images\favicon\apple-icon-60x60.png">
    <link rel="apple-touch-icon" sizes="72x72" href="<?php echo $this->common->theme_custome(); ?>\assets\images\favicon\apple-icon-72x72.png">
    <link rel="apple-touch-icon" sizes="76x76" href="<?php echo $this->common->theme_custome(); ?>\assets\images\favicon\apple-icon-76x76.png">
    <link rel="apple-touch-icon" sizes="114x114" href="<?php echo $this->common->theme_custome(); ?>\assets\images\favicon\apple-icon-114x114.png">
    <link rel="apple-touch-icon" sizes="120x120" href="<?php echo $this->common->theme_custome(); ?>\assets\images\favicon\apple-icon-120x120.png">
    <link rel="apple-touch-icon" sizes="144x144" href="<?php echo $this->common->theme_custome(); ?>\assets\images\favicon\apple-icon-144x144.png">
    <link rel="apple-touch-icon" sizes="152x152" href="<?php echo $this->common->theme_custome(); ?>\assets\images\favicon\apple-icon-152x152.png">
    <link rel="apple-touch-icon" sizes="180x180" href="<?php echo $this->common->theme_custome(); ?>\assets\images\favicon\apple-icon-180x180.png">
    <link rel="icon" type="image/png" sizes="192x192" href="<?php echo $this->common->theme_custome(); ?>\assets\images\favicon\android-icon-192x192.png">
    <link rel="icon" type="image/png" sizes="32x32" href="<?php echo $this->common->theme_custome(); ?>\assets\images\favicon\favicon-32x32.png">
    <link rel="icon" type="image/png" sizes="96x96" href="<?php echo $this->common->theme_custome(); ?>\assets\images\favicon\favicon-96x96.png">
    <link rel="icon" type="image/png" sizes="16x16" href="<?php echo $this->common->theme_custome(); ?>\assets\images\favicon\favicon-16x16.png">
    <link rel="manifest" href="<?php echo $this->common->theme_custome(); ?>\assets\images\favicon\manifest.json">
    <meta name="msapplication-TileColor" content="#ffffff">
    <meta name="msapplication-TileImage" content="<?php echo $this->common->theme_custome(); ?>\assets\images/favicon/ms-icon-144x144.png">
    <meta name="theme-color" content="#ffffff">
    <link rel="stylesheet" href="<?php echo $this->common->theme_custome(); ?>\assets\css\style.css">
    <link rel="stylesheet" href="<?php echo $this->common->theme_custome(); ?>\assets\css\responsive.css">
</head>

<body>
    <div class="preloader"><span></span></div><!-- /.preloader -->
    <div class="page-wrapper">
        <header class="site-header header-one header-one__home-two header-one__home-five">
            <nav class="navbar navbar-expand-lg navbar-light header-navigation stricky">
                <div class="container clearfix">
                    <!-- Brand and toggle get grouped for better mobile display -->
                    <div class="logo-box clearfix">
                        <a class="navbar-brand" href="index.html">
                            <img src="<?php echo $this->common->theme_custome(); ?>\assets\images\resources\logodrtinna.png" class="main-logo" alt="Awesome Image">
                            <img src="<?php echo $this->common->theme_custome(); ?>\assets\images\resources\logodrtinna2.png" class="stick-logo" alt="Awesome Image">
                        </a>
                        <button class="menu-toggler" data-target=".main-navigation">
                            <span class="fa fa-bars"></span>
                        </button>
                    </div><!-- /.logo-box -->
                    <!-- Collect the nav links, forms, and other content for toggling -->
                    <div class="main-navigation">
                        <?php
                            $this->load->view('frontpage/layout/layout_menu');
                        ?>
                    </div><!-- /.navbar-collapse -->
                    <div class="right-side-box">
                        <a href="#test-search" class="header-one__search popup-with-zoom-anim"><i class="icon icon-Search"></i></a>
                        <a href="tel:1800-685-4321" class="header-one__call">1800 685 4321</a>
                    </div><!-- /.right-side-box -->
                </div>
                <!-- /.container -->
            </nav>
        </header><!-- /.header-one -->
        
        
        <?=$content?>
        
        <footer class="site-footer">
            <div class="container ">
                <div class="footer-col">
                    <div class="footer-widget footer-widget__about">
                        <a class="footer-widget__logo" href="index.html"><img src="<?php echo $this->common->theme_custome(); ?>\assets\images\resources\logodrtinna.png" alt="Awesome Image"></a>
                        <p class="footer-widget__text">Dentallox is a HTML Template to build Dentist Website. It has
                            good features and you will love.</p>
                        <a href="#" class="footer-widget__link">Read more ...</a>
                    </div><!-- /.footer-widget -->
                    <div class="footer-widget">
                        <h3 class="footer-widget__title">
                            Useful Links
                        </h3>
                        <ul class="footer-widget__links-list">
                            <li class="footer-widget__links-list-item"> <a href="#">Home</a> </li>
                            <!-- /.footer-widget__links-list-item -->
                            <li class="footer-widget__links-list-item"> <a href="#">About Us</a> </li>
                            <!-- /.footer-widget__links-list-item -->
                            <li class="footer-widget__links-list-item"> <a href="#">Testimonials</a> </li>
                            <!-- /.footer-widget__links-list-item -->
                            <li class="footer-widget__links-list-item"> <a href="#">Book an Appointment</a> </li>
                            <!-- /.footer-widget__links-list-item -->
                            <li class="footer-widget__links-list-item"> <a href="#">Contact Us</a> </li>
                            <!-- /.footer-widget__links-list-item -->
                        </ul><!-- /.footer-widget__links-list -->
                    </div><!-- /.footer-widget -->
                    <div class="footer-widget">
                        <h3 class="footer-widget__title">
                            Time Schedule
                        </h3>
                        <ul class="footer-widget__time-list">
                            <li class="footer-widget__time-list-item">Monday 9:00 am – 6:00 pm </li>
                            <!-- /.footer-widget__time-list-item -->
                            <li class="footer-widget__time-list-item">Tuesday 9:00 am – 6:00 pm </li>
                            <!-- /.footer-widget__time-list-item -->
                            <li class="footer-widget__time-list-item">Wednesday Closed </li>
                            <!-- /.footer-widget__time-list-item -->
                            <li class="footer-widget__time-list-item">Thursday 8:00 am – 4:00 pm </li>
                            <!-- /.footer-widget__time-list-item -->
                            <li class="footer-widget__time-list-item">Friday 8:00 am – 2:00 pm</li>
                            <!-- /.footer-widget__time-list-item -->
                        </ul><!-- /.footer-widget__time-list -->
                    </div><!-- /.footer-widget -->
                    <div class="footer-widget">
                        <h3 class="footer-widget__title">
                            Get In Touch
                        </h3>
                        <ul class="footer-widget__time-list no-margin">
                            <li class="footer-widget__time-list-item">568 Anthum Tower Suite, Los Angeles,</li>
                            <!-- /.footer-widget__time-list-item -->
                            <li class="footer-widget__time-list-item">California CA 90056, USA</li>
                            <!-- /.footer-widget__time-list-item -->
                            <li class="footer-widget__time-list-item">Phone : +1800 456 7890</li>
                            <!-- /.footer-widget__time-list-item -->
                            <li class="footer-widget__time-list-item">Email : info@dentallox.com</li>
                            <!-- /.footer-widget__time-list-item -->
                        </ul><!-- /.footer-widget__time-list -->
                        <div class="footer-widget__social">
                            <a href="#"><i class="fa fa-facebook-f"></i></a>
                            <a href="#"><i class="fa fa-linkedin"></i></a>
                            <a href="#"><i class="fa fa-twitter"></i></a>
                            <a href="#"><i class="fa fa-google-plus"></i></a>
                        </div><!-- /.footer-widget__social -->
                    </div><!-- /.footer-widget -->
                </div><!-- /.footer-col -->
            </div><!-- /.container -->
            <div class="bottom-footer">
                <div class="container">
                    <hr class="bottom-footer__line">
                    <div class="bottom-footer__wrap">
                        <p class="bottom-footer__text">&copy; Copyright Dantallox 2019 . All right reserved.</p>
                        <!-- /.bottom-footer__text -->
                        <p class="bottom-footer__text">Created by <a href="#">ThemeArc</a></p>
                        <!-- /.bottom-footer__text -->
                    </div><!-- /.bottom-footer__wrap -->
                </div><!-- /.container -->
            </div><!-- /.bottom-footer -->
        </footer><!-- /.site-footer -->
    </div><!-- /.page-wrapper -->
    <a href="#" data-target="html" class="scroll-to-target scroll-to-top"><i class="fa fa-angle-up"></i></a>

    <script src="<?php echo $this->common->theme_custome(); ?>/assets/js\jquery.js"></script>
    <script src="<?php echo $this->common->theme_custome(); ?>/assets/js\bootstrap.bundle.min.js"></script>
    <script src="<?php echo $this->common->theme_custome(); ?>/assets/js\bootstrap-select.min.js"></script>
    <script src="<?php echo $this->common->theme_custome(); ?>/assets/js\bootstrap-datepicker.min.js"></script>
    <script src="<?php echo $this->common->theme_custome(); ?>/assets/js\owl.carousel.min.js"></script>
    <script src="<?php echo $this->common->theme_custome(); ?>/assets/js\jquery.validate.min.js"></script>
    <script src="<?php echo $this->common->theme_custome(); ?>/assets/js\jquery.magnific-popup.min.js"></script>
    <script src="<?php echo $this->common->theme_custome(); ?>/assets/js\theme.js"></script>
    <!-- /.scroll-to-top -->
    
  
</body>

</html>