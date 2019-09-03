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
            <?php echo form_open_multipart(site_url("hideend/admin/payment_settings_pro"), array("class" => "form-horizontal")) ?>
              <div class="box-body">
<div class="form-group">
    <label for="name-in" class="col-sm-2 control-label"><?php echo lang("ctn_251") ?></label>
    <div class="col-sm-10">
        <input type="checkbox" class="" id="name-in" name="payment_enabled" <?php if($this->settings->info->payment_enabled) echo "checked" ?> value="1">
        <span class="help-block"><?php echo lang("ctn_252") ?></span>
    </div>
</div>
<div class="form-group">
    <label for="name-in" class="col-sm-2 control-label"><?php echo lang("ctn_286") ?></label>
    <div class="col-sm-10">
        <input type="checkbox" id="name-in" name="global_premium" <?php if($this->settings->info->global_premium) echo "checked" ?> value="1">
        <span class="help-block"><?php echo lang("ctn_287") ?></span>
    </div>
</div>
<div class="form-group">
    <label for="name-in" class="col-sm-2 control-label"><?php echo lang("ctn_253") ?></label>
    <div class="col-sm-10">
        <input type="text" class="form-control" id="name-in" name="paypal_email" placeholder="" value="<?php echo $this->settings->info->paypal_email ?>">
        <span class="help-block"><?php echo lang("ctn_254") ?></span>
    </div>
</div>
<div class="form-group">
    <label for="name-in" class="col-sm-2 control-label"><?php echo lang("ctn_255") ?></label>
    <div class="col-sm-10">
        <input type="text" class="form-control" id="name-in" name="paypal_currency" placeholder="" value="<?php echo $this->settings->info->paypal_currency ?>">
        <span class="help-block"><?php echo lang("ctn_256") ?>: <a href="https://developer.paypal.com/docs/classic/api/currency_codes/">https://developer.paypal.com/docs/classic/api/currency_codes/</a>.</span>
    </div>
</div>
<div class="form-group">
    <label for="name-in" class="col-sm-2 control-label"><?php echo lang("ctn_257") ?></label>
    <div class="col-sm-10">
        <input type="text" class="form-control" id="name-in" name="payment_symbol" placeholder="" value="<?php echo $this->settings->info->payment_symbol ?>">
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