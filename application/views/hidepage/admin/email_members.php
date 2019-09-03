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
            <?php echo form_open_multipart(site_url("hideend/admin/email_members_pro"), array("class" => "form-horizontal")) ?>
              <div class="box-body">
                    <div class="form-group">
                            <label for="email-in" class="col-md-3 label-heading"><?php echo lang("ctn_43") ?></label>
                            <div class="col-md-9">
                                <input type="text" class="form-control" id="email-in" name="usernames" value="">
                                <span class="help-text"><?php echo lang("ctn_44") ?></span>
                            </div>
                    </div>

                    <div class="form-group">
                            <label for="email-in" class="col-md-3 label-heading"><?php echo lang("ctn_45") ?></label>
                            <div class="col-md-9">
                                <select name="groupid" class="form-control"><option value="0"><?php echo lang("ctn_46") ?></option><option value="-1"><?php echo lang("ctn_47") ?></option>
                                <?php foreach($groups->result() as $r) : ?>
                                    <option value="<?php echo $r->ID ?>"><?php echo $r->name ?></option>
                                <?php endforeach; ?>
                                </select>
                            </div>
                    </div>
                    <div class="form-group">
                            <label for="email-in" class="col-md-3 label-heading"><?php echo lang("ctn_48") ?></label>
                            <div class="col-md-9">
                                <input type="text" name="title" class="form-control" />
                            </div>
                    </div>
                    <div class="form-group">
                            <label for="email-in" class="col-md-3 label-heading"><?php echo lang("ctn_49") ?></label>
                            <div class="col-md-9">
                                <textarea name="message" class="form-control" rows="8"></textarea>
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