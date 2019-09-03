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
              <h3 class="box-title"><?php echo lang("ctn_133") ?></h3>
            </div>
            <!-- /.box-header -->
            <!-- form start -->
            <?php echo form_open_multipart(site_url("hideend/content/add_post_pro"), array("class" => "form-horizontal")) ?>
              <div class="box-body">
                       
                    <b><?php echo lang("ctn_134") ?></b>: <?php echo $message ?><br /><br />
                
                
                
              </div>
              <!-- /.box-body -->

              <div class="box-footer ">
                <input type="button" value="<?php echo lang("ctn_135") ?>" onclick="window.history.back()" class="btn btn-default btn-sm" />
              </div>
              
            <?php echo form_close() ?>
          </div>
          <!-- /.box -->

         

          

          
      <!-- /.row -->
    </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->