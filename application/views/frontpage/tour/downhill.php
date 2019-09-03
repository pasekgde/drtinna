

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
                    <div class="tourmaster-template-wrapper" id="app">
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

                                        <!--  -->
                                        <transition name="fade">
                                            <!-- always use different div element so vue detect change element -->
                                            <div key=1 v-if="enableEnquiry">
                                                <?php $this->load->view("frontpage/tour/enquiry_form",$selectTour); ?>
                                            </div> 
                                            <div key=2 v-else>
                                                <div class="tourmaster-enquiry-form tourmaster-form-field tourmaster-with-border" style="margin-top: 10px;">
                                                    <input type="submit" class="tourmaster-button" style="background: red!important" @click="enableEnquiry=true" value="Book Now" />
                                                </div>    
                                            </div>
                                        </transition>
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
                                    <div class="tourmaster-tour-info tourmaster-tour-info-duration-text tourmaster-item-pdlr"><i class="icon_clock_alt"></i>± 7 hours</div>
                                    <div class="tourmaster-tour-info tourmaster-tour-info-availability tourmaster-item-pdlr"><i class="fa fa-calendar"></i>Available Everyday</div>
                                    <div class="tourmaster-tour-info tourmaster-tour-info-departure-location tourmaster-item-pdlr"><i class="flaticon-takeoff-the-plane"></i>Detail Hotel Needed</div>
                                    <div class="tourmaster-tour-info tourmaster-tour-info-return-location tourmaster-item-pdlr"><i class="flaticon-plane-landing"></i>Detail Hotel Needed</div>
                                    <div class="tourmaster-tour-info tourmaster-tour-info-minimum-age tourmaster-item-pdlr"><i class="fa fa-user"></i>Min Age : 2+</div>
                                    
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
<h4><em>Make unforgettable&nbsp;balinese bike tour experience for you</em></h4>
<p>For you who have a short holiday trip in Bali, so then our&nbsp;<b><strong>Best Cycling Tour Bali&nbsp;</strong></b>is suitable for you while enjoy the panorama of the mountains and the cool air, and enjoy the view of rice terraces in Ubud.</p>
<p><b><strong><a href="http://www.greenbiketour.com/">GreenBike Cycling tours</a>&nbsp;</strong></b>offer not only a full day ubud based cycling tour, but an experience of Bali Downhill cycling tour through Balinese Hearth. Our cycling tour has a route through non-touristy area which the scenery and small villages which were just beautiful.</p>
<p>This best cycling tour Bali is start from the top of the Kintamani Area and make your way down, through forest, Asphalt Roads, Traditional Villages, and Traditional Balinese Rice Fields Architecture (Subak). Stopping along the way to learn about local food, Traditional Village life, and Balinese Home Industry (stone making &amp; wood working) (See Our Itinerary Below).</p>
<blockquote><p>We were picked up from the hotel at the exact time advised. Greenbike Cycling tour made sure we knew how to ride, gave us a detailed run down about this Bali Cycling Tour and what to expect. We visited a typical Balinese home where our guide explained the customs of the household. We enjoyed a bali bike tour with couple of stops and rode through villages and rice fields. Fantastic scenery all the way and finished off having a great lunch at a lovely restaurant, then driven back to our hotel. Would totally recommend this Bali Cycling Tour Company for service and value.&nbsp;<strong>Dansbre-Adelaide</strong> (<a href="https://www.tripadvisor.com/Attraction_Review-g297701-d3931670-Reviews-Greenbike_Cycling_Tour-Ubud_Bali.html">Read More Review)</a></p></blockquote>
<p>Wanna enjoy the trip like Dasnbre? Let’s book now!</p>
<p>If you need another kind of adventures tour, you could see our <a href="http://www.greenbiketour.com/tour/">another tour here</a>.</p>
<p>&nbsp;</p>
<p>See similar our <a href="https://www.greenbiketour.com/tour/explore-ubud-electric-bike-bali/">cycling tour with electric bike.</a></p>
<p>&nbsp;</p>


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
                                                                    <div class="gdlr-core-icon-list-content-wrap"><span class="gdlr-core-icon-list-content">07.15 – 07.30 (Nusa Dua / Jimbaran)</span></div>
                                                                </li>

                                                                <li class=" gdlr-core-skin-divider"><span class="gdlr-core-icon-list-icon-wrap"><i class="gdlr-core-icon-list-icon fa fa-clock-o" style="color: #4692e7 ;" ></i></span>
                                                                    <div class="gdlr-core-icon-list-content-wrap"><span class="gdlr-core-icon-list-content">07.15 – 07.30 (Kuta / Seminyak Area)</span></div>
                                                                </li>
                                                                <li class=" gdlr-core-skin-divider"><span class="gdlr-core-icon-list-icon-wrap"><i class="gdlr-core-icon-list-icon fa fa-clock-o" style="color: #4692e7 ;" ></i></span>
                                                                    <div class="gdlr-core-icon-list-content-wrap"><span class="gdlr-core-icon-list-content">08.00 - 08.30 (Ubud Area)</span></div>
                                                                </li>
                                                                
                                                            </ul>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>                                        
                                        <!-- pickup time -->
                                        <div class="gdlr-core-pbf-column gdlr-core-column-30 gdlr-core-column-first">
                                            <div class="gdlr-core-pbf-column-content-margin gdlr-core-js ">
                                                <div class="gdlr-core-pbf-column-content clearfix gdlr-core-js ">
                                                    <div class="gdlr-core-pbf-element">
                                                        <div class="gdlr-core-title-item gdlr-core-item-pdb clearfix  gdlr-core-left-align gdlr-core-title-item-caption-top gdlr-core-item-pdlr" style="padding-bottom: 0px ;">
                                                            <div class="gdlr-core-title-item-title-wrap">
                                                                <h3 class="gdlr-core-title-item-title gdlr-core-skin-title" style="font-size: 15px ;font-weight: 500 ;letter-spacing: 0px ;text-transform: none ;">Pick Up Time (Afternoon Cycling Tour)<span class="gdlr-core-title-item-title-divider gdlr-core-skin-divider" ></span></h3></div>
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
                                                                    <div class="gdlr-core-icon-list-content-wrap"><span class="gdlr-core-icon-list-content">09.30 – 09.45 (Nusa Dua / Jimbaran)</span></div>
                                                                </li>

                                                                <li class=" gdlr-core-skin-divider"><span class="gdlr-core-icon-list-icon-wrap"><i class="gdlr-core-icon-list-icon fa fa-clock-o" style="color: #4692e7 ;" ></i></span>
                                                                    <div class="gdlr-core-icon-list-content-wrap"><span class="gdlr-core-icon-list-content">09.30 – 09.45 (Kuta / Seminyak Area)</span></div>
                                                                </li>
                                                                <li class=" gdlr-core-skin-divider"><span class="gdlr-core-icon-list-icon-wrap"><i class="gdlr-core-icon-list-icon fa fa-clock-o" style="color: #4692e7 ;" ></i></span>
                                                                    <div class="gdlr-core-icon-list-content-wrap"><span class="gdlr-core-icon-list-content">10.30 - 11.30 (Ubud Area)</span></div>
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
                                                                    <div class="gdlr-core-icon-list-content-wrap"><span class="gdlr-core-icon-list-content">Morning Tour(±7-8 rs)</span></div>
                                                                </li>

                                                                <li class=" gdlr-core-skin-divider"><span class="gdlr-core-icon-list-icon-wrap"><i class="gdlr-core-icon-list-icon fa fa-clock-o" style="color: #4692e7 ;" ></i></span>
                                                                    <div class="gdlr-core-icon-list-content-wrap"><span class="gdlr-core-icon-list-content">Afternoon Tour(±5-6Hrs)Min. 4pax</span></div>
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
                                                                    <div class="gdlr-core-icon-list-content-wrap"><span class="gdlr-core-icon-list-content">Hotel pick-up & drop off W/ an A/C car</span></div>
                                                                </li>
                                                                <li class=" gdlr-core-skin-divider"><span class="gdlr-core-icon-list-icon-wrap"><i class="gdlr-core-icon-list-icon fa fa-check" style="color: #4692e7 ;" ></i></span>
                                                                    <div class="gdlr-core-icon-list-content-wrap"><span class="gdlr-core-icon-list-content">Professional English-speaking guide</span></div>
                                                                </li>
                                                                <li class=" gdlr-core-skin-divider"><span class="gdlr-core-icon-list-icon-wrap"><i class="gdlr-core-icon-list-icon fa fa-check" style="color: #4692e7 ;" ></i></span>
                                                                    <div class="gdlr-core-icon-list-content-wrap"><span class="gdlr-core-icon-list-content">Light Breakfast w/ Coffee/Tea </span></div>
                                                                </li>
                                                                <li class=" gdlr-core-skin-divider"><span class="gdlr-core-icon-list-icon-wrap"><i class="gdlr-core-icon-list-icon fa fa-check" style="color: #4692e7 ;" ></i></span>
                                                                    <div class="gdlr-core-icon-list-content-wrap"><span class="gdlr-core-icon-list-content">Traditional Indonesian lunch</span></div>
                                                                </li>
                                                                <li class=" gdlr-core-skin-divider"><span class="gdlr-core-icon-list-icon-wrap"><i class="gdlr-core-icon-list-icon fa fa-check" style="color: #4692e7 ;" ></i></span>
                                                                    <div class="gdlr-core-icon-list-content-wrap"><span class="gdlr-core-icon-list-content">Water and snacks en route</span></div>
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
                                                                    <div class="gdlr-core-icon-list-content-wrap"><span class="gdlr-core-icon-list-content">Walking/sport shoes recommended</span></div>
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
                                                                <h3 class="gdlr-core-title-item-title gdlr-core-skin-title" style="font-size: 15px ;font-weight: 500 ;letter-spacing: 0px ;text-transform: none ;">Age Classification<span class="gdlr-core-title-item-title-divider gdlr-core-skin-divider" ></span></h3></div>
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
                                                                    <div class="gdlr-core-icon-list-content-wrap"><span class="gdlr-core-icon-list-content">Adult (Age > 12 y.o.)</span></div>
                                                                </li>
                                                                <li class=" gdlr-core-skin-divider"><span class="gdlr-core-icon-list-icon-wrap"><i class="gdlr-core-icon-list-icon fa fa-check" style="color: #4692e7 ;" ></i></span>
                                                                    <div class="gdlr-core-icon-list-content-wrap"><span class="gdlr-core-icon-list-content">Child (Age between 6 y.o. and 12 y.o.)</span></div>
                                                                </li>
                                                                <li class=" gdlr-core-skin-divider"><span class="gdlr-core-icon-list-icon-wrap"><i class="gdlr-core-icon-list-icon fa fa-check" style="color: #4692e7 ;" ></i></span>
                                                                    <div class="gdlr-core-icon-list-content-wrap"><span class="gdlr-core-icon-list-content">Infant (Age < 6 y.o.)</span></div>
                                                                </li>
                                                                <li class=" gdlr-core-skin-divider"><span class="gdlr-core-icon-list-icon-wrap"><i class="gdlr-core-icon-list-icon fa fa-check" style="color: #4692e7 ;" ></i></span>
                                                                    <div class="gdlr-core-icon-list-content-wrap"><span class="gdlr-core-icon-list-content">Room Service Fees</span></div>
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
                                        <div class="gdlr-core-pbf-element">
<div class="gdlr-core-toggle-box-item gdlr-core-item-pdlr gdlr-core-item-pdb  gdlr-core-toggle-box-style-background-title gdlr-core-left-align" style="padding-bottom: 25px;"><div class="gdlr-core-toggle-box-item-tab clearfix  gdlr-core-active"><div class="gdlr-core-toggle-box-item-icon gdlr-core-js gdlr-core-skin-icon "></div><div class="gdlr-core-toggle-box-item-content-wrapper"><h4 class="gdlr-core-toggle-box-item-title gdlr-core-js  gdlr-core-skin-e-background gdlr-core-skin-e-content"><span class="gdlr-core-head">Best Cycling Tour Bali - Spot 1</span>Coffee Break</h4><div class="gdlr-core-toggle-box-item-content"><p>We start our best cycling tour by picking up customers at the hotel then drive up to Balinese plantation for having coffee break with pancake or smoothie bowl for gluten free request served with some coffees and teas tasting overlooking green valley view. </p>
<p>The guide will lead you to look around their garden with vary plants such as coffee, cocoa, vanilla, cinnamon, clove, spices and many more as well as to show customers how the coffee is being processed traditionally as well as chance to enjoy it with different kinds of herbal tea. There also chance to see and enjoy KOPI LUWAK (civet coffee) the most unique and expensive coffee in the world. </p>
</div></div></div><div class="gdlr-core-toggle-box-item-tab clearfix  gdlr-core-active"><div class="gdlr-core-toggle-box-item-icon gdlr-core-js gdlr-core-skin-icon "></div><div class="gdlr-core-toggle-box-item-content-wrapper"><h4 class="gdlr-core-toggle-box-item-title gdlr-core-js  gdlr-core-skin-e-background gdlr-core-skin-e-content"><span class="gdlr-core-head">Best Cycling Tour Bali - Spot 2</span>Penelokan Kintamani</h4><div class="gdlr-core-toggle-box-item-content"><p>After enjoying such nature then we’re heading off to Penelokan Kintamani for taking some pictures of AMAZING view of GEOPARK MT BATUR CALDERA and its crater lake if you never been there as it is optional stop. </p>
</div></div></div><div class="gdlr-core-toggle-box-item-tab clearfix  gdlr-core-active"><div class="gdlr-core-toggle-box-item-icon gdlr-core-js gdlr-core-skin-icon "></div><div class="gdlr-core-toggle-box-item-content-wrapper"><h4 class="gdlr-core-toggle-box-item-title gdlr-core-js  gdlr-core-skin-e-background gdlr-core-skin-e-content"><span class="gdlr-core-head">Best Cycling Tour Bali - Spot 3</span>Starting Point Cycling</h4><div class="gdlr-core-toggle-box-item-content"><p>After Volcano stop, we drive another 15 minutes to our best cycling tour bali start point at Abuan Village. Our starting point surrounded by Mandarin Oranges garden. All bikes and equipment are well prepared by our great team. Our guides will explain you regarding our safety standard and brief introduction about our trip.   </p>
</div></div></div><div class="gdlr-core-toggle-box-item-tab clearfix  gdlr-core-active"><div class="gdlr-core-toggle-box-item-icon gdlr-core-js gdlr-core-skin-icon "></div><div class="gdlr-core-toggle-box-item-content-wrapper"><h4 class="gdlr-core-toggle-box-item-title gdlr-core-js  gdlr-core-skin-e-background gdlr-core-skin-e-content"><span class="gdlr-core-head">Best Cycling Tour Bali - Stopping Point 1</span>Traditional Balinese House</h4><div class="gdlr-core-toggle-box-item-content"><p>Our Best Cycling Tour Bali next stop is in Balinese Traditional house at Abuan Village. Our Guides would explain more detail regarding Balinese architecture. Those architecture are centuries old, this tradition influenced by Hindu religion through ancient Javanese intermediary as well as the pre-Hindu elements of native Balinese architecture</p>
</div></div></div><div class="gdlr-core-toggle-box-item-tab clearfix  gdlr-core-active"><div class="gdlr-core-toggle-box-item-icon gdlr-core-js gdlr-core-skin-icon "></div><div class="gdlr-core-toggle-box-item-content-wrapper"><h4 class="gdlr-core-toggle-box-item-title gdlr-core-js  gdlr-core-skin-e-background gdlr-core-skin-e-content"><span class="gdlr-core-head">Best Cycling Tour Bali - Stopping Point 2</span>Ubud Jungle Stop (Optional)</h4><div class="gdlr-core-toggle-box-item-content"><p>We ride through rural forest of ancient Taro Village. This track is offered for those who seek adventurous experience.      </p>
</div></div></div><div class="gdlr-core-toggle-box-item-tab clearfix  gdlr-core-active"><div class="gdlr-core-toggle-box-item-icon gdlr-core-js gdlr-core-skin-icon "></div><div class="gdlr-core-toggle-box-item-content-wrapper"><h4 class="gdlr-core-toggle-box-item-title gdlr-core-js  gdlr-core-skin-e-background gdlr-core-skin-e-content"><span class="gdlr-core-head">Best Cycling Tour Bali - Stopping Point 3</span>Gunung Raung Temple</h4><div class="gdlr-core-toggle-box-item-content"><p>Gunung Raung Temple (read. Roaming Mountain Temple)  is located on Taro Village, which the ancient village in Bali. This temple is the very first temple on Bali and built by Dang Hyang Resi Markandya in 8th Century on his first holy journey to Bali. This temple as well located in the middle of Bali Island.</p>
</div></div></div><div class="gdlr-core-toggle-box-item-tab clearfix  gdlr-core-active"><div class="gdlr-core-toggle-box-item-icon gdlr-core-js gdlr-core-skin-icon "></div><div class="gdlr-core-toggle-box-item-content-wrapper"><h4 class="gdlr-core-toggle-box-item-title gdlr-core-js  gdlr-core-skin-e-background gdlr-core-skin-e-content"><span class="gdlr-core-head">Best Cycling Tour Bali - Stopping Point 4</span>Rice Field Stop</h4><div class="gdlr-core-toggle-box-item-content"><p>Most people who have visited Bali say that the real Bali can be found where the rice grows. Part of our Bali best bike/cycling tour trip is present you to this beautiful landscape. Our guide would explain history of Balinese farming system (which called Subak).</p>
</div></div></div><div class="gdlr-core-toggle-box-item-tab clearfix  gdlr-core-active"><div class="gdlr-core-toggle-box-item-icon gdlr-core-js gdlr-core-skin-icon "></div><div class="gdlr-core-toggle-box-item-content-wrapper"><h4 class="gdlr-core-toggle-box-item-title gdlr-core-js  gdlr-core-skin-e-background gdlr-core-skin-e-content"><span class="gdlr-core-head">Best Cycling Tour Bali - Stopping Point</span>Hyang Api Temple</h4><div class="gdlr-core-toggle-box-item-content"><p>This is our last stopping point of our best bike tour Bali trip. From this point we would drive you approx. 10 minute to our lunch place (well-known Greenkubu Cafe).</p>
</div></div></div><div class="gdlr-core-toggle-box-item-tab clearfix  gdlr-core-active"><div class="gdlr-core-toggle-box-item-icon gdlr-core-js gdlr-core-skin-icon "></div><div class="gdlr-core-toggle-box-item-content-wrapper"><h4 class="gdlr-core-toggle-box-item-title gdlr-core-js  gdlr-core-skin-e-background gdlr-core-skin-e-content"><span class="gdlr-core-head">Best Cycling Tour Bali - Lunch Stop</span>Greenkubu Cafe</h4><div class="gdlr-core-toggle-box-item-content"><p>After enjoying our Best Cycling Tour Bali trip, you will served by lunch with breath-taking view and hidden gems on our beautiful restaurant. Later, our driver will drop you off to your place. </p>
</div></div></div></div>
                                        </div>
                                        <div class="gdlr-core-pbf-element">
                                            <div class="gdlr-core-divider-item gdlr-core-item-pdlr gdlr-core-item-mgb gdlr-core-divider-item-normal gdlr-core-center-align" style="margin-bottom: 25px ;">
                                                <div class="gdlr-core-divider-line gdlr-core-skin-divider" style="border-bottom-width: 2px ;"></div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="gdlr-core-pbf-wrapper " style="padding: 0px 0px 30px 0px;" data-skin="Blue Icon" id="map">
                                <div class="gdlr-core-pbf-wrapper-content gdlr-core-js ">
                                    <div class="gdlr-core-pbf-wrapper-container clearfix gdlr-core-container">
                                        <div class="gdlr-core-pbf-element">
                                            <div class="gdlr-core-title-item gdlr-core-item-pdb clearfix  gdlr-core-left-align gdlr-core-title-item-caption-bottom gdlr-core-item-pdlr" style="padding-bottom: 35px ;">
                                                <div class="gdlr-core-title-item-title-wrap">
                                                    <h6 class="gdlr-core-title-item-title gdlr-core-skin-title" style="font-size: 24px ;font-weight: 600 ;letter-spacing: 0px ;text-transform: none ;"><span class="gdlr-core-title-item-left-icon" style="font-size: 18px ;"  ><i class="fa fa-map-o"  ></i></span>Map<span class="gdlr-core-title-item-title-divider gdlr-core-skin-divider" ></span></h6></div>
                                            </div>
                                        </div>
                                        <div class="gdlr-core-pbf-element">
                                            <div class="gdlr-core-text-box-item gdlr-core-item-pdlr gdlr-core-item-pdb gdlr-core-left-align" style="padding-bottom: 55px ;">
                                                <div class="gdlr-core-text-box-item-content">
                                                    <div class="">
                                                        <!-- <iframe src="https://www.google.com/maps/d/embed?mid=17owrKNTXOyPGsEvdz4rklXIIvAI" width="100%" height="480"></iframe> -->
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
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
