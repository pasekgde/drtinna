<!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
        <?php echo lang("ctn_1") ?>
        <small>Preview</small>
      </h1>
      <ol class="breadcrumb">
        <li><a href="<?php echo site_url("hideend/admin") ?>"><?php echo lang("ctn_2") ?></a></li>
        <li><a href="<?php echo site_url("hideend/admin") ?>"><?php echo lang("ctn_1") ?></a></li>
        <li><a href="<?php echo site_url("hideend/admin/email_templates") ?>"><?php echo lang("ctn_3") ?></a></li>
        <li class="active"><?php echo lang("ctn_4") ?></li>
      </ol>
    </section>

    <!-- Main content -->
    <section class="content">
      <div class="row">
        <!-- left column -->
        <div class="col-md-12">
          <!-- general form elements -->
          <div class="box box-primary">
            <!-- /.box-header -->
              <div class="box-body">
                <p><?php echo lang("ctn_5") ?></p>


                <p><b><?php echo lang("ctn_6") ?></b></p>
                <table class="table table-bordered">
                <tr><td>[NAME]</td><td> <?php echo lang("ctn_7") ?></td></tr>
                <tr><td>[SITE_URL]</td><td> <?php echo lang("ctn_8") ?></td></tr>
                <tr><td>[SITE_NAME]</td><td> <?php echo lang("ctn_9") ?></td></tr>
                <tr><td>[EMAIL_LINK]</td><td> <?php echo lang("ctn_10") ?></td></tr>
                </table>
                <hr>
          

 
                
              </div>
              <!-- /.box-body -->

             
        
            <?php echo form_close() ?>
          </div>
          <!-- /.box -->

         

          

          
      <!-- /.row -->
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
            <?php echo form_open_multipart(site_url("hideend/admin/edit_email_template_pro"), array("class" => "form-horizontal")) ?>
              <div class="box-body">
        
          
        <div class="form-group">
        <label for="email-in" class="col-md-3 label-heading"><?php echo lang("ctn_11") ?></label>
        <div class="col-md-9">
            <input type="text" class="form-control" id="email-in" name="title" value="<?php echo $email_template->title ?>">
        </div>
</div>
<div class="form-group">
        <label for="email-in" class="col-md-3 label-heading"><?php echo lang("ctn_12") ?></label>
        <div class="col-md-9">
            <textarea name="message" rows="8" class="form-control"><?php echo $email_template->message ?></textarea>
        </div>
</div>
        
                
              </div>
              <!-- /.box-body -->

              <div class="box-footer ">
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