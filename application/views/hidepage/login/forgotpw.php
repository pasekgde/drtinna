<div class="register-box-body">
  <p class="login-box-msg"><?php echo lang("ctn_175") ?></p>
  <?php if(!empty($fail)) : ?>
        <div class="alert alert-danger"><?php echo $fail ?></div>
      <?php endif; ?>

        <?php echo form_open(site_url("hideend/login/forgotpw_pro/")) ?>
          <div class="input-group">
              <span class="input-group-addon"><i class="fa fa-envelope"></i></span>
              <input type="text" name="email" class="form-control">
          </div><br />
          <input type="submit" class="btn btn-primary form-control" value="Kirim">
          <?php echo form_close() ?>
    <p class="decent-margin align-center"><a href="<?php echo site_url("hideend/login") ?>"> Kembali ke halaman Login</a></p>
</div>


