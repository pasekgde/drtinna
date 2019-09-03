<section class="section-35 section-sm-75 section-lg-100 bg-whisperapprox">
        <div class="shell">
          <div class="range">
            <div class="cell-md-9 cell-lg-12">
              <h3>Join Free!</h3>

               <?php 
         $attributes = array('class' => 'checkout kl-store-checkout', 'name' => 'checkout', 'id'=>'checkoutform', 'enctype' => 'multipart/form-data');
         $hidden = array('paket' => '1');
         echo form_open('join/submit', $attributes,$hidden);  ?>
            
                <div class="range">
                  <div class="cell-sm-12">
                    <div class="form-group">
                      <input id="feedback-2-first-name" type="text" name="first_name" data-constraints="@Required" class="form-control" value="<?php if(isset($datakirim['first_name']))echo $datakirim['first_name']?>">
                      <label for="feedback-2-first-name" class="form-label">Name</label>
                    </div>
                  </div>
                  <div class="cell-sm-6 offset-top-30">
                    <div class="form-group">
                      <input id="feedback-2-email" type="email" name="email" data-constraints="@Email @Required" class="form-control" value="<?php if(isset($datakirim['email']))echo $datakirim['email']?>">
                      <label for="feedback-2-email" class="form-label">Email</label>
                    </div>
                  </div>
                  <div class="cell-sm-6 offset-top-30">
                    <div class="form-group">
                      <input id="feedback-2-state" type="state" name="state" data-constraints=" @Required" class="form-control" value="<?php if(isset($datakirim['state']))echo $datakirim['state']?>">
                      <label for="feedback-2-state" class="form-label">State</label>
                    </div>
                  </div>
                  <div class="cell-sm-6 offset-top-30">
                    <div class="form-group">
                      
              <div class="field-widget">
               <select name="phonecode" id="phonecode" class="input-text ">
                <?php foreach($phonecode as $key=>$ds) : ?>
                <option value="<?=$ds['dial_code']; ?>" <?php if(isset($dial_code))if($dial_code == $ds['dial_code']) echo "selected"; ?> >
                   <?=$ds['name'];?> (<?=$ds['dial_code'];?>)
                </option>
                <?php endforeach;?>
               </select>
              </div>
                    </div>
                  </div>
                  <div class="cell-sm-6 offset-top-30">
                    <div class="form-group">
                      <input id="feedback-2-phonenum" type="text" name="phone" data-constraints="@Numeric @Required" class="form-control" value="<?php if(isset($datakirim['phone']))echo $datakirim['phone']?>">
                      <label for="feedback-2-phonenum" class="form-label">Phone/Whatsapp</label>
                    </div>
                  </div>
                  <div class="cell-xs-12 offset-top-30">
                    <div class="form-group">
                      <textarea id="feedback-2-address_1" name="address_1" data-constraints="@Required" class="form-control"><?php if(isset($datakirim['address_1']))echo $datakirim['address_1']?></textarea>
                      <label for="feedback-2-address_1" class="form-label">Address</label>
                    </div>
                  </div>
                  <div class="cell-sm-6 offset-top-30">
                    <div class="form-group">
                      <input id="feedback-2-pass" type="password" name="pass" data-constraints="@Required" class="form-control" value="<?php if(isset($datakirim['password']))echo $datakirim['password']?>">
                      <label for="feedback-2-pass" class="form-label">Password</label>
                    </div>
                  </div>
                  <div class="cell-sm-6 offset-top-30">
                    <div class="form-group">
                      <input id="feedback-2-passconfirm" type="password" name="pass-confirm" data-constraints="@Required" class="form-control" value="<?php if(isset($datakirim['pass-confirm']))echo $datakirim['pass-confirm']?>">
                      <label for="feedback-2-passconfirm" class="form-label">Confim Password</label>
                    </div>
                  </div>
                  <div class="cell-sm-6 offset-top-30">
                     <label class="checkbox-inline checkbox-small">
                          <input type="checkbox" name="check_agree" id="check_agree" value = 'agree' />
                     <label for="check_agree">Accept our <a href="<?=site_url("home/tos")?>" target="_blank"> Terms of Use, Policies and Disclaimers.</a><span class="errorform"><?php if(isset($nochecked))echo "*Please check this, if you agree"?></span></label>
                        </label>
                  </div>


                  <div class="offset-top-22 text-left text-secondary">
                       
                      </div>
                  <div class="cell-sm-6 offset-top-30 offset-sm-top-50">
                    <button type="submit" class="btn btn-rect btn-ebony-clay-outline btn-block">Submit</button>
                  </div>
                </div>
              <?php echo form_close(); ?>
            </div>
          </div>
        </div>
      </section>

  