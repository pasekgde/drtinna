<!-- Content Wrapper. Contains page content -->
<div class="content-wrapper" id="app" >
  
  <!-- Content Header (Page header) -->
  <section class="content-header">
    <h1>
        Dashboard
        
      <small>Control panel</small>
    </h1>
    <ol class="breadcrumb">
      <li>
        <a href="#">
          <i class="fa fa-dashboard"></i> Home
        </a>
      </li>
      <li class="active">Dashboard</li>
    </ol>
  </section>
  <!-- Main content -->
  <section class="content" >
    <!-- /.row -->
    <!-- Main row -->
    <div class="row">
      <!-- Left col -->
      <section class="col-lg-12">
        <!-- Custom tabs (Charts with tabs)-->
        <div class="nav-tabs-custom">
          <!-- Tabs within a box -->
          <!-- quick email widget -->
          <div class="box box-info">
            <div class="box-header">
              <div class="col-xs-4">
                <h3 class="box-title">Pemantauan Status Pengajuan PSP BMN</h3>
              </div>
              <div class="col-xs-7">
                <div class="input-group">
                  <input type="text" class="form-control" placeholder="Search" id="form-search-input" >
                    <div class="input-group-btn">
                      <input type="hidden" id="search_type" value="0">
                        <button type="button" class="btn btn-info dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                          <span class="glyphicon glyphicon-search" aria-hidden="true"></span>
                        </button>
                        <ul class="dropdown-menu small-text" style="min-width: 90px !important; left: -90px;">
                          <li>
                            <a href="#" onclick="change_search(0)">
                              <span class="glyphicon glyphicon-ok" id="search-like"></span>
                              <?php echo lang("ctn_337") ?>
                            </a>
                          </li>
                          <li>
                            <a href="#" onclick="change_search(1)">
                              <span class="glyphicon glyphicon-ok no-display" id="search-exact"></span>
                              <?php echo lang("ctn_338") ?>
                            </a>
                          </li>
                          <li>
                            <a href="#" onclick="change_search(2)">
                              <span class="glyphicon glyphicon-ok no-display" id="user-exact"></span>
                              <?php echo lang("ctn_339") ?>
                            </a>
                          </li>
                          <li>
                            <a href="#" onclick="change_search(3)">
                              <span class="glyphicon glyphicon-ok no-display" id="title-exact"></span>
                              <?php echo lang("ctn_401") ?>
                            </a>
                          </li>
                          <li>
                            <a href="#" onclick="change_search(4)">
                              <span class="glyphicon glyphicon-ok no-display" id="summary-exact"></span>
                              <?php echo lang("ctn_402") ?>
                            </a>
                          </li>
                        </a>
                      </li>
                      <li>
                        <a href="#" onclick="change_search(5)">
                          <span class="glyphicon glyphicon-ok no-display" id="category-exact"></span>
                          <?php echo lang("ctn_406") ?>
                        </a>
                      </li>
                    </a>
                  </li>
                </ul>
              </div>
            </div>
          </div>
          <div class="col-xs-1">
            <div class="pull-right">
              <a href="
                <?php echo site_url("hideend/content/add_gallery") ?>" class="btn btn-primary">
                <?php echo lang("ctn_495") ?>
              </a>
            </div>
          </div>
        </div>
        <!-- /.box-header -->
        <div class="box-body" >
          <table class="table is-bordered is-hoverable">
            <thead class="text-white bg-dark" >
              <th class="text-white">No.</th>
              <th class="text-white">Tanggal Surat</th>
              <th class="text-white">Tanggal Input Permohonan</th>
              <th class="text-white">Kementrian Lembaga</th>
              <th class="text-white">Satuan Kerja</th>
              <th class="text-white">Tindak Lanjut</th>
              <tbody class="table-light">
                <tr v-for="trade in trades" class="table-default">
                  <td>{{trade.symbol}}</td>
                  <td>{{trade.type}}</td>
                  <td>{{trade.price}}</td>
                  <td>{{trade.price}}</td>
                  <td>{{trade.price}}</td>
                  <td><button type="button" class="btn btn-flat" data-toggle="modal" data-target="#modal-warning" :class="{'bg-maroon':!parseInt(trade.stat_target1)}" :disabled="(parseInt(trade.stat_target1))?true:false" style="width: 60px!important" @click="tpModal=true;selectTrade(trade);selectTpButton(1);" >
                {{trade.target1}}</button>
                   </td>
                </tr>
                <tr v-if="emptyResult">
                  <td colspan="9" rowspan="4" class="text-center h1">No Record Found</td>
                </tr>
              </tbody>
            </table>
        </div>
         <div class="modal fade" id="modal-success2">
          <div class="modal-dialog">
            <div class="modal-content">
              <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                  <span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">Default Modal</h4>
              </div>
              <div class="modal-body">
                <p>One fine body&hellip;</p>
              </div>
              <div class="modal-footer">
                <button type="button" class="btn btn-default pull-left" data-dismiss="modal">Close</button>
                <button type="button" class="btn btn-primary">Save changes</button>
              </div>
            </div>
            <!-- /.modal-content -->
          </div>
          <!-- /.modal-dialog -->
        </div>
        <!-- /.modal -->
          <pagination
          :current_page="currentPage"
          :row_count_page="rowCountPage"
           @page-update="pageUpdate"
           :total_users="totalTrades"
           :page_range="pageRange"
           ></pagination>
          <!-- /.box-body -->
        </div>
        <!-- /.box -->
      </section>
      <?php include 'modal.php';?>
      <!-- /.Left col -->
      <!-- right col (We are only adding the ID to make the widgets sortable)-->
    </div>
    <!-- /.row (main row) -->
   
  </section>
  <!-- /.content -->
  
</div>
<!-- /.content-wrapper -->
