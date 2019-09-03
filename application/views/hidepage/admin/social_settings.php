<!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
        <?php echo lang("ctn_1") ?>
        <small>Preview</small>
      </h1>
      <ol class="breadcrumb">
        <li><a href="<?php echo site_url("hideend/") ?>"><i class="fa fa-dashboard"></i> <?php echo lang("ctn_2") ?></a></li>
        <li><a href="<?php echo site_url("hideend/admin") ?>"><?php echo lang("ctn_1") ?></a></li>
        <li class="active"><?php echo lang("ctn_89") ?></li>
      </ol>
    </section>

    <!-- Main content -->
    <section class="content">
      <div class="row">
        <!-- left column -->
        <div class="col-md-12">
          <!-- general form elements -->
          <div class="box box-primary">
            <div class="box-header with-border">
              <h3 class="box-title"><?php echo lang("ctn_90") ?></h3>
            </div>
            <!-- /.box-header -->
            <!-- form start -->
            <?php echo form_open_multipart(site_url("hideend/admin/social_settings_pro"), array("class" => "form-horizontal")) ?>
              <div class="box-body">
				<div class="form-group">
					<label for="name-in" class="col-sm-2 control-label"><?php echo lang("ctn_117") ?></label>
					<div class="col-sm-10">
						<input type="checkbox" id="name-in" name="disable_social_login" value="1" <?php if($this->settings->info->disable_social_login) echo "checked" ?>>
						<span class="help-block"><?php echo lang("ctn_118") ?></span>
					</div>
				</div>
				<div class="form-group">
					<label for="name-in" class="col-sm-2 control-label"><?php echo lang("ctn_119") ?></label>
					<div class="col-sm-10">
					  <input type="text" class="form-control" id="name-in" name="twitter_consumer_key" placeholder="" value="<?php echo $this->settings->info->twitter_consumer_key ?>">
					</div>
				</div>
				<div class="form-group">
					<label for="name-in" class="col-sm-2 control-label"><?php echo lang("ctn_120") ?></label>
					<div class="col-sm-10">
					  <input type="text" class="form-control" id="name-in" name="twitter_consumer_secret" placeholder="" value="<?php echo $this->settings->info->twitter_consumer_secret ?>">
					</div>
				</div>
				<div class="form-group">
					<label for="name-in" class="col-sm-2 control-label"><?php echo lang("ctn_121") ?></label>
					<div class="col-sm-10">
					  <input type="text" class="form-control" id="name-in" name="facebook_app_id" placeholder="" value="<?php echo $this->settings->info->facebook_app_id ?>">
					</div>
				</div>
				<div class="form-group">
					<label for="name-in" class="col-sm-2 control-label"><?php echo lang("ctn_122") ?></label>
					<div class="col-sm-10">
					  <input type="text" class="form-control" id="name-in" name="facebook_app_secret" placeholder="" value="<?php echo $this->settings->info->facebook_app_secret ?>">
					</div>
				</div>
				<div class="form-group">
					<label for="name-in" class="col-sm-2 control-label"><?php echo lang("ctn_123") ?></label>
					<div class="col-sm-10">
					  <input type="text" class="form-control" id="name-in" name="google_client_id" placeholder="" value="<?php echo $this->settings->info->google_client_id ?>">
					</div>
				</div>
				<div class="form-group">
					<label for="name-in" class="col-sm-2 control-label"><?php echo lang("ctn_124") ?></label>
					<div class="col-sm-10">
					  <input type="text" class="form-control" id="name-in" name="google_client_secret" placeholder="" value="<?php echo $this->settings->info->google_client_secret ?>">
					</div>
				</div>
				
				
				
                
              </div>
              <!-- /.box-body -->

              <div class="box-footer">
                <button type="submit" class="btn btn-primary col-md-12"><?php echo lang("ctn_13") ?></button>
              </div>
			  
            <?php echo form_close() ?>
          </div>
          <!-- /.box -->

         

          

          
      <!-- /.row -->
    </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->