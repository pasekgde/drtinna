<ul class=" navigation-box">
                            <li class="<?= ($menu==1)?'current':''?>">
                                <a href="<?=site_url('/')?>">Home</a>                                
                            </li>
                            <li class="<?= ($menu==2)?'current':''?>">
                                <a href="<?=site_url('home/training/1')?>">Training</a>
                                <ul class="submenu">
                                    <li class="<?= ($submenu==1)?'current':''?>">
                                        <a href="#">Healthcare Pro</a>
                                        <ul class="submenu">
                                            <li><a href="<?=$this->common->slug_link('/home/training/1')?>">Regular ACLS</a></li>
                                            <li><a href="<?=$this->common->slug_link('/home/training/2')?>">Regular PALS</a></li>
                                            <li><a href="<?=$this->common->slug_link('/home/training/3')?>">Onsite Basic Life Support</a></li>
                                            <li><a href="<?=$this->common->slug_link('/home/training/4')?>">Onsite ACLS</a></li>
                                            <li><a href="<?=$this->common->slug_link('/home/training/5')?>">Onsite PALS</a></li>
                                            <li><a href="<?=$this->common->slug_link('/home/training/6')?>">Private Class</a></li>
                                        </ul><!-- /.submenu -->          
                                    </li>
                                    <li>
                                        <a href="blog-2-col.html">Lay Rescurer</a>
                                        <ul class="submenu">
                                            <li><a href="<?=$this->common->slug_link('/home/training/7')?>">Onsite First Aid, CPR & AED</a></li>
                                            <li><a href="<?=$this->common->slug_link('/home/training/8')?>">Onsite Heartsaver</a></li>
                                        </ul><!-- /.submenu --> 
                                    </li>
                                </ul><!-- /.submenu -->                                
                            </li>
                            
                            
                        </ul>