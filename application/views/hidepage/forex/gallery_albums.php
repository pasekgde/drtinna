 <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
        Add Album
      </h1>
      <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
        <li><a href="#">Tables</a></li>
        <li class="active">Data tables</li>
      </ol>
    </section>

    <!-- Main content -->
    <section class="content">
      <div class="row">
        <div class="col-xs-12">
          <div class="box">
            <div class="box-header">
        <h3 class="box-title"></h3>
        <div class="pull-right">
          <?php if($this->common->has_permissions(array("admin", "content_manager"), $this->user)) : ?><button class="btn btn-primary btn-sm" data-toggle="modal" data-target="#addModal"><?php echo ("Add Album") ?></button><?php endif; ?>
        </div>
            </div>
            <!-- /.box-header -->
            <div class="box-body">
              <table id="example2" class="table table-bordered table-hover">
                <thead>
                <tr>
          <th><?php echo lang("ctn_81") ?></th>
          <th><?php echo lang("ctn_430") ?></th>
          <th><?php echo lang("ctn_52") ?></th>
                </tr>
                </thead>
                <tbody>
          
          <?php foreach($albums->result() as $r) : ?>
          <tr><td><?php echo $r->name ?></td><td><img src="<?php echo base_url() ?><?php echo $this->settings->info->upload_path_relative ?>/<?php echo $r->image ?>" class="content-category"></td><td><a href="<?php echo site_url("hideend/content/edit_post_category/" . $r->ID) ?>" class="btn btn-warning btn-xs" data-toggle="tooltip" data-placement="bottom" title="<?php echo lang("ctn_55") ?>"><span class="glyphicon glyphicon-cog"></span></a> <a href="<?php echo site_url("hideend/content/delete_post_category/" . $r->ID . "/" . $this->security->get_csrf_hash()) ?>" class="btn btn-danger btn-xs" onclick="return confirm('<?php echo lang("ctn_317") ?>')" data-toggle="tooltip" data-placement="bottom" title="<?php echo lang("ctn_57") ?>"><span class="glyphicon glyphicon-trash"></span></a></td></tr>
          <?php endforeach; ?>
                </tbody>
                
              </table>
            </div>
            <!-- /.box-body -->
          </div>
          <!-- /.box -->

          
          <!-- /.box -->
        </div>
        <!-- /.col -->
      </div>
      <!-- /.row -->
    </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->
 
<?php if($this->common->has_permissions(array("admin", "content_manager"), $this->user)) : ?>
       <div class="modal modal-info fade" id="addModal">
          <div class="modal-dialog" role="document">
            <div class="modal-content">
              <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel"> <?php echo lang("ctn_450") ?></h4>
              </div>
              <div class="modal-body" style="    background-color: #ECF0F5 !important; color:black!important">
                 <?php echo form_open_multipart(site_url("hideend/content/add_slider"), array("class" => "form-horizontal")) ?>
            <div class="form-group">
                    <label for="p-in" class="col-md-4 label-heading"><?php echo lang("ctn_81") ?></label>
                    <div class="col-md-8 ui-front">
                        <input type="text" class="form-control" name="name" value="">
                    </div>
            </div>
            <div class="form-group">
                    <label for="p-in" class="col-md-4 label-heading"><?php echo lang("ctn_430") ?></label>
                    <div class="col-md-8 ui-front">
                        <input type="file" class="form-control" name="userfile">
                        <span class="help-block"><?php echo lang("ctn_431") ?></span>
                    </div>
            </div>
            <div class="form-group">
                    <label for="p-in" class="col-md-4 label-heading"><?php echo lang("ctn_432") ?></label>
                    <div class="col-md-8">
                        <textarea name="desc" id="project-description"></textarea>
                    </div>
            </div>
              </div>
              <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal"><?php echo lang("ctn_60") ?></button>
        <input type="submit" class="btn btn-primary" value="<?php echo lang("ctn_450") ?>">
      <?php echo form_close() ?>
              </div>
            </div>
            <!-- /.modal-content -->
          </div>
          <!-- /.modal-dialog -->
        </div>
        <!-- /.modal -->

 <?php endif; ?>
  