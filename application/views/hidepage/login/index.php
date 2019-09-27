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
          <button type="submit" class="btn btn-primary btn-block btn-flat">Masuk</button>
        </div>
        <!-- /.col -->
      </div>
    <?php echo form_close() ?>
    <a href="<?php echo site_url("hideend/login/forgotpw") ?>">Lupa Password</a><br>
    <a href="<?php echo site_url("hideend/register") ?>" class="text-center">Daftar Akun Baru</a>


