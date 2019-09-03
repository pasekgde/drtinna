Vue.component('verifikasi-pspbmn-djkn', {
            template: '#pspVerifikasiWizardFormDJKN',
            data() {
                 return {
                    
                    verifikasi:{
                        id: '',
                        idPengajuan : '',
                        nama_petugas : '',
                        nip_petugas : '',
                        nip_kepala_seksi:'',
                        nama_kepala_seksi:'',
                        jabatan_kepala_seksi:'',
                        status_kepala_seksi:'',
                        nip_kepala_bidang:'',            
                        nama_kepala_bidang:'',            
                        jabatan_kepala_bidang:'',            
                        status_kepala_bidang:'',
                        nip_kepala_kanwil:'',                        
                        nama_kepala_kanwil:'',                        
                        jabatan_kepala_kanwil:'',                        
                        status_kepala_kanwil:'',
                        check_jenis_bmn:'',
                        check_nilai_bmn:'',
                        check_surat_permohonan:'',
                        check_rincian_usulan_bmn:'',
                        check_kib:'',
                        check_foto_bmn:'',
                        check_sk_delegasi:'',
                        check_dokumen_kepemilikan:'',
                        check_fc_dokumen_kepemilikan:'',
                        check_sptjm_bermaterai:'',
                        check_kebenaran_fc_dokumen_kepemilikan:'',
                        noteDokumen:'',
                        jabatan_salinan:'',
                        nama_salinan:'',
                        nip_salinan:'',
                        daftarTembusan:[{
                                        nama:''
                                    }]
                    },
                 }

            },
            methods:{
                beforeTab1SwitchKPKNL: function() {
                    return this.$validator.validateAll("step1KPKNL").then((result) => {
                        if (!result) {
                            alert('mohon melengkapi seluruh form diatas')
                            return false;
                        } else {
                            this.addVerifikasiForm("Proses by Verifikator")
                            return true
                        }

                    })
                },
                beforeTab2SwitchKPKNL: function() {
                    this.addVerifikasiForm("Dokumen Fisik telah Dicek")
                    return true
                },

                addVerifikasiForm(status) {
                    //Assign Kepala Seksi
                    this.verifikasi.jabatan_kepala_seksi = this.data_kepala_seksi.jabatan
                    this.verifikasi.status_kepala_seksi = this.data_kepala_seksi.status
                    this.verifikasi.nama_kepala_seksi = this.data_kepala_seksi.nama
                    this.verifikasi.nip_kepala_seksi = this.data_kepala_seksi.nip

                    //Assign Kepala Bidang
                    this.verifikasi.jabatan_kepala_bidang = this.data_kepala_bidang.jabatan
                    this.verifikasi.status_kepala_bidang = this.data_kepala_bidang.status
                    this.verifikasi.nama_kepala_bidang = this.data_kepala_bidang.nama
                    this.verifikasi.nip_kepala_bidang = this.data_kepala_bidang.nip
            
                    //Assign Kepala Kanwil
                    if(this.data_kepala_kanwil){
                      this.verifikasi.jabatan_kepala_kanwil = this.data_kepala_kanwil.jabatan
                      this.verifikasi.status_kepala_kanwil = this.data_kepala_kanwil.status
                      this.verifikasi.nama_kepala_kanwil = this.data_kepala_kanwil.nama
                      this.verifikasi.nip_kepala_kanwil = this.data_kepala_kanwil.nip
                    }  

                    this.status_pengajuan = status

                        if(this.choosePengajuan.id){
                            var formData = this.formData(this.verifikasi);
                            let self = this
                            if(this.verifikasi.id!=''){
                                axios.post(this.url + "/hideend/verifikasi/update", formData).then(function(response) {
                                    if (response.data.error) {
                                        console.log(response.data.msg);
                                    } else {
                                        self.updateStatusPengajuan()
                                    }
                                })

                            }else{
                                axios.post(this.url + "/hideend/verifikasi/add", formData).then(function(response) {
                                    if (response.data.error) {
                                        console.log(response.data.msg);
                                    } else {
                                        self.verifikasi.id =response.data.id
                                        self.updateStatusPengajuan()
                                    }
                                })
                            }
                    

                        }else{
                                alert("Data Pengajuan Belum di Pilih!")
                        }
                },
                updateStatusPengajuan(){
                    let pengajuan= {
                                idPengajuan:v.choosePengajuan.id,
                                status_pengajuan: v.status_pengajuan
                              }
                    var formData = v.formData(pengajuan);
                    axios.post(this.url + "/hideend/pengajuan/updateStatusPengajuan", formData).then(function(response) {
                            if (response.data.numdata==0) {
                                return false;
                            } else {
                                return true;
                            }
                        })
                },
            }
        })
