            <div class="traveltour-page-title-wrap  traveltour-style-medium traveltour-center-align">
                <div class="traveltour-header-transparent-substitute"></div>
                <div class="traveltour-page-title-overlay"></div>
                <div class="traveltour-page-title-container traveltour-container">
                    <div class="traveltour-page-title-content traveltour-item-pdlr">
                        <h1 class="traveltour-page-title">Greenbike Adventure</h1>
                    </div>
                </div>
            </div>

            <div class="traveltour-page-wrapper" id="traveltour-page-wrapper">
                <div class="gdlr-core-page-builder-body">
                    <div class="gdlr-core-pbf-wrapper " id="div_7425_0">
                        <div class="gdlr-core-pbf-wrapper-content gdlr-core-js ">
                            <div class="gdlr-core-pbf-wrapper-container clearfix gdlr-core-pbf-wrapper-full-no-space">
                                <div class="gdlr-core-pbf-element">
                                    <div class="gdlr-core-portfolio-item gdlr-core-item-pdb clearfix  gdlr-core-portfolio-item-style-modern" id="div_7425_1">
                                        <div class="gdlr-core-portfolio-item-holder gdlr-core-js-2 clearfix" data-layout="fitrows">
                                            <?php foreach ($tourOptions as $key => $tour) :
                                                $name = $tour->name;
                                                $img =  $this->common->theme_custome()."/images/". $tour->img;
                                                $link = base_url($tour->link); ; 
                                                $category = $tour->category; 
                                                ?>
                                                <div class="gdlr-core-item-list  gdlr-core-item-pdlr gdlr-core-item-mgb gdlr-core-column-15">
                                                    <div class="gdlr-core-portfolio-modern">
                                                        <div class="gdlr-core-portfolio-thumbnail gdlr-core-media-image  gdlr-core-style-icon-title-tag">
                                                            <div class="gdlr-core-portfolio-thumbnail-image-wrap  gdlr-core-zoom-on-hover">
                                                                <img src="<?=$img?>" alt="" width="900" height="500" /><span class="gdlr-core-image-overlay  gdlr-core-portfolio-overlay gdlr-core-image-overlay-center-icon gdlr-core-js">
                                                                    <span class="gdlr-core-image-overlay-content" >
                                                                        <span class="gdlr-core-portfolio-title gdlr-core-title-font " id="span_7425_0" style="margin-top: 0px;"> <a href="<?=$link?>" ><?=$name?></a>
                                                                        </span>
                                                                        <span class="gdlr-core-portfolio-info gdlr-core-portfolio-info-tag gdlr-core-info-font">
                                                                             <a href="<?=$link?>" rel="tag"><input type="submit" class="tourmaster-button" value="Book Now" /> </a>
                                                                        </span>
                                                                    </span>
                                                                </span>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            <?php endforeach; ?>


  
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
               
                    <div class="gdlr-core-pbf-wrapper " id="div_fd3f_0">
                        <div class="gdlr-core-pbf-background-wrap" id="div_fd3f_1"></div>
                        <div class="gdlr-core-pbf-wrapper-content gdlr-core-js ">
                            <div class="gdlr-core-pbf-wrapper-container clearfix gdlr-core-container">
                                <div class="gdlr-core-pbf-column gdlr-core-column-20 gdlr-core-column-first">
                                    <div class="gdlr-core-pbf-column-content-margin gdlr-core-js ">
                                        <div class="gdlr-core-pbf-column-content clearfix gdlr-core-js ">
                                            <div class="gdlr-core-pbf-element">
                                                <div class="gdlr-core-column-service-item gdlr-core-item-pdb  gdlr-core-center-align gdlr-core-no-caption gdlr-core-item-pdlr" id="div_fd3f_2">
                                                    <div class="gdlr-core-column-service-media gdlr-core-media-image" id="div_fd3f_3"><img src="<?php echo $this->common->theme_custome(); ?>upload/icon-6.png" alt="" width="44" height="44" /></div>
                                                    <div class="gdlr-core-column-service-content-wrapper">
                                                        <div class="gdlr-core-column-service-title-wrap" id="div_fd3f_4">
                                                            <h3 class="gdlr-core-column-service-title gdlr-core-skin-title" id="h3_fd3f_0">Tropical Adventure</h3></div>
                                                        <div class="gdlr-core-column-service-content" id="div_fd3f_5">
                                                            <p>We get many tropical adventure.</p>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="gdlr-core-pbf-column gdlr-core-column-20">
                                    <div class="gdlr-core-pbf-column-content-margin gdlr-core-js ">
                                        <div class="gdlr-core-pbf-column-content clearfix gdlr-core-js ">
                                            <div class="gdlr-core-pbf-element">
                                                <div class="gdlr-core-column-service-item gdlr-core-item-pdb  gdlr-core-center-align gdlr-core-no-caption gdlr-core-item-pdlr" id="div_fd3f_6">
                                                    <div class="gdlr-core-column-service-media gdlr-core-media-image" id="div_fd3f_7"><img src="<?php echo $this->common->theme_custome(); ?>upload/icon-2.png" alt="" width="41" height="49" /></div>
                                                    <div class="gdlr-core-column-service-content-wrapper">
                                                        <div class="gdlr-core-column-service-title-wrap" id="div_fd3f_8">
                                                            <h3 class="gdlr-core-column-service-title gdlr-core-skin-title" id="h3_fd3f_1">Best Price, No Hidden Fee</h3></div>
                                                        <div class="gdlr-core-column-service-content" id="div_fd3f_9">
                                                            <p>Best Price for Adventure in Bali</p>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="gdlr-core-pbf-column gdlr-core-column-20">
                                    <div class="gdlr-core-pbf-column-content-margin gdlr-core-js ">
                                        <div class="gdlr-core-pbf-column-content clearfix gdlr-core-js ">
                                            <div class="gdlr-core-pbf-element">
                                                <div class="gdlr-core-column-service-item gdlr-core-item-pdb  gdlr-core-center-align gdlr-core-no-caption gdlr-core-item-pdlr" id="div_fd3f_10">
                                                    <div class="gdlr-core-column-service-media gdlr-core-media-image" id="div_fd3f_11"><img src="<?php echo $this->common->theme_custome(); ?>upload/icon-14.png" alt="" width="35" height="45" /></div>
                                                    <div class="gdlr-core-column-service-content-wrapper">
                                                        <div class="gdlr-core-column-service-title-wrap" id="div_fd3f_12">
                                                            <h3 class="gdlr-core-column-service-title gdlr-core-skin-title" id="h3_fd3f_2">Professional Team</h3></div>
                                                        <div class="gdlr-core-column-service-content" id="div_fd3f_13">
                                                            <p>Professional Guide and Team Experience</p>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
<div class="gdlr-core-pbf-wrapper " id="div_0576_33" data-skin="Blue Column Service">
                        <div class="gdlr-core-pbf-background-wrap">
                            <div class="gdlr-core-pbf-background gdlr-core-parallax gdlr-core-js" id="div_0576_34" data-parallax-speed="0"></div>
                        </div>
                        <div class="gdlr-core-pbf-wrapper-content gdlr-core-js ">
                            <div class="gdlr-core-pbf-wrapper-container clearfix gdlr-core-pbf-wrapper-full-no-space">
                                <div class="gdlr-core-pbf-element">
                                    <div class="gdlr-core-title-item gdlr-core-item-pdb clearfix  gdlr-core-center-align gdlr-core-title-item-caption-bottom gdlr-core-item-pdlr"  id="gdlr-core-title-item-id-30372">
                                        <div class="gdlr-core-title-item-title-wrap">
                                            <h3 class="gdlr-core-title-item-title gdlr-core-skin-title" id="h3_0576_7"><span class="gdlr-core-title-item-left-icon" id="span_0576_3"  ></span>
                                                Who are we?
                                                <span class="gdlr-core-title-item-title-divider gdlr-core-skin-divider" ></span>
                                            </h3>
                            
                                        </div>
                                    </div>
                                </div>
                                <div class="gdlr-core-pbf-column gdlr-core-column-60 gdlr-core-column-first">
                                    <div class="gdlr-core-pbf-column-content-margin gdlr-core-js ">
                                        <div class="gdlr-core-pbf-column-content clearfix gdlr-core-js " id="div_0576_35">
                                            <div class="gdlr-core-pbf-element">
                                                <div class="gdlr-core-text-box-item gdlr-core-item-pdlr gdlr-core-item-pdb gdlr-core-center-align" id="div_0576_36">
                                                    <div class="gdlr-core-text-box-item-content">
                                                        <p>GREENBIKE has unique concepts “Work with your heart to serve better”. We ride trough historical Taro village with all of its important history for Hinduism in Bali and the culture explanation of our professional guides will ensure your trip more enjoyable.</p>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="gdlr-core-pbf-wrapper " id="div_fd3f_51" data-skin="Blue Column Service">
                        <div class="gdlr-core-pbf-background-wrap">
                            <div class="gdlr-core-pbf-background gdlr-core-parallax gdlr-core-js" id="div_fd3f_52" data-parallax-speed="0"></div>
                        </div>
                        <div class="gdlr-core-pbf-wrapper-content gdlr-core-js ">
                            <div class="gdlr-core-pbf-wrapper-container clearfix gdlr-core-container">
                                <div class="gdlr-core-pbf-column gdlr-core-column-15 gdlr-core-column-first" data-skin="Blue Icon">
                                    <div class="gdlr-core-pbf-column-content-margin gdlr-core-js  gdlr-core-column-extend-left" id="div_fd3f_53" data-sync-height="column-service-height">
                                        <div class="gdlr-core-pbf-background-wrap" id="div_fd3f_54"></div>
                                        <div class="gdlr-core-pbf-column-content clearfix gdlr-core-js  gdlr-core-sync-height-content">
                                            <div class="gdlr-core-pbf-element">
                                                <div class="gdlr-core-title-item gdlr-core-item-pdb clearfix  gdlr-core-left-align gdlr-core-title-item-caption-top gdlr-core-item-pdlr" id="div_fd3f_55">
                                                    <div class="gdlr-core-title-item-title-wrap">
                                                        <h3 class="gdlr-core-title-item-title gdlr-core-skin-title" id="h3_fd3f_16">Why Book With Us?<span class="gdlr-core-title-item-title-divider gdlr-core-skin-divider" ></span></h3></div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="gdlr-core-pbf-column gdlr-core-column-15" data-skin="Blue Icon">
                                    <div class="gdlr-core-pbf-column-content-margin gdlr-core-js " id="div_fd3f_56" data-sync-height="column-service-height">
                                        <div class="gdlr-core-pbf-column-content clearfix gdlr-core-js  gdlr-core-sync-height-content">
                                            <div class="gdlr-core-pbf-element">
                                                <div class="gdlr-core-column-service-item gdlr-core-item-pdb  gdlr-core-left-align gdlr-core-column-service-icon-left gdlr-core-no-caption gdlr-core-item-pdlr" id="div_fd3f_57">
                                                    <div class="gdlr-core-column-service-media gdlr-core-media-image"><img src="<?php echo $this->common->theme_custome(); ?>upload/icon-10.png" alt="" width="37" height="39" /></div>
                                                    <div class="gdlr-core-column-service-content-wrapper">
                                                        <div class="gdlr-core-column-service-title-wrap" id="div_fd3f_58">
                                                            <h3 class="gdlr-core-column-service-title gdlr-core-skin-title">4,000+ Adventuors Plan</h3></div>
                                                        <div class="gdlr-core-column-service-content" id="div_fd3f_59">
                                                            <p>Over 4K Trip was planned for People all around world </p>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="gdlr-core-pbf-column gdlr-core-column-15" data-skin="Blue Icon">
                                    <div class="gdlr-core-pbf-column-content-margin gdlr-core-js " id="div_fd3f_60" data-sync-height="column-service-height">
                                        <div class="gdlr-core-pbf-column-content clearfix gdlr-core-js  gdlr-core-sync-height-content">
                                            <div class="gdlr-core-pbf-element">
                                                <div class="gdlr-core-column-service-item gdlr-core-item-pdb  gdlr-core-left-align gdlr-core-column-service-icon-left gdlr-core-no-caption gdlr-core-item-pdlr" id="div_fd3f_61">
                                                    <div class="gdlr-core-column-service-media gdlr-core-media-image"><img src="<?php echo $this->common->theme_custome(); ?>upload/icon-11.png" alt="" width="34" height="43" /></div>
                                                    <div class="gdlr-core-column-service-content-wrapper">
                                                        <div class="gdlr-core-column-service-title-wrap" id="div_fd3f_62">
                                                            <h3 class="gdlr-core-column-service-title gdlr-core-skin-title">3x TA Winners</h3></div>
                                                        <div class="gdlr-core-column-service-content" id="div_fd3f_63">
                                                            <p>Winner 3 times Excellence Service on Trip Advisor</p>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="gdlr-core-pbf-column gdlr-core-column-15" data-skin="Blue Icon">
                                    <div class="gdlr-core-pbf-column-content-margin gdlr-core-js " id="div_fd3f_64" data-sync-height="column-service-height">
                                        <div class="gdlr-core-pbf-column-content clearfix gdlr-core-js  gdlr-core-sync-height-content">
                                            <div class="gdlr-core-pbf-element">
                                                <div class="gdlr-core-column-service-item gdlr-core-item-pdb  gdlr-core-left-align gdlr-core-column-service-icon-left gdlr-core-no-caption gdlr-core-item-pdlr" id="div_fd3f_65">
                                                    <div class="gdlr-core-column-service-media gdlr-core-media-image"><img src="<?php echo $this->common->theme_custome(); ?>upload/icon-2.png" alt="" width="27" height="37" /></div>
                                                    <div class="gdlr-core-column-service-content-wrapper">
                                                        <div class="gdlr-core-column-service-title-wrap" id="div_fd3f_66">
                                                            <h3 class="gdlr-core-column-service-title gdlr-core-skin-title">Best Price Trou</h3></div>
                                                        <div class="gdlr-core-column-service-content" id="div_fd3f_67">
                                                            <p>Best Price for Adventurous Service</p>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="gdlr-core-pbf-wrapper " id="div_fd3f_37">
                        <div class="gdlr-core-pbf-background-wrap">
                            <div class="gdlr-core-pbf-background gdlr-core-parallax gdlr-core-js" id="div_fd3f_38" data-parallax-speed="0.2"></div>
                        </div>
                        <div class="gdlr-core-pbf-wrapper-content gdlr-core-js ">
                            <div class="gdlr-core-pbf-wrapper-container clearfix gdlr-core-container">
                                <div class="gdlr-core-pbf-column gdlr-core-column-30 gdlr-core-column-first" data-skin="White Text">
                                    <div class="gdlr-core-pbf-column-content-margin gdlr-core-js ">
                                        <div class="gdlr-core-pbf-column-content clearfix gdlr-core-js ">
                                            <div class="gdlr-core-pbf-element">
                                                <div class="gdlr-core-title-item gdlr-core-item-pdb clearfix  gdlr-core-left-align gdlr-core-title-item-caption-top gdlr-core-item-pdlr" id="div_fd3f_39">
                                                    <div class="gdlr-core-title-item-title-wrap">
                                                        <h3 class="gdlr-core-title-item-title gdlr-core-skin-title" id="h3_fd3f_8">Discount <span id="span_fd3f_11">10% Off</span><span class="gdlr-core-title-item-title-divider gdlr-core-skin-divider" ></span></h3></div>
                                                </div>
                                            </div>
                                            <div class="gdlr-core-pbf-element">
                                                <div class="gdlr-core-text-box-item gdlr-core-item-pdlr gdlr-core-item-pdb gdlr-core-left-align" id="div_fd3f_40">
                                                    <div class="gdlr-core-text-box-item-content" id="div_fd3f_41">
                                                        <p>We are glad to inform you that we are giving you best discount for our repeater guest in Downhill Cycling</p>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="gdlr-core-pbf-element">
                                                <div class="gdlr-core-button-item gdlr-core-item-pdlr gdlr-core-item-pdb gdlr-core-left-align"><a class="gdlr-core-button  gdlr-core-button-solid gdlr-core-button-no-border" href="http://max-themes.net/demos/popular-deals/index.html" id="gdlr-core-button-id-84996"><span class="gdlr-core-content" >Get Discount Tours</span></a></div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="gdlr-core-pbf-column gdlr-core-column-30">
                                    <div class="gdlr-core-pbf-column-content-margin gdlr-core-js ">
                                        <div class="gdlr-core-pbf-column-content clearfix gdlr-core-js "></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    
                </div>
            </div>