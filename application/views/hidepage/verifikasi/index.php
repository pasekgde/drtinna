<div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
        <h1>
        PSP BMN
        <small>Input Pengajuan</small>
      </h1>
        <ol class="breadcrumb">
            <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
            <li><a href="#">UI</a></li>
            <li class="active">General</li>
        </ol>
    </section>

    <!-- Main content -->
    <section class="content">
        <div class="row">
            <div class="col-md-8">
                <!-- Custom Tabs -->
                <div class="nav-tabs-custom">
                    <ul class="nav nav-tabs">
                        <li class="active"><a href="#tab_1" data-toggle="tab">Step 1</a></li>
                        <li><a href="#tab_2" data-toggle="tab">Step 2</a></li>
                        <li><a href="#tab_3" data-toggle="tab">Step 3</a></li>
                        <li><a href="#tab_4" data-toggle="tab">Step 4</a></li>
                        <li><a href="#tab_finish" data-toggle="tab">Finish Step</a></li>

                        <li class="pull-right"><a href="#" class="text-muted"><i class="fa fa-gear"></i></a></li>
                    </ul>
                    <div class="tab-content">
                        <div class="tab-pane active" id="tab_1">
                            <div class="box box-primary">
                                <div class="box-header with-border">
                                    <h3 class="box-title btn bg-maroon margin">VERIFIKATOR</h3>
                                </div>
                                <!-- /.box-header -->
                                <!-- form start -->
                                <div class="form-horizontal">
                                    <div class="box-body">
                                        <div class="form-group">
                                            <label for="exampleInputEmail1" class="col-sm-2 control-label">Nama</label>
                                            <div class="col-sm-8">
                                                <input type="name" v-model="name" class="form-control" id="inputEmail3" placeholder="Email">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="exampleInputEmail1" class="col-sm-2 control-label">NIP</label>
                                            <div class="col-sm-5">
                                                <input type="name" v-model="nip" class="form-control" id="inputEmail3" placeholder="Email">
                                            </div>
                                        </div>
                                    </div>
                                    <!-- /.box-body -->

                                </div>
                                <div class="box-header with-border">
                                    <h3 class="box-title btn bg-maroon btn-flat margin">KEPALA SEKSI</h3>
                                </div>
                                <!-- /.box-header -->
                                <!-- form start -->
                                <div class="form-horizontal">
                                    <div class="box-body">
                                        <div class="form-group">
                                            <label for="exampleInputEmail1" class="col-sm-2 control-label">Kementrian Lembaga</label>
                                            <div class="col-sm-5">
                                                <select class="form-control">
                                                    <option>Kepala Seksi PKN I</option>
                                                    <option>Kepala Seksi PKN II</option>
                                                    <option>Kepala Seksi PKN III</option>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="exampleInputEmail1" class="col-sm-2 control-label">Status Jabatan</label>
                                            <div class="col-sm-5">
                                               <button class="btn btn-outline-dark" :class="{'active':(newUser.gender == 'definitif')}" @click.prevent="pickGender('definitif')">Definitif</button>
                                                <button class="btn btn-outline-dark fa fa-venus" :class="{'active': (newUser.gender == 'plt')}" @click.prevent="pickGender('plt')"> Plt/Plh</button>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="exampleInputEmail1" class="col-sm-2 control-label">Nama Kepala Seksi</label>
                                            <div class="col-sm-5">
                                                <input type="name" v-model="nip" class="form-control" id="inputEmail3" placeholder="Email">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="exampleInputEmail1" class="col-sm-2 control-label">NIP Kepala Seksi</label>
                                            <div class="col-sm-5">
                                                <input type="name" v-model="nip" class="form-control" id="inputEmail3" placeholder="Email">
                                            </div>
                                        </div>

                                    </div>
                                    <!-- /.box-body -->

                                </div>                                
                                <div class="box-header with-border">
                                    <h3 class="box-title btn bg-maroon btn-flat margin">KEPALA BIDANG</h3>
                                </div>
                                <!-- /.box-header -->
                                <!-- form start -->
                                <div class="form-horizontal">
                                    <div class="box-body">
                                        <div class="form-group">
                                            <label for="exampleInputEmail1" class="col-sm-2 control-label">Status Kepala Bidang</label>
                                            <div class="col-sm-5">
                                               <button class="btn btn-outline-dark" :class="{'active':(newUser.gender == 'definitif')}" @click.prevent="pickGender('definitif')">Definitif</button>
                                                <button class="btn btn-outline-dark fa fa-venus" :class="{'active': (newUser.gender == 'plt')}" @click.prevent="pickGender('plt')"> Plt/Plh</button>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="exampleInputEmail1" class="col-sm-2 control-label">Nama Kepala Bidang</label>
                                            <div class="col-sm-5">
                                                <input type="name" v-model="nip" class="form-control" id="inputEmail3" placeholder="Email">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="exampleInputEmail1" class="col-sm-2 control-label">NIP Kepala Bidang</label>
                                            <div class="col-sm-5">
                                                <input type="name" v-model="nip" class="form-control" id="inputEmail3" placeholder="Email">
                                            </div>
                                        </div>

                                    </div>
                                    <!-- /.box-body -->

                                </div>

                                 <div class="box-header with-border">
                                    <h3 class="box-title btn bg-maroon btn-flat margin">KEPALA KANWIL</h3>
                                </div>
                                <!-- /.box-header -->
                                <!-- form start -->
                                <div class="form-horizontal">
                                    <div class="box-body">

                                        <div class="form-group">
                                            <label for="exampleInputEmail1" class="col-sm-2 control-label">Status Kepala Kanwil</label>
                                            <div class="col-sm-5">
                                               <button class="btn btn-outline-dark" :class="{'active':(newUser.gender == 'definitif')}" @click.prevent="pickGender('definitif')">Definitif</button>
                                                <button class="btn btn-outline-dark fa fa-venus" :class="{'active': (newUser.gender == 'plt')}" @click.prevent="pickGender('plt')"> Plt/Plh</button>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="exampleInputEmail1" class="col-sm-2 control-label">Nama Kepala Kanwil</label>
                                            <div class="col-sm-5">
                                                <input type="name" v-model="nip" class="form-control" id="inputEmail3" placeholder="Email">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="exampleInputEmail1" class="col-sm-2 control-label">NIP Kepala Kanwil</label>
                                            <div class="col-sm-5">
                                                <input type="name" v-model="nip" class="form-control" id="inputEmail3" placeholder="Email">
                                            </div>
                                        </div>

                                    </div>
                                    <!-- /.box-body -->

                                    <div class="box-footer">
                                        <button type="submit" class="btn btn-primary">Save</button>
                                        <button type="submit" class="btn btn-warning pull-right">Save & Next</button>
                                    </div>
                                </div>

                            </div>
                        </div>
                        <!-- /.tab-pane -->
                        <div class="tab-pane" id="tab_2">
                            <div class="box box-primary">
                                 <div class="box-header with-border">
                                    <h3 class="box-title btn bg-maroon btn-flat margin">PENGECEKAN DOKUMEN</h3>
                                </div>
                                <!-- /.box-header -->
                                <!-- form start -->
                                <div class="form-horizontal">
                                    <div class="box-body">
                                        <b>Keterangan:</b>
                                        <p>Silakan downloan terlebih dahulu dokumen-dokumen dibawah ini.</p>
                                        <div class="form-group">
                                            <div class="col-sm-4">
                                                <a class="btn btn-block btn-social btn-bitbucket">
                                                    <i class="fa fa-bitbucket"></i> Download Surat Permohonan
                                                </a>
                                            </div>
                                            <div class="col-sm-4">
                                                <a class="btn btn-block btn-social btn-bitbucket">
                                                    <i class="fa fa-bitbucket"></i> Download  Daftar Rician BMN 
                                                </a>
                                            </div>
                                            <div class="col-sm-4">
                                                <a class="btn btn-block btn-social btn-bitbucket">
                                                    <i class="fa fa-bitbucket"></i> Download Kelengkapan 
                                                </a>
                                            </div>
                                        </div>

                                    </div>
                                    <!-- /.box-body -->

                                    <div class="box-footer">
                                        <button type="submit" class="btn btn-warning pull-right col-sm-2">Next</button>
                                    </div>
                                </div>

                            </div>
                         

                        </div>
                        <!-- /.tab-pane -->
                        <div class="tab-pane" id="tab_3">
                            <div class="box box-primary">
                                <div class="box-header with-border">
                                    <h3 class="box-title btn bg-maroon btn-flat margin">DOKUMEN PERMOHONAN</h3>
                                </div>
                                <!-- /.box-header -->
                                <!-- form start -->
                                <div class="form-horizontal">
                                    <div class="box-body">
                                        <div class="form-group">
                                            <label for="exampleInputEmail1" class="col-sm-3 control-label">Identitas & Jenis BMN</label>
                                            <div class="col-sm-5">
                                               <button class="btn btn-outline-dark" :class="{'active':(newUser.gender == 'definitif')}" @click.prevent="pickGender('definitif')">Sesuai</button>
                                                <button class="btn btn-outline-dark" :class="{'active': (newUser.gender == 'plt')}" @click.prevent="pickGender('plt')">Tidak Sesuai</button>
                                                <button class="btn btn-outline-dark" :class="{'active': (newUser.gender == 'plt')}" @click.prevent="pickGender('plt')">Tidak Ada</button>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="exampleInputEmail1" class="col-sm-3 control-label">Nilai BMN</label>
                                            <div class="col-sm-5">
                                               <button class="btn btn-outline-dark" :class="{'active':(newUser.gender == 'definitif')}" @click.prevent="pickGender('definitif')">Sesuai</button>
                                                <button class="btn btn-outline-dark" :class="{'active': (newUser.gender == 'plt')}" @click.prevent="pickGender('plt')">Tidak Sesuai</button>
                                                <button class="btn btn-outline-dark" :class="{'active': (newUser.gender == 'plt')}" @click.prevent="pickGender('plt')">Tidak Ada</button>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="exampleInputEmail1" class="col-sm-3 control-label">Surat Permohonan</label>
                                            <div class="col-sm-5">
                                               <button class="btn btn-outline-dark" :class="{'active':(newUser.gender == 'definitif')}" @click.prevent="pickGender('definitif')">Sesuai</button>
                                                <button class="btn btn-outline-dark" :class="{'active': (newUser.gender == 'plt')}" @click.prevent="pickGender('plt')">Tidak Sesuai</button>
                                                <button class="btn btn-outline-dark" :class="{'active': (newUser.gender == 'plt')}" @click.prevent="pickGender('plt')">Tidak Ada</button>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="exampleInputEmail1" class="col-sm-3 control-label">Daftar Rincian Usulan BMN</label>
                                            <div class="col-sm-5">
                                               <button class="btn btn-outline-dark" :class="{'active':(newUser.gender == 'definitif')}" @click.prevent="pickGender('definitif')">Sesuai</button>
                                                <button class="btn btn-outline-dark" :class="{'active': (newUser.gender == 'plt')}" @click.prevent="pickGender('plt')">Tidak Sesuai</button>
                                                <button class="btn btn-outline-dark" :class="{'active': (newUser.gender == 'plt')}" @click.prevent="pickGender('plt')">Tidak Ada</button>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="exampleInputEmail1" class="col-sm-3 control-label">KIB</label>
                                            <div class="col-sm-5">
                                               <button class="btn btn-outline-dark" :class="{'active':(newUser.gender == 'definitif')}" @click.prevent="pickGender('definitif')">Sesuai</button>
                                                <button class="btn btn-outline-dark" :class="{'active': (newUser.gender == 'plt')}" @click.prevent="pickGender('plt')">Tidak Sesuai</button>
                                                <button class="btn btn-outline-dark" :class="{'active': (newUser.gender == 'plt')}" @click.prevent="pickGender('plt')">Tidak Ada</button>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="exampleInputEmail1" class="col-sm-3 control-label">Foto BMN</label>
                                            <div class="col-sm-5">
                                               <button class="btn btn-outline-dark" :class="{'active':(newUser.gender == 'definitif')}" @click.prevent="pickGender('definitif')">Sesuai</button>
                                                <button class="btn btn-outline-dark" :class="{'active': (newUser.gender == 'plt')}" @click.prevent="pickGender('plt')">Tidak Sesuai</button>
                                                <button class="btn btn-outline-dark" :class="{'active': (newUser.gender == 'plt')}" @click.prevent="pickGender('plt')">Tidak Ada</button>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="exampleInputEmail1" class="col-sm-3 control-label">Fotocopy Surat Keputusan tentang Pendelegasian Wewenang</label>
                                            <div class="col-sm-5">
                                               <button class="btn btn-outline-dark" :class="{'active':(newUser.gender == 'definitif')}" @click.prevent="pickGender('definitif')">Sesuai</button>
                                                <button class="btn btn-outline-dark" :class="{'active': (newUser.gender == 'plt')}" @click.prevent="pickGender('plt')">Tidak Sesuai</button>
                                                <button class="btn btn-outline-dark" :class="{'active': (newUser.gender == 'plt')}" @click.prevent="pickGender('plt')">Tidak Ada</button>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="exampleInputEmail1" class="col-sm-3 control-label">Dokumen Kepemilikan</label>
                                            <div class="col-sm-5">
                                               <button class="btn btn-outline-dark" :class="{'active':(newUser.gender == 'definitif')}" @click.prevent="pickGender('definitif')">Ada</button>
                                                <button class="btn btn-outline-dark" :class="{'active': (newUser.gender == 'plt')}" @click.prevent="pickGender('plt')">Tidak Ada</button>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="exampleInputEmail1" class="col-sm-3 control-label">Fotocopy Dokumen Kepemilikan(Sertifikat, STNK, BAST dll)</label>
                                            <div class="col-sm-5">
                                               <button class="btn btn-outline-dark" :class="{'active':(newUser.gender == 'definitif')}" @click.prevent="pickGender('definitif')">Sesuai</button>
                                                <button class="btn btn-outline-dark" :class="{'active': (newUser.gender == 'plt')}" @click.prevent="pickGender('plt')">Tidak Sesuai</button>
                                                <button class="btn btn-outline-dark" :class="{'active': (newUser.gender == 'plt')}" @click.prevent="pickGender('plt')">Tidak Ada</button>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="exampleInputEmail1" class="col-sm-3 control-label">Surat keterangan pejabat struktural menyatakan kebenaran fotokopi dokumen kepemilikan </label>
                                            <div class="col-sm-5">
                                               <button class="btn btn-outline-dark" :class="{'active':(newUser.gender == 'definitif')}" @click.prevent="pickGender('definitif')">Sesuai</button>
                                                <button class="btn btn-outline-dark" :class="{'active': (newUser.gender == 'plt')}" @click.prevent="pickGender('plt')">Tidak Sesuai</button>
                                                <button class="btn btn-outline-dark" :class="{'active': (newUser.gender == 'plt')}" @click.prevent="pickGender('plt')">Tidak Ada</button>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="exampleInputEmail1" class="col-sm-3 control-label">SPTJM bermaterai bahwa barang tersebut adalah BMN dan digunakan untuk tugas dan fungsi </label>
                                            <div class="col-sm-5">
                                               <button class="btn btn-outline-dark" :class="{'active':(newUser.gender == 'definitif')}" @click.prevent="pickGender('definitif')">Sesuai</button>
                                                <button class="btn btn-outline-dark" :class="{'active': (newUser.gender == 'plt')}" @click.prevent="pickGender('plt')">Tidak Sesuai</button>
                                                <button class="btn btn-outline-dark" :class="{'active': (newUser.gender == 'plt')}" @click.prevent="pickGender('plt')">Tidak Ada</button>
                                            </div>
                                        </div>

                                    </div>
                                    <!-- /.box-body -->

                                </div>

                                <div class="box-footer">
                                    <button type="submit" class="btn btn-primary">Save</button>
                                    <button type="submit" class="btn btn-warning pull-right">Save & Next</button>
                                </div>
                            </div>

                        </div>

                        <!-- /.tab-pane -->
                        <div class="tab-pane" id="tab_4">
                            <div class="box box-primary">
                                 <div class="box-header with-border">
                                    <h3 class="box-title btn bg-maroon btn-flat margin">PENGECEKAN DOKUMEN</h3>
                                </div>
                                <!-- /.box-header -->
                                <!-- form start -->
                                <div class="form-horizontal">
                                    <div class="box-body">
                                        <b>Keterangan:</b>
                                        <p>Silakan downloan terlebih dahulu dokumen-dokumen dibawah ini.</p>
                                        <div class="form-group">
                                            <div class="col-sm-4">
                                                <a class="btn btn-block btn-social btn-bitbucket">
                                                    <i class="fa fa-bitbucket"></i> Download Surat Permohonan
                                                </a>
                                            </div>
                                            <div class="col-sm-4">
                                                <a class="btn btn-block btn-social btn-bitbucket">
                                                    <i class="fa fa-bitbucket"></i> Download  Daftar Rician BMN 
                                                </a>
                                            </div>
                                            <div class="col-sm-4">
                                                <a class="btn btn-block btn-social btn-bitbucket">
                                                    <i class="fa fa-bitbucket"></i> Download Kelengkapan 
                                                </a>
                                            </div>
                                        </div>

                                    </div>
                                    <!-- /.box-body -->

                                    <div class="box-footer">
                                        <button type="submit" class="btn btn-warning pull-right col-sm-2">Next</button>
                                    </div>
                                </div>

                            </div>
                         

                        </div>
                        <div class="tab-pane" id="tab_finish">
                          <div class="callout callout-success">
                            <h4>Terima Kasih</h4>
                            <h4>Permohonan Pengajuan PSP BMN anda telah dikirimkan.</h4>
                            <p>Kami akan segera memproses permohonan Anda.</p>
                          </div>
                          <button type="submit" class="btn btn-warning">Kembali Ke Dashboard!</button>

                        </div>
                    </div>
                    <!-- /.tab-pane -->
                </div>
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