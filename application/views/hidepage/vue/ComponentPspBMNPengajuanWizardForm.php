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
                                <!-- /.box-header -->
                                <!-- form start -->
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
                                                <input type="email" class="form-control"  placeholder="Email Petugas" v-validate="'required'" name="email_petugas" v-model="pengajuan.email_petugas" data-vv-scope="step1">
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
                                                <vue-multiselect v-model="pengajuan.kementerian_lembaga" :options="option_kementerian_lembaga" :custom-label="name_kementerian_lembaga" placeholder="Select one" label="name" track-by="nama_KL" v-validate data-vv-rules="required" name="KementerianLembaga">
                                                </vue-multiselect>
                                                <span class="text-red">{{ errors.first('step1.KementerianLembaga') }}</span>

                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="exampleInputEmail1" class="col-sm-2 control-label">Alamat Kantor</label>
                                            <div class="col-sm-5">
                                                <input type="name" class="form-control"  placeholder="Alamat Kementerian Lembaga " v-validate="'required'" name="KantorKL" v-model="pengajuan.alamat_kantorKL">
                                                <span class="text-red">{{ errors.first('step1.KantorKL') }}</span>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="exampleInputEmail1" class="col-sm-2 control-label">Nama Satker</label>
                                            <div class="col-sm-5">
                                                <input type="name" class="form-control"  placeholder="Nama Satuan Kerja" v-validate="'required'" name="satuan_kerja" v-model="pengajuan.satuan_kerja">
                                                <span class="text-red">{{ errors.first('step1.satuan_kerja') }}</span>
                                            </div>
                                        </div>

                                    </div>
                                    <!-- /.box-body -->

                                </div>

                                <div class="box-header with-border">
                                    <h3 class="box-title btn bg-maroon btn-flat margin">PENGAJUAN BMN</h3>
                                </div>
                                <!-- /.box-header -->
                                <!-- form start -->
                                <div class="form-horizontal">
                                    <div class="box-body">
                                        <div class="form-group">
                                            <label for="exampleInputEmail1" class="col-sm-2 control-label">Jenis BMN</label>
                                            <div class="col-sm-5">
                                                <vue-multiselect v-model="pengajuan.jenis_bmn" :options="option_jenis_bmn" :custom-label="nameJenisBMN" placeholder="Pilih Jenis BMN" label="name" track-by="name" v-validate data-vv-rules="required" name="JenisBMN">
                                                </vue-multiselect>

                                                <span class="text-red">{{ errors.first('step1.JenisBMN') }}</span>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="exampleInputEmail1" class="col-sm-2 control-label">Total Nilai BMN</label>
                                            <div class="col-sm-5">
                                                <money  type="text" v-bind="money" class="form-control" v-validate="'required'" name="totalnilai_bmn" v-model="pengajuan.totalnilai_bmn" placeholder="Total Nilai (Rp.)"> </money>
                                                <span class="text-red">{{ errors.first('step1.totalnilai_bmn') }}</span>
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <label for="exampleInputEmail1" class="col-sm-2 control-label">Lokasi PSPBMN (Provinsi)</label>
                                            <div class="col-sm-5">
                                                <vue-multiselect v-model="pengajuan.provinsi" :options="option_provinsi" :custom-label="name_provinsi" placeholder="Pilih Provinsi" label="provinsi" track-by="provinsi" @input="showKabupaten=true;getKabupaten(pengajuan.provinsi);pengajuan.kabupaten=null"
                                                    v-validate data-vv-rules="required" name="lokasiProvinsi">
                                                </vue-multiselect>

                                                <span class="text-red">{{ errors.first('step1.lokasiProvinsi') }}</span>
                                            </div>
                                        </div>

                                        <div class="form-group" v-if="true">
                                            <label for="exampleInputEmail1" class="col-sm-2 control-label">Lokasi PSPBMN (Kabupaten)</label>
                                            <div class="col-sm-5">
                                                <vue-multiselect v-model="pengajuan.kabupaten" :options="option_kabupaten" :custom-label="name_kabupaten" placeholder="Pilih Kabupaten" label="kabupaten" track-by="name" v-validate data-vv-rules="required" name="lokasiKabupaten">
                                                </vue-multiselect>

                                                <span class="text-red">{{ errors.first('step1.lokasiKabupaten') }}</span>
                                            </div>
                                        </div>

                                    </div>
                                    <!-- /.box-body -->

                                </div>

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