

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
                        fileNDSSurveyLapangan:''
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
                      uploadUlangSuratNDSPersetujuanfinal:false,
                      uploadUlangSuratKMKfinal:false,
                      uploadUlangSuratSalinanKMKfinal:false,
                      file1:'',
                      file2:'',
                      file3:'',
                      file4:'',
                }

            },
            updated: function () {
               this.loadfileFinal() 
            },
            created(){
                this.cekdokumenUpload()
                
                
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
                hrefsuratNDSPersetujuanfinal: function () {
                    // `this` points to the vm instance
                    return (this.verifikasi.suratNDSPersetujuanfinal==='')?'':( this.url+'/uploads/'+this.verifikasi.suratNDSPersetujuanfinal)
                    // return this.url
                },
                // a computed getter
                hrefsuratHasilVerifikasifinal: function () {
                    return (this.verifikasi.suratHasilVerifikasifinal==='')?'':(this.url+'/uploads/'+this.verifikasi.suratHasilVerifikasifinal)
                },
                // a computed getter
                hrefsuratKMKfinal: function () {
                    return (this.verifikasi.suratKMKfinal==='')?'':(this.url+'/uploads/'+this.verifikasi.suratKMKfinal)
                    // return this.url
                },
                // a computed getter
                hrefsuratSalinanKMKfinal: function () {
                    return (this.verifikasi.suratSalinanKMKfinal==='')?'':(this.url+'/uploads/'+this.verifikasi.suratSalinanKMKfinal)
                  
                },
                // a computed getter
                hrefsuratNDSPermintaanKelengkapanfinal: function () {
                    return (this.verifikasi.suratNDSPermintaanKelengkapanfinal==='')?'':(this.url+'/uploads/'+this.verifikasi.suratNDSPermintaanKelengkapanfinal)
                  
                    // return this.url
                },
                // a computed getter
                hrefsuratNDSSurveyLapanganfinal: function () {
                    return (this.verifikasi.suratNDSSurveyLapanganfinal==='')?'':(this.url+'/uploads/'+this.verifikasi.suratNDSSurveyLapanganfinal)
                                      // return this.url
                }
            },
            methods:{
                finishUploadHasil(){
                    let valueHide ={
                                    showWizardFormHASIL : false                                    
                                }
                    this.$emit('hide-form', valueHide)
                },
                loadfileFinal: function () {   

                     if(this.verifikasi.suratHasilVerifikasifinal===''){
                        this.uploadUlangSuratHasilVerifikasifinal=true
                    }else{
                        this.uploadUlangSuratHasilVerifikasifinal=false
                    }    
                    
                    if(this.verifikasi.suratKMKfinal===''){
                        this.uploadUlangSuratKMKfinal=true
                    }else{
                        this.uploadUlangSuratKMKfinal=false
                    }

                    if(this.verifikasi.suratSalinanKMKfinal===''){
                        this.uploadUlangSuratSalinanKMKfinal=true
                    }else{
                        this.uploadUlangSuratSalinanKMKfinal=false
                    }

                    if(this.verifikasi.suratNDSPermintaanKelengkapanfinal===''){
                        this.uploadUlangSuratNDSPermintaanKelengkapanfinal=true
                    }else{
                        this.uploadUlangSuratNDSPermintaanKelengkapanfinal=false
                    }

                    if(this.verifikasi.suratNDSSurveyLapanganfinal===''){
                        this.uploadUlangSuratNDSSurveyLapanganfinal=true
                    }else{
                        this.uploadUlangSuratNDSSurveyLapanganfinal=false
                    }
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
                    let formData = new FormData();
                    if(typeof this.$refs.suratHasilVerifikasifinal !== 'undefined'){
                       this.file1 = this.$refs.suratHasilVerifikasifinal.files[0];   
                       formData.append('file1', this.file1);  
                    }
                    if(typeof this.$refs.suratNDSPermintaanKelengkapanfinal !== 'undefined'){
                       this.file2 = this.$refs.suratNDSPermintaanKelengkapanfinal.files[0];   
                       formData.append('file2', this.file2);  
                    }
                    if (true) {
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
                                    response.data.file.forEach((item,index)=>{
                                        console.log(response.data.tipe[index])
                                        if(response.data.tipe[index]==="file1"){
                                            self.verifikasi.suratHasilVerifikasifinal = item
                                        }
                                        if(response.data.tipe[index]==="file2"){
                                            self.verifikasi.suratNDSPermintaanKelengkapanfinal = item
                                        }

                                    })
                                    
                                    
                                    

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
                    let formData = new FormData();
                    if(typeof this.$refs.suratHasilVerifikasifinal !== 'undefined'){
                       this.file1 = this.$refs.suratHasilVerifikasifinal.files[0];   
                       formData.append('file1', this.file1);  
                    }
                    if(typeof this.$refs.suratNDSSurveyLapanganfinal !== 'undefined'){
                       this.file2 = this.$refs.suratNDSSurveyLapanganfinal.files[0];   
                       formData.append('file2', this.file2);  
                    }

                    if (true) {
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
                                    response.data.file.forEach((item,index)=>{
                                        console.log(response.data.tipe[index])
                                        if(response.data.tipe[index]==="file1"){
                                            self.verifikasi.suratHasilVerifikasifinal = item
                                        }
                                        if(response.data.tipe[index]==="file2"){
                                            self.verifikasi.suratNDSSurveyLapanganfinal = item
                                        }

                                    })

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
                    let formData = new FormData();
                    if(typeof this.$refs.suratNDSPersetujuanfinal !== 'undefined'){
                       this.file1 = this.$refs.suratNDSPersetujuanfinal.files[0];   
                       formData.append('file1', this.file1);  
                    }
                    if(typeof this.$refs.suratHasilVerifikasifinal !== 'undefined'){
                       this.file2 = this.$refs.suratHasilVerifikasifinal.files[0];   
                       formData.append('file2', this.file2);  
                    }
                    if(typeof this.$refs.suratKMKfinal !== 'undefined'){
                       this.file3 = this.$refs.suratKMKfinal.files[0];   
                       formData.append('file3', this.file3);  
                    }
                    if(typeof this.$refs.suratSalinanKMKfinal !== 'undefined'){
                       this.file4 = this.$refs.suratSalinanKMKfinal.files[0];   
                       formData.append('file4', this.file4);  
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
                                    self.successUpload = true


                                    response.data.file.forEach((item,index)=>{
                                        if(response.data.tipe[index]==="file1"){
                                            self.verifikasi.suratNDSPersetujuanfinal = item
                                        }
                                        if(response.data.tipe[index]==="file2"){
                                            self.verifikasi.suratHasilVerifikasifinal = item
                                        }
                                        if(response.data.tipe[index]==="file3"){
                                            self.verifikasi.suratKMKfinal = item
                                        }
                                        if(response.data.tipe[index]==="file4"){
                                            self.verifikasi.suratSalinanKMKfinal = item
                                        }

                                    })

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
                    axios.post(this.url + "/hideend/verifikasi/generateDocKMKKPKNL/",formData).then(function(response) {
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