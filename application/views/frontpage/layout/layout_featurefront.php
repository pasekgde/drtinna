<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>First Medic || Authorized training site dari American Heart Association </title>
    <link rel="apple-touch-icon" sizes="57x57" href="<?php echo $this->common->theme_custome(); ?>/assets/images/resources/preloader.png">
    <link rel="apple-touch-icon" sizes="60x60" href="<?php echo $this->common->theme_custome(); ?>/assets/images/resources/preloader.png">
    <link rel="apple-touch-icon" sizes="72x72" href="<?php echo $this->common->theme_custome(); ?>/assets/images/resources/preloader.png">
    <link rel="apple-touch-icon" sizes="76x76" href="<?php echo $this->common->theme_custome(); ?>/assets/images/resources/preloader.png">
    <link rel="apple-touch-icon" sizes="114x114" href="<?php echo $this->common->theme_custome(); ?>/assets/images/resources/preloader.png">
    <link rel="apple-touch-icon" sizes="120x120" href="<?php echo $this->common->theme_custome(); ?>/assets/images/resources/preloader.png">
    <link rel="apple-touch-icon" sizes="144x144" href="<?php echo $this->common->theme_custome(); ?>/assets/images/resources/preloader.png">
    <link rel="apple-touch-icon" sizes="152x152" href="<?php echo $this->common->theme_custome(); ?>/assets/images/resources/preloader.png">
    <link rel="apple-touch-icon" sizes="180x180" href="<?php echo $this->common->theme_custome(); ?>/assets/images/resources/preloader.png">
    <link rel="icon" type="image/png" sizes="192x192" href="<?php echo $this->common->theme_custome(); ?>/assets/images/resources/preloader.png">
    <link rel="icon" type="image/png" sizes="32x32" href="<?php echo $this->common->theme_custome(); ?>/assets/images/resources/preloader.png">
    <link rel="icon" type="image/png" sizes="96x96" href="<?php echo $this->common->theme_custome(); ?>/assets/images/resources/preloader.png">
    <link rel="icon" type="image/png" sizes="16x16" href="<?php echo $this->common->theme_custome(); ?>/assets/images/resources/preloader.png">
    <link rel="manifest" href="<?php echo $this->common->theme_custome(); ?>/assets/images/resources/preloader.png">
    <meta name="msapplication-TileColor" content="#ffffff">
    <meta name="msapplication-TileImage" content="images/favicon/ms-icon-144x144.png">
    <meta name="theme-color" content="#ffffff">
    <link rel="stylesheet" href="<?php echo $this->common->theme_custome(); ?>/assets/css\style.css">
    <link rel="stylesheet" href="<?php echo $this->common->theme_custome(); ?>/assets/css\responsive.css">    
    <link rel="stylesheet" href="<?php echo $this->common->theme_custome(); ?>/assets/css\custom.css">
</head>

<body>
    <div class="preloader"><span></span></div><!-- /.preloader -->
    <div class="page-wrapper">
        <section class="topbar-one">
            <div class="container">
                <div class="topbar-one__left-text">Upcoming Schedule: ACLS Training (24 Desember 2019)</div><!-- /.left-text -->
                <div class="topbar-one__right-content">
                    <div class="topbar-one__social">
                        <a href="facebook.com/firstmedic"><i class="fa fa-facebook-f"></i></a>
                        <a href="instagram.com/first_medic"><i class="fa fa-instagram"></i></a>
                    </div><!-- /.topbar-one__social -->

                    <a href="mailto:info.firstmedic@gmail.com" class="topbar-one__btn">Send us an Email</a>
                </div><!-- /.right-content -->
            </div><!-- /.container -->
        </section><!-- /.topbar-one -->
        <header class="site-header header-one">
            <nav class="navbar navbar-expand-lg navbar-light header-navigation stricky">
                <div class="container clearfix">
                    <!-- Brand and toggle get grouped for better mobile display -->
                    <div class="logo-box clearfix">
                        <a class="navbar-brand" href="<?=site_url('/')?>">
                            <img src="<?php echo $this->common->theme_custome(); ?>/assets/images\resources\logo-1-1.png" class="main-logo" alt="First Medic Logo">
                            <img src="<?php echo $this->common->theme_custome(); ?>/assets/images\resources\logo-1-1.png" class="stick-logo" alt="First Medic Logo">
                        </a>
                        <button class="menu-toggler" data-target=".main-navigation">
                            <span class="fa fa-bars"></span>
                        </button>
                    </div><!-- /.logo-box -->
                    <!-- Collect the nav links, forms, and other content for toggling -->
                    <div class="main-navigation">
                        <?php
                            $data=array(
                                    "menu" => $menu,
                                    "submenu" => $submenu,
                                ); 
                            $this->load->view('frontpage/layout/layout_menu',$data);?>
                    </div><!-- /.navbar-collapse -->
                    <div class="right-side-box">
                        <a href="tel:+62877 8222 0555" class="header-one__cta">
                            <span class="header-one__cta-icon">
                                <i class="dentallox-icon-call-answer"></i>
                            </span>
                            <span class="header-one__cta-content">
                                <span class="header-one__cta-text">Call Us for query:</span>
                                <span class="header-one__cta-number">0877 8222 0555</span>
                            </span>
                        </a>
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
                        <a class="footer-widget__logo" href="index.html"><img src="<?php echo $this->common->theme_custome(); ?>/assets/images\resources\logo-1-2.png" alt="Awesome Image"></a>
                        <p class="footer-widget__text">First medic merupakan authorized training site dari American Heart association berlokasi di Bali. First Medic berdiri sejak 2018 dibawah PT. Aditama Medika Nusantara</p>
                    </div><!-- /.footer-widget -->
                    <div class="footer-widget">
                        <h3 class="footer-widget__title">
                            Healtcare Professional
                        </h3>
                        <ul class="footer-widget__links-list">
                            <li class="footer-widget__links-list-item"> <a href="<?=site_url('/')?>">Home</a> </li><!-- /.footer-widget__links-list-item -->
                            <li class="footer-widget__links-list-item"><a href="<?=$this->common->slug_link('/home/training/1')?>">Regular ACLS</a></li>
                            <li class="footer-widget__links-list-item"><a href="<?=$this->common->slug_link('/home/training/2')?>">Regular PALS</a></li>
                            <li class="footer-widget__links-list-item"><a href="<?=$this->common->slug_link('/home/training/3')?>">Onsite Basic Life Support</a></li>
                            <li class="footer-widget__links-list-item"><a href="<?=$this->common->slug_link('/home/training/4')?>">Onsite ACLS</a></li>
                            <li class="footer-widget__links-list-item"><a href="<?=$this->common->slug_link('/home/training/5')?>">Onsite PALS</a></li>
                            <li class="footer-widget__links-list-item"><a href="<?=$this->common->slug_link('/home/training/6')?>">Private Class</a></li>
                            <!-- /.footer-widget__links-list-item -->
                        </ul><!-- /.footer-widget__links-list -->
                    </div><!-- /.footer-widget -->
                    <div class="footer-widget">
                        <h3 class="footer-widget__title">
                            Lay rescuer Professional
                        </h3>
                        <ul class="footer-widget__time-list">
                              <li class="footer-widget__time-list-item"><a href="<?=$this->common->slug_link('/home/training/7')?>">Onsite First Aid, CPR & AED</a></li>
                            <li class="footer-widget__time-list-item"><a href="<?=$this->common->slug_link('/home/training/8')?>">Onsite Heartsaver</a></li><!-- /.footer-widget__time-list-item -->
                        </ul><!-- /.footer-widget__time-list -->
                    </div><!-- /.footer-widget -->
                    <div class="footer-widget">
                        <h3 class="footer-widget__title">
                            Get In Touch
                        </h3>
                        <ul class="footer-widget__time-list no-margin">
                            <li class="footer-widget__time-list-item">Jl. Katalia No. 5</li><!-- /.footer-widget__time-list-item -->
                            <li class="footer-widget__time-list-item">Denpasar, Bali</li><!-- /.footer-widget__time-list-item -->
                            <li class="footer-widget__time-list-item">Phone : <a href="tel:+6281805510887 ">+6281 8055 10887 </a></li><!-- /.footer-widget__time-list-item -->
                            <li class="footer-widget__time-list-item">Email : <a href="mailto:info.firstmedic@gmail.com">info@dentallox.com</a></li><!-- /.footer-widget__time-list-item -->
                        </ul><!-- /.footer-widget__time-list -->
                        <div class="footer-widget__social">
                            
                        <a href="facebook.com/firstmedic"><i class="fa fa-facebook-f"></i></a>
                        <a href="instagram.com/first_medic"><i class="fa fa-instagram"></i></a>
                        </div><!-- /.footer-widget__social -->
                    </div><!-- /.footer-widget -->
                </div><!-- /.footer-col -->
            </div><!-- /.container -->
            <div class="bottom-footer">
                <div class="container">
                    <hr class="bottom-footer__line">
                    <div class="bottom-footer__wrap">
                        <p class="bottom-footer__text">&copy; Copyright First Medic 2019 . All right reserved.</p><!-- /.bottom-footer__text -->
                        <p class="bottom-footer__text">Created by <a href="#">FirstMedic</a></p><!-- /.bottom-footer__text -->
                    </div><!-- /.bottom-footer__wrap -->
                </div><!-- /.container -->
            </div><!-- /.bottom-footer -->
        </footer><!-- /.site-footer -->
    </div><!-- /.page-wrapper -->
    <a href="#" data-target="html" class="scroll-to-target scroll-to-top"><i class="fa fa-angle-up"></i></a>
    <!-- /.scroll-to-top -->
    <script src="<?php echo $this->common->theme_custome(); ?>/assets/js\jquery.js"></script>
    <script src="<?php echo $this->common->theme_custome(); ?>/assets/js\bootstrap.bundle.min.js"></script>
    <script src="<?php echo $this->common->theme_custome(); ?>/assets/js\bootstrap-select.min.js"></script>
    <script src="<?php echo $this->common->theme_custome(); ?>/assets/js\bootstrap-datepicker.min.js"></script>
    <script src="<?php echo $this->common->theme_custome(); ?>/assets/js\owl.carousel.min.js"></script>
    <script src="<?php echo $this->common->theme_custome(); ?>/assets/js\theme.js"></script>
</body>

</html>