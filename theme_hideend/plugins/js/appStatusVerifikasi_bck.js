

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


Vue.component('verifikasi-pspbmn-kpknl', {
            template: '#pspVerifikasiWizardFormKPKNL',
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
                        daftarKekuranganData:'',
                        hasil_verifikasi:'',
                        peraturan_pendelegasian_wewenang_KL:'',                     
                        suratHasilVerifikasifinal:'',
                        suratKMKfinal:'',
                        suratSalinanKMKfinal:'',
                        suratNDSPermintaanKelengkapanfinal:'',
                        suratNDSSurveyLapanganfinal:'',
                        alamat_kantor_pemohon:'',
                        rencana_survey:'',
                        nama_survey:'',
                        cp_survey:'',
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
                      uploadUlangSuratHasilVerifikasifinal:false,
                      uploadUlangSuratNDSPermintaanKelengkapanfinal:false,
                      uploadUlangSuratNDSSurveyLapanganfinal:false,
                }

            },
            created(){
                this.getKepalaSeksiKPKNL() 
                this.getKepalaBidangKPKNL() 
                this.getDataVerifikasiDokumen()
                this.loadfileFinal()
            },
            computed: {
                hrefImageLoader: function () {
                    // `this` points to the vm instance
                    return this.url+'/theme_costume/images/success.gif'
                    // return this.url
                },
                // a computed getter
                hrefsuratNDSPersetujuanfinal: function () {
                    if(this.verifikasi.suratNDSPersetujuanfinal===''){
                        this.uploadUlangSuratNDSPersetujuanfinal=true
                    }else{
                        this.uploadUlangSuratNDSPersetujuanfinal=false
                    }
                    // `this` points to the vm instance
                    return this.url+'/uploads/'+this.verifikasi.suratNDSPersetujuanfinal
                    // return this.url
                },
                // a computed getter
                hrefsuratHasilVerifikasifinal: function () {

                    console.log("this.verifikasi.suratHasilVerifikasifinal")
                    console.log(this.verifikasi.suratHasilVerifikasifinal)
                    console.log(this.verifikasi)
                    if(this.verifikasi.suratHasilVerifikasifinal===''){
                        this.uploadUlangSuratHasilVerifikasifinal=true
                    }else{
                        this.uploadUlangSuratHasilVerifikasifinal=false
                    }
                    // `this` points to the vm instance
                    return this.url+'/uploads/'+this.verifikasi.suratHasilVerifikasifinal
                    // return this.url
                },
                // a computed getter
                hrefsuratKMKfinal: function () {
                    // `this` points to the vm instance
                    if(this.verifikasi.suratKMKfinal===''){
                        this.uploadUlangSuratHasilVerifikasifinal=true
                    }else{
                        this.uploadUlangSuratHasilVerifikasifinal=false
                    }
                    return this.url+'/uploads/'+this.verifikasi.suratKMKfinal
                    // return this.url
                },
                // a computed getter
                hrefsuratSalinanKMKfinal: function () {
                    // `this` points to the vm instance
                    if(this.verifikasi.suratSalinanKMKfinal===''){
                        this.uploadUlangSuratHasilVerifikasifinal=true
                    }else{
                        this.uploadUlangSuratHasilVerifikasifinal=false
                    }
                    return this.url+'/uploads/'+this.verifikasi.suratSalinanKMKfinal
                    // return this.url
                },
                // a computed getter
                hrefsuratNDSPermintaanKelengkapanfinal: function () {

                    if(this.verifikasi.suratNDSPermintaanKelengkapanfinal===''){
                        this.uploadUlangSuratHasilVerifikasifinal=true
                    }else{
                        this.uploadUlangSuratHasilVerifikasifinal=false
                    }
                    // `this` points to the vm instance
                    return this.url+'/uploads/'+this.verifikasi.suratNDSPermintaanKelengkapanfinal
                    // return this.url
                },
                // a computed getter
                hrefsuratNDSSurveyLapanganfinal: function () {
                     if(this.verifikasi.suratNDSSurveyLapanganfinal===''){
                        this.uploadUlangSuratNDSSurveyLapanganfinal=true
                    }else{
                        this.uploadUlangSuratNDSSurveyLapanganfinal=false
                    }
                    // `this` points to the vm instance
                    return this.url+'/uploads/'+this.verifikasi.suratNDSSurveyLapanganfinal
                    // return this.url
                },
                // a computed getter
                hrefFileSuratPermohon: function () {
                    // `this` points to the vm instance
                    return this.url+'/uploads/'+this.choosePengajuan.fileSuratPermohon
                    // return this.url
                },
                // a computed getter
                hrefFileDaftarRincian: function () {
                    // `this` points to the vm instance
                    return this.url+'/uploads/'+this.choosePengajuan.fileDaftarRincian
                    //return this.url
                },
                // a computed getter
                hrefFileDokumenKelengkapan: function () {
                    // `this` points to the vm instance
                    return this.url+'/uploads/'+this.choosePengajuan.fileDokumenKelengkapan
                    //return this.url
                },

                 // a computed getter
                hreffileNDSPersetujuan: function () {
                    // `this` points to the vm instance
                    return this.url+this.verifikasi.fileNDSPersetujuan
                    // return this.url
                },
                // a computed getter
                hreffileHasilVerifikasi: function () {
                    // `this` points to the vm instance
                    return this.url+this.verifikasi.fileHasilVerifikasi
                    //return this.url
                },
                // a computed getter
                hreffileKMK: function () {
                    // `this` points to the vm instance
                    return this.url+this.verifikasi.fileKMK
                    //return this.url
                },
                // a computed getter
                hreffileSalinanKMK: function () {
                    // `this` points to the vm instance
                    return this.url+this.verifikasi.fileKMK
                    //return this.url
                },
                // a computed getter
                hreffileNDSPermintaanKelengkapan: function () {
                    // `this` points to the vm instance
                    return this.url+this.verifikasi.fileNDSPermintaanKelengkapan
                    //return this.url
                },
                // a computed getter
                hreffileNDSSurveyLapangan: function () {
                    // `this` points to the vm instance
                    return this.url+this.verifikasi.fileNDSSurveyLapangan
                    //return this.url
                }
            },
            methods:{

                  // a computed getter
                loadfileFinal: function () {
                    console.log("loadfileFinal")
                    if(this.verifikasi.suratNDSPersetujuanfinal===''){
                        this.uploadUlangSuratNDSPersetujuanfinal=true
                    }else{
                        this.uploadUlangSuratNDSPersetujuanfinal=false
                    }

                    if(this.verifikasi.suratHasilVerifikasifinal===''){
                        this.uploadUlangSuratHasilVerifikasifinal=true
                    }else{
                        this.uploadUlangSuratHasil
                    }    
                    // `this` points to the vm instance
                    if(this.verifikasi.suratKMKfinal===''){
                        this.uploadUlangSuratHasilVerifikasifinal=true
                    }else{
                        this.uploadUlangSuratHasilVerifikasifinal=false
                    }

                    if(this.verifikasi.suratSalinanKMKfinal===''){
                        this.uploadUlangSuratHasilVerifikasifinal=true
                    }else{
                        this.uploadUlangSuratHasilVerifikasifinal=false
                    }

                    if(this.verifikasi.suratNDSPermintaanKelengkapanfinal===''){
                        this.uploadUlangSuratHasilVerifikasifinal=true
                    }else{
                        this.uploadUlangSuratHasilVerifikasifinal=false
                    }
                },
                // a computed getter
                hrefsuratNDSSurveyLapanganfinal: function () {
                     if(this.verifikasi.suratNDSSurveyLapanganfinal===''){
                        this.uploadUlangSuratNDSSurveyLapanganfinal=true
                    }else{
                        this.uploadUlangSuratNDSSurveyLapanganfinal=false
                    }
                    // `this` points to the vm instance
                    return this.url+'/uploads/'+this.verifikasi.suratNDSSurveyLapanganfinal
                    // return this.url
                },

                beforeTabHasilVerifikasi: function() {

                    let self = this
                    return this.$validator.validateAll("step2").then((result) => {
                        if (!result) {
                            alert('mohon melengkapi seluruh form diatas')
                            return false;
                        } else {
                            this.addVerifikasi("Dokumen Final Telah Diupload oleh Verifikator")
                            return true
                        }

                    })
                },
                uploadFileKelengkapan: function() {
                    this.file1 = this.$refs.suratHasilVerifikasifinal.files[0];
                    this.file2 = this.$refs.suratNDSPermintaanKelengkapanfinal.files[0];
                    console.log("masukkk")
                    if (this.file1 && this.file2) {
                         console.log("masukkk2")
                        let formData = new FormData();
                        formData.append('file1', this.file1);
                        formData.append('file2', this.file2);
                        let self = this
                        axios.post(this.url + '/hideend/verifikasi/uploadFileKelengkapan', formData, {
                                headers: {
                                    'Content-Type': 'multipart/form-data'
                                }
                            })
                            .then(function(response) {
                                if (!response.data) {
                                    alert('File not uploaded All. Please check one of your file');
                                } else {
                                    self.verifikasi.suratHasilVerifikasifinal = response.data.file[0]
                                    self.verifikasi.suratNDSPermintaanKelengkapanfinal = response.data.file[1]

                                }

                            })
                            .catch(function(error) {
                                console.log(error);
                            });
                            this.successUpload = true
                    }else{
                        alert("Silakan diUpload semua dokumen")
                    }

                },
                uploadFileSurvey: function() {
                    this.file1 = this.$refs.suratHasilVerifikasifinal.files[0];
                    this.file2 = this.$refs.suratNDSSurveyLapanganfinal.files[0];
                    console.log("masuk survey")
                    if (this.file1 && this.file2) {
                        console.log("masuk survey2")
                        let formData = new FormData();
                        formData.append('file1', this.file1);
                        formData.append('file2', this.file2);

                        let self = this
                        axios.post(this.url + '/hideend/verifikasi/uploadFileSurvey', formData, {
                                headers: {
                                    'Content-Type': 'multipart/form-data'
                                }
                            })
                            .then(function(response) {
                                if (!response.data) {
                                    alert('File not uploaded All. Please check one of your file');
                                } else {
                                    self.verifikasi.suratHasilVerifikasifinal = response.data.file[0]
                                    self.verifikasi.suratNDSSurveyLapanganfinal = response.data.file[1]

                                }

                            })
                            .catch(function(error) {
                                console.log(error);
                            });
                            this.successUpload=true
                    }else{
                        alert("Silakan diUpload semua dokumen")
                    }

                },
                uploadFileComplete: function() {

                    this.file1 = this.$refs.suratNDSPersetujuanfinal.files[0];
                    this.file2 = this.$refs.suratHasilVerifikasifinal.files[0];
                    this.file3 = this.$refs.suratKMKfinal.files[0];
                    this.file4 = this.$refs.suratSalinanKMKfinal.files[0];

                    if (this.file1 && this.file2 && this.file3 && this.file4) {

                        let formData = new FormData();
                        formData.append('file1', this.file1);
                        formData.append('file2', this.file2);
                        formData.append('file3', this.file3);
                        formData.append('file4', this.file4);
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
                                    self.successUpload = true
                                    self.verifikasi.suratNDSPersetujuanfinal = response.data.file[0]
                                    self.verifikasi.suratHasilVerifikasifinal = response.data.file[1]
                                    self.verifikasi.suratKMKfinal = response.data.file[2]
                                    self.verifikasi.suratSalinanKMKfinal = response.data.file[3]

                                }

                            })
                            .catch(function(error) {
                                console.log(error);
                            });

                        this.successUpload = true
                    }else{
                        alert("Silakan diUpload semua dokumen")
                    }

                },
                btnDataSurveyLapangan(){
                    this.isGenerateKMKDoc = false
                    this.isButuhKelengkapanData = false
                    this.isButuhSurveyLapangan = true

                    this.verifikasi.daftarKekuranganData=[]
                    this.verifikasi.daftar_tembusan=[]
                    this.daftarTembusan = []
                    this.verifikasi.jabatan_salinan=''
                    this.verifikasi.nama_salinan=''
                    this.verifikasi.nip_salinan=''

                    this.verifikasi.hasil_verifikasi = "Butuh Survey Lapangan"

                    let GabungData = {...this.verifikasi,...this.choosePengajuan}
                    this.clearGenerateDoc()
                    GabungData.id = this.verifikasi.id
                    var formData = this.formData(GabungData);
                    let self = this

                    axios.post(this.url + "/hideend/verifikasi/generateSurveyLapanganKPKNL/",formData).then(function(response) {
                            if (true) {
                                self.verifikasi.fileNDSPersetujuan = response.data.dokumen.fileNDSPersetujuan
                                self.verifikasi.fileHasilVerifikasi = response.data.dokumen.fileHasilVerifikasi
                                self.verifikasi.fileKMK = response.data.dokumen.fileKMK
                                self.verifikasi.fileSalinanKMK = response.data.dokumen.fileSalinanKMK
                                self.verifikasi.fileNDSPermintaanKelengkapan = response.data.dokumen.fileNDSPermintaanKelengkapan
                                self.verifikasi.fileNDSSurveyLapangan = response.data.dokumen.fileNDSSurveyLapangan
           
                            }
                        })
                },
                btnGenerateKelengkapanDoc(){
                    this.isGenerateKMKDoc = false
                    this.isButuhKelengkapanData = true
                    this.isButuhSurveyLapangan = false

                    this.verifikasi.rencana_survey='' 
                    this.verifikasi.nama_survey='' 
                    this.verifikasi.cp_survey='' 
                    this.verifikasi.daftar_tembusan=[]
                    this.daftarTembusan = []
                    this.verifikasi.jabatan_salinan=''
                    this.verifikasi.nama_salinan=''
                    this.verifikasi.nip_salinan=''

                    this.verifikasi.daftarKekuranganData = JSON.stringify(this.daftarKekuranganData)  
                    this.verifikasi.hasil_verifikasi = "Butuh Kelengkapan Data"  
                                        

                    let GabungData = {...this.verifikasi,...this.choosePengajuan}
                    this.clearGenerateDoc()
                    GabungData.id = this.verifikasi.id
                    var formData = this.formData(GabungData);
                    let self = this

                    axios.post(this.url + "/hideend/verifikasi/generateKelengkapanDataKPKNL/",formData).then(function(response) {
                            if (true) {                                
                                self.verifikasi.fileNDSPersetujuan = response.data.dokumen.fileNDSPersetujuan
                                self.verifikasi.fileHasilVerifikasi = response.data.dokumen.fileHasilVerifikasi
                                self.verifikasi.fileKMK = response.data.dokumen.fileKMK
                                self.verifikasi.fileSalinanKMK = response.data.dokumen.fileSalinanKMK
                                self.verifikasi.fileNDSPermintaanKelengkapan = response.data.dokumen.fileNDSPermintaanKelengkapan
                                self.verifikasi.fileNDSSurveyLapangan = response.data.dokumen.fileNDSSurveyLapangan          
                            }
                        })
                },
                btnGenerateKMKDoc(){
                    this.isGenerateKMKDoc = true
                    this.isButuhKelengkapanData = false
                    this.isButuhSurveyLapangan = false    
                    this.verifikasi.rencana_survey='' 
                    this.verifikasi.nama_survey='' 
                    this.verifikasi.cp_survey='' 
                    this.verifikasi.daftarKekuranganData=[]
                    this.verifikasi.hasil_verifikasi = "Terbitkan KMK Dokumen" 
                    this.verifikasi.daftar_tembusan = JSON.stringify(this.daftarTembusan) 
                    let GabungData = {...this.verifikasi,...this.choosePengajuan}

                    this.clearGenerateDoc()
                    GabungData.id = this.verifikasi.id
                    var formData = this.formData(GabungData);
                    let self = this
                    axios.post(this.url + "/hideend/verifikasi/generateDocKPKNL/",formData).then(function(response) {
                            console.log("btnGenerateKMKDoc")     
                            console.log(response.data.dokumen)     
                            if (true) {
                                self.verifikasi.fileNDSPersetujuan = response.data.dokumen.fileNDSPersetujuan
                                self.verifikasi.fileHasilVerifikasi = response.data.dokumen.fileHasilVerifikasi
                                self.verifikasi.fileKMK = response.data.dokumen.fileKMK
                                self.verifikasi.fileSalinanKMK = response.data.dokumen.fileSalinanKMK
                                self.verifikasi.fileNDSPermintaanKelengkapan = response.data.dokumen.fileNDSPermintaanKelengkapan
                                self.verifikasi.fileNDSSurveyLapangan = response.data.dokumen.fileNDSSurveyLapangan
           
                            }
                        })

                },
                uploadFile: function() {

                    this.file1 = this.$refs.fileSuratPermohon.files[0];
                    this.file2 = this.$refs.fileDaftarRincian.files[0];
                    this.file3 = this.$refs.fileDokumenKelengkapan.files[0];
                    this.file4 = this.$refs.fileUploadBackupSimak.files[0];

                    if (this.file1 && this.file2 && this.file3 && this.file4) {

                        let formData = new FormData();
                        formData.append('file1', this.file1);
                        formData.append('file2', this.file2);
                        formData.append('file3', this.file3);
                        formData.append('file4', this.file4);

                        axios.post(this.url + '/hideend/verifikasi/uploadFileFinal', formData, {
                                headers: {
                                    'Content-Type': 'multipart/form-data'
                                }
                            })
                            .then(function(response) {
                                if (!response.data) {
                                    alert('File not uploaded All. Please check one of your file');
                                } else {
                                    v.pengajuan.fileSuratPermohon = response.data.file[0]
                                    v.pengajuan.fileDaftarRincian = response.data.file[1]
                                    v.pengajuan.fileDokumenKelengkapan = response.data.file[2]
                                    v.pengajuan.fileUploadBackupSimak = response.data.file[3]

                                }

                            })
                            .catch(function(error) {
                                console.log(error);
                            });
                    }

                },
                generateKMKDoc(){
                    this.isGenerateKMKDoc = true
                    this.isButuhKelengkapanData = false
                    this.isButuhSurveyLapangan = false  
                },
                butuhKelengkapanData(){
                    this.isGenerateKMKDoc = false
                    this.isButuhKelengkapanData = true
                    this.isButuhSurveyLapangan = false
                },
                butuhSurveyLapangan(){
                    this.isGenerateKMKDoc = false
                    this.isButuhKelengkapanData = false
                    this.isButuhSurveyLapangan = true
                },
                //1
                deleteRowKurangData(index){
                    if(this.daftarKekuranganData.length>1){
                        this.daftarKekuranganData.splice(index, 1);
                    }
                },
                deleteRow(index){
                    if(this.daftarTembusan.length>1){
                        this.daftarTembusan.splice(index, 1);
                    }
                },


                addRowKurangData(){
                    this.daftarKekuranganData.push({'nama': ''});
                },

                addRowTembusan(){
                    this.daftarTembusan.push({'nama': ''});
                },
                getDataVerifikasiDokumen:function(){
                    let self = this
                    axios.post(this.url + "/hideend/verifikasi/checkDocumentVerifikasi/"+this.choosePengajuan.id).then(function(response) {
                               console.log("masuk get verifikasi data")
                               console.log(response.data.dokumen)

                                self.showStatusJabatanKasi = true
                                self.showStatusJabatanKabid = true


                                self.data_kepala_seksi_kpknl = {
                                                        jabatan : self.option_data_kepala_seksi_kpknl[0].jabatan,
                                                        status : self.option_data_kepala_seksi_kpknl[0].status,
                                                        nip : self.option_data_kepala_seksi_kpknl[0].nip,          
                                                        nama : self.option_data_kepala_seksi_kpknl[0].nama 
                                                }
                                self.temp_data_kepala_seksi_kpknl = {
                                                        jabatan : self.option_data_kepala_seksi_kpknl[0].jabatan,
                                                        status : self.option_data_kepala_seksi_kpknl[0].status,
                                                        nip : self.option_data_kepala_seksi_kpknl[0].nip,          
                                                        nama : self.option_data_kepala_seksi_kpknl[0].nama 
                                                }                        
                                self.data_kepala_bidang_kpknl = {
                                                        jabatan : self.option_data_kepala_bidang_kpknl[0].jabatan,
                                                        status : self.option_data_kepala_bidang_kpknl[0].status,
                                                        nip : self.option_data_kepala_bidang_kpknl[0].nip,          
                                                        nama : self.option_data_kepala_bidang_kpknl[0].nama 
                                                }

                                self.temp_data_kepala_bidang_kpknl = {
                                                        jabatan : self.option_data_kepala_bidang_kpknl[0].jabatan,
                                                        status : self.option_data_kepala_bidang_kpknl[0].status,
                                                        nip : self.option_data_kepala_bidang_kpknl[0].nip,          
                                                        nama : self.option_data_kepala_bidang_kpknl[0].nama 
                                                }
                            if (response.data.dokumen) {


                                self.verifikasi =  response.data.dokumen[0]
                                self.verifikasi.jabatan_salinan = (response.data.dokumen[0].jabatan_salinan === "null")?'':response.data.dokumen[0].jabatan_salinan
                                self.verifikasi.nama_salinan = (response.data.dokumen[0].nama_salinan === "null")?'':response.data.dokumen[0].nama_salinan
                                self.verifikasi.nip_salinan = (response.data.dokumen[0].nip_salinan === "null")?'':response.data.dokumen[0].nip_salinan
                                self.verifikasi.peraturan_pendelegasian_wewenang_KL = (response.data.dokumen[0].peraturan_pendelegasian_wewenang_KL === "null")?'':response.data.dokumen[0].peraturan_pendelegasian_wewenang_KL
                                console.log(response.data.dokumen[0].daftarKekuranganData)    
                                console.log("null? KPKNL")      

                                 if(response.data.dokumen[0].daftarKekuranganData==="null" || response.data.dokumen[0].daftarKekuranganData===""){
                                    self.daftarKekuranganData = [{
                                                                nama:''
                                                            }] 
                                }else{ 
                                    self.daftarKekuranganData = JSON.parse(response.data.dokumen[0].daftarKekuranganData) 
                                }      


                                if(response.data.dokumen[0].daftar_tembusan==='null' || response.data.dokumen[0].daftar_tembusan===''|| response.data.dokumen[0].daftar_tembusan==='[]'){
                                     self.daftarTembusan = [{
                                                                nama:''
                                                            }]  
                                   
                                }else{
                                    self.daftarTembusan = JSON.parse(response.data.dokumen[0].daftar_tembusan) 
                                   
                                }                
                                             
                            }
                        })
                },

                clearGenerateDoc(){
                    this.showDocumentVerifikasiFinal = false
                    this.showDocumentKekuranganFinal = false
                    this.showDocumentSurveyFinal = false
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
                    this.clearAllForm()
                    let valueHide ={
                                    isShowFormKPKNL : false                                    
                                }
                    this.$emit('send-data', valueHide)
                },
                checklistVerifikasi($jenisButton,$value){
                    if($jenisButton==='check_jenis_bmn'){
                        this.verifikasi.check_jenis_bmn = $value
                    }
                    if($jenisButton==='check_nilai_bmn'){
                        this.verifikasi.check_nilai_bmn = $value
                    }
                    if($jenisButton==='check_surat_permohonan'){
                        this.verifikasi.check_surat_permohonan = $value
                    }
                    if($jenisButton==='check_rincian_usulan_bmn'){
                        this.verifikasi.check_rincian_usulan_bmn = $value
                    }
                    if($jenisButton==='check_kib'){
                        this.verifikasi.check_kib = $value
                    }
                    if($jenisButton==='check_foto_bmn'){
                        this.verifikasi.check_foto_bmn = $value
                    }
                    if($jenisButton==='check_sk_delegasi'){
                        this.verifikasi.check_sk_delegasi = $value
                    }
                    if($jenisButton==='check_dokumen_kepemilikan'){
                        this.verifikasi.check_dokumen_kepemilikan = $value
                    }
                    if($jenisButton==='check_fc_dokumen_kepemilikan'){
                        this.verifikasi.check_fc_dokumen_kepemilikan = $value
                    }
                    if($jenisButton==='check_sptjm_bermaterai'){
                        this.verifikasi.check_sptjm_bermaterai = $value
                    }
                    if($jenisButton==='check_kebenaran_fc_dokumen_kepemilikan'){
                        this.verifikasi.check_kebenaran_fc_dokumen_kepemilikan = $value
                    }

                },

                //ubah ini semua
                pickStatusJabatanKasiKPKNL(statusJabatan) {

                     if(statusJabatan === this.temp_data_kepala_seksi_kpknl.status ){
                        
                           this.data_kepala_seksi_kpknl = {
                                                        jabatan : this.temp_data_kepala_seksi_kpknl.jabatan,
                                                        status : statusJabatan,
                                                        nip : this.temp_data_kepala_seksi_kpknl.nip,          
                                                        nama : this.temp_data_kepala_seksi_kpknl.nama 
                                                    }
                    }else{
                            this.data_kepala_seksi_kpknl = {
                                                        jabatan : this.temp_data_kepala_seksi_kpknl.jabatan,
                                                        status : statusJabatan,
                                                        nip : '',          
                                                        nama : '' 
                                                    }
                    }
                },
                pickStatusJabatanKabidKPKNL(statusJabatan) {

                    if(statusJabatan === this.temp_data_kepala_bidang_kpknl.status ){
                            this.data_kepala_bidang_kpknl = {
                                                       jabatan : this.temp_data_kepala_bidang_kpknl.jabatan,
                                                       status : statusJabatan,
                                                       nip : this.temp_data_kepala_bidang_kpknl.nip,          
                                                       nama : this.temp_data_kepala_bidang_kpknl.nama 
                                                    } 
                    }else{
                            this.data_kepala_bidang_kpknl = {
                                                    jabatan :this.temp_data_kepala_bidang_kpknl.jabatan,
                                                    status : statusJabatan,
                                                    nip : '',          
                                                    nama : ''}
                    }
                },        
                //DATA KPKNL
                setTempJabatanKepalaSeksiKPKNL() {
                    this.temp_data_kepala_seksi_kpknl = {
                                               jabatan : this.data_kepala_seksi_kpknl.jabatan,
                                               status : this.data_kepala_seksi_kpknl.status,
                                               nip : this.data_kepala_seksi_kpknl.nip,          
                                               nama : this.data_kepala_seksi_kpknl.nama 
                                          }

                },       
                //DATA KPKNL
                setTempJabatanKepalaBidangKPKNL() {
                    this.temp_data_kepala_bidang_kpknl = {
                                               jabatan : this.data_kepala_bidang_kpknl.jabatan,
                                               status : this.data_kepala_bidang_kpknl.status,
                                               nip : this.data_kepala_bidang_kpknl.nip,          
                                               nama : this.data_kepala_bidang_kpknl.nama 
                                          }

                }, 
                getKepalaBidangKPKNL() {
                    let self = this
                    axios.get(this.url + "/theme_costume/static_content/kepala_bidangPKN.json")
                        .then(response => {
                            
                            self.option_data_kepala_bidang_kpknl = response.data.jabatan_kepala_bidang.filter(
                                            data => data.kantor.includes(this.choosePengajuan.status_proses))

                            // self.data_kepala_bidang_kpknl =  response.data.jabatan_kepala_bidang.filter(
                            //                 data => data.kantor.includes(this.choosePengajuan.status_proses))
                        })
                },     
                getKepalaSeksiKPKNL() {
                    let self = this
                    axios.get(this.url + "/theme_costume/static_content/kepala_seksiPKN.json")
                        .then(response => {
                            self.option_data_kepala_seksi_kpknl = response.data.jabatan_kepala_seksi.filter(
                                            data => data.kantor.includes(this.choosePengajuan.status_proses))
                            // self.data_kepala_seksi_kpknl =  response.data.jabatan_kepala_seksi.filter(
                            //                 data => data.kantor.includes(this.choosePengajuan.status_proses))
                        })
                },
                name_jabatan_kepala_seksi_kpknl({jabatan}) {
                    return `${jabatan}` 
                },        
                name_jabatan_kepala_bidang_kpknl({jabatan}) {
                    return `${jabatan}` 
                },

                
                beforeTab1SwitchKPKNL: function() {

                    let self = this
                    return this.$validator.validateAll("step1").then((result) => {
                        if (!result) {
                            alert('mohon melengkapi seluruh form diatas')
                            return false;
                        } else {
                            this.verifikasi.hasil_verifikasi = "Dokumen sedang diproses"
                            this.addVerifikasi("Proses by Verifikator")
                            return true
                        }

                    })
                },
                beforeTab2SwitchKPKNL: function() {
                     let self = this
                    return this.$validator.validateAll("step2").then((result) => {
                        if (!result) {
                            alert('mohon melengkapi seluruh form diatas')
                            return false;
                        } else {
                             this.verifikasi.hasil_verifikasi = "Dokumen sedang diproses"
                             this.addVerifikasi("Dokumen Fisik telah Dicek")
                            return true
                        }

                    })
                },
                beforeTab3SwitchKPKNL: function() {
                     let self = this
                    return this.$validator.validateAll("step3").then((result) => {
                        if (!result) {
                            alert('mohon melengkapi seluruh form diatas')
                            return false;
                        } else {
                            this.addVerifikasi("Keputusan Telah di buat")
                            return true
                        }

                    })
                },
                beforeTab4SwitchKPKNL: function() {
                    //this.verifikasi.daftar_tembusan = JSON.stringify(this.daftarTembusan)
                    this.addVerifikasi("Keputusan Telah di buat")
                    return true
                },

                addVerifikasi:function(status) {
                    //Assign Kepala Seksi
                    this.verifikasi.jabatan_kepala_seksi = this.data_kepala_seksi_kpknl.jabatan
                    this.verifikasi.status_kepala_seksi = this.data_kepala_seksi_kpknl.status
                    this.verifikasi.nama_kepala_seksi = this.data_kepala_seksi_kpknl.nama
                    this.verifikasi.nip_kepala_seksi = this.data_kepala_seksi_kpknl.nip

                    //Assign Kepala Bidang
                    this.verifikasi.jabatan_kepala_bidang = this.data_kepala_bidang_kpknl.jabatan
                    this.verifikasi.status_kepala_bidang = this.data_kepala_bidang_kpknl.status
                    this.verifikasi.nama_kepala_bidang = this.data_kepala_bidang_kpknl.nama
                    this.verifikasi.nip_kepala_bidang = this.data_kepala_bidang_kpknl.nip
                    this.verifikasi.idPengajuan = this.choosePengajuan.id

                    this.status_pengajuan = status

                    this.verifikasi.daftar_tembusan = JSON.stringify(this.daftarTembusan)

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
                    

                },
                updateStatusPengajuan(){
                    let pengajuan= {
                                idPengajuan:this.choosePengajuan.id,
                                status_pengajuan: this.status_pengajuan
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

Vue.component('verifikasi-pspbmn-kanwil', {
            template: '#pspVerifikasiWizardFormKANWIL',
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

                    },          
                    showDocumentVerifikasiFinal:false,         
                    showDocumentKekuranganFinal:false,         
                    showDocumentSurveyFinal:false,         
                    daftarTembusan:[
                                    { nama:''}
                                    ],          
                    daftarKekuranganData:[
                                    { nama:''}
                                    ],
                    option_data_kepala_seksi_kanwil:[],
                    option_data_kepala_bidang_kanwil:[],
                    option_data_kepala_kanwil:[],
                    temp_data_kepala_seksi_kanwil:{
                                              jabatan : '',
                                              status : '',
                                              nip : '',          
                                              nama : '' 
                                            },
                    temp_data_kepala_bidang_kanwil:{
                                              jabatan : '',
                                              status : '',
                                              nip : '',          
                                              nama : '' 
                                            },
                    temp_data_kepala_kanwil:{
                                              jabatan : '',
                                              status : '',
                                              nip : '',          
                                              nama : '' 
                                            },
                      data_kepala_seksi_kanwil:null,
                      data_kepala_bidang_kanwil:null,
                      data_kepala_kanwil:null,
                      showStatusJabatanKasi:false,
                      showStatusJabatanKabid:false,
                      showStatusJabatanKanwil:false,
                      isAdaDokumenKepemilikan: true,
                      showButtonhasilVerifikasi: true,
                      isGenerateKMKDoc : false,
                      isButuhKelengkapanData : false,
                      isButuhSurveyLapangan : false,
                      isShowLast: false,
                      isShowUploadWizardForm: false,
                      isShowVerifikasiForm: true,
                      jenisForm: this.jenisform,
                      generateHasilVerifikasiKANWIL : false,
                      successUpload:false
                }

            },
            created(){
                this.getKepalaSeksiKANWIL() 
                this.getKepalaBidangKANWIL() 
                this.getKepalaKANWIL() 
                this.getDataVerifikasiDokumen()
            },
            computed: {
                // a computed getter
                hrefImageLoader: function () {
                    // `this` points to the vm instance
                    return this.url+'/theme_costume/images/success.gif'
                    // return this.url
                },
                // a computed getter
                hrefsuratNDSPersetujuanfinal: function () {
                    if(this.verifikasi.suratNDSPersetujuanfinal===''){
                        this.uploadUlangSuratNDSPersetujuanfinal=true
                    }else{
                        this.uploadUlangSuratNDSPersetujuanfinal=false
                    }
                    // `this` points to the vm instance
                    return this.url+'/uploads/'+this.verifikasi.suratNDSPersetujuanfinal
                    // return this.url
                },
                // a computed getter
                hrefsuratHasilVerifikasifinal: function () {
                    if(this.verifikasi.suratHasilVerifikasifinal===''){
                        this.uploadUlangSuratHasilVerifikasifinal=true
                    }else{
                        this.uploadUlangSuratHasilVerifikasifinal=false
                    }
                    // `this` points to the vm instance
                    return this.url+'/uploads/'+this.verifikasi.suratHasilVerifikasifinal
                    // return this.url
                },
                // a computed getter
                hrefsuratKMKfinal: function () {
                    // `this` points to the vm instance
                    if(this.verifikasi.suratKMKfinal===''){
                        this.uploadUlangSuratHasilVerifikasifinal=true
                    }else{
                        this.uploadUlangSuratHasilVerifikasifinal=false
                    }
                    return this.url+'/uploads/'+this.verifikasi.suratKMKfinal
                    // return this.url
                },
                // a computed getter
                hrefsuratSalinanKMKfinal: function () {
                    // `this` points to the vm instance
                    if(this.verifikasi.suratSalinanKMKfinal===''){
                        this.uploadUlangSuratHasilVerifikasifinal=true
                    }else{
                        this.uploadUlangSuratHasilVerifikasifinal=false
                    }
                    return this.url+'/uploads/'+this.verifikasi.suratSalinanKMKfinal
                    // return this.url
                },
                // a computed getter
                hrefsuratNDSPermintaanKelengkapanfinal: function () {

                    if(this.verifikasi.suratNDSPermintaanKelengkapanfinal===''){
                        this.uploadUlangSuratHasilVerifikasifinal=true
                    }else{
                        this.uploadUlangSuratHasilVerifikasifinal=false
                    }
                    // `this` points to the vm instance
                    return this.url+'/uploads/'+this.verifikasi.suratNDSPermintaanKelengkapanfinal
                    // return this.url
                },
                // a computed getter
                hrefsuratNDSSurveyLapanganfinal: function () {
                     if(this.verifikasi.suratNDSSurveyLapanganfinal===''){
                        this.uploadUlangSuratNDSSurveyLapanganfinal=true
                    }else{
                        this.uploadUlangSuratNDSSurveyLapanganfinal=false
                    }
                    // `this` points to the vm instance
                    return this.url+'/uploads/'+this.verifikasi.suratNDSSurveyLapanganfinal
                    // return this.url
                },
                // a computed getter
                hrefFileSuratPermohon: function () {
                    // `this` points to the vm instance
                    return this.url+'/uploads/'+this.choosePengajuan.fileSuratPermohon
                    // return this.url
                },
                // a computed getter
                hrefFileDaftarRincian: function () {
                    // `this` points to the vm instance
                    return this.url+'/uploads/'+this.choosePengajuan.fileDaftarRincian
                    //return this.url
                },
                // a computed getter
                hrefFileDokumenKelengkapan: function () {
                    // `this` points to the vm instance
                    return this.url+'/uploads/'+this.choosePengajuan.fileDokumenKelengkapan
                    //return this.url
                },

                 // a computed getter
                hreffileNDSPersetujuan: function () {
                    // `this` points to the vm instance
                    return this.url+this.verifikasi.fileNDSPersetujuan
                    // return this.url
                },
                // a computed getter
                hreffileHasilVerifikasi: function () {
                    // `this` points to the vm instance
                    return this.url+this.verifikasi.fileHasilVerifikasi
                    //return this.url
                },
                // a computed getter
                hreffileKMK: function () {
                    // `this` points to the vm instance
                    return this.url+this.verifikasi.fileKMK
                    //return this.url
                },
                // a computed getter
                hreffileSalinanKMK: function () {
                    // `this` points to the vm instance
                    return this.url+this.verifikasi.fileKMK
                    //return this.url
                },
                // a computed getter
                hreffileNDSPermintaanKelengkapan: function () {
                    // `this` points to the vm instance
                    return this.url+this.verifikasi.fileNDSPermintaanKelengkapan
                    //return this.url
                },
                // a computed getter
                hreffileNDSSurveyLapangan: function () {
                    // `this` points to the vm instance
                    return this.url+this.verifikasi.fileNDSSurveyLapangan
                    //return this.url
                }
            },
            methods:{

                beforeTabHasilVerifikasi: function() {

                    let self = this
                    return this.$validator.validateAll("step2").then((result) => {
                        if (!result) {
                            alert('mohon melengkapi seluruh form diatas')
                            return false;
                        } else {
                            this.addVerifikasi("Dokumen Final Telah Diupload oleh Verifikator")
                            return true
                        }

                    })
                },
                uploadFileKelengkapan: function() {
                    this.file1 = this.$refs.suratHasilVerifikasifinal.files[0];
                    this.file2 = this.$refs.suratNDSPermintaanKelengkapanfinal.files[0];
                    console.log("masukkk KANWIL")
                    if (this.file1 && this.file2) {
                         console.log("masukkk2 KANWL")
                        let formData = new FormData();
                        formData.append('file1', this.file1);
                        formData.append('file2', this.file2);
                        let self = this
                        axios.post(this.url + '/hideend/verifikasi/uploadFileKelengkapan', formData, {
                                headers: {
                                    'Content-Type': 'multipart/form-data'
                                }
                            })
                            .then(function(response) {
                                if (!response.data) {
                                    alert('File not uploaded All. Please check one of your file');
                                } else {
                                    self.verifikasi.suratHasilVerifikasifinal = response.data.file[0]
                                    self.verifikasi.suratNDSPermintaanKelengkapanfinal = response.data.file[1]

                                }

                            })
                            .catch(function(error) {
                                console.log(error);
                            });
                            this.successUpload = true
                    }else{
                        alert("Silakan diUpload semua dokumen")
                    }

                },
                uploadFileSurvey: function() {
                    this.file1 = this.$refs.suratHasilVerifikasifinal.files[0];
                    this.file2 = this.$refs.suratNDSSurveyLapanganfinal.files[0];
                    console.log("masuk survey")
                    if (this.file1 && this.file2) {
                        console.log("masuk survey2")
                        let formData = new FormData();
                        formData.append('file1', this.file1);
                        formData.append('file2', this.file2);

                        let self = this
                        axios.post(this.url + '/hideend/verifikasi/uploadFileSurvey', formData, {
                                headers: {
                                    'Content-Type': 'multipart/form-data'
                                }
                            })
                            .then(function(response) {
                                if (!response.data) {
                                    alert('File not uploaded All. Please check one of your file');
                                } else {
                                    self.verifikasi.suratHasilVerifikasifinal = response.data.file[0]
                                    self.verifikasi.suratNDSSurveyLapanganfinal = response.data.file[1]

                                }

                            })
                            .catch(function(error) {
                                console.log(error);
                            });
                            this.successUpload=true
                    }else{
                        alert("Silakan diUpload semua dokumen")
                    }

                },
                uploadFileComplete: function() {

                    this.file1 = this.$refs.suratNDSPersetujuanfinal.files[0];
                    this.file2 = this.$refs.suratHasilVerifikasifinal.files[0];
                    this.file3 = this.$refs.suratKMKfinal.files[0];
                    this.file4 = this.$refs.suratSalinanKMKfinal.files[0];

                    if (this.file1 && this.file2 && this.file3 && this.file4) {

                        let formData = new FormData();
                        formData.append('file1', this.file1);
                        formData.append('file2', this.file2);
                        formData.append('file3', this.file3);
                        formData.append('file4', this.file4);
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
                                    self.successUpload = true
                                    self.verifikasi.suratNDSPersetujuanfinal = response.data.file[0]
                                    self.verifikasi.suratHasilVerifikasifinal = response.data.file[1]
                                    self.verifikasi.suratKMKfinal = response.data.file[2]
                                    self.verifikasi.suratSalinanKMKfinal = response.data.file[3]

                                }

                            })
                            .catch(function(error) {
                                console.log(error);
                            });

                        this.successUpload = true
                    }else{
                        alert("Silakan diUpload semua dokumen")
                    }

                },
                btnDataSurveyLapangan(){
                    this.isGenerateKMKDoc = false
                    this.isButuhKelengkapanData = false
                    this.isButuhSurveyLapangan = true

                    this.verifikasi.daftarKekuranganData=[]
                    this.verifikasi.daftar_tembusan=[]
                    this.daftarTembusan = []
                    this.verifikasi.jabatan_salinan=''
                    this.verifikasi.nama_salinan=''
                    this.verifikasi.nip_salinan=''

                    this.verifikasi.hasil_verifikasi = "Butuh Survey Lapangan"
                    let GabungData = {...this.verifikasi,...this.choosePengajuan}
                    this.clearGenerateDoc()
                    GabungData.id = this.verifikasi.id
                    var formData = this.formData(GabungData);
                    let self = this

                    axios.post(this.url + "/hideend/verifikasi/generateSurveyLapanganKANWIL/",formData).then(function(response) {
                            if (trueq) {
                                self.verifikasi.fileNDSPersetujuan = response.data.dokumen.fileNDSPersetujuan
                                self.verifikasi.fileHasilVerifikasi = response.data.dokumen.fileHasilVerifikasi
                                self.verifikasi.fileKMK = response.data.dokumen.fileKMK
                                self.verifikasi.fileSalinanKMK = response.data.dokumen.fileSalinanKMK
                                self.verifikasi.fileNDSPermintaanKelengkapan = response.data.dokumen.fileNDSPermintaanKelengkapan
                                self.verifikasi.fileNDSSurveyLapangan = response.data.dokumen.fileNDSSurveyLapangan
           
                            }
                        })
                },
                btnGenerateKelengkapanDoc(){
                    this.isGenerateKMKDoc = false
                    this.isButuhKelengkapanData = true
                    this.isButuhSurveyLapangan = false

                    this.verifikasi.rencana_survey='' 
                    this.verifikasi.nama_survey='' 
                    this.verifikasi.cp_survey='' 
                    this.verifikasi.daftar_tembusan=[]
                    this.daftarTembusan = []
                    this.verifikasi.jabatan_salinan=''
                    this.verifikasi.nama_salinan=''
                    this.verifikasi.nip_salinan=''

                    this.verifikasi.daftarKekuranganData = JSON.stringify(this.daftarKekuranganData)  
                    
                    this.verifikasi.hasil_verifikasi = "Butuh Kelengkapan Data"                         

                    let GabungData = {...this.verifikasi,...this.choosePengajuan}
                    this.clearGenerateDoc()
                    GabungData.id = this.verifikasi.id
                    var formData = this.formData(GabungData);
                    let self = this

                    axios.post(this.url + "/hideend/verifikasi/generateKelengkapanDataKANWIL/",formData).then(function(response) {
                            if (true) {                                
                                self.verifikasi.fileNDSPersetujuan = response.data.dokumen.fileNDSPersetujuan
                                self.verifikasi.fileHasilVerifikasi = response.data.dokumen.fileHasilVerifikasi
                                self.verifikasi.fileKMK = response.data.dokumen.fileKMK
                                self.verifikasi.fileSalinanKMK = response.data.dokumen.fileSalinanKMK
                                self.verifikasi.fileNDSPermintaanKelengkapan = response.data.dokumen.fileNDSPermintaanKelengkapan
                                self.verifikasi.fileNDSSurveyLapangan = response.data.dokumen.fileNDSSurveyLapangan          
                            }
                        })
                },
                btnGenerateKMKDoc(){
                    this.isGenerateKMKDoc = true
                    this.isButuhKelengkapanData = false
                    this.isButuhSurveyLapangan = false    

                    this.verifikasi.rencana_survey='' 
                    this.verifikasi.nama_survey='' 
                    this.verifikasi.cp_survey='' 
                    this.verifikasi.daftarKekuranganData=[]

                    this.verifikasi.hasil_verifikasi = "Terbitkan KMK Dokumen"  
                    this.verifikasi.daftar_tembusan = JSON.stringify(this.daftarTembusan)
                    let GabungData = {...this.verifikasi,...this.choosePengajuan}
                    this.clearGenerateDoc()
                    GabungData.id = this.verifikasi.id
                    var formData = this.formData(GabungData);
                    let self = this
                    axios.post(this.url + "/hideend/verifikasi/generateDocKANWIL/",formData).then(function(response) {

                            console.log("generate doc!")
                            console.log(response.data.dokumen)
                            if (true) {
                                self.verifikasi.fileNDSPersetujuan = response.data.dokumen.fileNDSPersetujuan
                                self.verifikasi.fileHasilVerifikasi = response.data.dokumen.fileHasilVerifikasi
                                self.verifikasi.fileKMK = response.data.dokumen.fileKMK
                                self.verifikasi.fileSalinanKMK = response.data.dokumen.fileSalinanKMK
                                self.verifikasi.fileNDSPermintaanKelengkapan = response.data.dokumen.fileNDSPermintaanKelengkapan
                                self.verifikasi.fileNDSSurveyLapangan = response.data.dokumen.fileNDSSurveyLapangan

           
                            }
                        })
                },
                showUploadWizardForm(){
                    this.isShowUploadWizardForm = true;
                    this.isShowVerifikasiForm = false;

                },

                uploadFile: function() {

                    this.file1 = this.$refs.fileNDSPersetujuan.files[0];
                    this.file2 = this.$refs.fileHasilVerifikasi.files[0];
                    this.file3 = this.$refs.fileKMK.files[0];
                    this.file4 = this.$refs.fileKMK.files[0];
                    this.file5 = this.$refs.fileNDSPermintaanKelengkapan.files[0];
                    this.file6 = this.$refs.fileNDSSurveyLapangan.files[0];

                    if (this.file1 && this.file2 && this.file3 && this.file4 && this.file5 && this.file6) {

                        let formData = new FormData();
                        formData.append('file1', this.file1);
                        formData.append('file2', this.file2);
                        formData.append('file3', this.file3);
                        formData.append('file4', this.file4);
                        formData.append('file5', this.file4);
                        formData.append('file6', this.file4);

                        axios.post(this.url + '/hideend/verifikasi/uploadFile', formData, {
                                headers: {
                                    'Content-Type': 'multipart/form-data'
                                }
                            })
                            .then(function(response) {
                                if (!response.data) {
                                    alert('File not uploaded All. Please check one of your file');
                                } else {
                                    this.verifikasi.fileNDSPersetujuan = response.data.file[0]
                                    this.verifikasi.fileHasilVerifikasi = response.data.file[1]
                                    this.verifikasi.fileKMK = response.data.file[2]
                                    this.verifikasi.fileKMK = response.data.file[3]
                                    this.verifikasi.fileNDSPermintaanKelengkapan = response.data.file[4]
                                    this.verifikasi.fileNDSSurveyLapangan = response.data.file[5]

                                }

                            })
                            .catch(function(error) {
                                console.log(error);
                            });
                    }

                },
                generateKMKDoc(){
                    this.isGenerateKMKDoc = true
                    this.isButuhKelengkapanData = false
                    this.isButuhSurveyLapangan = false
                },
                butuhKelengkapanData(){
                    this.isGenerateKMKDoc = false
                    this.isButuhKelengkapanData = true
                    this.isButuhSurveyLapangan = false
                },
                butuhSurveyLapangan(){
                    this.isGenerateKMKDoc = false
                    this.isButuhKelengkapanData = false
                    this.isButuhSurveyLapangan = true
                },
                //2
                deleteRowKurangData(index){
                    if(this.daftarKekuranganData.length>1){
                        this.daftarKekuranganData.splice(index, 1);
                    }
                },
                deleteRow(index){
                    if(this.daftarTembusan.length>1){
                        this.daftarTembusan.splice(index, 1);
                    }
                },
                getDataVerifikasiDokumen:function(){
                    let self = this
                    axios.post(this.url + "/hideend/verifikasi/checkDocumentVerifikasi/"+this.choosePengajuan.id).then(function(response) {
                               
                            if (response.data.dokumen) {

                                self.showStatusJabatanKasi = true
                                self.showStatusJabatanKabid = true
                                self.showStatusJabatanKanwil = true


                                self.verifikasi =  response.data.dokumen[0]
                                self.data_kepala_seksi_kanwil = {
                                                        jabatan : response.data.dokumen[0].jabatan_kepala_seksi,
                                                        status : response.data.dokumen[0].status_kepala_seksi,
                                                        nip : response.data.dokumen[0].nip_kepala_seksi,          
                                                        nama : response.data.dokumen[0].nama_kepala_seksi 
                                                }
                                self.temp_data_kepala_seksi_kanwil  = {
                                                        jabatan : response.data.dokumen[0].jabatan_kepala_seksi,
                                                        status : response.data.dokumen[0].status_kepala_seksi,
                                                        nip : response.data.dokumen[0].nip_kepala_seksi,          
                                                        nama : response.data.dokumen[0].nama_kepala_seksi
                                                }                        
                                self.data_kepala_bidang_kanwil  = {
                                                        jabatan : response.data.dokumen[0].jabatan_kepala_bidang,
                                                        status : response.data.dokumen[0].status_kepala_bidang,
                                                        nip : response.data.dokumen[0].nip_kepala_bidang,          
                                                        nama : response.data.dokumen[0].nama_kepala_bidang 
                                                }

                                self.temp_data_kepala_bidang_kanwil = {
                                                        jabatan : response.data.dokumen[0].jabatan_kepala_bidang,
                                                        status : response.data.dokumen[0].status_kepala_bidang,
                                                        nip : response.data.dokumen[0].nip_kepala_bidang,          
                                                        nama : response.data.dokumen[0].nama_kepala_bidang
                                                }                    
                                self.data_kepala_kanwil  = {
                                                        jabatan : response.data.dokumen[0].jabatan_kepala_kanwil,
                                                        status : response.data.dokumen[0].status_kepala_kanwil,
                                                        nip : response.data.dokumen[0].nip_kepala_kanwil,          
                                                        nama : response.data.dokumen[0].nama_kepala_kanwil 
                                                }

                                self.temp_data_kepala_kanwil = {
                                                        jabatan : response.data.dokumen[0].jabatan_kepala_kanwil,
                                                        status : response.data.dokumen[0].status_kepala_kanwil,
                                                        nip : response.data.dokumen[0].nip_kepala_kanwil,          
                                                        nama : response.data.dokumen[0].nama_kepala_kanwil
                                                }

                                self.verifikasi.jabatan_salinan = (response.data.dokumen[0].jabatan_salinan === "null")?'':response.data.dokumen[0].jabatan_salinan
                                self.verifikasi.nama_salinan = (response.data.dokumen[0].nama_salinan === "null")?'':response.data.dokumen[0].nama_salinan
                                self.verifikasi.nip_salinan = (response.data.dokumen[0].nip_salinan === "null")?'':response.data.dokumen[0].nip_salinan
                                self.verifikasi.peraturan_pendelegasian_wewenang_KL = (response.data.dokumen[0].peraturan_pendelegasian_wewenang_KL === "null")?'':response.data.dokumen[0].peraturan_pendelegasian_wewenang_KL
 
                                if(response.data.dokumen[0].daftarKekuranganData==="null" || response.data.dokumen[0].daftarKekuranganData===""){
                                    self.daftarKekuranganData = [{
                                                                nama:''
                                                            }]  
                                     
                                   
                                }else{
                                    self.daftarKekuranganData = JSON.parse(response.data.dokumen[0].daftarKekuranganData)
                                } 

                                console.log(response.data.dokumen[0].daftar_tembusan)

                                if(response.data.dokumen[0].daftar_tembusan==="null" || response.data.dokumen[0].daftar_tembusan===""||response.data.dokumen[0].daftar_tembusan==='[]'){
                                    self.daftarTembusan = [{
                                                                nama:''
                                                            }]  
                                    
                                   
                                }else{
                                     self.daftarTembusan = JSON.parse(response.data.dokumen[0].daftar_tembusan)
                                }         

                               
                            }
                        })
                },
                clearGenerateDoc(){
                    this.showDocumentVerifikasiFinal = false
                    this.showDocumentKekuranganFinal = false
                    this.showDocumentSurveyFinal = false
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
                    this.clearAllForm()

                    this.isShowUploadWizardForm = false;
                    this.isShowVerifikasiForm = false;
                    let valueHide ={
                                    isShowFormKANWIL : false                                    
                                }
                    this.$emit('send-data', valueHide)
                },
                addRowKurangData(){
                    this.daftarKekuranganData.push({'nama': ''});
                },
                addRowTembusan(){
                    this.daftarTembusan.push({'nama': ''});
                },
                checklistVerifikasi($jenisButton,$value){
                    if($jenisButton==='check_jenis_bmn'){
                        this.verifikasi.check_jenis_bmn = $value
                    }
                    if($jenisButton==='check_nilai_bmn'){
                        this.verifikasi.check_nilai_bmn = $value
                    }
                    if($jenisButton==='check_surat_permohonan'){
                        this.verifikasi.check_surat_permohonan = $value
                    }
                    if($jenisButton==='check_rincian_usulan_bmn'){
                        this.verifikasi.check_rincian_usulan_bmn = $value
                    }
                    if($jenisButton==='check_kib'){
                        this.verifikasi.check_kib = $value
                    }
                    if($jenisButton==='check_foto_bmn'){
                        this.verifikasi.check_foto_bmn = $value
                    }
                    if($jenisButton==='check_sk_delegasi'){
                        this.verifikasi.check_sk_delegasi = $value
                    }
                    if($jenisButton==='check_dokumen_kepemilikan'){
                        this.verifikasi.check_dokumen_kepemilikan = $value
                    }
                    if($jenisButton==='check_fc_dokumen_kepemilikan'){
                        this.verifikasi.check_fc_dokumen_kepemilikan = $value
                    }
                    if($jenisButton==='check_sptjm_bermaterai'){
                        this.verifikasi.check_sptjm_bermaterai = $value
                    }
                    if($jenisButton==='check_kebenaran_fc_dokumen_kepemilikan'){
                        this.verifikasi.check_kebenaran_fc_dokumen_kepemilikan = $value
                    }

                },

                //pick
                pickStatusJabatanKasiKANWIL(statusJabatan) {

                     if(statusJabatan === this.temp_data_kepala_seksi_kanwil.status ){
                        
                           this.data_kepala_seksi_kanwil = {
                                                        jabatan : this.temp_data_kepala_seksi_kanwil.jabatan,
                                                        status : statusJabatan,
                                                        nip : this.temp_data_kepala_seksi_kanwil.nip,          
                                                        nama : this.temp_data_kepala_seksi_kanwil.nama 
                                                    }
                    }else{
                            this.data_kepala_seksi_kanwil = {
                                                        jabatan : this.temp_data_kepala_seksi_kanwil.jabatan,
                                                        status : statusJabatan,
                                                        nip : '',          
                                                        nama : '' 
                                                    }
                    }
                },
                pickStatusJabatanKabidKANWIL(statusJabatan) {

                    if(statusJabatan === this.temp_data_kepala_bidang_kanwil.status ){
                            this.data_kepala_bidang_kanwil = {
                                                       jabatan : this.temp_data_kepala_bidang_kanwil.jabatan,
                                                       status : statusJabatan,
                                                       nip : this.temp_data_kepala_bidang_kanwil.nip,          
                                                       nama : this.temp_data_kepala_bidang_kanwil.nama 
                                                    } 
                    }else{
                            this.data_kepala_bidang_kanwil = {
                                                    jabatan :this.temp_data_kepala_bidang_kanwil.jabatan,
                                                    status : statusJabatan,
                                                    nip : '',          
                                                    nama : ''}
                    }
                },  
                pickStatusJabatanKANWIL(statusJabatan) {

                    if(statusJabatan === this.temp_data_kepala_kanwil.status ){
                            this.data_kepala_kanwil = {
                                                       jabatan : this.temp_data_kepala_kanwil.jabatan,
                                                       status : statusJabatan,
                                                       nip : this.temp_data_kepala_kanwil.nip,          
                                                       nama : this.temp_data_kepala_kanwil.nama 
                                                    } 
                    }else{
                            this.data_kepala_kanwil = {
                                                    jabatan :this.temp_data_kepala_kanwil.jabatan,
                                                    status : statusJabatan,
                                                    nip : '',          
                                                    nama : ''}
                    }
                },   


                //SET
                setTempJabatanKepalaSeksiKANWIL() {
                    this.temp_data_kepala_seksi_kanwil = {
                                               jabatan : this.data_kepala_seksi_kanwil.jabatan,
                                               status : this.data_kepala_seksi_kanwil.status,
                                               nip : this.data_kepala_seksi_kanwil.nip,          
                                               nama : this.data_kepala_seksi_kanwil.nama 
                                          }

                },       
                setTempJabatanKepalaBidangKANWIL() {
                    this.temp_data_kepala_bidang_kanwil = {
                                               jabatan : this.data_kepala_bidang_kanwil.jabatan,
                                               status : this.data_kepala_bidang_kanwil.status,
                                               nip : this.data_kepala_bidang_kanwil.nip,          
                                               nama : this.data_kepala_bidang_kanwil.nama 
                                          }

                }, 

                setTempJabatanKepalaKANWIL() {
                    this.temp_data_kepala_kanwil = {
                                               jabatan : this.data_kepala_kanwil.jabatan,
                                               status : this.data_kepala_kanwil.status,
                                               nip : this.data_kepala_kanwil.nip,          
                                               nama : this.data_kepala_kanwil.nama 
                                          }

                }, 

                //GET
                getKepalaBidangKANWIL() {
                    let self = this
                    axios.get(this.url + "/theme_costume/static_content/kepala_bidang.json")
                        .then(response => {
                            self.option_data_kepala_bidang_kanwil = response.data.jabatan_kepala_bidang
                        })
                },     
                getKepalaSeksiKANWIL() {
                    let self = this
                    axios.get(this.url + "/theme_costume/static_content/kepala_seksi.json")
                        .then(response => {
                            self.option_data_kepala_seksi_kanwil = response.data.jabatan_kepala_seksi
                        })
                },
                getKepalaKANWIL() {
                    let self = this
                    axios.get(this.url + "/theme_costume/static_content/kepala_kanwil.json")
                        .then(response => {
                            self.option_data_kepala_kanwil = response.data.jabatan_kepala_kanwil
                        })
                },

                //NAME
                name_jabatan_kepala_seksi_kanwil({jabatan}) {
                    return `${jabatan}` 
                },        
                name_jabatan_kepala_bidang_kanwil({jabatan}) {
                    return `${jabatan}` 
                },      
                name_jabatan_kepala_kanwil({jabatan}) {
                    return `${jabatan}` 
                },

                
                beforeTab1SwitchKANWIL: function() {

                    let self = this
                    return this.$validator.validateAll("step1").then((result) => {
                        if (!result) {
                            alert('mohon melengkapi seluruh form diatas')
                            return false;
                        } else {
                            this.verifikasi.hasil_verifikasi = "Dokumen sedang diproses"
                            this.addVerifikasi("Proses by Verifikator")
                            return true
                        }

                    })
                },
                beforeTab2SwitchKANWIL: function() {
                     let self = this
                    return this.$validator.validateAll("step2").then((result) => {
                        if (!result) {
                            alert('mohon melengkapi seluruh form diatas')
                            return false;
                        } else {
                            this.verifikasi.hasil_verifikasi = "Dokumen sedang diproses"
                            this.addVerifikasi("Dokumen Fisik telah Dicek")
                            return true
                        }

                    })
                },
                beforeTab3SwitchKANWIL: function() {
                     let self = this
                    return this.$validator.validateAll("step3").then((result) => {
                        if (!result) {
                            alert('mohon melengkapi seluruh form diatas')
                            return false;
                        } else {
                            this.addVerifikasi("Keputusan Telah di buat")
                            return true
                        }

                    })
                },
                beforeTab4SwitchKANWIL: function() {
                    //this.verifikasi.daftar_tembusan = JSON.stringify(this.daftarTembusan)
                    this.addVerifikasi("Keputusan Telah di buat")
                    return true
                },

                addVerifikasi:function(status) {
                    //Assign Kepala Seksi
                    this.verifikasi.jabatan_kepala_seksi = this.data_kepala_seksi_kanwil.jabatan
                    this.verifikasi.status_kepala_seksi = this.data_kepala_seksi_kanwil.status
                    this.verifikasi.nama_kepala_seksi = this.data_kepala_seksi_kanwil.nama
                    this.verifikasi.nip_kepala_seksi = this.data_kepala_seksi_kanwil.nip

                    //Assign Kepala Bidang
                    this.verifikasi.jabatan_kepala_bidang = this.data_kepala_bidang_kanwil.jabatan
                    this.verifikasi.status_kepala_bidang = this.data_kepala_bidang_kanwil.status
                    this.verifikasi.nama_kepala_bidang = this.data_kepala_bidang_kanwil.nama
                    this.verifikasi.nip_kepala_bidang = this.data_kepala_bidang_kanwil.nip

                    //Assign Kepala Kanwil
                    this.verifikasi.jabatan_kepala_kanwil = this.data_kepala_kanwil.jabatan
                    this.verifikasi.status_kepala_kanwil = this.data_kepala_kanwil.status
                    this.verifikasi.nama_kepala_kanwil = this.data_kepala_kanwil.nama
                    this.verifikasi.nip_kepala_kanwil = this.data_kepala_kanwil.nip

                    //setup others
                    this.verifikasi.idPengajuan = this.choosePengajuan.id
                    this.status_pengajuan = status

                    this.verifikasi.daftar_tembusan = JSON.stringify(this.daftarTembusan)

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
                    

                },
                updateStatusPengajuan(){
                    let pengajuan= {
                                idPengajuan:this.choosePengajuan.id,
                                status_pengajuan: this.status_pengajuan
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
            methods:{

                    
                    refresh(){
                        this.showAll(); //for preventing
                    },

                    showAll(){ 
                        let self = this
                        axios.post(this.url+"/hideend/pengajuan/showAll/verify").then(function(response){
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