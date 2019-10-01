

var datepickerOptions = {}
Vue.use(window.AirbnbStyleDatepicker, datepickerOptions)
Vue.use(VueFormWizard)
Vue.use(VeeValidate)
Vue.use(VueTheMask)
Vue.use(VueMultiselect)
Vue.component('vue-multiselect', window.VueMultiselect.default)

//dynamic url
let myUrl = window.location.origin+"/";

if(myUrl.includes("localhost")){
  var pathArray = window.location.pathname.split( '/' );
  myUrl += pathArray [1] + "/";
}

Vue.component('hasil-pspbmn', {
            template: '#pspHasilVerifikasiWizardForm',
            props: ['datapengajuan','tipepengajuan','jenisform'],
            data() {
                 return {
                    url: myUrl,
                    choosePengajuan:this.datapengajuan,
                    verifikasi:{
                        id: '',
                        idPengajuan : '',
                        nama_verifikator : '123',
                        nip_verifikator : '123',
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
                        check_jenis_bmn:'sesuai',
                        check_nilai_bmn:'sesuai',
                        check_surat_permohonan:'sesuai',
                        check_rincian_usulan_bmn:'sesuai',
                        check_kib:'sesuai',
                        check_foto_bmn:'sesuai',
                        check_sk_delegasi:'sesuai',
                        check_dokumen_kepemilikan:'ada',
                        check_fc_dokumen_kepemilikan:'sesuai',
                        check_sptjm_bermaterai:'sesuai',
                        check_kebenaran_fc_dokumen_kepemilikan:'sesuai',
                        noteDokumen:'sesuai',
                        jabatan_salinan:'',
                        nama_salinan:'',
                        nip_salinan:'',
                        daftar_tembusan:'',
                        fileNDSPersetujuan:'',
                        fileHasilVerifikasi:'',
                        fileKMK:'',
                        fileNDSPermintaanKelengkapan:'',
                        fileNDSSurveyLapangan:'',
                        daftarKekuranganData:'',
                        hasil_verifikasi:'',                        
                        suratHasilVerifikasifinal:'',
                        suratKMKfinal:'',
                        suratSalinanKMKfinal:'',
                        suratNDSPermintaanKelengkapanfinal:'',
                        suratNDSSurveyLapanganfinal:'',
                        peraturan_pendelegasian_wewenang_KL:'',
                        alamat_kantor_pemohon:'',
                        rencana_survey:'',
                        nama_survey:'',
                        cp_survey:'',                        
                        fileHasilVerifikasi:'',
                        fileNDSPersetujuan:'',
                        fileHasilVerifikasi:'',
                        fileKMK:'',
                        fileSalinanKMK:'',
                        fileNDSPermintaanKelengkapan:'',
                        fileNDSSurveyLapangan:'',
                        isuploadUlangSuratHasilVerifikasifinal:false,
                        dokumenVerifikasiFinal:'',
                    },       

                    showDocumentVerifikasiFinal:false,             
                    showDocumentKekuranganFinal:false,             
                    showDocumentSurveyFinal:false,             
                    daftarTembusan:[{
                                        nama:''
                                    }],

                    daftarKekuranganData:[
                                    { nama:''}
                                    ],
                    option_data_kepala_seksi_kpknl:[],
                    option_data_kepala_bidang_kpknl:[],
                    temp_data_kepala_seksi_kpknl:{
                                              jabatan : '',
                                              status : '',
                                              nip : '',          
                                              nama : '' 
                                            },
                    temp_data_kepala_bidang_kpknl:{
                                              jabatan : '',
                                              status : '',
                                              nip : '',          
                                              nama : '' 
                                            },
                      data_kepala_seksi_kpknl:null,
                      data_kepala_bidang_kpknl:null,
                      showStatusJabatanKasi:false,
                      showStatusJabatanKabid:false,
                      isAdaDokumenKepemilikan: true,
                      showButtonhasilVerifikasi: true,
                      isButuhSurveyLapangan: false,
                      isButuhKelengkapanData: false,
                      isGenerateKMKDoc: false,
                      isShowUploadDokumenVerifikasi: false,
                      isShowLast: false,
                      jenisForm:this.jenisform,
                      successUpload:false,
                      isuploadUlangDokumenVerifikasiFinal:false,
                      isShowformUploadDokumenVerifikasiFinal:false,
                      isprosesUploadDokumenKelengkapan:false,
                      file1:'',

                }

            },
            updated: function () {
                
            },
            created(){
                //this.cekdokumenUpload()             
                this.getDataVerifikasiDokumen()                
                   
                
            },
            mounted(){
            },
            computed: {
                hrefImageLoader: function () {
                    // `this` points to the vm instance
                    return this.url+'/theme_costume/images/success.gif'
                    // return this.url
                },
                // a computed getter
                hrefDokumenVerifikasiFinal: function () {
                    // `this` points to the vm instance
                    return (this.verifikasi.suratHasilVerifikasifinal==='')?'':( this.url+'/uploads/'+this.verifikasi.suratHasilVerifikasifinal)
                    // return this.url
                },
            },
            methods:{

                finishVerifikasiSendEmail() {
                    let namaSurat = this.datapengajuan.kementerian_lembaga+'-'+this.datapengajuan.noSurat_pemohon
                    let tujuanEmail = this.datapengajuan.email_petugas
                    
                    if(this.datapengajuan.id!==''){
                        let self = this;
                        axios.post(this.url + "/hideend/verifikasi/finishPengajuan/"+tujuanEmail+"/"+namaSurat).then(function(response) {
                            
                            if (response.data.id!='') {
                                console.log("kirim email")
                                
                            } 

                        })
                    }


                },

                getDataVerifikasiDokumen:function(){
                    let self = this
                    axios.post(this.url + "/hideend/verifikasi/checkDocumentVerifikasi/"+this.choosePengajuan.id).then(function(response) {
                               console.log("masuk get verifikasi data")
                               console.log(response.data.dokumen)
                               self.verifikasi = response.data.dokumen[0]
                               self.loadfileFinal()    
                        })
                    
                },
                finishUploadHasil(){
                    let valueHide ={
                                    showWizardFormHASIL : false                                    
                                }
                    this.$emit('hide-form', valueHide)
                },
                loadfileFinal: function () {   
                    if(this.verifikasi.suratHasilVerifikasifinal===''){
                        this.isuploadUlangDokumenVerifikasiFinal=true
                        this.isShowformUploadDokumenVerifikasiFinal=true
                        this.isprosesUploadDokumenKelengkapan=false
                    }else{
                        this.isuploadUlangDokumenVerifikasiFinal=false
                    }    
                    
                },

                beforeTabHasilVerifikasi: function() {

                    let self = this
                    return this.$validator.validateAll("step1").then((result) => {
                        if (!result) {
                            alert('mohon melengkapi seluruh form diatas')
                            return false;
                        } else {
                            this.addVerifikasi("Dokumen Final Telah Diupload oleh Verifikator")
                            return true
                        }

                    })
                },
                uploadFileDokumenVerifikasiFinal: function() {
                    let formData = new FormData();
                    if(typeof this.$refs.dokumenVerifikasiFinal !== 'undefined'){
                       this.file1 = this.$refs.dokumenVerifikasiFinal.files[0];   
                       formData.append('file1', this.file1);  
                    }


                    if (true) {
                        let self = this
                        axios.post(this.url + '/hideend/verifikasi/uploadFileFinal', formData, {
                                headers: {
                                    'Content-Type': 'multipart/form-data'
                                }
                            })
                            .then(function(response) {
                                if (!response.data) {
                                    alert('File not uploaded All. Please check one of your file');
                                } else {
                                        if(response.data.tipe[0]==="file1"){
                                            self.isuploadUlangDokumenVerifikasiFinal = false
                                            self.verifikasi.suratHasilVerifikasifinal = response.data.file[0]
                                        }

                                    

                                }

                            })
                            .catch(function(error) {
                                self.isShowformUploadDokumenVerifikasiFinal=true
                                console.log(error);
                            });

                        this.successUpload = true
                    }else{
                        alert("Silakan diUpload semua dokumen")
                    }

                },
                clearAllForm(){
                    this.verifikasi={
                            id: '',
                            idPengajuan : '',
                            nama_verifikator : '',
                            nip_verifikator : '',
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
                            daftar_tembusan:''
                        }            

                },
                finishVerifikasiProses(){
                    
                    let valueHide ={
                                    isShowFormKPKNL : false                                    
                                }
                    this.$emit('send-data', valueHide)
                    this.clearAllForm()
                },

                addVerifikasi:function(status) {
                  
                    this.verifikasi.status_pengajuan = status
                    var formData = this.formData(this.verifikasi)
                    let self = this
                    if(this.verifikasi.id!=''){
                        axios.post(this.url + "/hideend/verifikasi/update", formData).then(function(response) {
                            if (response.data.error) {
                                console.log(response.data.msg);
                            } else {
                                self.updateStatusPengajuan(status)
                            }
                         })
                    }else{
                        axios.post(this.url + "/hideend/verifikasi/add", formData).then(function(response) {
                            if (response.data.error) {
                                console.log(response.data.msg);
                            } else {
                                self.verifikasi.id =response.data.id
                                self.updateStatusPengajuan(status)
                            }
                        })
                    }
                    

                },
                updateStatusPengajuan(status){
                    let pengajuan= {
                                idPengajuan:this.choosePengajuan.id,
                                status_pengajuan:status
                              }
                    var formData = this.formData(pengajuan);
                    axios.post(this.url + "/hideend/pengajuan/updateStatusPengajuan", formData).then(function(response) {
                            if (!response.data.error) {
                                return true;
                            } else {
                                return false;
                            }
                        })
                },
                formData(obj) {
                    var formData = new FormData();
                    for (var key in obj) {
                        formData.append(key, obj[key]);
                    }
                    return formData;
                },

                    }
                })


// Table
Vue.component('table-verifikasi-pspbmn', {
            template: '#pspTableVerifikasiWizard',
            data() {
                 return {
                    url: myUrl,
                    pengajuan:[],
                    emptyResult: false,
                    successMSG: '',
                    totalData:0,
                    currentPage: 0,
                    rowCountPage: 5,
                    pageRange: 2,
                    choosePengajuan:{},
                    jenisForm:{
                        'verifikasi':false,
                        'uploaddokumen':false,
                        'butuhsurvey':false,
                        'butuhkelengkapan':false,
                    },
                    
                 }

            },
            created(){
                this.showAll()
            },
            computed:{

            },
            methods:{

                    
                    refresh(){
                        this.showAll(); //for preventing
                    },

                    showAll(){ 
                        let self = this
                        axios.post(this.url+"/hideend/pengajuan/showAllbyIDProses").then(function(response){
                                 if(response.data.pengajuan == null){
                                        self.noResult()
                                    }else{
                                        self.getData(response.data.pengajuan);
                                    }
                        })
                    },
                    getData(pengajuan){
                        this.emptyResult = false; // become false if has a record
                        this.totalData = pengajuan.length //get total of user
                        this.pengajuan = pengajuan.slice(this.currentPage * this.rowCountPage, (this.currentPage * this.rowCountPage) + this.rowCountPage); //slice the result for pagination
                        
                         // if the record is empty, go back a page
                        if(this.pengajuan.length == 0 && this.currentPage > 0){ 
                            this.pageUpdate(self.currentPage - 1)
                            this.clearAll();  
                        }
                    },
                    pageUpdate(pageNumber){
                        this.currentPage = pageNumber; //receive currentPage number came from pagination template
                        this.refresh()  
                    },
                    selectPengajuan(data){
                        this.choosePengajuan = data
                    },
                    selectJenisForm(jenisForm){
                        if(jenisForm==='verifikasi'){
                            this.jenisForm.verifikasi = true
                            this.jenisForm.uploaddokumen = false
                            this.jenisForm.butuhsurvey = false
                            this.jenisForm.butuhkelengkapan = false
                        }else if(jenisForm==='Terbitkan KMK Dokumen'){
                            this.jenisForm.verifikasi = false
                            this.jenisForm.uploaddokumen = true
                            this.jenisForm.butuhsurvey = false
                            this.jenisForm.butuhkelengkapan = false
                        }else if(jenisForm==='Butuh Survey Lapangan'){
                            this.jenisForm.verifikasi = false
                            this.jenisForm.uploaddokumen = false
                            this.jenisForm.butuhsurvey = true
                            this.jenisForm.butuhkelengkapan = false
                        }else if(jenisForm==='Butuh Kelengkapan Data'){
                            this.jenisForm.verifikasi = false
                            this.jenisForm.uploaddokumen = false
                            this.jenisForm.butuhsurvey = false
                            this.jenisForm.butuhkelengkapan = true
                        }

                    },
                    getDataChoosePengajuan(){
                         this.$emit('send-data', this.choosePengajuan)
                    },
                    getJenisForm(){
                         this.$emit('send-jenisform', this.jenisForm)
                    },
                    showHasilVerifikasi(){
                         let hasil = true
                         this.$emit('show-hasil',hasil)
                    }

        },
        })






var v = new Vue({
    el: '#app',
    data: {
        url: myUrl,
        verifikasi:{},
        jenisForm:{
                        'verifikasi':false,
                        'uploaddokumen':false,
                        'butuhsurvey':false,
                        'butuhkelengkapan':false,
                    },

        isShowFormKANWIL: false,
        isShowFormKPKNL: false,           
        showWizardFormHASIL: false,           

        choosePengajuan:{},
        emptyResult: false,
        successMSG: '',
        totalData:0,
        tpBtn: 0,
        isDisabled: 1,
        enableEnquiry: false,
        inputDateOne: '',
        inputDateTwo: '',
        sundayFirst: false,
        alignRight: false,
        trigger: false,
        showVerifikasiWizardForm:false,
        showWizardFormHASIL:false,
        showTablePengajuan:true,
        areaProsesText: '',
        statusFirstSelect:false,
        jenisProses: '',
        isAdaDokumenKepemilikan: true,
        showVerifikasiWizardTable: true,
        showButtonhasilVerifikasi: true,
            daftarTembusan:[{
                            nama:''
                        }]
    },
    created() {

    },
    computed: {
        // a computed getter
        hrefFileSuratPermohon: function () {
            // `this` points to the vm instance
            return this.url+'/uploads/'+this.choosePengajuan.fileSuratPermohon
        },
        // a computed getter
        hrefFileDaftarRincian: function () {
            // `this` points to the vm instance
            return this.url+'/uploads/'+this.choosePengajuan.fileDaftarRincian
        },
        // a computed getter
        hrefFileDokumenKelengkapan: function () {
            // `this` points to the vm instance
            return this.url+'/uploads/'+this.choosePengajuan.fileDokumenKelengkapan
        }
    },
    methods: {

        showHasilForm() {
            this.showVerifikasiWizardForm = false
            this.showVerifikasiWizardTable = false
            this.showWizardFormHASIL = true
        },
        finishProsesUploadHasil(value) {
            this.showWizardFormHASIL = value.showWizardFormHASIL     
            this.showVerifikasiWizardForm = false
            this.showVerifikasiWizardTable = true
        },
        finishProsesVerifikasi(value) {
            if(this.jenisProses=="KANWIL"){
                //hide FORM KANWIL
                this.isShowFormKANWIL = value.isShowFormKANWIL
            }            

            if(this.jenisProses=="KPKNL"){
                //hide FORM KPKNL
                this.isShowFormKPKNL = value.isShowFormKPKNL
            }
            this.showVerifikasiWizardForm = false
            this.showVerifikasiWizardTable = true
        },
        getJenisForm(value) {
            this.jenisForm = value
        },
        getDataChoosePengajuan(value) {
            this.choosePengajuan = value

            this.showVerifikasiWizardTable = false
            this.showVerifikasiWizardForm = true
            this.pspTableVerifikasiWizard = false
            let str = this.choosePengajuan.status_proses 
            this.getDataVerifikasi()
            if(str.includes("KPKNL")){
                 this.showVerifikasiWizardForm = true
                 this.isShowFormKPKNL = true
                 this.jenisProses = "KPKNL"
            }

            if(str.includes("KANWIL")){
                 this.showVerifikasiWizardForm = true
                 this.isShowFormKANWIL = true
                 this.jenisProses = "KANWIL"
            }           
        },
       
        getDataVerifikasi:function(){
            axios.post(this.url + "/hideend/verifikasi/checkDocumentVerifikasi/"+this.choosePengajuan.id).then(function(response) {
                 
                    if (response.data.dokumen) {
                        v.verifikasi =  response.data.dokumen[0]
                    
                    }
                })  
        },







    }
})