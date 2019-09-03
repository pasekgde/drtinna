 <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
        <?php echo lang("ctn_1") ?>
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
        <h3 class="box-title"></h3>
        <div class="pull-right">
          <?php if($this->common->has_permissions(array("admin", "content_manager"), $this->user)) : ?><button class="btn btn-primary btn-sm" data-toggle="modal" data-target="#addModal"><?php echo ("Add Plan") ?></button><?php endif; ?>
        </div>
            </div>
            <!-- /.box-header -->
            <div class="box-body">
              <table id="example2" class="table table-bordered table-hover">
                <thead>
                <tr>
                    <th><?php echo lang("ctn_260") ?></th>
                    <th><?php echo lang("ctn_261") ?></th>
                    <th><?php echo lang("ctn_262") ?></th>
                    <th><?php echo lang("ctn_263") ?></th>
                    <th><?php echo lang("ctn_52") ?></th>
                </tr>
                </thead>
                <tbody>
                  <?php foreach($plans->result() as $r) : ?>
                    <tr>
                        <td><?php echo $r->name ?></td>
                        <td><?php echo number_format($r->cost, 2) ?></td>
                        <td><?php echo $r->days ?></td><td><?php echo $r->sales ?></td>
                        <td><a href="<?php echo site_url("hideend/admin/edit_payment_plan/" . $r->ID) ?>" class="btn btn-warning btn-xs" title="<?php echo lang("ctn_55") ?>"><span class="glyphicon glyphicon-cog"></span></a> <a href="<?php echo site_url("hideend/admin/delete_payment_plan/" . $r->ID . "/" . $this->security->get_csrf_hash()) ?>" class="btn btn-danger btn-xs" title="<?php echo lang("ctn_57") ?>"><span class="glyphicon glyphicon-trash"></span></a></td>
                    </tr>
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
        <h4 class="modal-title" id="myModalLabel"> <?php echo lang("ctn_264") ?></h4>
              </div>
              <div class="modal-body" style="background-color: #ECF0F5 !important; color:black!important">
                 <?php echo form_open_multipart(site_url("hideend/admin/add_payment_plan"), array("class" => "form-horizontal")) ?>
            <div class="form-group">
                    <label for="email-in" class="col-md-3 label-heading"><?php echo lang("ctn_260") ?></label>
                    <div class="col-md-9">
                        <input type="text" class="form-control" id="email-in" name="name">
                    </div>
            </div>
            <div class="form-group">
                    <label for="email-in" class="col-md-3 label-heading"><?php echo lang("ctn_271") ?></label>
                    <div class="col-md-9">
                        <input type="text" class="form-control" id="email-in" name="description">
                    </div>
            </div>
            <div class="form-group">

                        <label for="username-in" class="col-md-3 label-heading"><?php echo lang("ctn_265") ?></label>
                        <div class="col-md-9">
                            <input type="text" class="form-control" id="username" name="cost">
                        </div>
            </div>
            <div class="form-group">

                        <label for="username-in" class="col-md-3 label-heading"><?php echo lang("ctn_266") ?></label>
                        <div class="col-md-9">
                            <input type="text" class="form-control jscolor" id="username" name="color">
                        </div>
            </div>
            <div class="form-group">

                        <label for="username-in" class="col-md-3 label-heading"><?php echo lang("ctn_272") ?></label>
                        <div class="col-md-9">
                            <input type="text" class="form-control jscolor" id="username" name="fontcolor">
                        </div>
            </div>
            <div class="form-group">

                        <label for="username-in" class="col-md-3 label-heading"><?php echo lang("ctn_262") ?></label>
                        <div class="col-md-9">
                            <input type="text" class="form-control" id="username" name="days">
                            <span class="help-block"><?php echo lang("ctn_267") ?></span>
                        </div>
            </div>
            <div class="form-group">

                        <label for="username-in" class="col-md-3 label-heading"><?php echo lang("ctn_347") ?></label>
                        <div class="col-md-9">
                            <input type="text" class="form-control" id="username" name="icon" value="glyphicon glyphicon-piggy-bank">
                            <span class="help-block"><?php echo lang("ctn_348") ?> <a href="http://getbootstrap.com/components/">http://getbootstrap.com/components/</a>. <?php echo lang("ctn_349") ?></span>
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
  