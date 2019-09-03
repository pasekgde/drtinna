  <p class="login-box-msg">Sign in to start your session</p>
        <?php if(isset($_GET['redirect'])) : ?>
        <?php echo form_open(site_url("hideend/login/pro/" . urlencode($_GET['redirect']))) ?>
        <?php else : ?>
        <?php echo form_open(site_url("hideend/login/pro")) ?>
        <?php endif; ?>
      <div class="form-group has-feedback">
        <input type="email" name="email" class="form-control" placeholder="<?php echo lang("ctn_303") ?>">
        <span class="glyphicon glyphicon-envelope form-control-feedback"></span>
      </div>
      <div class="form-group has-feedback">
        <input type="password" name="pass" class="form-control" placeholder="<?php echo lang("ctn_180") ?>">
        <span class="glyphicon glyphicon-lock form-control-feedback"></span>
      </div>
      <div class="row">
        
        <!-- /.col -->
        <div class="col-xs-4 pull-right">
          <button type="submit" class="btn btn-primary btn-block btn-flat">Sign In</button>
        </div>
        <!-- /.col -->
      </div>
    <?php echo form_close() ?>
    <?php if(!$this->settings->info->disable_social_login) : ?> 
    <div class="social-auth-links text-center">
      <p>- OR -</p>
      <a href="<?php echo site_url("hideend/login/twitter_login") ?>" class="btn btn-block btn-social btn-twitter btn-flat"><i class="fa fa-twitter"></i> Sign in using
        Twitter</a>     

      <a href="<?php echo site_url("hideend/login/facebook_login") ?>" class="btn btn-block btn-social btn-facebook btn-flat"><i class="fa fa-facebook"></i> Sign in using
        Facebook</a>
      <a href="<?php echo site_url("hideend/login/google_login") ?>" class="btn btn-block btn-social btn-google btn-flat"><i class="fa fa-google-plus"></i> Sign in using
        Google+</a>
    </div>
    <!-- /.social-auth-links -->
      <?php endif; ?>
    <a href="<?php echo site_url("hideend/login/forgotpw") ?>">I forgot my password</a><br>
    <a href="<?php echo site_url("hideend/register") ?>" class="text-center">Register a new membership</a>


