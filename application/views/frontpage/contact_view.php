<section class="inner-intro bg-2 bg-opacity-white-70 lazyload" data-src="<?php echo $this->common->theme_link()?>images/bg/02.jpg"  style="background-image: url(<?php echo $this->common->theme_link()?>images/loading.gif);">
  <div class="container">
     <div class="row text-center intro-title">
            <h1 class="text-blue">Contact us</h1>
            <p class="text-grey">Let’s make something great together</p>
            <ul class="page-breadcrumb">
               <li><a href="#"><i class="fa fa-home"></i> Home</a> <i class="fa fa-angle-double-right"></i></li>
              <li><a href="#">Contact Us</a></li>
           </ul>
     </div>
  </div>
</section>

<!--=================================
 contact-->

<section class="contact white-bg page-section-ptb">
  <div class="container">
    <div class="row">
       <div class="col-lg-12 col-md-12">
        <div class="section-title-1 text-center">
          <h1 class="text-blue">Let’s Get in Touch!</h1>
          <div class="title-line"></div>
          <p>If you have a question or something, please don't hesitate to contact us as below:</p>
        </div>
      </div>
    </div>
     <div class="row">
       <div class="col-lg-4 col-md-4 col-sm-4">
           <div class="contact-box text-center">
              <a href="tel:+6281353001068"><i class="fa fa-phone"></i></a>
              <h3 class="mt-20">Phone</h3>
              <p class="mt-20">+62 81353001068</p>
           </div>
       </div>    

	   <div class="col-lg-4 col-md-4 col-sm-4">
           <div class="contact-box text-center">
              <a href="https://api.whatsapp.com/send?phone=+6281353001068&amp;text=Hi!%20Saya%20ingin%20menanyakan%20info%20mengenai%20BossForexSignal.com."><i class="fa fa-whatsapp"></i></a>
              <h3 class="mt-20">Whatsapp</h3>
              <p class="mt-20">+62 81353001068</p>
           </div>
       </div>
       <div class="col-lg-4 col-md-4 col-sm-4">
           <div class="contact-box text-center">
              <a href="mailto:info@bossforexsignal.com?subject=[Ask]bossforexsignal.com"><i class="fa fa-envelope-o"></i></a>
              <h3 class="mt-20">Email</h3>
              <p class="mt-20">info@bossforexsignal.com</p>
           </div>
       </div>
       
     </div>
      <div class="row">
      <div class="col-lg-12 col-md-12 text-center">
       <p class="mt-50 mb-30"> We are looking forward to hearing from you! We reply within <br /><span class="tooltip-content-2" data-original-title="Mon-Fri 8am–7pm (GMT +8)" data-toggle="tooltip" data-placement="top"> 24 hours !</span></p>
      </div>
     </div>
     <div class="row">
       <div class="col-lg-12 col-md-12">
         <div id="formmessage"><?php echo validation_errors(); ?></div>
         <?php 		 
		 $attributes = array('class'=>'form-horizontal','id' => 'contactform','role'=>'form','method'=>'post');
			echo form_open('#',$attributes );	?>
         <div class="contact-form">
		    <div class="section-field">
              <i class="fa fa-envelope-o"></i>
             <input type="email" placeholder="Email*" name="email" value="<?php if(isset($datakirim['email']))echo $datakirim['email']?>">
            </div>
           <div class="section-field">
            <i class="fa fa-user"></i>
           <input id="name" type="text" placeholder="Name*"  name="name" value="<?php if(isset($datakirim['name']))echo $datakirim['name']?>">
           </div> 
           <div class="section-field">
              <i class="fa fa-phone"></i>
              <input type="text" placeholder="Phone*" name="phone" value="<?php if(isset($datakirim['phone']))echo $datakirim['phone']?>">
            </div>
           <div class="section-field textarea">
             <i class="fa fa-pencil"></i>
             <textarea class="input-message" placeholder="Comment*" rows="7" name="message"><?php if(isset($datakirim['message']))echo $datakirim['message']?></textarea>
            </div>
             <button id="submit" name="submit" type="submit" value="Send" class="button mt-15"><span> Send your message </span> <i class="fa fa-paper-plane"></i></button>
			
         </div> 
        <?php echo form_close(); ?>
        <div id="ajaxloader" style="display:none"><img class="center-block mt-30 mb-30" src="<?php echo $this->common->theme_link(); ?>images/ajax-loader.gif" alt=""></div> 
       </div> 
     </div> 
    <div class="page-section-pt"> 
    
     
  </div>
 </div>
</section>

<!--=================================
 contact-->
<section class="action-box">
  <div class="container">
    <div class="row">
      <div class="col-lg-12 col-md-12" style="text-align: center;">
        <a href="https://fbs.id/?ppk=Bossforexsignal" target="_blank" style="outline: none;" ><img src="https://fbs.id/upload/promo/banner/56b6238721c3397d2521f93cd52a9539.gif?ppu=1090762" width="728" height="90" border="0"></a>
      </div>

    </div>
  </div>
</section>