<script type="text/x-template" id="pspPengajuanWizardForm">
    <div>
                <div class="nav-tabs-custom">
                    <form-wizard :ref="'vuewizard'">
                        <wizard-step slot-scope="props" slot="step" :tab="props.tab" :transition="props.transition" :index="props.index">
                        </wizard-step>
                        <h3 slot="title"></h3>
                        <tab-content title="Inital Input" icon="fa fa-user" :before-change="beforeTab1Switch">
                                                        <div class="box box-primary">

                                <div class="box-header with-border">
                                    <h3 class="box-title btn bg-maroon margin">IDENTITAS PETUGAS</h3>
                                </div>
                                <div class="form-horizontal">
                                    <div class="box-body">
                                        <div class="form-group">
                                            <label for="exampleInputEmail1" class="col-sm-2 control-label">Nama Petugas</label>
                                            <div class="col-sm-8">
                                                <input type="text" class="form-control" placeholder="Nama" v-validate="'required'" name="nama_petugas" v-model="pengajuan.nama_petugas" data-vv-scope="step1">
                                                <span class="text-red">{{ errors.first('step1.nama_petugas') }}</span>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="exampleInputEmail1" class="col-sm-2 control-label">NIP Petugas</label>
                                            <div class="col-sm-5">
                                                <input type="text" class="form-control"  placeholder="Nomor Induk Pegawai" v-validate="'required'" name="nip_petugas" v-model="pengajuan.nip_petugas" data-vv-scope="step1">
                                                <span class="text-red">{{ errors.first('step1.nip_petugas') }}</span>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="exampleInputEmail1" class="col-sm-2 control-label">Jabatan Petugas</label>
                                            <div class="col-sm-5">
                                                <input type="jabatan" class="form-control"  placeholder="Jabatan Petugas" v-validate="'required'" name="jabatan_petugas" v-model="pengajuan.jabatan_petugas" data-vv-scope="step1">
                                                <span class="text-red">{{ errors.first('step1.jabatan_petugas') }}</span>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="exampleInputEmail1" class="col-sm-2 control-label">No. Hp.</label>
                                            <div class="col-sm-5">
                                                <the-mask type="text" mask="(+62)################" class="form-control" v-validate="'required'" name="kontak_petugas" v-model="pengajuan.kontak_petugas" placeholder="Kontak Petugas" data-vv-scope="step1"> </the-mask>
                                                <span class="text-red">{{ errors.first('step1.kontak_petugas') }}</span>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="exampleInputEmail1" class="col-sm-2 control-label">Email</label>
                                            <div class="col-sm-8">
                                                <input type="email" class="form-control"  placeholder="Email Petugas" v-validate="{ required: true, regex:/^(([^<>()\[\]\\.,;:\s@']+(\.[^<>()\[\]\\.,;:\s@']+)*)|('.+'))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/ }" name="email_petugas" v-model="pengajuan.email_petugas" data-vv-scope="step1">
                                                <span class="text-red">{{ errors.first('step1.email_petugas') }}</span>
                                            </div>
                                        </div>

                                    </div>
                                    <!-- /.box-body -->

                                </div>
                                                                <div class="box-header with-border">
                                    <h3 class="box-title btn bg-maroon btn-flat margin">IDENTITAS SATKER</h3>
                                </div>
                                <!-- /.box-header -->
                                <!-- form start -->
                                <div class="form-horizontal">
                                    <div class="box-body">
                                        <div class="form-group">
                                            <label for="exampleInputEmail1" class="col-sm-2 control-label">Kementerian Lembaga</label>
                                            <div class="col-sm-8">
                                                <vue-multiselect 
                                                    v-model="pengajuan.kementerian_lembaga" 
                                                    :options="option_kementerian_lembaga" 
                                                    :custom-label="name_kementerian_lembaga" 
                                                    placeholder="Select one" 
                                                    label="name" 
                                                    track-by="nama_KL" 
                                                    v-validate data-vv-rules="required" 
                                                    name="KementerianLembaga">
                                                </vue-multiselect>
                                                <span class="text-red">{{ errors.first('step1.KementerianLembaga') }}</span>

                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="exampleInputEmail1" class="col-sm-2 control-label">Alamat Kantor</label>
                                            <div class="col-sm-5">
                                                <input type="name" class="form-control" id="inputEmail3" placeholder="Alamat Kementerian Lembaga " v-validate="'required'" name="KantorKL" v-model="pengajuan.alamat_kantorKL">
                                                <span class="text-red">{{ errors.first('step1.KantorKL') }}</span>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="exampleInputEmail1" class="col-sm-2 control-label">Nama Satker</label>
                                            <div class="col-sm-5">
                                                <input type="name" class="form-control" id="inputEmail3" placeholder="Nama Satuan Kerja" v-validate="'required'" name="satuan_kerja" v-model="pengajuan.satuan_kerja">
                                                <span class="text-red">{{ errors.first('step1.satuan_kerja') }}</span>
                                            </div>
                                        </div>

                                    </div>
                                    <!-- /.box-body -->

                                </div>


                                <div class="box-header with-border">
                                    <h3 class="box-title btn bg-maroon btn-flat margin">PENGAJUAN BMN</h3>
                                </div>
                                <div class="form-horizontal">
                                    <div class="box-body">
                                        <div class="form-group">
                                            <label for="exampleInputEmail1" class="col-sm-2 control-label">Jenis BMN</label>
                                            <div class="col-sm-5">
                                                <vue-multiselect 
                                                    :allow-empty="false" 
                                                    v-model="pengajuan.jenis_bmn" 
                                                    :options="option_jenis_bmn" 
                                                    :custom-label="nameJenisBMN" 
                                                    placeholder="Pilih Jenis BMN" 
                                                    label="name" track-by="name" 
                                                    v-validate data-vv-rules="required" 
                                                    name="JenisBMN"
                                                    data-vv-scope="step1"

                                                    >
                                                </vue-multiselect>

                                                <span class="text-red">{{ errors.first('step1.JenisBMN') }}</span>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="exampleInputEmail1" class="col-sm-2 control-label">Total Nilai Perolehan</label>
                                            <div class="col-sm-5">
                                                <money  type="text" v-bind="money" class="form-control" v-validate="'required|numeric|min_value:100000'" name="totalnilai_bmn" v-model="pengajuan.totalnilai_bmn" placeholder="Total Nilai (Rp.)" data-vv-scope="step1"> </money>
                                                <span class="text-red">{{ errors.first('step1.totalnilai_bmn') }}</span>
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <label for="exampleInputEmail1" class="col-sm-2 control-label">Lokasi PSPBMN (Provinsi)</label>
                                            <div class="col-sm-5">
                                                <vue-multiselect
                                                    :allow-empty="false"  
                                                    v-model="pengajuan.provinsi" 
                                                    :options="option_provinsi" 
                                                    :custom-label="name_provinsi" 
                                                    placeholder="Pilih Provinsi" 
                                                    label="provinsi" 
                                                    track-by="provinsi" 
                                                    @input="showKabupaten=true;getKabupaten(pengajuan.provinsi);pengajuan.kabupaten=null"
                                                    v-validate data-vv-rules="required" 
                                                    name="lokasiProvinsi" 
                                                    data-vv-scope="step1">
                                                </vue-multiselect>

                                                <span class="text-red">{{ errors.first('step1.lokasiProvinsi') }}</span>
                                            </div>
                                        </div>

                                        <div class="form-group" v-if="true">
                                            <label for="exampleInputEmail1" class="col-sm-2 control-label">Lokasi PSPBMN (Kabupaten)</label>
                                            <div class="col-sm-5">
                                                <vue-multiselect 
                                                    v-model="pengajuan.kabupaten" 
                                                    :options="option_kabupaten" 
                                                    :custom-label="name_kabupaten" 
                                                    placeholder="Pilih Kabupaten" 
                                                    label="kabupaten" 
                                                    track-by="name" 
                                                    v-validate 
                                                    data-vv-rules="required" 
                                                    name="lokasiKabupaten"
                                                    data-vv-scope="step1">
                                                </vue-multiselect>

                                                <span class="text-red">{{ errors.first('step1.lokasiKabupaten') }}</span>
                                            </div>
                                        </div>

                                    </div>

                                </div>

                            </div>
                        </tab-content>
                                                
                        <tab-content title="Proses PSPBMN" icon="fa fa-certificate">
                            <div class="callout callout-warning" v-if="notif100M">
                                <h4>Silahkan ajukan Permohonan anda kepada </h4>
                                <h1>Direktorat Jenderal Kekayaan Negara</h1>
                                <div class="row">
                                    <label class="col-sm-1">Kepada</label>
                                    <label class="col-sm-8">Dirjen Kekayaan Negara</label>
                                </div>
                                <div class="row">
                                    <label class="col-sm-1">Alamat</label>
                                    <label class="col-sm-8">Kementerian Keuangan, Gedung Syafrudin Prawiranegara II Lantai. Jalan Lapangan Banteng No. 2-4, Ps. Baru, Kec. Sawah Besar, Kota Jakarta Pusat, Daerah Khusus Ibukota Jakarta 10710</label>
                                </div>
                                <div class="row">
                                    <label class="col-sm-1">Telepon</label>
                                    <label class="col-sm-8">(021) 1500 991</label>
                                </div>
                            </div>

                            <div class="callout callout-info" v-if="notif75M">
                                <h4>Silahkan ajukan Permohonan anda kepada </h4>
                                <h1>Direktorat Pengelolaan Kekayaan Negara dan Sistem Informasi</h1>
                                <div class="row">
                                    <label class="col-sm-1">Kepada</label>
                                    <label class="col-sm-8">Direktur PKNSI</label>
                                </div>
                                <div class="row">
                                    <label class="col-sm-1">Alamat</label>
                                    <label class="col-sm-8">DJKN, Kementerian Keuangan. Gedung Syafrudin Prawiranegara II Lantai, Jalan Lapangan Banteng No. 2-4, Ps. Baru, Kec. Sawah Besar, Kota Jakarta Pusat, Daerah Khusus Ibukota Jakarta 10710</label>
                                </div>
                                <div class="row">
                                    <label class="col-sm-1">Telepon</label>
                                    <label class="col-sm-8">(021) 1500 991</label>
                                </div>
                            </div>

                            <div class="callout callout-success" v-if="notifProses">
                                <h4>Permohanan anda akan di proses oleh</h4>
                                <h1>{{areaProsesText}}</h1>
                                <p>Silakan klik tombol SAVE & NEXT dibawah ini!</p>
                            </div>
                        </tab-content>

                        <tab-content title="Input Dokumen" icon="fa fa-envelope-o" v-if="isShowOtherTabDJKN" :before-change="beforeTab2Switch">

                            <div class="box box-primary">
                                <div class="box-header with-border">
                                    <h3 class="box-title btn bg-maroon btn-flat margin">DOKUMEN PERMOHONAN</h3>
                                </div>
                                <!-- /.box-header -->
                                <!-- form start -->
                                <div class="form-horizontal">
                                    <div class="box-body">
                                        <div class="form-group">
                                            <label for="exampleInputEmail1" class="col-sm-2 control-label">Jabatan Pemohon</label>
                                            <div class="col-sm-8">
                                                <input type="name" class="form-control"  placeholder="Mis. Kepala Kantor, Direktur, Panglima" v-validate="'required'" name="jabatan_pemohon" v-model="pengajuan.jabatan_pemohon" data-vv-scope="step2">
                                                <span class="text-red">{{ errors.first('step2.jabatan_pemohon') }}</span>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="exampleInputEmail1" class="col-sm-2 control-label">Nomor Surat Permohonan</label>
                                            <div class="col-sm-5">
                                                <input type="name" class="form-control"  placeholder="Nomor Surat Pemohon" v-validate="'required'" name="noSurat_pemohon" v-model="pengajuan.noSurat_pemohon" data-vv-scope="step2">
                                                <span class="text-red">{{ errors.first('step2.noSurat_pemohon') }}</span>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="exampleInputEmail1" class="col-sm-2 control-label">Tanggal Surat Permohonan</label>
                                            <div class="col-sm-5">
                                                <input type="jabatan" id="datepicker-input-trigger" :value="formatDates(pengajuan.tglSurat_pemohon)" class="form-control"  placeholder="Tanggal Surat" v-validate="'required'" name="tglSurat_pemohon" data-vv-scope="step2" />
                                                <airbnb-style-datepicker style="left:0!important" :trigger-element-id="'datepicker-input-trigger'" :mode="'single'" :date-one="pengajuan.tglSurat_pemohon" v-on:date-one-selected="function(val) { pengajuan.tglSurat_pemohon = val }" :months-to-show="1"
                                                    v-on:closed="onClosed" v-on:previous-month="onMonthChange" v-on:next-month="onMonthChange">
                                                </airbnb-style-datepicker>

                                                <span class="text-red">{{ errors.first('step2.tglSurat_pemohon') }}</span>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="exampleInputEmail1" class="col-sm-2 control-label">Perihal Surat Permohonan</label>
                                            <div class="col-sm-10">
                                                <input type="nohape" class="form-control"  placeholder="Perihal Surat Permohonan" v-validate="'required'" name="perihalSurat_pemohon" v-model="pengajuan.perihalSurat_pemohon" data-vv-scope="step2">
                                                <span class="text-red">{{ errors.first('step2.perihalSurat_pemohon') }}</span>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="exampleInputEmail1" class="col-sm-2 control-label">Peraturan Pendelegasian Wewenang</label>
                                            <div class="col-sm-5">
                                                <input type="nohape" class="form-control"  placeholder="Contoh: Peraturan Menteri Perhubungan no 1" v-validate="'required'" name="perihalSurat_pemohon" v-model="pengajuan.perihalSurat_pemohon" data-vv-scope="step2">
                                                <span class="text-red">{{ errors.first('step2.perihalSurat_pemohon') }}</span>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="exampleInputEmail1" class="col-sm-2 control-label">fileUploadBackupSimakoad Surat Permohonan</label>
                                            <div class="col-sm-10">
                                                <input type="file" id="fileSuratPermohon" ref="fileSuratPermohon" v-validate="'required'" name="fileSuratPermohonName" data-vv-scope="step2">
                                                <span class="text-red">{{ errors.first('step2.fileSuratPermohonName') }}</span>
                                                <p class="help-block">Upload Document *.docx or *.xlsx</p>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="exampleInputEmail1" class="col-sm-2 control-label">Upload Daftar Rician BMN (Format Exel)</label>
                                            <div class="col-sm-10">
                                                <input type="file" id="fileDaftarRincian" ref="fileDaftarRincian" v-validate="'required'" name="fileDaftarRincianName" data-vv-scope="step2">
                                                <span class="text-red">{{ errors.first('step2.fileDaftarRincianName') }}</span>
                                            </div>
                                            <div class="col-sm-5">
                                                <div class="box-body2">
                                                    <a class="btn btn-block btn-social btn-bitbucket">
                                                        <i class="fa fa-download"></i> Download contoh format Rincian BMN
                                                    </a>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="exampleInputEmail1" class="col-sm-2 control-label">Upload Dokumen Kelengkapan</label>
                                            <div class="col-sm-10">
                                                <input type="file" id="fileDokumenKelengkapan" ref="fileDokumenKelengkapan" v-validate="'required'" name="fileDokumenKelengkapanName" data-vv-scope="step2">
                                                <span class="text-red">{{ errors.first('step2.fileDokumenKelengkapanName') }}</span>
                                            </div>
                                            <div class="col-sm-5">
                                                <div class="box-body2">
                                                    <a class="btn btn-block btn-social btn-bitbucket">
                                                        <i class="fa fa-download"></i> Apa saja syarat kelengkapannya?
                                                    </a>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="exampleInputEmail1" class="col-sm-2 control-label">Upload Backup SIMAK</label>
                                            <div class="col-sm-10">
                                                <input type="file" id="fileUploadBackupSimak" ref="fileUploadBackupSimak" v-validate="'required'" name="fileUploadBackupSimakName" data-vv-scope="step2" v-on:change="">
                                                <span class="text-red">{{ errors.first('step2.fileUploadBackupSimakName') }}</span>
                                            </div>
                                            <div class="col-sm-5">
                                                <div class="box-body2">
                                                    <a class="btn btn-block btn-social btn-bitbucket">
                                                        <i class="fa fa-download"></i> Download format backup SIMAK
                                                    </a>
                                                </div>
                                            </div>
                                        </div>

                                    </div>
                                    <!-- /.box-body -->

                                </div>
                            </div>
                        </tab-content>
                        <tab-content title="Last step" icon="fa fa-check-circle" v-if="isShowOtherTabDJKN" :before-change="resetTab">
                            <div class="callout callout-success">
                                <h4>Terima Kasih</h4>
                                <h4>Permohonan Pengajuan PSP BMN anda telah dikirimkan.</h4>
                                <p>Kami akan segera memproses permohonan Anda.</p>
                            </div>
                        </tab-content>
                           

                        <template slot="footer" slot-scope="props">
                            <div class="wizard-footer-right2">
                                <wizard-button v-if="!props.isLastStep" @click.native="props.nextTab()" class="wizard-footer-right" :style="props.fillButtonStyle">Save & Next</wizard-button>
                                <wizard-button v-else @click.native="clearPengajuanData" class="wizard-footer-right finish-button" :style="props.fillButtonStyle">{{props.isLastStep ? 'Done & Upload Data' : 'Next'}}</wizard-button>

                                <wizard-button v-if="props.activeTabIndex > 0" @click.native="props.prevTab()" class="btn btn-warning" :style="props.fillButtonStyle">Back</wizard-button>
                            </div>  
                        </template>
                    </form-wizard>
                </div>
    </div>
</script>