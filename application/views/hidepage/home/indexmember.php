<!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
        Dashboard
        <small>Control panel</small>
      </h1>
      <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
        <li class="active">Dashboard</li>
      </ol>
    </section>

    <!-- Main content -->
    <section class="content">
      <!-- Small boxes (Stat box) -->
      <div class="row">
        <div class="col-lg-3 col-xs-6">
          <!-- small box -->
          <div class="small-box bg-aqua">
            <div class="inner">
              <h3><?php echo number_format($stats->total_members) ?></h3>

              <p><?php echo lang("ctn_136") ?></p>
            </div>
            <div class="icon">
              <i class="ion ion-bag"></i>
            </div>
            <a href="#" class="small-box-footer">More info <i class="fa fa-arrow-circle-right"></i></a>
          </div>
        </div>
        <!-- ./col -->
        <div class="col-lg-3 col-xs-6">
          <!-- small box -->
          <div class="small-box bg-green">
            <div class="inner">
              <h3><?php echo number_format($stats->new_members) ?><sup style="font-size: 20px">%</sup></h3>

              <p><?php echo lang("ctn_137") ?></p>
            </div>
            <div class="icon">
              <i class="ion ion-stats-bars"></i>
            </div>
            <a href="#" class="small-box-footer">More info <i class="fa fa-arrow-circle-right"></i></a>
          </div>
        </div>
        <!-- ./col -->
        <div class="col-lg-3 col-xs-6">
          <!-- small box -->
          <div class="small-box bg-yellow">
            <div class="inner">
              <h3><?php echo number_format($stats->active_today) ?></h3>

              <p><?php echo lang("ctn_138") ?></p>
            </div>
            <div class="icon">
              <i class="ion ion-person-add"></i>
            </div>
            <a href="#" class="small-box-footer">More info <i class="fa fa-arrow-circle-right"></i></a>
          </div>
        </div>
        <!-- ./col -->
        <div class="col-lg-3 col-xs-6">
          <!-- small box -->
          <div class="small-box bg-red">
            <div class="inner">
              <h3><?php echo number_format($online_count) ?></h3>

              <p><?php echo lang("ctn_139") ?></p>
            </div>
            <div class="icon">
              <i class="ion ion-pie-graph"></i>
            </div>
            <a href="#" class="small-box-footer">More info <i class="fa fa-arrow-circle-right"></i></a>
          </div>
        </div>
        <!-- ./col -->
      </div>
      <!-- /.row -->
      <!-- Main row -->
      <div class="row">
        <!-- Left col -->
                  
      </div>

      <div class="row">
        <!-- Left col -->
        <section class="col-lg-12">
          <!-- Custom tabs (Charts with tabs)-->
          <div class="nav-tabs-custom">
            <!-- Tabs within a box -->
            <div id="containerChart" style="height: 400px; min-width: 310px"></div>
            
          </div>
          <!-- /.nav-tabs-custom -->


      

          <!-- quick email widget -->
          <div class="box box-info">
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
                      <td><?php echo ("Symbol") ?></td>
                      <td><?php echo ("Type") ?></td>
                      <td><?php echo ("Price") ?></td>
                      <td><?php echo ("Stoploss") ?></td>
                      <td><?php echo ("Target 1") ?></td>
                      <td><?php echo ("Target 2") ?></td>
                      <td><?php echo ("Target 3") ?></td>
                      <td><?php echo ("Pips") ?></td>
                      <td><?php echo ("Opendate") ?></td>
                      <td><?php echo ("Closedate") ?></td>
                    </tr>
                </thead>
                <tbody>
          
                </tbody>
                
              </table>
            </div>
            <!-- /.box-body -->
          </div>
          <!-- /.box -->
        </section>
        <!-- /.Left col -->
        <!-- right col (We are only adding the ID to make the widgets sortable)-->
        
      </div>
      <!-- /.row (main row) -->

    </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->