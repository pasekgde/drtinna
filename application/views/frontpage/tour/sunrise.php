

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
                                    <div class="tourmaster-tour-info tourmaster-tour-info-minimum-age tourmaster-item-pdlr"><i class="fa fa-user"></i>Min Age : 17+</div>
                                    
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
                                               <h1>Who wanna See Sunrise while doing Mount Batur Trekking?</h1>
<p>Wake up earlier and see the most beautiful sunrise on our Bali Sunrise Mount Batur Trekking. Mount Batur is one of active volcano in Bali, it is 1717 meters above sea level. This volcano had big eruption in 1917, 1926 and 1963, by doing our mount batur trekking you could explore its crater from those eruptions. It takes 2 hours to the summit of the volcano and the guides will prepare light breakfast there while waiting the sunrise coming out. On the way down we could see its crater lake called Batur lake whic is the bigest lake in Bali. So the whole trakking is around 4 hours.</p>
<p>&nbsp;</p>
<p>If you need another kind of adventures tour, you could see our&nbsp;<a href="http://www.greenbiketour.com/tour/">another tour here</a>.</p>



                                                </div>
                                            </div>
                                        </div>
                                         <div class="gdlr-core-pbf-element">
                                            <div class="gdlr-core-divider-item gdlr-core-item-pdlr gdlr-core-item-mgb gdlr-core-divider-item-normal gdlr-core-center-align" style="margin-bottom: 19px ;">
                                                <div class="gdlr-core-divider-line gdlr-core-skin-divider"></div>
                                            </div>
                                        </div>
                                        <!-- pickup time -->
                                        <div class="gdlr-core-pbf-column gdlr-core-column-30 gdlr-core-column-first">
                                            <div class="gdlr-core-pbf-column-content-margin gdlr-core-js ">
                                                <div class="gdlr-core-pbf-column-content clearfix gdlr-core-js ">
                                                    <div class="gdlr-core-pbf-element">
                                                        <div class="gdlr-core-title-item gdlr-core-item-pdb clearfix  gdlr-core-left-align gdlr-core-title-item-caption-top gdlr-core-item-pdlr" style="padding-bottom: 0px ;">
                                                            <div class="gdlr-core-title-item-title-wrap">
                                                                <h3 class="gdlr-core-title-item-title gdlr-core-skin-title" style="font-size: 15px ;font-weight: 500 ;letter-spacing: 0px ;text-transform: none ;">Pick Up Time (Morning Cycling Tour)<span class="gdlr-core-title-item-title-divider gdlr-core-skin-divider" ></span></h3></div>
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
                                                                    <div class="gdlr-core-icon-list-content-wrap"><span class="gdlr-core-icon-list-content">01.15 – 01.30 (Nusa Dua / Jimbaran)</span></div>
                                                                </li>

                                                                <li class=" gdlr-core-skin-divider"><span class="gdlr-core-icon-list-icon-wrap"><i class="gdlr-core-icon-list-icon fa fa-clock-o" style="color: #4692e7 ;" ></i></span>
                                                                    <div class="gdlr-core-icon-list-content-wrap"><span class="gdlr-core-icon-list-content">01.15 – 01.30 (Kuta / Seminyak Area)</span></div>
                                                                </li>
                                                                <li class=" gdlr-core-skin-divider"><span class="gdlr-core-icon-list-icon-wrap"><i class="gdlr-core-icon-list-icon fa fa-clock-o" style="color: #4692e7 ;" ></i></span>
                                                                    <div class="gdlr-core-icon-list-content-wrap"><span class="gdlr-core-icon-list-content">02.00 - 02.30 (Ubud Area)</span></div>
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
                                                                    <div class="gdlr-core-icon-list-content-wrap"><span class="gdlr-core-icon-list-content">Light Breakfast</span></div>
                                                                </li>
                                                                <li class=" gdlr-core-skin-divider"><span class="gdlr-core-icon-list-icon-wrap"><i class="gdlr-core-icon-list-icon fa fa-check" style="color: #4692e7 ;" ></i></span>
                                                                    <div class="gdlr-core-icon-list-content-wrap"><span class="gdlr-core-icon-list-content">Hotel pick-up & drop off W/ an A/C car</span></div>
                                                                </li>
                                                                <li class=" gdlr-core-skin-divider"><span class="gdlr-core-icon-list-icon-wrap"><i class="gdlr-core-icon-list-icon fa fa-check" style="color: #4692e7 ;" ></i></span>
                                                                    <div class="gdlr-core-icon-list-content-wrap"><span class="gdlr-core-icon-list-content">Professional English-speaking guide</span></div>
                                                                </li>
                                                                <li class=" gdlr-core-skin-divider"><span class="gdlr-core-icon-list-icon-wrap"><i class="gdlr-core-icon-list-icon fa fa-check" style="color: #4692e7 ;" ></i></span>
                                                                    <div class="gdlr-core-icon-list-content-wrap"><span class="gdlr-core-icon-list-content">Water and Snack on the Route</span></div>
                                                                </li>
                                                                <li class=" gdlr-core-skin-divider"><span class="gdlr-core-icon-list-icon-wrap"><i class="gdlr-core-icon-list-icon fa fa-check" style="color: #4692e7 ;" ></i></span>
                                                                    <div class="gdlr-core-icon-list-content-wrap"><span class="gdlr-core-icon-list-content">Entrance fee to Kintamani</span></div>
                                                                </li>
                                                                <li class=" gdlr-core-skin-divider"><span class="gdlr-core-icon-list-icon-wrap"><i class="gdlr-core-icon-list-icon fa fa-check" style="color: #4692e7 ;" ></i></span>
                                                                    <div class="gdlr-core-icon-list-content-wrap"><span class="gdlr-core-icon-list-content">Wet weather gear if needed</span></div>
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
                                                                    <div class="gdlr-core-icon-list-content-wrap"><span class="gdlr-core-icon-list-content">Warm Jacket & Long Pants</span></div>
                                                                </li>
                                                                <li class=" gdlr-core-skin-divider"><span class="gdlr-core-icon-list-icon-wrap"><i class="gdlr-core-icon-list-icon fa fa-check" style="color: #4692e7 ;" ></i></span>
                                                                    <div class="gdlr-core-icon-list-content-wrap"><span class="gdlr-core-icon-list-content">Trekking/Hiking shoes recommended</span></div>
                                                                </li>
                                                                <li class=" gdlr-core-skin-divider"><span class="gdlr-core-icon-list-icon-wrap"><i class="gdlr-core-icon-list-icon fa fa-check" style="color: #4692e7 ;" ></i></span>
                                                                    <div class="gdlr-core-icon-list-content-wrap"><span class="gdlr-core-icon-list-content">Sunscreen advised</span></div>
                                                                </li>
                                                                <li class=" gdlr-core-skin-divider"><span class="gdlr-core-icon-list-icon-wrap"><i class="gdlr-core-icon-list-icon fa fa-check" style="color: #4692e7 ;" ></i></span>
                                                                    <div class="gdlr-core-icon-list-content-wrap"><span class="gdlr-core-icon-list-content">Small Backpack for your camera/video</span></div>
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

                                        <div class="gdlr-core-pbf-column gdlr-core-column-30 gdlr-core-column-first">
                                            <div class="gdlr-core-pbf-column-content-margin gdlr-core-js ">
                                                <div class="gdlr-core-pbf-column-content clearfix gdlr-core-js ">
                                                    <div class="gdlr-core-pbf-element">
                                                        <div class="gdlr-core-title-item gdlr-core-item-pdb clearfix  gdlr-core-left-align gdlr-core-title-item-caption-top gdlr-core-item-pdlr" style="padding-bottom: 0px ;">
                                                            <div class="gdlr-core-title-item-title-wrap">
                                                                <h3 class="gdlr-core-title-item-title gdlr-core-skin-title" style="font-size: 15px ;font-weight: 500 ;letter-spacing: 0px ;text-transform: none ;">Payment<span class="gdlr-core-title-item-title-divider gdlr-core-skin-divider" ></span></h3></div>
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
                                        <div class="gdlr-core-pbf-element"><div class="gdlr-core-toggle-box-item gdlr-core-item-pdlr gdlr-core-item-pdb  gdlr-core-toggle-box-style-background-title gdlr-core-left-align" style="padding-bottom: 25px;"><div class="gdlr-core-toggle-box-item-tab clearfix  gdlr-core-active"><div class="gdlr-core-toggle-box-item-icon gdlr-core-js gdlr-core-skin-icon "></div><div class="gdlr-core-toggle-box-item-content-wrapper"><h4 class="gdlr-core-toggle-box-item-title gdlr-core-js  gdlr-core-skin-e-background gdlr-core-skin-e-content"><span class="gdlr-core-head">Spot 1 Mount Batur Trekking</span>Start Point</h4><div class="gdlr-core-toggle-box-item-content"><p>We start the Mount Batur Trekking from Toya Bungkah village where it is famous with hot spring water. Here we prepare the equipments such as flash light, water and some snack. We will meet with the local guide here who will lead us to the summit of Mount Batur.</p>
</div></div></div><div class="gdlr-core-toggle-box-item-tab clearfix  gdlr-core-active"><div class="gdlr-core-toggle-box-item-icon gdlr-core-js gdlr-core-skin-icon "></div><div class="gdlr-core-toggle-box-item-content-wrapper"><h4 class="gdlr-core-toggle-box-item-title gdlr-core-js  gdlr-core-skin-e-background gdlr-core-skin-e-content"><span class="gdlr-core-head">Spot 2 Mount Batur Trekking</span>Break Time</h4><div class="gdlr-core-toggle-box-item-content"><p>After almost half way, we will have a break to fill out more energy for half of the way up our Mount Batur Trekking as it will be still dark so we just see trees around,  While having a break, local guides will explain a little bit about the history of Batur volcano.</p>
</div></div></div><div class="gdlr-core-toggle-box-item-tab clearfix  gdlr-core-active"><div class="gdlr-core-toggle-box-item-icon gdlr-core-js gdlr-core-skin-icon "></div><div class="gdlr-core-toggle-box-item-content-wrapper"><h4 class="gdlr-core-toggle-box-item-title gdlr-core-js  gdlr-core-skin-e-background gdlr-core-skin-e-content"><span class="gdlr-core-head">Spot 3 Mount Batur Trekking</span>Jungle Route</h4><div class="gdlr-core-toggle-box-item-content"><p>Our Mount Batur Trekking will be more interesting  when we walk up through eucalyptus tree and pine tree. On this part the track is going steeper and get closer to the top so we get ready to enjoy the sunrise.</p>
</div></div></div><div class="gdlr-core-toggle-box-item-tab clearfix  gdlr-core-active"><div class="gdlr-core-toggle-box-item-icon gdlr-core-js gdlr-core-skin-icon "></div><div class="gdlr-core-toggle-box-item-content-wrapper"><h4 class="gdlr-core-toggle-box-item-title gdlr-core-js  gdlr-core-skin-e-background gdlr-core-skin-e-content"><span class="gdlr-core-head">Spot 4 Mount Batur Trekking</span>Summit on Top</h4><div class="gdlr-core-toggle-box-item-content"><p>After around 2 hour doing Mount Batur Trekking, we get to the summit where we will wait for sunrise on this spot. The guide will prepare light breakfast as well coffee and tea. After the day clear, we walk around to get more pictures before going down.</p>
</div></div></div><div class="gdlr-core-toggle-box-item-tab clearfix  gdlr-core-active"><div class="gdlr-core-toggle-box-item-icon gdlr-core-js gdlr-core-skin-icon "></div><div class="gdlr-core-toggle-box-item-content-wrapper"><h4 class="gdlr-core-toggle-box-item-title gdlr-core-js  gdlr-core-skin-e-background gdlr-core-skin-e-content"><span class="gdlr-core-head">Spot 5 Mount Batur Trekking</span>Walk down</h4><div class="gdlr-core-toggle-box-item-content"><p>Walk down will take around 2 hours and we walk on the same trek as we went up. It is nice way to see the way up we did in the dark. We will be spoield by green view as well as the crater lake of Batur.</p>
</div></div></div><div class="gdlr-core-toggle-box-item-tab clearfix  gdlr-core-active"><div class="gdlr-core-toggle-box-item-icon gdlr-core-js gdlr-core-skin-icon "></div><div class="gdlr-core-toggle-box-item-content-wrapper"><h4 class="gdlr-core-toggle-box-item-title gdlr-core-js  gdlr-core-skin-e-background gdlr-core-skin-e-content"><span class="gdlr-core-head">Spot 6 Mount Batur Trekking</span>Finish point</h4><div class="gdlr-core-toggle-box-item-content"><p>We will be back on the same place where we started the trek. The last program, drop you back to hotel.</p>
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
