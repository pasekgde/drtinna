<div class="register-box-body">
	<p class="login-box-msg">Register Akun Pengajuan Baru</p>
	<?php if(!empty($fail)) : ?>
				<div class="alert alert-danger"><?php echo $fail ?></div>
			<?php endif; ?>

    <?php echo form_open(site_url("hideend/register"), array("class" => "form-horizontal")) ?>
      <div class="form-group has-feedback">
        	<input type="text" class="form-control" placeholder="Nama Lengkap" name="fullname" value="<?php if(isset($fullname)) echo $fullname; ?>">
       		<div id="fullname_check"></div>
       		<span class="glyphicon glyphicon-user form-control-feedback"></span>
      </div>

      <div class="form-group has-feedback">
        <input type="text" class="form-control" id="jabatan" placeholder="Jabatan" name="jabatan" value="<?php if(isset($jabatan)) echo $jabatan; ?>">
        <span class="glyphicon glyphicon-envelope form-control-feedback"></span>
      </div>

      <div class="form-group has-feedback">
        <input type="text" class="form-control" placeholder="NIP" name="nip" value="<?php if(isset($nip)) echo $nip; ?>">
        <span class="glyphicon glyphicon-envelope form-control-feedback"></span>
      </div>

      <div class="form-group has-feedback">
        <input type="text" class="form-control" placeholder="No. Hp" name="phone" value="<?php if(isset($phone)) echo $phone; ?>">
        <span class="glyphicon glyphicon-envelope form-control-feedback"></span>
      </div>      

      <div class="form-group has-feedback">
        <input type="email" class="form-control" placeholder="Email" id="email-in" name="email" value="<?php if(isset($email)) echo $email; ?>">
        <span class="glyphicon glyphicon-envelope form-control-feedback"></span>
      </div>

      <div class="form-group has-feedback">
        <input type="password" class="form-control" placeholder="Password" id="password-in" name="password" value="">
        <span class="glyphicon glyphicon-lock form-control-feedback"></span>
      </div>

      <div class="form-group has-feedback">
        <input type="password" class="form-control" placeholder="Retype password" id="cpassword-in" name="password2" value="">
        <span class="glyphicon glyphicon-log-in form-control-feedback"></span>
      </div>
      <div class="row">
        <!-- /.col -->
        <div class="col-sa-4">
          		  		<input type="submit" name="s" class="btn btn-primary form-control" value="<?php echo lang("ctn_221") ?>" />
        </div>
        <!-- /.col -->
      </div>
    <?php echo form_close() ?>

    <a href="<?php echo site_url("hideend/login") ?>" class="text-center">I already have a membership</a>
</div>

