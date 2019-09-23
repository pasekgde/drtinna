Content Wrapper. Contains page content -->
<div class="content-wrapper" id="app">

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
    <section class="content" id="tableVerifikasi" v-if="showVerifikasiWizardTable">
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
                                    <input type="text" class="form-control" placeholder="Search" id="form-search-input">
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
                                            <li>
                                                <a href="#" onclick="change_search(5)">
                                                    <span class="glyphicon glyphicon-ok no-display" id="category-exact"></span>
                                                    <?php echo lang("ctn_406") ?>
                                                </a>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xs-1">
                                <div class="pull-right">
                                    <a href="<?php echo site_url(" hideend/content/add_gallery ") ?>" class="btn btn-primary">
                                        <?php echo lang("ctn_495") ?>
                                    </a>
                                </div>
                            </div>
                        </div>
                        
                        <table-verifikasi-pspbmn 
                            ref="form" 
                            v-on:send-data="getDataChoosePengajuan"
                            v-on:send-jenisform="getJenisForm"
                            v-on:show-hasil="showHasilForm"
                        />   
                        <!-- /.box-header -->
                        
                        
                        
                        <!-- /.box-body -->

                    </div>
                    <!-- /.box -->
                </div>
            </section>
            <!-- /.Left col -->
            <!-- right col (We are only adding the ID to make the widgets sortable)-->
        </div>
        <!-- /.row (main row) -->

    </section>
    <!-- /.content -->
    <section class="content" id="formWizardVerifikasi" v-if="showVerifikasiWizardForm">

        <div class="row">
            <div v-if="isShowFormKPKNL">
                <!-- Custom Tabs -->
                <verifikasi-pspbmn-kpknl 
                        :jenisform="jenisForm"
                        :tipepengajuan="jenisProses" 
                        :datapengajuan="choosePengajuan"                        
                        v-on:send-data="finishProsesVerifikasi"> 
                </verifikasi-pspbmn-kpknl>

                <!-- /.tab-content -->
            </div>
            <div v-if="isShowFormKANWIL">
                <!-- Custom Tabs -->
                
                <verifikasi-pspbmn-kanwil 
                        :jenisform="jenisForm"
                        :tipepengajuan="jenisProses" 
                        :datapengajuan="choosePengajuan"
                        v-on:send-data="finishProsesVerifikasi"> 
                </verifikasi-pspbmn-kanwil>

                <!-- /.tab-content -->
            </div>


            <!-- nav-tabs-custom -->
        </div>
        <!-- /.col -->
    </section>  
    <!-- Hasil Verifikasi -->  
    <section class="content" id="formWizardVerifikasiHASIL" v-if="showWizardFormHASIL">

        <div class="row">
            <div class="col-md-8">
                <!-- Custom Tabs -->
                <hasil-pspbmn
                        :jenisform="jenisForm"
                        :tipepengajuan="jenisProses" 
                        :datapengajuan="choosePengajuan"                        
                        v-on:hide-form="finishProsesUploadHasil"> 
                </hasil-pspbmn>

                <!-- /.tab-content -->
            </div>

            <div class="col-md-4">
                <div class="box box-default">
                    <div class="box-header with-border">
                        <i class="fa fa-bullhorn"></i>

                        <h3 class="box-title">Pengumuman</h3>
                    </div>
                    <!-- /.box-header -->
                    <div class="box-body">
                        <div class="callout callout-danger">
                            <h4>I am a danger callout!</h4>

                            <p>There is a problem that we need to fix. A wonderful serenity has taken possession of my entire soul, like these sweet mornings of spring which I enjoy with my whole heart.</p>
                        </div>
                        <div class="callout callout-info">
                            <h4>I am an info callout!</h4>

                            <p>Follow the steps to continue to payment.</p>
                        </div>
                        <div class="callout callout-warning">
                            <h4>I am a warning callout!</h4>

                            <p>This is a yellow callout.</p>
                        </div>
                        <div class="callout callout-success">
                            <h4>I am a success callout!</h4>

                            <p>This is a green callout.</p>
                        </div>
                    </div>
                    <!-- /.box-body -->
                </div>
                <!-- /.box -->
            </div>
            <!-- nav-tabs-custom -->
        </div>
        <!-- /.col -->
    </section>

</div>
<!-- /.content-wrapper