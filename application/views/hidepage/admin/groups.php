 <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
        Data Tables
        <small>advanced tables</small>
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
        <h3 class="box-title">Hover Data Table</h3>
        <div class="pull-right">
          <?php if($this->common->has_permissions(array("admin", "content_manager"), $this->user)) : ?><button class="btn btn-primary btn-sm" data-toggle="modal" data-target="#addModal"><?php echo ("Add Group") ?></button><?php endif; ?>
        </div>
            </div>
            <!-- /.box-header -->
            <div class="box-body">
              <table id="example2" class="table table-bordered table-hover">
                <thead>
                <tr>
            <th><?php echo lang("ctn_18") ?></th>
            <th><?php echo lang("ctn_19") ?></th>
            <th><?php echo lang("ctn_52") ?></th>
                </tr>
                </thead>
                <tbody>
          <?php foreach($groups->result() as $r) : ?>
<tr><td><?php echo $r->name ?></td><td><?php if($r->default) { echo lang("ctn_53");}else{ echo lang("ctn_54"); } ?></td><td><a href="<?php echo site_url("hideend/admin/edit_group/" . $r->ID) ?>" class="btn btn-warning btn-xs" title="<?php echo lang("ctn_55") ?>"><span class="glyphicon glyphicon-cog"></span></a> <a href="<?php echo site_url("hideend/admin/delete_group/" . $r->ID . "/" . $this->security->get_csrf_hash()) ?>" class="btn btn-danger btn-xs" onclick="return confirm('<?php echo lang("ctn_56") ?>')" title="<?php echo lang("ctn_57") ?>"><span class="glyphicon glyphicon-trash"></span></a> <a href="<?php echo site_url("hideend/admin/view_group/" . $r->ID) ?>" class="btn btn-primary btn-xs"><?php echo lang("ctn_58") ?></a></td></tr>
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
                    <div class="modal-body">
      <?php echo form_open(site_url("hideend/admin/add_group_pro"), array("class" => "form-horizontal")) ?>
            <div class="form-group">
                    <label for="email-in" class="col-md-3 label-heading"><?php echo lang("ctn_18") ?></label>
                    <div class="col-md-9">
                        <input type="text" class="form-control" id="email-in" name="name">
                    </div>
            </div>
            <div class="form-group">

                        <label for="username-in" class="col-md-3 label-heading"><?php echo lang("ctn_19") ?></label>
                        <div class="col-md-9">
                            <input type="checkbox" name="default_group" value="1">
                            <span class="help-block"><?php echo lang("ctn_59") ?></span>
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
  