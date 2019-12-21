<script type="text/x-template" id="pspTableVerifikasiWizard">
    <div>
                  <div class="box-body">
                            <table class="table is-bordered is-hoverable">
                                <thead class="text-white bg-dark">
                                    <th class="text-white">ID</th>
                                    <th class="text-white">No Surat</th>
                                    <th class="text-white">Tanggal Surat</th>
                                    <th class="text-white">Tgl Input</th>
                                    <th class="text-white">Kementrian Lembaga</th>
                                    <th class="text-white">Satuan Kerja</th>
                                    <th class="text-white">Status Pengajuan</th>
                                    <th class="text-white">Action</th>
                                </thead>
                                <tbody class="table-light">
                                    <tr v-for="data in pengajuan" class="table-default">
                                        <td>{{data.id}}</td>
                                        <td>{{data.noSurat_pemohon}}</td>
                                        <td>{{data.tglSurat_pemohon}}</td>
                                        <td>{{data.submitdate}}</td>
                                        <td>{{data.kementerian_lembaga}}</td>
                                        <td>{{data.satuan_kerja}}</td>
                                        <td>{{data.status_pengajuan}}</td>
                                        <td>
                                            <button type="button" 
                                                    class="btn btn-success" 
                                                    @click=
                                                        "selectPengajuan(data);getDataChoosePengajuan();">

                                                Verifikasi
                                            </button>
                                            <button type="button" class="btn btn-danger">Tolak</button>
                                        </td>
                                    </tr>
                                    <tr v-if="emptyResult">
                                        <td colspan="9" rowspan="4" class="text-center h1">No Record Found</td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                        <pagination :current_page="currentPage" :row_count_page="rowCountPage" @page-update="pageUpdate" :total_users="totalData" :page_range="pageRange"></pagination>
    </div>
</script>

<script type="text/x-template" id="pspVerifikasiWizardFormKPKNL">
    <div>
                <div class="nav-tabs-custom">
                    <form-wizard>
                        <wizard-step slot-scope="props" slot="step" :tab="props.tab" :transition="props.transition" :index="props.index">
                        </wizard-step>
                        <h3 slot="title"></h3>
                        <tab-content title="Inital Input" icon="fa fa-user" :before-change="beforeTab1SwitchKPKNL">
                            <div class="box box-primary">
                                <div class="box-header with-border">
                                    <h3 class="box-title btn bg-maroon margin">IDENTITAS PETUGAS KPKNL</h3>
                                </div>
                                
                                
                                <div class="form-horizontal">
                                    <div class="box-body">
                                        <div class="form-group">
                                            <label for="exampleInputEmail1" class="col-sm-2 control-label">Nama Petugas</label>
                                            <div class="col-sm-8">
                                                <input type="text" class="form-control" placeholder="Nama" v-validate="'required'" name="nama_petugas" v-model="verifikasi.nama_petugas" data-vv-scope="step1">
                                                <span class="text-red">{{ errors.first('step1.nama_petugas') }}</span>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="exampleInputEmail1" class="col-sm-2 control-label">NIP Petugas</label>
                                            <div class="col-sm-5">
                                                <the-mask type="text" mask="######## ###### # ###" class="form-control" v-validate="'required'" name="nip_petugas" v-model="verifikasi.nip_petugas" placeholder="Masukkan NIP Petugas" data-vv-scope="step1"> </the-mask>
                                                <span class="text-red">{{ errors.first('step1.nip_petugas') }}</span>
                                            </div>
                                        </div>

                                    </div>
                                    

                                </div>
                                <div class="box-header with-border">
                                    <h3 class="box-title btn bg-maroon btn-flat margin">KEPALA SEKSI</h3>
                                </div>
                                
                                
                                <div class="form-horizontal">
                                    <div class="box-body">
                                        <div class="form-group">
                                            <label for="exampleInputEmail1" class="col-sm-2 control-label">Jabatan KASI KPKNL</label>
                                            <div class="col-sm-5">
                                                <vue-multiselect 
                                                        v-model="data_kepala_seksi"
                                                        :allow-empty="false" 
                                                        :options="option_data_kepala_seksi_kpknl" 
                                                        :custom-label="name_jabatan_kepala_seksi_kpknl" 
                                                        placeholder="Pilih Jabatan Kepala Seksi" 
                                                        label="Jabatan Kepala Seksi" 
                                                        track-by="jabatan" 
                                                        v-validate data-vv-rules="required" 
                                                        name="KepalaSeksi" 
                                                        @input="showStatusJabatanKasi=true;setTempJabatanKepalaSeksiKPKNL()" 
                                                        data-vv-scope="step1">
                                                </vue-multiselect>

                                                <span class="text-red">{{ errors.first('step1.KepalaSeksi') }}</span>
                                            </div>
                                        </div>
                                        <div class="form-group" v-if="showStatusJabatanKasi">
                                            <label for="exampleInputEmail1" class="col-sm-2 control-label">Status Jabatan</label>
                                            <div class="col-sm-5">
                                                <button class="btn" :class="{'active btn-success':(data_kepala_seksi.status == 'definitif')}"  @click="pickStatusJabatanKasiKPKNL('definitif')">Definitif</button>
                                                <button class="btn" :class="{'active btn-success':(data_kepala_seksi.status == 'plt_plh')}"  @click="pickStatusJabatanKasiKPKNL('plt_plh')"> Plt/Plh</button>
                                            </div>
                                        </div>

                                        <div class="form-group" v-if="showStatusJabatanKasi">
                                            <label for="exampleInputEmail1" class="col-sm-2 control-label">Nama Kepala Seksi</label>
                                            <div class="col-sm-5">
                                                <input type="name" class="form-control" placeholder="Masukkan Nama Kepala Seksi" v-validate="'required'" name="nama_kepala_seksi" v-model="data_kepala_seksi.nama" data-vv-scope="step1">
                                                <span class="text-red">{{ errors.first('step1.nama_kepala_seksi') }}</span>
                                            </div>
                                        </div>

                                        <div class="form-group" v-if="showStatusJabatanKasi">
                                            <label for="exampleInputEmail1" class="col-sm-2 control-label">NIP Kepala Seksi</label>
                                            <div class="col-sm-5">
                                                <the-mask type="text" mask="######## ###### # ###" class="form-control" v-validate="'required'" name="nip_kepala_seksi" v-model="data_kepala_seksi.nip" placeholder="Masukkan NIP Kepala Seksi" data-vv-scope="step1"> </the-mask>
                                                <span class="text-red">{{ errors.first('step1.nip_kepala_seksi') }}</span>
                                            </div>
                                        </div>

                                    </div>
                                    

                                </div>

                                <div class="box-header with-border">
                                    <h3 class="box-title btn bg-maroon btn-flat margin">KEPALA BIDANG</h3>
                                </div>                             
                                
                                
                                
                                <div class="form-horizontal">
                                    <div class="box-body">
                                        <div class="form-group">
                                            <label for="exampleInputEmail1" class="col-sm-2 control-label">Jabatan KABID KPKNL</label>
                                            <div class="col-sm-5">
                                                <vue-multiselect 
                                                    v-model="data_kepala_bidang" 
                                                    :options="option_data_kepala_bidang_kpknl" 
                                                    :allow-empty="false" 
                                                    :custom-label="name_jabatan_kepala_bidang_kpknl" 
                                                    placeholder="Pilih Jabatan Kepala bidang" 
                                                    label="Jabatan Kepala bidang" 
                                                    track-by="jabatan" 
                                                    v-validate data-vv-rules="required" 
                                                    name="Kepalabidang" 
                                                    @input="showStatusJabatanKabid=true;setTempJabatanKepalaBidangKPKNL()" 
                                                    data-vv-scope="step1"> 
                                                </vue-multiselect>



                                                <span class="text-red">{{ errors.first('step1.Kepalabidang') }}</span>
                                            </div>
                                        </div>
                                        <div class="form-group" v-if="showStatusJabatanKabid">
                                            <label for="exampleInputEmail1" class="col-sm-2 control-label">Status Jabatan</label>
                                            <div class="col-sm-5">
                                                <button class="btn" :class="{'active btn-success':(data_kepala_bidang.status == 'definitif')}" @click="pickStatusJabatanKabidKPKNL('definitif')">Definitif</button>
                                                <button class="btn" :class="{'active btn-success':(data_kepala_bidang.status == 'plt_plh')}" @click="pickStatusJabatanKabidKPKNL('plt_plh')"> Plt/Plh</button>
                                            </div>
                                        </div>



                                        <div class="form-group" v-if="showStatusJabatanKabid">
                                            <label for="exampleInputEmail1" class="col-sm-2 control-label">Nama Kepala bidang</label>
                                            <div class="col-sm-5">
                                                <input type="name" class="form-control" placeholder="Masukkan Nama Kepala bidang" v-validate="'required'" name="nama_kepala_bidang" v-model="data_kepala_bidang.nama" data-vv-scope="step1">
                                                <span class="text-red">{{ errors.first('step1.nama_kepala_bidang') }}</span>
                                            </div>
                                        </div>

                                        <div class="form-group" v-if="showStatusJabatanKabid">
                                            <label for="exampleInputEmail1" class="col-sm-2 control-label">NIP Kepala bidang</label>
                                            <div class="col-sm-5">
                                                <the-mask type="text" mask="######## ###### # ###" class="form-control" v-validate="'required'" name="nip_kepala_bidang" v-model="data_kepala_bidang.nip" placeholder="Masukkan NIP Kepala bidang" data-vv-scope="step1"> </the-mask>
                                                <span class="text-red">{{ errors.first('step1.nip_kepala_bidang') }}</span>
                                            </div>
                                        </div>

                                    </div>
                                    

                                </div>

                            </div>
                        </tab-content>
                        <tab-content title="Pengecekan Dokumen" icon="fa fa-certificate">
                            <div class="box-header with-border">
                                <h3 class="box-title btn bg-maroon btn-flat margin">PROSES PENGECEKAN DOKUMEN</h3>
                            </div>
                            <div class="form-horizontal">
                                <div class="box-body">
                                    <div class="form-group">
                                        <div class="col-sm-4">
                                            <div class="box-body2">
                                                <a :href="hrefFileSuratPermohon" download class="btn btn-block btn-bitbucket btn-social ">
                                                    <i class="fa fa-download"></i> Download Surat Permohonan
                                                </a>
                                            </div>
                                        </div>
                                        <div class="col-sm-4">
                                            <div class="box-body2">
                                                <a :href="hrefFileDaftarRincian" download class="btn btn-block btn-social btn-bitbucket">
                                                    <i class="fa fa-download"></i> Download  Daftar Rician BMN 
                                                </a>
                                            </div>
                                        </div>
                                        <div class="col-sm-4">
                                            <div class="box-body2">
                                                <a :href="hrefFileDokumenKelengkapan" download class="btn btn-block btn-social btn-bitbucket">
                                                    <i class="fa fa-download"></i> Download Dokumen Kelengkapan 
                                                </a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                        </tab-content>

                        <tab-content title="Input Dokumen" icon="fa fa-envelope-o" v-if="true" :before-change="beforeTab2SwitchKPKNL" >

                            <div class="box box-primary">
                                <div class="box-header with-border">
                                    <h3 class="box-title btn bg-maroon btn-flat margin">CHECKLIST KELENGKAPAN</h3>
                                </div>
                                
                                
                                <div class="form-horizontal">
                                    <div class="box-body">
                                        <div class="form-group">
                                            <label for="exampleInputEmail1" class="col-sm-4 control-label">Jenis BMN</label>
                                            <div class="col-sm-8">
                                                <button class="btn" :class="{'active btn-success':(verifikasi.check_jenis_bmn === 'sesuai')}" @click.prevent="checklistVerifikasi('check_jenis_bmn','sesuai')">Sesuai</button>
                                                <button class="btn" :class="{'active btn-success':(verifikasi.check_jenis_bmn === 'tidak sesuai')}" @click.prevent="checklistVerifikasi('check_jenis_bmn','tidak sesuai')">Tidak Sesuai</button>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="box-body">
                                        <div class="form-group">
                                            <label for="exampleInputEmail1" class="col-sm-4 control-label">Nilai BMN</label>
                                            <div class="col-sm-8">
                                                <button class="btn" :class="{'active btn-success':(verifikasi.check_nilai_bmn === 'sesuai')}" @click.prevent="checklistVerifikasi('check_nilai_bmn','sesuai')">Sesuai</button>
                                                <button class="btn" :class="{'active btn-success':(verifikasi.check_nilai_bmn === 'tidak sesuai')}" @click.prevent="checklistVerifikasi('check_nilai_bmn','tidak sesuai')">Tidak Sesuai</button>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="box-body">
                                        <div class="form-group">
                                            <label for="exampleInputEmail1" class="col-sm-4 control-label">Surat Permohonan</label>
                                            <div class="col-sm-8">
                                                <button class="btn" :class="{'active btn-success':(verifikasi.check_surat_permohonan === 'sesuai')}" @click.prevent="checklistVerifikasi('check_surat_permohonan','sesuai')">Sesuai</button>
                                                <button class="btn" :class="{'active btn-success':(verifikasi.check_surat_permohonan === 'tidak sesuai')}" @click.prevent="checklistVerifikasi('check_surat_permohonan','tidak sesuai')">Tidak Sesuai</button>
                                                <button class="btn" :class="{'active btn-success':(verifikasi.check_surat_permohonan === 'tidak ada')}" @click.prevent="checklistVerifikasi('check_surat_permohonan','tidak ada')">Tidak Ada</button>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="box-body">
                                        <div class="form-group">
                                            <label for="exampleInputEmail1" class="col-sm-4 control-label">Daftar Rincian Usulan BMN</label>
                                            <div class="col-sm-8">
                                                <button class="btn" :class="{'active btn-success':(verifikasi.check_rincian_usulan_bmn === 'sesuai')}" @click.prevent="checklistVerifikasi('check_rincian_usulan_bmn','sesuai')">Sesuai</button>
                                                <button class="btn" :class="{'active btn-success':(verifikasi.check_rincian_usulan_bmn === 'tidak sesuai')}" @click.prevent="checklistVerifikasi('check_rincian_usulan_bmn','tidak sesuai')">Tidak Sesuai</button>
                                                <button class="btn" :class="{'active btn-success':(verifikasi.check_rincian_usulan_bmn === 'tidak ada')}" @click.prevent="checklistVerifikasi('check_rincian_usulan_bmn','tidak ada')">Tidak Ada</button>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="box-body">
                                        <div class="form-group">
                                            <label for="exampleInputEmail1" class="col-sm-4 control-label">KIB</label>
                                            <div class="col-sm-8">
                                                <button class="btn" :class="{'active btn-success':(verifikasi.check_kib === 'sesuai')}" @click.prevent="checklistVerifikasi('check_kib','sesuai')">Sesuai</button>
                                                <button class="btn" :class="{'active btn-success':(verifikasi.check_kib === 'tidak sesuai')}" @click.prevent="checklistVerifikasi('check_kib','tidak sesuai')">Tidak Sesuai</button>
                                                <button class="btn" :class="{'active btn-success':(verifikasi.check_kib === 'tidak ada')}" @click.prevent="checklistVerifikasi('check_kib','tidak ada')">Tidak Ada</button>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="box-body">
                                        <div class="form-group">
                                            <label for="exampleInputEmail1" class="col-sm-4 control-label">Foto BMN</label>
                                            <div class="col-sm-8">
                                                <button class="btn" :class="{'active btn-success':(verifikasi.check_foto_bmn === 'sesuai')}" @click.prevent="checklistVerifikasi('check_foto_bmn','sesuai')">Sesuai</button>
                                                <button class="btn" :class="{'active btn-success':(verifikasi.check_foto_bmn === 'tidak sesuai')}" @click.prevent="checklistVerifikasi('check_foto_bmn','tidak sesuai')">Tidak Sesuai</button>
                                                <button class="btn" :class="{'active btn-success':(verifikasi.check_foto_bmn === 'tidak ada')}" @click.prevent="checklistVerifikasi('check_foto_bmn','tidak ada')">Tidak Ada</button>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="box-body">
                                        <div class="form-group">
                                            <label for="exampleInputEmail1" class="col-sm-4 control-label">Fotocopy Surat Keputusan(dari Kementerian/Lembaga) tentang Pendelegasian Wewenang</label>
                                            <div class="col-sm-8">
                                                <button class="btn" :class="{'active btn-success':(verifikasi.check_sk_delegasi === 'sesuai')}" @click.prevent="checklistVerifikasi('check_sk_delegasi','sesuai')">Sesuai</button>
                                                <button class="btn" :class="{'active btn-success':(verifikasi.check_sk_delegasi === 'tidak sesuai')}" @click.prevent="checklistVerifikasi('check_sk_delegasi','tidak sesuai')">Tidak Sesuai</button>
                                                <button class="btn" :class="{'active btn-success':(verifikasi.check_sk_delegasi === 'tidak ada')}" @click.prevent="checklistVerifikasi('check_sk_delegasi','tidak ada')">Tidak Ada</button>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="box-body">
                                        <div class="form-group">
                                            <label for="exampleInputEmail1" class="col-sm-4 control-label">Dokumen Kepemilikan</label>
                                            <div class="col-sm-8">
                                                <button class="btn" :class="{'active btn-success':(verifikasi.check_dokumen_kepemilikan === 'ada')}" @click.prevent="checklistVerifikasi('check_dokumen_kepemilikan','ada');isAdaDokumenKepemilikan=true">Ada</button>
                                                <button class="btn" :class="{'active btn-success':(verifikasi.check_dokumen_kepemilikan === 'tidak ada')}" @click.prevent="checklistVerifikasi('check_dokumen_kepemilikan','tidak ada');isAdaDokumenKepemilikan=false">Tidak Ada</button>
                                            </div>
                                        </div>
                                    </div>
                                    <div v-if="isAdaDokumenKepemilikan">
                                        <div class="box-body">
                                            <div class="form-group">
                                                <label for="exampleInputEmail1" class="col-sm-4 control-label">Fotocopy Dokumen Kepemilikan</label>
                                                <div class="col-sm-8">
                                                    <button class="btn" :class="{'active btn-success':(verifikasi.check_fc_dokumen_kepemilikan === 'sesuai')}" @click.prevent="checklistVerifikasi('check_fc_dokumen_kepemilikan','sesuai')">Sesuai</button>
                                                    <button class="btn" :class="{'active btn-success':(verifikasi.check_fc_dokumen_kepemilikan === 'tidak sesuai')}" @click.prevent="checklistVerifikasi('check_fc_dokumen_kepemilikan','tidak sesuai')">Tidak Sesuai</button>
                                                    <button class="btn" :class="{'active btn-success':(verifikasi.check_fc_dokumen_kepemilikan === 'tidak ada')}" @click.prevent="checklistVerifikasi('check_fc_dokumen_kepemilikan','tidak ada')">Tidak Ada</button>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="box-body">
                                            <div class="form-group">
                                                <label for="exampleInputEmail1" class="col-sm-4 control-label">Surat keterangan pejabat struktural menyatakan kebenaran fotokopi dokumen kepemilikan </label>
                                                <div class="col-sm-8">
                                                    <button class="btn" :class="{'active btn-success':(verifikasi.check_kebenaran_fc_dokumen_kepemilikan === 'sesuai')}" @click.prevent="checklistVerifikasi('check_kebenaran_fc_dokumen_kepemilikan','sesuai')">Sesuai</button>
                                                    <button class="btn" :class="{'active btn-success':(verifikasi.check_kebenaran_fc_dokumen_kepemilikan === 'tidak sesuai')}" @click.prevent="checklistVerifikasi('check_kebenaran_fc_dokumen_kepemilikan','tidak sesuai')">Tidak Sesuai</button>
                                                    <button class="btn" :class="{'active btn-success':(verifikasi.check_kebenaran_fc_dokumen_kepemilikan === 'tidak ada')}" @click.prevent="checklistVerifikasi('check_kebenaran_fc_dokumen_kepemilikan','tidak ada')">Tidak Ada</button>
                                                </div>
                                            </div>
                                        </div> 
                                    </div>
                                    <div v-else>
                                        <div class="box-body">
                                            <div class="form-group">
                                                <label for="exampleInputEmail1" class="col-sm-4 control-label">SPTJM bermaterai bahwa barang tersebut adalah BMN dan digunakan untuk tugas dan fungsi</label>
                                                <div class="col-sm-8">
                                                    <button class="btn" :class="{'active btn-success':(verifikasi.check_sptjm_bermaterai === 'sesuai')}" @click.prevent="checklistVerifikasi('check_sptjm_bermaterai','sesuai')">Sesuai</button>
                                                    <button class="btn" :class="{'active btn-success':(verifikasi.check_sptjm_bermaterai === 'tidak sesuai')}" @click.prevent="checklistVerifikasi('check_sptjm_bermaterai','tidak sesuai')">Tidak Sesuai</button>
                                                    <button class="btn" :class="{'active btn-success':(verifikasi.check_sptjm_bermaterai === 'tidak ada')}" @click.prevent="checklistVerifikasi('check_sptjm_bermaterai','tidak ada')">Tidak Ada</button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="box-body">
                                            <div class="form-group">
                                                <label for="exampleInputEmail1" class="col-sm-4 control-label">Catatan Khusus </label>
                                                <div class="col-sm-8">
                                                    <textarea width="100%" v-model='verifikasi.noteDokumen'></textarea>
                                                </div>
                                            </div>
                                        </div> 
                                    

                                </div>
                            </div>
                        </tab-content>

                        <tab-content title="Pengecekan Dokumen" icon="fa fa-certificate" :before-change="beforeTab3SwitchKPKNL" >
                            <div class="box-header with-border">
                                <h3 class="box-title btn bg-maroon btn-flat margin">Hasil Verifikasi Dokumen</h3>
                            </div>
                            <div class="form-horizontal" >
                                <div class="box-body">
                                    <div class="form-group">
                                        <div class="col-sm-4">
                                            <div class="box-body2">
                                                <button class="btn btn-success">
                                                    <i class="fa fa-check"></i> Terbitkan KMK
                                                </button>
                                            </div>
                                        </div>
                                        <div class="col-sm-4">
                                            <div class="box-body2">
                                                <button class="btn btn-danger" >
                                                    <i class="fa fa-ban"></i> Butuh Kelengkapan Data 
                                                </button>
                                            </div>
                                        </div>
                                        <div class="col-sm-4">
                                            <div class="box-body2">
                                                <button class="btn btn-warning" >
                                                    <i class="fa fa-question"></i> Butuh Survei Lapangan 
                                                </button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="form-horizontal" >
                                <div class="box-body">
                                        <div v-for="(row, index) in daftarTembusan" >
                                            <div class="form-group">
                                                <label for="exampleInputEmail1" class="col-sm-3 control-label">Nama Tembusan {{index+1}}</label>
                                                <div class="col-sm-9">
                                                    <input type="text" class="form-control" placeholder="Masukkan Nama" v-model="row.nama">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                                <div class="col-sm-3 pull-right">
                                                 <button class="btn active btn-success" @click.prevent="addRowTembusan()">Add Tembusan</button>
                                                    
                                                </div>
                                        </div>

                                        <div class="form-group">
                                            <label for="exampleInputEmail1" class="col-sm-3 control-label">Jabatan Salinan</label>
                                            <div class="col-sm-9">
                                               <input type="text" class="form-control" placeholder="Masukkan Nama" v-model="verifikasi.jabatan_salinan">
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <label for="exampleInputEmail1" class="col-sm-3 control-label">Nama Salinan</label>
                                            <div class="col-sm-9">
                                               <input type="text" class="form-control" placeholder="Masukkan Nama" v-model="verifikasi.nama_salinan">
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <label for="exampleInputEmail1" class="col-sm-3 control-label">Nip Salinan</label>
                                            <div class="col-sm-9">
                                               <input type="text" class="form-control" placeholder="Masukkan Nama" v-model="verifikasi.nip_salinan">
                                            </div>
                                        </div>

                                </div>
                            </div>

                        </tab-content>
                        <tab-content title="Last step" icon="fa fa-check-circle" >
                            <div class="callout callout-success">
                                <h4>Terima Kasih</h4>
                                <h4>Permohonan Verifikasi Dokumen Telah Selesai dilakukan.</h4>
                            </div>
                        </tab-content>

                        <template slot="footer" slot-scope="props">
                            <div class="wizard-footer-right2">
                                <wizard-button v-if="!props.isLastStep" @click.native="props.nextTab()" class="wizard-footer-right" :style="props.fillButtonStyle">Save & Next</wizard-button>
                                <wizard-button v-else @click.native="clearPengajuanData" class="wizard-footer-right finish-button" :style="props.fillButtonStyle">{{props.isLastStep ? 'Done' : 'Next'}}</wizard-button>

                                <wizard-button v-if="props.activeTabIndex > 0" @click.native="props.prevTab()" class="btn btn-warning" :style="props.fillButtonStyle">Back</wizard-button>
                            </div>
                        </template>
                    </form-wizard>
                </div>

    </div>
</script>


<script type="text/x-template" id="pspVerifikasiWizardFormKANWIL">
    <div>
                <div class="nav-tabs-custom">
                    <form-wizard>
                        <wizard-step slot-scope="props" slot="step" :tab="props.tab" :transition="props.transition" :index="props.index">
                        </wizard-step>
                        <h3 slot="title"></h3>
                        <tab-content title="Inital Input" icon="fa fa-user" :before-change="beforeTab1SwitchKANWIL">
                            <div class="box box-primary">
                                <div class="box-header with-border">
                                    <h3 class="box-title btn bg-maroon margin">IDENTITAS PETUGAS KANWIL</h3>
                                </div>
                                
                                
                                <div class="form-horizontal">
                                    <div class="box-body">
                                        <div class="form-group">
                                            <label for="exampleInputEmail1" class="col-sm-2 control-label">Nama Petugas</label>
                                            <div class="col-sm-8">
                                                <input type="text" class="form-control" placeholder="Nama" v-validate="'required'" name="nama_petugas" v-model="verifikasi.nama_petugas" data-vv-scope="step1">
                                                <span class="text-red">{{ errors.first('step1.nama_petugas') }}</span>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="exampleInputEmail1" class="col-sm-2 control-label">NIP Petugas</label>
                                            <div class="col-sm-5">
                                                <the-mask type="text" mask="######## ###### # ###" class="form-control" v-validate="'required'" name="nip_petugas" v-model="verifikasi.nip_petugas" placeholder="Masukkan NIP Petugas" data-vv-scope="step1"> </the-mask>
                                                <span class="text-red">{{ errors.first('step1.nip_petugas') }}</span>
                                            </div>
                                        </div>

                                    </div>
                                    

                                </div>
                                <div class="box-header with-border">
                                    <h3 class="box-title btn bg-maroon btn-flat margin">KEPALA SEKSI</h3>
                                </div>
                                
                                
                                <div class="form-horizontal">
                                    <div class="box-body">
                                        <div class="form-group">
                                            <label for="exampleInputEmail1" class="col-sm-2 control-label">Jabatan KASI KANWIL</label>
                                            <div class="col-sm-5">
                                                <vue-multiselect 
                                                        v-model="data_kepala_seksi"
                                                        :allow-empty="false" 
                                                        :options="option_data_kepala_seksi_kanwil" 
                                                        :custom-label="name_jabatan_kepala_seksi_kanwil" 
                                                        placeholder="Pilih Jabatan Kepala Seksi" 
                                                        label="Jabatan Kepala Seksi" 
                                                        track-by="jabatan" 
                                                        v-validate data-vv-rules="required" 
                                                        name="KepalaSeksi" 
                                                        @input="showStatusJabatanKasi=true;setTempJabatanKepalaSeksiKANWIL()" 
                                                        data-vv-scope="step1">
                                                </vue-multiselect>

                                                <span class="text-red">{{ errors.first('step1.KepalaSeksi') }}</span>
                                            </div>
                                        </div>
                                        <div class="form-group" v-if="showStatusJabatanKasi">
                                            <label for="exampleInputEmail1" class="col-sm-2 control-label">Status Jabatan</label>
                                            <div class="col-sm-5">
                                                <button class="btn" :class="{'active btn-success':(data_kepala_seksi.status == 'definitif')}"  @click="pickStatusJabatanKasiKANWIL('definitif')">Definitif</button>
                                                <button class="btn" :class="{'active btn-success':(data_kepala_seksi.status == 'plt_plh')}"  @click="pickStatusJabatanKasiKANWIL('plt_plh')"> Plt/Plh</button>
                                            </div>
                                        </div>

                                        <div class="form-group" v-if="showStatusJabatanKasi">
                                            <label for="exampleInputEmail1" class="col-sm-2 control-label">Nama Kepala Seksi</label>
                                            <div class="col-sm-5">
                                                <input type="name" class="form-control" placeholder="Masukkan Nama Kepala Seksi" v-validate="'required'" name="nama_kepala_seksi" v-model="data_kepala_seksi.nama" data-vv-scope="step1">
                                                <span class="text-red">{{ errors.first('step1.nama_kepala_seksi') }}</span>
                                            </div>
                                        </div>

                                        <div class="form-group" v-if="showStatusJabatanKasi">
                                            <label for="exampleInputEmail1" class="col-sm-2 control-label">NIP Kepala Seksi</label>
                                            <div class="col-sm-5">
                                                <the-mask type="text" mask="######## ###### # ###" class="form-control" v-validate="'required'" name="nip_kepala_seksi" v-model="data_kepala_seksi.nip" placeholder="Masukkan NIP Kepala Seksi" data-vv-scope="step1"> </the-mask>
                                                <span class="text-red">{{ errors.first('step1.nip_kepala_seksi') }}</span>
                                            </div>
                                        </div>

                                    </div>
                                    

                                </div>

                                <div class="box-header with-border">
                                    <h3 class="box-title btn bg-maroon btn-flat margin">KEPALA BIDANG</h3>
                                </div>                             
                                
                                
                                
                                <div class="form-horizontal">
                                    <div class="box-body">
                                        <div class="form-group">
                                            <label for="exampleInputEmail1" class="col-sm-2 control-label">Jabatan KABID KANWIL</label>
                                            <div class="col-sm-5">
                                                <vue-multiselect 
                                                    v-model="data_kepala_bidang" 
                                                    :options="option_data_kepala_bidang_kanwil" 
                                                    :allow-empty="false" 
                                                    :custom-label="name_jabatan_kepala_bidang_kanwil" 
                                                    placeholder="Pilih Jabatan Kepala bidang" 
                                                    label="Jabatan Kepala bidang" 
                                                    track-by="jabatan" 
                                                    v-validate data-vv-rules="required" 
                                                    name="Kepalabidang" 
                                                    @input="showStatusJabatanKabid=true;setTempJabatanKepalaBidangKANWIL()" 
                                                    data-vv-scope="step1"> 
                                                </vue-multiselect>



                                                <span class="text-red">{{ errors.first('step1.Kepalabidang') }}</span>
                                            </div>
                                        </div>
                                        <div class="form-group" v-if="showStatusJabatanKabid">
                                            <label for="exampleInputEmail1" class="col-sm-2 control-label">Status Jabatan</label>
                                            <div class="col-sm-5">
                                                <button class="btn" :class="{'active btn-success':(data_kepala_bidang.status == 'definitif')}" @click="pickStatusJabatanKabidKANWIL('definitif')">Definitif</button>
                                                <button class="btn" :class="{'active btn-success':(data_kepala_bidang.status == 'plt_plh')}" @click="pickStatusJabatanKabidKANWIL('plt_plh')"> Plt/Plh</button>
                                            </div>
                                        </div>



                                        <div class="form-group" v-if="showStatusJabatanKabid">
                                            <label for="exampleInputEmail1" class="col-sm-2 control-label">Nama Kepala bidang</label>
                                            <div class="col-sm-5">
                                                <input type="name" class="form-control" placeholder="Masukkan Nama Kepala bidang" v-validate="'required'" name="nama_kepala_bidang" v-model="data_kepala_bidang.nama" data-vv-scope="step1">
                                                <span class="text-red">{{ errors.first('step1.nama_kepala_bidang') }}</span>
                                            </div>
                                        </div>

                                        <div class="form-group" v-if="showStatusJabatanKabid">
                                            <label for="exampleInputEmail1" class="col-sm-2 control-label">NIP Kepala bidang</label>
                                            <div class="col-sm-5">
                                                <the-mask type="text" mask="######## ###### # ###" class="form-control" v-validate="'required'" name="nip_kepala_bidang" v-model="data_kepala_bidang.nip" placeholder="Masukkan NIP Kepala bidang" data-vv-scope="step1"> </the-mask>
                                                <span class="text-red">{{ errors.first('step1.nip_kepala_bidang') }}</span>
                                            </div>
                                        </div>

                                    </div>
                                    

                                </div>

                            </div>
                        </tab-content>
                        <tab-content title="Pengecekan Dokumen" icon="fa fa-certificate">
                            <div class="box-header with-border">
                                <h3 class="box-title btn bg-maroon btn-flat margin">PROSES PENGECEKAN DOKUMEN</h3>
                            </div>
                            <div class="form-horizontal">
                                <div class="box-body">
                                    <div class="form-group">
                                        <div class="col-sm-4">
                                            <div class="box-body2">
                                                <a :href="hrefFileSuratPermohon" download class="btn btn-block btn-bitbucket btn-social ">
                                                    <i class="fa fa-download"></i> Download Surat Permohonan
                                                </a>
                                            </div>
                                        </div>
                                        <div class="col-sm-4">
                                            <div class="box-body2">
                                                <a :href="hrefFileDaftarRincian" download class="btn btn-block btn-social btn-bitbucket">
                                                    <i class="fa fa-download"></i> Download  Daftar Rician BMN 
                                                </a>
                                            </div>
                                        </div>
                                        <div class="col-sm-4">
                                            <div class="box-body2">
                                                <a :href="hrefFileDokumenKelengkapan" download class="btn btn-block btn-social btn-bitbucket">
                                                    <i class="fa fa-download"></i> Download Dokumen Kelengkapan 
                                                </a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                        </tab-content>

                        <tab-content title="Input Dokumen" icon="fa fa-envelope-o" v-if="true" :before-change="beforeTab2SwitchKANWIL" >

                            <div class="box box-primary">
                                <div class="box-header with-border">
                                    <h3 class="box-title btn bg-maroon btn-flat margin">CHECKLIST KELENGKAPAN</h3>
                                </div>
                                
                                
                                <div class="form-horizontal">
                                    <div class="box-body">
                                        <div class="form-group">
                                            <label for="exampleInputEmail1" class="col-sm-4 control-label">Jenis BMN</label>
                                            <div class="col-sm-8">
                                                <button class="btn" :class="{'active btn-success':(verifikasi.check_jenis_bmn === 'sesuai')}" @click.prevent="checklistVerifikasi('check_jenis_bmn','sesuai')">Sesuai</button>
                                                <button class="btn" :class="{'active btn-success':(verifikasi.check_jenis_bmn === 'tidak sesuai')}" @click.prevent="checklistVerifikasi('check_jenis_bmn','tidak sesuai')">Tidak Sesuai</button>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="box-body">
                                        <div class="form-group">
                                            <label for="exampleInputEmail1" class="col-sm-4 control-label">Nilai BMN</label>
                                            <div class="col-sm-8">
                                                <button class="btn" :class="{'active btn-success':(verifikasi.check_nilai_bmn === 'sesuai')}" @click.prevent="checklistVerifikasi('check_nilai_bmn','sesuai')">Sesuai</button>
                                                <button class="btn" :class="{'active btn-success':(verifikasi.check_nilai_bmn === 'tidak sesuai')}" @click.prevent="checklistVerifikasi('check_nilai_bmn','tidak sesuai')">Tidak Sesuai</button>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="box-body">
                                        <div class="form-group">
                                            <label for="exampleInputEmail1" class="col-sm-4 control-label">Surat Permohonan</label>
                                            <div class="col-sm-8">
                                                <button class="btn" :class="{'active btn-success':(verifikasi.check_surat_permohonan === 'sesuai')}" @click.prevent="checklistVerifikasi('check_surat_permohonan','sesuai')">Sesuai</button>
                                                <button class="btn" :class="{'active btn-success':(verifikasi.check_surat_permohonan === 'tidak sesuai')}" @click.prevent="checklistVerifikasi('check_surat_permohonan','tidak sesuai')">Tidak Sesuai</button>
                                                <button class="btn" :class="{'active btn-success':(verifikasi.check_surat_permohonan === 'tidak ada')}" @click.prevent="checklistVerifikasi('check_surat_permohonan','tidak ada')">Tidak Ada</button>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="box-body">
                                        <div class="form-group">
                                            <label for="exampleInputEmail1" class="col-sm-4 control-label">Daftar Rincian Usulan BMN</label>
                                            <div class="col-sm-8">
                                                <button class="btn" :class="{'active btn-success':(verifikasi.check_rincian_usulan_bmn === 'sesuai')}" @click.prevent="checklistVerifikasi('check_rincian_usulan_bmn','sesuai')">Sesuai</button>
                                                <button class="btn" :class="{'active btn-success':(verifikasi.check_rincian_usulan_bmn === 'tidak sesuai')}" @click.prevent="checklistVerifikasi('check_rincian_usulan_bmn','tidak sesuai')">Tidak Sesuai</button>
                                                <button class="btn" :class="{'active btn-success':(verifikasi.check_rincian_usulan_bmn === 'tidak ada')}" @click.prevent="checklistVerifikasi('check_rincian_usulan_bmn','tidak ada')">Tidak Ada</button>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="box-body">
                                        <div class="form-group">
                                            <label for="exampleInputEmail1" class="col-sm-4 control-label">KIB</label>
                                            <div class="col-sm-8">
                                                <button class="btn" :class="{'active btn-success':(verifikasi.check_kib === 'sesuai')}" @click.prevent="checklistVerifikasi('check_kib','sesuai')">Sesuai</button>
                                                <button class="btn" :class="{'active btn-success':(verifikasi.check_kib === 'tidak sesuai')}" @click.prevent="checklistVerifikasi('check_kib','tidak sesuai')">Tidak Sesuai</button>
                                                <button class="btn" :class="{'active btn-success':(verifikasi.check_kib === 'tidak ada')}" @click.prevent="checklistVerifikasi('check_kib','tidak ada')">Tidak Ada</button>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="box-body">
                                        <div class="form-group">
                                            <label for="exampleInputEmail1" class="col-sm-4 control-label">Foto BMN</label>
                                            <div class="col-sm-8">
                                                <button class="btn" :class="{'active btn-success':(verifikasi.check_foto_bmn === 'sesuai')}" @click.prevent="checklistVerifikasi('check_foto_bmn','sesuai')">Sesuai</button>
                                                <button class="btn" :class="{'active btn-success':(verifikasi.check_foto_bmn === 'tidak sesuai')}" @click.prevent="checklistVerifikasi('check_foto_bmn','tidak sesuai')">Tidak Sesuai</button>
                                                <button class="btn" :class="{'active btn-success':(verifikasi.check_foto_bmn === 'tidak ada')}" @click.prevent="checklistVerifikasi('check_foto_bmn','tidak ada')">Tidak Ada</button>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="box-body">
                                        <div class="form-group">
                                            <label for="exampleInputEmail1" class="col-sm-4 control-label">Fotocopy Surat Keputusan(dari Kementerian/Lembaga) tentang Pendelegasian Wewenang</label>
                                            <div class="col-sm-8">
                                                <button class="btn" :class="{'active btn-success':(verifikasi.check_sk_delegasi === 'sesuai')}" @click.prevent="checklistVerifikasi('check_sk_delegasi','sesuai')">Sesuai</button>
                                                <button class="btn" :class="{'active btn-success':(verifikasi.check_sk_delegasi === 'tidak sesuai')}" @click.prevent="checklistVerifikasi('check_sk_delegasi','tidak sesuai')">Tidak Sesuai</button>
                                                <button class="btn" :class="{'active btn-success':(verifikasi.check_sk_delegasi === 'tidak ada')}" @click.prevent="checklistVerifikasi('check_sk_delegasi','tidak ada')">Tidak Ada</button>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="box-body">
                                        <div class="form-group">
                                            <label for="exampleInputEmail1" class="col-sm-4 control-label">Dokumen Kepemilikan</label>
                                            <div class="col-sm-8">
                                                <button class="btn" :class="{'active btn-success':(verifikasi.check_dokumen_kepemilikan === 'ada')}" @click.prevent="checklistVerifikasi('check_dokumen_kepemilikan','ada');isAdaDokumenKepemilikan=true">Ada</button>
                                                <button class="btn" :class="{'active btn-success':(verifikasi.check_dokumen_kepemilikan === 'tidak ada')}" @click.prevent="checklistVerifikasi('check_dokumen_kepemilikan','tidak ada');isAdaDokumenKepemilikan=false">Tidak Ada</button>
                                            </div>
                                        </div>
                                    </div>
                                    <div v-if="isAdaDokumenKepemilikan">
                                        <div class="box-body">
                                            <div class="form-group">
                                                <label for="exampleInputEmail1" class="col-sm-4 control-label">Fotocopy Dokumen Kepemilikan</label>
                                                <div class="col-sm-8">
                                                    <button class="btn" :class="{'active btn-success':(verifikasi.check_fc_dokumen_kepemilikan === 'sesuai')}" @click.prevent="checklistVerifikasi('check_fc_dokumen_kepemilikan','sesuai')">Sesuai</button>
                                                    <button class="btn" :class="{'active btn-success':(verifikasi.check_fc_dokumen_kepemilikan === 'tidak sesuai')}" @click.prevent="checklistVerifikasi('check_fc_dokumen_kepemilikan','tidak sesuai')">Tidak Sesuai</button>
                                                    <button class="btn" :class="{'active btn-success':(verifikasi.check_fc_dokumen_kepemilikan === 'tidak ada')}" @click.prevent="checklistVerifikasi('check_fc_dokumen_kepemilikan','tidak ada')">Tidak Ada</button>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="box-body">
                                            <div class="form-group">
                                                <label for="exampleInputEmail1" class="col-sm-4 control-label">Surat keterangan pejabat struktural menyatakan kebenaran fotokopi dokumen kepemilikan </label>
                                                <div class="col-sm-8">
                                                    <button class="btn" :class="{'active btn-success':(verifikasi.check_kebenaran_fc_dokumen_kepemilikan === 'sesuai')}" @click.prevent="checklistVerifikasi('check_kebenaran_fc_dokumen_kepemilikan','sesuai')">Sesuai</button>
                                                    <button class="btn" :class="{'active btn-success':(verifikasi.check_kebenaran_fc_dokumen_kepemilikan === 'tidak sesuai')}" @click.prevent="checklistVerifikasi('check_kebenaran_fc_dokumen_kepemilikan','tidak sesuai')">Tidak Sesuai</button>
                                                    <button class="btn" :class="{'active btn-success':(verifikasi.check_kebenaran_fc_dokumen_kepemilikan === 'tidak ada')}" @click.prevent="checklistVerifikasi('check_kebenaran_fc_dokumen_kepemilikan','tidak ada')">Tidak Ada</button>
                                                </div>
                                            </div>
                                        </div> 
                                    </div>
                                    <div v-else>
                                        <div class="box-body">
                                            <div class="form-group">
                                                <label for="exampleInputEmail1" class="col-sm-4 control-label">SPTJM bermaterai bahwa barang tersebut adalah BMN dan digunakan untuk tugas dan fungsi</label>
                                                <div class="col-sm-8">
                                                    <button class="btn" :class="{'active btn-success':(verifikasi.check_sptjm_bermaterai === 'sesuai')}" @click.prevent="checklistVerifikasi('check_sptjm_bermaterai','sesuai')">Sesuai</button>
                                                    <button class="btn" :class="{'active btn-success':(verifikasi.check_sptjm_bermaterai === 'tidak sesuai')}" @click.prevent="checklistVerifikasi('check_sptjm_bermaterai','tidak sesuai')">Tidak Sesuai</button>
                                                    <button class="btn" :class="{'active btn-success':(verifikasi.check_sptjm_bermaterai === 'tidak ada')}" @click.prevent="checklistVerifikasi('check_sptjm_bermaterai','tidak ada')">Tidak Ada</button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="box-body">
                                            <div class="form-group">
                                                <label for="exampleInputEmail1" class="col-sm-4 control-label">Catatan Khusus </label>
                                                <div class="col-sm-8">
                                                    <textarea width="100%" v-model='verifikasi.noteDokumen'></textarea>
                                                </div>
                                            </div>
                                        </div> 
                                    

                                </div>
                            </div>
                        </tab-content>

                        <tab-content title="Pengecekan Dokumen" icon="fa fa-certificate" :before-change="beforeTab3SwitchKANWIL" >
                            <div class="box-header with-border">
                                <h3 class="box-title btn bg-maroon btn-flat margin">Hasil Verifikasi Dokumen</h3>
                            </div>
                            <div class="form-horizontal" >
                                <div class="box-body">
                                    <div class="form-group">
                                        <div class="col-sm-4">
                                            <div class="box-body2">
                                                <button class="btn btn-success">
                                                    <i class="fa fa-check"></i> Terbitkan KMK
                                                </button>
                                            </div>
                                        </div>
                                        <div class="col-sm-4">
                                            <div class="box-body2">
                                                <button class="btn btn-danger" >
                                                    <i class="fa fa-ban"></i> Butuh Kelengkapan Data 
                                                </button>
                                            </div>
                                        </div>
                                        <div class="col-sm-4">
                                            <div class="box-body2">
                                                <button class="btn btn-warning" >
                                                    <i class="fa fa-question"></i> Butuh Survei Lapangan 
                                                </button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="form-horizontal" >
                                <div class="box-body">
                                        <div v-for="(row, index) in daftarTembusan" >
                                            <div class="form-group">
                                                <label for="exampleInputEmail1" class="col-sm-3 control-label">Nama Tembusan {{index+1}}</label>
                                                <div class="col-sm-9">
                                                    <input type="text" class="form-control" placeholder="Masukkan Nama" v-model="row.nama">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                                <div class="col-sm-3 pull-right">
                                                 <button class="btn active btn-success" @click.prevent="addRowTembusan()">Add Tembusan</button>
                                                    
                                                </div>
                                        </div>

                                        <div class="form-group">
                                            <label for="exampleInputEmail1" class="col-sm-3 control-label">Jabatan Salinan</label>
                                            <div class="col-sm-9">
                                               <input type="text" class="form-control" placeholder="Masukkan Nama" v-model="verifikasi.jabatan_salinan">
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <label for="exampleInputEmail1" class="col-sm-3 control-label">Nama Salinan</label>
                                            <div class="col-sm-9">
                                               <input type="text" class="form-control" placeholder="Masukkan Nama" v-model="verifikasi.nama_salinan">
                                            </div>
                                        </div>

                                        <div class="form-group">
                                            <label for="exampleInputEmail1" class="col-sm-3 control-label">Nip Salinan</label>
                                            <div class="col-sm-9">
                                               <input type="text" class="form-control" placeholder="Masukkan Nama" v-model="verifikasi.nip_salinan">
                                            </div>
                                        </div>

                                </div>
                            </div>

                        </tab-content>
                        <tab-content title="Last step" icon="fa fa-check-circle" >
                            <div class="callout callout-success">
                                <h4>Terima Kasih</h4>
                                <h4>Permohonan Verifikasi Dokumen Telah Selesai dilakukan.</h4>
                            </div>
                        </tab-content>

                        <template slot="footer" slot-scope="props">
                            <div class="wizard-footer-right2">
                                <wizard-button v-if="!props.isLastStep" @click.native="props.nextTab()" class="wizard-footer-right" :style="props.fillButtonStyle">Save & Next</wizard-button>
                                <wizard-button v-else @click.native="clearPengajuanData" class="wizard-footer-right finish-button" :style="props.fillButtonStyle">{{props.isLastStep ? 'Done' : 'Next'}}</wizard-button>

                                <wizard-button v-if="props.activeTabIndex > 0" @click.native="props.prevTab()" class="btn btn-warning" :style="props.fillButtonStyle">Back</wizard-button>
                            </div>
                        </template>
                    </form-wizard>
                </div>

    </div>
</script>




