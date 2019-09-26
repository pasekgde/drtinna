<div class="register-box-body">
  <p class="login-box-msg"><?php echo lang("ctn_186") ?></p>
  <?php if(!empty($fail)) : ?>
        <div class="alert alert-danger"><?php echo $fail ?></div>
      <?php endif; ?>

	<?php echo form_open(site_url("hideend/login/resetpw_pro/" . $token . "/" . $userid)) ?>
		  	<div class="form-group">
			  	<div class="row">
					<div class="col-md-12">
				    	<label for="password-in"><?php echo lang("ctn_187") ?></label>
				    	<input type="password" class="form-control" id="password-in" name="npassword" />
				    </div>
				</div>
		  	</div>
		  	<div class="form-group">
			  	<div class="row">
					<div class="col-md-12">
				    	<label for="password-in"><?php echo lang("ctn_188") ?></label>
				    	<input type="password" class="form-control" id="password-in" name="npassword2" />
				    </div>
				</div>
		  	</div>

		  	<input type="submit" class="btn btn-primary" name="s" value="<?php echo lang("ctn_185") ?>">
	<?php echo form_close() ?>
    <p class="decent-margin align-center"><a href="<?php echo site_url("hideend/login") ?>"> <?php echo lang("ctn_177") ?></a></p>
</div>



