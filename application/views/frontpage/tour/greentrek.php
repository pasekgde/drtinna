

            <div class="traveltour-page-wrapper" id="traveltour-page-wrapper">
                <div class="tourmaster-page-wrapper tourmaster-tour-style-1 tourmaster-with-sidebar" id="tourmaster-page-wrapper">

                    <div class="tourmaster-single-header" style="background-image: url(../../theme_costume/<?='upload/tour/'.$selectTour["img-background"]?>);">
                   
                        <div class="tourmaster-single-header-background-overlay"></div>
                        <div class="tourmaster-single-header-top-overlay"></div>
                        <div class="tourmaster-single-header-overlay"></div>
                        <div class="tourmaster-single-header-container tourmaster-container">
                            <div class="tourmaster-single-header-container-inner">
                                <div class="tourmaster-single-header-title-wrap tourmaster-item-pdlr">
                                    <h1 class="tourmaster-single-header-title"><?= $selectTour["name"] ?></h1>
                                </div>
                                <div class="tourmaster-header-price tourmaster-item-mglr">
                                    <div class="tourmaster-header-price-ribbon"><?= $selectTour["promo"] ?></div>
                                    <div class="tourmaster-header-price-wrap">
                                        <div class="tourmaster-header-price-overlay"></div>
                                        <div class="tourmaster-tour-price-wrap tourmaster-discount"><span class="tourmaster-tour-price"><span class="tourmaster-head">From</span></span><span class="tourmaster-tour-discount-price"><?= $selectTour["startprice"] ?></span><span class="fa fa-info-circle tourmaster-tour-price-info" data-rel="tipsy" title="The initial price based on 1 adult with the lowest price in low season"></span></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="tourmaster-template-wrapper">
                        <div class="tourmaster-tour-booking-bar-container tourmaster-container">
                            <div class="tourmaster-tour-booking-bar-container-inner">
                                <div class="tourmaster-tour-booking-bar-anchor tourmaster-item-mglr"></div>
                                <div class="tourmaster-tour-booking-bar-wrap tourmaster-item-mglr" id="tourmaster-tour-booking-bar-wrap">
                                    <div class="tourmaster-tour-booking-bar-outer">
                                        <div class="tourmaster-header-price tourmaster-item-mglr">
                                            <div class="tourmaster-header-price-ribbon"><?= $selectTour["promo"] ?></div>
                                            <div class="tourmaster-header-price-wrap">
                                                <div class="tourmaster-header-price-overlay"></div>
                                                <div class="tourmaster-tour-price-wrap tourmaster-discount"><span class="tourmaster-tour-price"><span class="tourmaster-head">From</span><span class="tourmaster-tour-discount-price"><?= $selectTour["startprice"] ?></span><span class="fa fa-info-circle tourmaster-tour-price-info" data-rel="tipsy" title="The initial price based on 1 adult with the lowest price in low season"></span></div>
                                            </div>
                                        </div>
                                        <?php $this->load->view("frontpage/tour/enquiry_form",$selectTour); ?>
                                    </div>
                                    <div class="tourmaster-tour-booking-bar-widget  traveltour-sidebar-area">
                                        <div id="text-11" class="widget widget_text traveltour-widget">
                                            <div class="textwidget"><span class="gdlr-core-space-shortcode" style="margin-top: -20px ;"></span>
                                            <div class="gdlr-core-widget-list-shortcode" id="gdlr-core-widget-list-0"><h3 class="gdlr-core-widget-list-shortcode-title">Why Book Greenbike Tour?</h3>
                                            <ul>
                                                <li><i class="fa fa-dollar" style="font-size: 15px;color: #7fd647;margin-right: 13px;"></i>Reasonable Price</li>
                                                <li><i class="fa fa-handshake-o" style="font-size: 15px;color: #7fd647;margin-right: 13px;"></i>No Hidden Fees</li>
                                                <li><i class="fa fa-users" style="font-size: 15px;color: #7fd647;margin-right: 10px;"></i>Small Group Cycling (Max 6-8 pax)</li>
                                                <li><i class="fa fa-bicycle" style="font-size: 15px;color: #7fd647;margin-right: 10px;"></i>Non-Touristy Route</li>
                                                <li><i class="fa fa-user-secret " style="font-size: 15px;color: #7fd647;margin-right: 10px;"></i>Professional Team</li>
                                            </ul>
                                            </div>
                                            </div>
                                        </div>

                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="tourmaster-tour-info-outer">
                            <div class="tourmaster-tour-info-outer-container tourmaster-container">
                                <div class="tourmaster-tour-info-wrap clearfix">
                                    <div class="tourmaster-tour-info tourmaster-tour-info-duration-text tourmaster-item-pdlr"><i class="icon_clock_alt"></i>± 3 - 4 hours</div>
                                    <div class="tourmaster-tour-info tourmaster-tour-info-availability tourmaster-item-pdlr"><i class="fa fa-calendar"></i>Available Everyday</div>
                                    <div class="tourmaster-tour-info tourmaster-tour-info-departure-location tourmaster-item-pdlr"><i class="flaticon-takeoff-the-plane"></i>Detail Hotel Needed</div>
                                    <div class="tourmaster-tour-info tourmaster-tour-info-return-location tourmaster-item-pdlr"><i class="flaticon-plane-landing"></i>Detail Hotel Needed</div>
                                    <div class="tourmaster-tour-info tourmaster-tour-info-minimum-age tourmaster-item-pdlr"><i class="fa fa-user"></i>Min Age : 10+</div>
                                    <div class="tourmaster-tour-info tourmaster-tour-info-minimum-age tourmaster-item-pdlr"><i class="fa fa-users"></i>Max People : 20</div>
                                    
                                </div>
                            </div>
                        </div>
                        <div class="gdlr-core-page-builder-body">
                            <div class="gdlr-core-pbf-wrapper " style="padding: 0px 0px 0px 0px;">
                                <div class="gdlr-core-pbf-wrapper-content gdlr-core-js ">
                                    <div class="gdlr-core-pbf-wrapper-container clearfix gdlr-core-pbf-wrapper-full">
                                        <div class="gdlr-core-pbf-element">
                                            <div class="tourmaster-content-navigation-item-wrap clearfix" style="padding-bottom: 0px;">
                                                <div class="tourmaster-content-navigation-item-outer" id="tourmaster-content-navigation-item-outer">
                                                    <div class="tourmaster-content-navigation-item-container tourmaster-container">
                                                        <div class="tourmaster-content-navigation-item tourmaster-item-pdlr"><a class="tourmaster-content-navigation-tab tourmaster-active" href="#detail">Detail</a><a class="tourmaster-content-navigation-tab " href="#itinerary">Itinerary</a><a class="tourmaster-content-navigation-tab " href="#map">Map</a><a class="tourmaster-content-navigation-tab " href="#photos">Photos</a>
                                                            <div class="tourmaster-content-navigation-slider"></div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="gdlr-core-pbf-wrapper " style="padding: 70px 0px 30px 0px;" data-skin="Blue Icon" id="detail">
                                <div class="gdlr-core-pbf-wrapper-content gdlr-core-js ">
                                    <div class="gdlr-core-pbf-wrapper-container clearfix gdlr-core-container">
                                        <div class="gdlr-core-pbf-element">
                                            <div class="gdlr-core-title-item gdlr-core-item-pdb clearfix  gdlr-core-left-align gdlr-core-title-item-caption-bottom gdlr-core-item-pdlr" style="padding-bottom: 35px ;">
                                                <div class="gdlr-core-title-item-title-wrap">
                                                    <h6 class="gdlr-core-title-item-title gdlr-core-skin-title" style="font-size: 24px ;font-weight: 600 ;letter-spacing: 0px ;text-transform: none ;"><span class="gdlr-core-title-item-left-icon" style="font-size: 18px ;"  ><i class="fa fa-file-text-o"  ></i></span>Tour Details<span class="gdlr-core-title-item-title-divider gdlr-core-skin-divider" ></span></h6></div>
                                            </div>
                                        </div>
                                        <div class="gdlr-core-pbf-element">
                                            <div class="gdlr-core-text-box-item gdlr-core-item-pdlr gdlr-core-item-pdb gdlr-core-left-align">
                                                <div class="gdlr-core-text-box-item-content">
<p>Complete your holiday in Bali by doing our GreenTrek that will allow you to explore more of this beautiful island. We made a route in the middle of Ubud. Down to Paddies Farm, Jungle and beautiful restaurant at the end of trip.&nbsp;This trek is unique, since it not too faraway from famous Ubud.</p>
<p>Best way to spend your day as well as to get bit exercise on your vacation. Our local guide will be happy to share their knowledge about local custom and all things we will see on the way.</p>
<p>If you need another kind of adventures tour, you could see our <a href="http://www.greenbiketour.com/tour/">another tour here</a>.</p>



                                                </div>
                                            </div>
                                        </div>
                                         <div class="gdlr-core-pbf-element">
                                            <div class="gdlr-core-divider-item gdlr-core-item-pdlr gdlr-core-item-mgb gdlr-core-divider-item-normal gdlr-core-center-align" style="margin-bottom: 19px ;">
                                                <div class="gdlr-core-divider-line gdlr-core-skin-divider"></div>
                                            </div>
                                        </div>
                                        <!-- pickup time -->
                                                                             

                                        <!-- Schedule Activity -->
                                        <div class="gdlr-core-pbf-column gdlr-core-column-30 gdlr-core-column-first">
                                            <div class="gdlr-core-pbf-column-content-margin gdlr-core-js ">
                                                <div class="gdlr-core-pbf-column-content clearfix gdlr-core-js ">
                                                    <div class="gdlr-core-pbf-element">
                                                        <div class="gdlr-core-title-item gdlr-core-item-pdb clearfix  gdlr-core-left-align gdlr-core-title-item-caption-top gdlr-core-item-pdlr" style="padding-bottom: 0px ;">
                                                            <div class="gdlr-core-title-item-title-wrap">
                                                                <h3 class="gdlr-core-title-item-title gdlr-core-skin-title" style="font-size: 15px ;font-weight: 500 ;letter-spacing: 0px ;text-transform: none ;">Schedule Activity<span class="gdlr-core-title-item-title-divider gdlr-core-skin-divider" ></span></h3></div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="gdlr-core-pbf-column gdlr-core-column-30">
                                            <div class="gdlr-core-pbf-column-content-margin gdlr-core-js ">
                                                <div class="gdlr-core-pbf-column-content clearfix gdlr-core-js ">
                                                    <div class="gdlr-core-pbf-element">
                                                        <div class="gdlr-core-icon-list-item gdlr-core-item-pdlr gdlr-core-item-pdb clearfix " style="padding-bottom: 10px ;">
                                                            <ul>
                                                                <li class=" gdlr-core-skin-divider"><span class="gdlr-core-icon-list-icon-wrap"><i class="gdlr-core-icon-list-icon fa fa-clock-o" style="color: #4692e7 ;" ></i></span>
                                                                    <div class="gdlr-core-icon-list-content-wrap"><span class="gdlr-core-icon-list-content">Trekking Trip (± 4 - 5 Hours)</span></div>
                                                                </li>

                                                            
                                                                                                                                
                                                            </ul>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="gdlr-core-pbf-element">
                                            <div class="gdlr-core-divider-item gdlr-core-item-pdlr gdlr-core-item-mgb gdlr-core-divider-item-normal gdlr-core-center-align" style="margin-bottom: 19px ;">
                                                <div class="gdlr-core-divider-line gdlr-core-skin-divider"></div>
                                            </div>
                                        </div>
                                        <div class="gdlr-core-pbf-column gdlr-core-column-30 gdlr-core-column-first">
                                            <div class="gdlr-core-pbf-column-content-margin gdlr-core-js ">
                                                <div class="gdlr-core-pbf-column-content clearfix gdlr-core-js ">
                                                    <div class="gdlr-core-pbf-element">
                                                        <div class="gdlr-core-title-item gdlr-core-item-pdb clearfix  gdlr-core-left-align gdlr-core-title-item-caption-top gdlr-core-item-pdlr" style="padding-bottom: 0px ;">
                                                            <div class="gdlr-core-title-item-title-wrap">
                                                                <h3 class="gdlr-core-title-item-title gdlr-core-skin-title" style="font-size: 15px ;font-weight: 500 ;letter-spacing: 0px ;text-transform: none ;">Price Includes<span class="gdlr-core-title-item-title-divider gdlr-core-skin-divider" ></span></h3></div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="gdlr-core-pbf-column gdlr-core-column-30">
                                            <div class="gdlr-core-pbf-column-content-margin gdlr-core-js ">
                                                <div class="gdlr-core-pbf-column-content clearfix gdlr-core-js ">
                                                    <div class="gdlr-core-pbf-element">
                                                        <div class="gdlr-core-icon-list-item gdlr-core-item-pdlr gdlr-core-item-pdb clearfix " style="padding-bottom: 10px ;">
                                                            <ul>
                                                                <li class=" gdlr-core-skin-divider"><span class="gdlr-core-icon-list-icon-wrap"><i class="gdlr-core-icon-list-icon fa fa-check" style="color: #4692e7 ;" ></i></span>
                                                                    <div class="gdlr-core-icon-list-content-wrap"><span class="gdlr-core-icon-list-content">Water</span></div>
                                                                </li>
                                                                <li class=" gdlr-core-skin-divider"><span class="gdlr-core-icon-list-icon-wrap"><i class="gdlr-core-icon-list-icon fa fa-check" style="color: #4692e7 ;" ></i></span>
                                                                    <div class="gdlr-core-icon-list-content-wrap"><span class="gdlr-core-icon-list-content">Hotel pick-up & drop off W/ an A/C car</span></div>
                                                                </li>
                                                                <li class=" gdlr-core-skin-divider"><span class="gdlr-core-icon-list-icon-wrap"><i class="gdlr-core-icon-list-icon fa fa-check" style="color: #4692e7 ;" ></i></span>
                                                                    <div class="gdlr-core-icon-list-content-wrap"><span class="gdlr-core-icon-list-content">Professional English-speaking guide</span></div>
                                                                </li>
                                                                <li class=" gdlr-core-skin-divider"><span class="gdlr-core-icon-list-icon-wrap"><i class="gdlr-core-icon-list-icon fa fa-check" style="color: #4692e7 ;" ></i></span>
                                                                    <div class="gdlr-core-icon-list-content-wrap"><span class="gdlr-core-icon-list-content">Fresh juice and young coconut</span></div>
                                                                </li>
                                                                <li class=" gdlr-core-skin-divider"><span class="gdlr-core-icon-list-icon-wrap"><i class="gdlr-core-icon-list-icon fa fa-check" style="color: #4692e7 ;" ></i></span>
                                                                    <div class="gdlr-core-icon-list-content-wrap"><span class="gdlr-core-icon-list-content">Lunch</span></div>
                                                                </li>
                                                                <li class=" gdlr-core-skin-divider"><span class="gdlr-core-icon-list-icon-wrap"><i class="gdlr-core-icon-list-icon fa fa-check" style="color: #4692e7 ;" ></i></span>
                                                                    <div class="gdlr-core-icon-list-content-wrap"><span class="gdlr-core-icon-list-content">Insuranced</span></div>
                                                                </li>
                                                            </ul>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="gdlr-core-pbf-element">
                                            <div class="gdlr-core-divider-item gdlr-core-item-pdlr gdlr-core-item-mgb gdlr-core-divider-item-normal gdlr-core-center-align" style="margin-bottom: 19px ;">
                                                <div class="gdlr-core-divider-line gdlr-core-skin-divider"></div>
                                            </div>
                                        </div>
                                        <div class="gdlr-core-pbf-column gdlr-core-column-30 gdlr-core-column-first">
                                            <div class="gdlr-core-pbf-column-content-margin gdlr-core-js ">
                                                <div class="gdlr-core-pbf-column-content clearfix gdlr-core-js ">
                                                    <div class="gdlr-core-pbf-element">
                                                        <div class="gdlr-core-title-item gdlr-core-item-pdb clearfix  gdlr-core-left-align gdlr-core-title-item-caption-top gdlr-core-item-pdlr" style="padding-bottom: 0px ;">
                                                            <div class="gdlr-core-title-item-title-wrap">
                                                                <h3 class="gdlr-core-title-item-title gdlr-core-skin-title" style="font-size: 15px ;font-weight: 500 ;letter-spacing: 0px ;text-transform: none ;">What to bring<span class="gdlr-core-title-item-title-divider gdlr-core-skin-divider" ></span></h3></div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="gdlr-core-pbf-column gdlr-core-column-30">
                                            <div class="gdlr-core-pbf-column-content-margin gdlr-core-js ">
                                                <div class="gdlr-core-pbf-column-content clearfix gdlr-core-js ">
                                                    <div class="gdlr-core-pbf-element">
                                                        <div class="gdlr-core-icon-list-item gdlr-core-item-pdlr gdlr-core-item-pdb clearfix " style="padding-bottom: 10px ;">
                                                            <ul>
                                                                <li class=" gdlr-core-skin-divider"><span class="gdlr-core-icon-list-icon-wrap"><i class="gdlr-core-icon-list-icon fa fa-check" style="color: #4692e7 ;" ></i></span>
                                                                    <div class="gdlr-core-icon-list-content-wrap"><span class="gdlr-core-icon-list-content">Trekking Shoes</span></div>
                                                                </li>
                                                                <li class=" gdlr-core-skin-divider"><span class="gdlr-core-icon-list-icon-wrap"><i class="gdlr-core-icon-list-icon fa fa-check" style="color: #4692e7 ;" ></i></span>
                                                                    <div class="gdlr-core-icon-list-content-wrap"><span class="gdlr-core-icon-list-content">Hat</span></div>
                                                                </li>
                                                                <li class=" gdlr-core-skin-divider"><span class="gdlr-core-icon-list-icon-wrap"><i class="gdlr-core-icon-list-icon fa fa-check" style="color: #4692e7 ;" ></i></span>
                                                                    <div class="gdlr-core-icon-list-content-wrap"><span class="gdlr-core-icon-list-content">Sunscreen advised</span></div>
                                                                </li>
                                                                <li class=" gdlr-core-skin-divider"><span class="gdlr-core-icon-list-icon-wrap"><i class="gdlr-core-icon-list-icon fa fa-check" style="color: #4692e7 ;" ></i></span>
                                                                    <div class="gdlr-core-icon-list-content-wrap"><span class="gdlr-core-icon-list-content"> Changing clothes</span></div>
                                                                </li>
                                                            </ul>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="gdlr-core-pbf-element">
                                            <div class="gdlr-core-divider-item gdlr-core-item-pdlr gdlr-core-item-mgb gdlr-core-divider-item-normal gdlr-core-center-align" style="margin-bottom: 45px ;">
                                                <div class="gdlr-core-divider-line gdlr-core-skin-divider"></div>
                                            </div>
                                        </div> <div class="gdlr-core-pbf-column gdlr-core-column-30 gdlr-core-column-first">
                                            <div class="gdlr-core-pbf-column-content-margin gdlr-core-js ">
                                                <div class="gdlr-core-pbf-column-content clearfix gdlr-core-js ">
                                                    <div class="gdlr-core-pbf-element">
                                                        <div class="gdlr-core-title-item gdlr-core-item-pdb clearfix  gdlr-core-left-align gdlr-core-title-item-caption-top gdlr-core-item-pdlr" style="padding-bottom: 0px ;">
                                                            <div class="gdlr-core-title-item-title-wrap">
                                                                <h3 class="gdlr-core-title-item-title gdlr-core-skin-title" style="font-size: 15px ;font-weight: 500 ;letter-spacing: 0px ;text-transform: none ;">Payments<span class="gdlr-core-title-item-title-divider gdlr-core-skin-divider" ></span></h3></div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="gdlr-core-pbf-column gdlr-core-column-30">
                                            <div class="gdlr-core-pbf-column-content-margin gdlr-core-js ">
                                                <div class="gdlr-core-pbf-column-content clearfix gdlr-core-js ">
                                                    <div class="gdlr-core-pbf-element">
                                                        <div class="gdlr-core-icon-list-item gdlr-core-item-pdlr gdlr-core-item-pdb clearfix " style="padding-bottom: 10px ;">
                                                            <ul>
                                                                <li class=" gdlr-core-skin-divider"><span class="gdlr-core-icon-list-icon-wrap"><i class="gdlr-core-icon-list-icon fa fa-check" style="color: #4692e7 ;" ></i></span>
                                                                    <div class="gdlr-core-icon-list-content-wrap"><span class="gdlr-core-icon-list-content">By Cash / Bank Transfer (No charge)</span></div>
                                                                </li>
                                                                <li class=" gdlr-core-skin-divider"><span class="gdlr-core-icon-list-icon-wrap"><i class="gdlr-core-icon-list-icon fa fa-check" style="color: #4692e7 ;" ></i></span>
                                                                    <div class="gdlr-core-icon-list-content-wrap"><span class="gdlr-core-icon-list-content">Visa/Mastercard (3% bank fee charge)</span></div>
                                                                </li>
                                                                </li>
                                                            </ul>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="gdlr-core-pbf-element">
                                            <div class="gdlr-core-divider-item gdlr-core-item-pdlr gdlr-core-item-mgb gdlr-core-divider-item-normal gdlr-core-center-align" style="margin-bottom: 45px ;">
                                                <div class="gdlr-core-divider-line gdlr-core-skin-divider"></div>
                                            </div>
                                        </div>                                        



                                    </div>
                                </div>
                            </div>
                            <div class="gdlr-core-pbf-wrapper " style="padding: 20px 0px 30px 0px;" data-skin="Blue Icon" id="itinerary">
                                <div class="gdlr-core-pbf-wrapper-content gdlr-core-js ">
                                    <div class="gdlr-core-pbf-wrapper-container clearfix gdlr-core-container">
                                        <div class="gdlr-core-pbf-element">
                                            <div class="gdlr-core-title-item gdlr-core-item-pdb clearfix  gdlr-core-left-align gdlr-core-title-item-caption-bottom gdlr-core-item-pdlr" style="padding-bottom: 35px ;">
                                                <div class="gdlr-core-title-item-title-wrap">
                                                    <h6 class="gdlr-core-title-item-title gdlr-core-skin-title" style="font-size: 24px ;font-weight: 600 ;letter-spacing: 0px ;text-transform: none ;"><span class="gdlr-core-title-item-left-icon" style="font-size: 18px ;"  ><i class="fa fa-bus"  ></i></span>Itinerary<span class="gdlr-core-title-item-title-divider gdlr-core-skin-divider" ></span></h6></div>
                                            </div>
                                        </div>
                                        <div class="gdlr-core-pbf-element"><div class="gdlr-core-toggle-box-item gdlr-core-item-pdlr gdlr-core-item-pdb  gdlr-core-toggle-box-style-background-title gdlr-core-left-align" style="padding-bottom: 25px;"><div class="gdlr-core-toggle-box-item-tab clearfix  gdlr-core-active"><div class="gdlr-core-toggle-box-item-icon gdlr-core-js gdlr-core-skin-icon "></div><div class="gdlr-core-toggle-box-item-content-wrapper"><h4 class="gdlr-core-toggle-box-item-title gdlr-core-js  gdlr-core-skin-e-background gdlr-core-skin-e-content"><span class="gdlr-core-head">Spot 1</span>Spring water temple</h4><div class="gdlr-core-toggle-box-item-content"><p>Our first stop will be at the spring water temple. Every village in Bali has spring water temple where local people get holy water to bless their family as well as their house in auspicious day. If you wish to bless yourself, here you could wash your face for good luck.  </p>
</div></div></div><div class="gdlr-core-toggle-box-item-tab clearfix  gdlr-core-active"><div class="gdlr-core-toggle-box-item-icon gdlr-core-js gdlr-core-skin-icon "></div><div class="gdlr-core-toggle-box-item-content-wrapper"><h4 class="gdlr-core-toggle-box-item-title gdlr-core-js  gdlr-core-skin-e-background gdlr-core-skin-e-content"><span class="gdlr-core-head">Spot 2</span>Balinese house</h4><div class="gdlr-core-toggle-box-item-content"><p>We have quick stop to see how local people live in their house as in Bali, we have to use Balinese Fang Sui when we build a house so in Bali the layout of Balinese house will be same. We could walk in their house as well as take some pictures here.</p>
</div></div></div><div class="gdlr-core-toggle-box-item-tab clearfix  gdlr-core-active"><div class="gdlr-core-toggle-box-item-icon gdlr-core-js gdlr-core-skin-icon "></div><div class="gdlr-core-toggle-box-item-content-wrapper"><h4 class="gdlr-core-toggle-box-item-title gdlr-core-js  gdlr-core-skin-e-background gdlr-core-skin-e-content"><span class="gdlr-core-head">Spot 3</span>Water Break</h4><div class="gdlr-core-toggle-box-item-content"><p>We have a break before continuing our trip with some young coconut and fresh juice. It is one of the famous photo spot in this area called Gembok Cinta. The concept of this place is taken from one place in Korea where couple comes to this place to lock their love so they could be together forever.</p>
</div></div></div><div class="gdlr-core-toggle-box-item-tab clearfix  gdlr-core-active"><div class="gdlr-core-toggle-box-item-icon gdlr-core-js gdlr-core-skin-icon "></div><div class="gdlr-core-toggle-box-item-content-wrapper"><h4 class="gdlr-core-toggle-box-item-title gdlr-core-js  gdlr-core-skin-e-background gdlr-core-skin-e-content"><span class="gdlr-core-head">Stopping Point 1</span>Rice Field Walking</h4><div class="gdlr-core-toggle-box-item-content"><p>We could see closer to the rice field and irrigation system called Subak on this trip. Here, we could learn how rice is growing from planting to harvesting as our guide will give depth explanation.</p>
</div></div></div><div class="gdlr-core-toggle-box-item-tab clearfix  gdlr-core-active"><div class="gdlr-core-toggle-box-item-icon gdlr-core-js gdlr-core-skin-icon "></div><div class="gdlr-core-toggle-box-item-content-wrapper"><h4 class="gdlr-core-toggle-box-item-title gdlr-core-js  gdlr-core-skin-e-background gdlr-core-skin-e-content"><span class="gdlr-core-head">Stopping Point 4</span>Lunch Time</h4><div class="gdlr-core-toggle-box-item-content"><p>We finish our trip by having lunch at Greenkubu café with Indonesian food. Enjoy your lunch with green field view and nice breezes.</p>
</div></div></div></div></div>
                                        <div class="gdlr-core-pbf-element">
                                            <div class="gdlr-core-divider-item gdlr-core-item-pdlr gdlr-core-item-mgb gdlr-core-divider-item-normal gdlr-core-center-align" style="margin-bottom: 25px ;">
                                                <div class="gdlr-core-divider-line gdlr-core-skin-divider" style="border-bottom-width: 2px ;"></div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            
                            <div class="gdlr-core-pbf-wrapper " style="padding: 0px 0px 30px 0px;" data-skin="Blue Icon" id="photos">
                                <div class="gdlr-core-pbf-wrapper-content gdlr-core-js ">
                                    <div class="gdlr-core-pbf-wrapper-container clearfix gdlr-core-container">
                                        <div class="gdlr-core-pbf-element">
                                            <div class="gdlr-core-title-item gdlr-core-item-pdb clearfix  gdlr-core-left-align gdlr-core-title-item-caption-bottom gdlr-core-item-pdlr" style="padding-bottom: 35px ;">
                                                <div class="gdlr-core-title-item-title-wrap">
                                                    <h6 class="gdlr-core-title-item-title gdlr-core-skin-title" style="font-size: 24px ;font-weight: 600 ;letter-spacing: 0px ;text-transform: none ;"><span class="gdlr-core-title-item-left-icon" style="font-size: 18px ;"  ><i class="icon_images"  ></i></span>Photos<span class="gdlr-core-title-item-title-divider gdlr-core-skin-divider" ></span></h6></div>
                                            </div>
                                        </div>
                                        <div class="gdlr-core-pbf-element">
                                            <div class="gdlr-core-gallery-item gdlr-core-item-pdb clearfix  gdlr-core-gallery-item-style-slider gdlr-core-item-pdlr ">
                                                <div class="gdlr-core-flexslider flexslider gdlr-core-js-2 " data-type="slider" data-effect="default" data-nav="bullet">
                                                    <ul class="slides">
                                                        <?php foreach ($selectTour["photos"] as $photo) { 
                                                            $img = $this->common->theme_custome()."/upload/tour/".$photo
                                                            ?>                   
                                                            <li>
                                                                <div class="gdlr-core-gallery-list gdlr-core-media-image">
                                                                    <a class="gdlr-core-ilightbox gdlr-core-js " href="<?= $img ?>" data-ilightbox-group="gdlr-core-img-group-1"><img src="<?= $img ?>" alt="" width="1500" height="1000" /><span class="gdlr-core-image-overlay "><i class="gdlr-core-image-overlay-icon gdlr-core-size-22 fa fa-search"  ></i></span></a>
                                                                </div>
                                                            </li>
                                                      <?php } ?>
                                                    </ul>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>
                <div class="tourmaster-urgency-message" id="tourmaster-urgency-message" data-expire="86400"><i class="tourmaster-urgency-message-icon fa fa-users"></i>
                    <div class="tourmaster-urgency-message-text">5 travellers are considering this tour right now!</div>
                </div>
            </div>
