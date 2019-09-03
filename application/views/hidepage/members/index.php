 <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
        <?php echo lang("ctn_494") ?>
       
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
        <div class="col-xs-4">
          <h3 class="box-title">All your image list</h3>
        </div>
        <div class="col-xs-7">
          <div class="input-group">
            <input type="text" class="form-control" placeholder="Search" id="form-search-input" >
             <div class="input-group-btn">
      <input type="hidden" id="search_type" value="0">
        <button type="button" class="btn btn-info dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
    <span class="glyphicon glyphicon-search" aria-hidden="true"></span></button>
              <ul class="dropdown-menu small-text" style="min-width: 90px !important; left: -90px;">
              <li><a href="#" onclick="change_search(0)"><span class="glyphicon glyphicon-ok" id="search-like"></span> <?php echo lang("ctn_337") ?></a></li>
          <li><a href="#" onclick="change_search(1)"><span class="glyphicon glyphicon-ok no-display" id="search-exact"></span> <?php echo lang("ctn_338") ?></a></li>
          <li><a href="#" onclick="change_search(2)"><span class="glyphicon glyphicon-ok no-display" id="user-exact"></span> <?php echo lang("ctn_339") ?></a></li>
          <li><a href="#" onclick="change_search(3)"><span class="glyphicon glyphicon-ok no-display" id="title-exact"></span> <?php echo lang("ctn_401") ?></a></li>
          <li><a href="#" onclick="change_search(4)"><span class="glyphicon glyphicon-ok no-display" id="summary-exact"></span> <?php echo lang("ctn_402") ?></a></li></a></li>
          <li><a href="#" onclick="change_search(5)"><span class="glyphicon glyphicon-ok no-display" id="category-exact"></span> <?php echo lang("ctn_406") ?></a></li></a></li>
              </ul>
            </div>
          </div>  
        </div>
        <div class="col-xs-1">  
          <div class="pull-right">
            <a href="<?php echo site_url("hideend/content/add_gallery") ?>" class="btn btn-primary"><?php echo lang("ctn_495") ?></a>
          </div>
        </div>
            </div>
            <!-- /.box-header -->
            <div class="box-body">
              <table id="content-table" class="table table-bordered table-hover">
                <thead>
    <tr class="table-header">
      <td><?php echo lang("ctn_191") ?></td>
      <td><?php echo lang("ctn_29") ?></td>
      <td><?php echo lang("ctn_30") ?></td>
      <td><?php echo lang("ctn_322") ?></td>
      <td><?php echo lang("ctn_194") ?></td>
      <td><?php echo lang("ctn_195") ?></td>
    </tr>
                </thead>
                <tbody>
          
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
 
