var datepickerOptions = {}
Vue.use(window.AirbnbStyleDatepicker, datepickerOptions)
Vue.use(VueFormWizard)
Vue.use(VeeValidate)
Vue.use(VueTheMask)
Vue.use(VMoney)
Vue.use(VueMultiselect)
Vue.component('vue-multiselect', window.VueMultiselect.default)

//dynamic url
let myUrl = window.location.origin+"/";

if(myUrl.includes("localhost")){
  var pathArray = window.location.pathname.split( '/' );
  myUrl += pathArray [1] + "/";
}


Vue.component('pengajuan-pspbmn', {
            template: '#pspPengajuanWizardForm',
            data() {
                return {
                    url: myUrl,
                    emptyResult: false,
                    successMSG: '',
                    tpBtn: 0,
                    isDisabled: 1,
                    enableEnquiry: false,
                    inputDateOne: '',
                    inputDateTwo: '',
                    sundayFirst: false,
                    alignRight: false,
                    trigger: false,
                    money: {
                        decimal: ',',
                        thousands: '.',
                        prefix: 'Rp ',
                        suffix: '',
                        precision: 0,
                        masked: false /* doesn't work with directive */
                      },
                    uploadSimak: '',
                    inlineDateOne: '',
                    dateFormat: 'D MMM YYYY',
                    currentPage: 0,
                    rowCountPage: 5,
                    value: {},
                    pageRange: 2,
                    kabupaten: [],
                    showKabupaten: false,
                    isShowOtherTabDJKN: false,
                    notif75M: false,
                    notif100M: false,
                    notifKanwilProses: false,
                    notifDjknProses: false,
                    notifProses: false,
                    areaProsesText: '',
                    progressBar: 0,
                    vErrors:{},
                    pengajuan: {
                            id:'',
                            nama_petugas: '123',
                            nip_petugas: '123',
                            jabatan_petugas: '123',
                            kontak_petugas: '123',
                            status_pengajuan: '',
                            email_petugas: '123@gmail.com',
                            kementerian_lembaga: 
                                            {
                                                kode_KL:"5",
                                                nama_KL:"MAHKAMAH AGUNG",
                                                no:"4"
                                            }
                                          , //becarefull disini, karena yang dipassing select adalah object. selalu akses spesifik value
                            nama_kementerian_lembaga: '', //becarefull disini, karena yang dipassing select adalah object. selalu akses spesifik value
                            alamat_kantorKL: '123',
                            satuan_kerja: '123',
                            jenis_bmn:  
                                            {
                                                name:"Tanah dan Bangunan"
                                            }
                                          ,
                            nama_jenis_bmn: '',
                            totalnilai_bmn: '22000000000',
                            provinsi: null,
                            detail_djkn: null,
                            email_djkn: '',
                            nama_provinsi: '',
                            kabupaten: null,
                            nama_kabupaten: '',
                            status_proses: '',
                            jabatan_pemohon: '123',
                            noSurat_pemohon: '123',
                            tglSurat_pemohon: '',
                            perihalSurat_pemohon: '123',
                            fileSuratPermohon: '',
                            fileDaftarRincian: '',
                            fileDokumenKelengkapan: ''
                        },
                        fileSuratPermohon: '',
                        fileDaftarRincian: '',
                        fileDokumenKelengkapan: '',
                        option_kementerian_lembaga: [],
                        option_provinsi: [],
                        option_kabupaten: [],
                        option_jenis_bmn: [
                                            {name: 'Tanah'},
                                            {name: 'Bangunan'},
                                            {name: 'Tanah dan Bangunan'},
                                            {name: 'Selain Tanah dan Bangunan'}
                                          ],

                }
            },
            created() {
                this.getKementerianLembaga()
                this.getKabupaten()
                this.showDatabyID()
            },
            computed: {
                        valName() {
                            if (this.pengajuan.nama_petugas.length === 0 || this.pengajuan.nama_petugas.length > 50) {
                                return true;
                            } 
                            return false;
                        }
                    },
            methods: {
                showDatabyID(){ 
                    let self = this
                    let idPengajuan = document.getElementById("idPengajuan").value
                    if(idPengajuan!==""){
                        axios.post(this.url+"/hideend/pengajuan/show/"+idPengajuan).then(function(response){
                            if(response.data.pengajuan !== null){                    
                                self.pengajuan = response.data.pengajuan[0]
                                self.pengajuan.jenis_bmn = {
                                                    name:self.pengajuan.jenis_bmn
                                                 }
                                self.pengajuan.kementerian_lembaga = {
                                                    nama_KL:self.pengajuan.kementerian_lembaga
                                                 }                
                                self.pengajuan.kabupaten = JSON.parse(response.data.pengajuan[0].detail_djkn)
                                self.pengajuan.detail_djkn =  JSON.parse(response.data.pengajuan[0].detail_djkn)
                            }
                        })   
                    }

                },    
                beforeTab1Switch: function() {
                    return this.$validator.validateAll("step1").then((result) => {

                        if (!result) {
                            alert('mohon melengkapi seluruh form diatas')
                            return false;
                        } else {   
                            this.ShowOtherTabDJKN()
                            this.pengajuan.status_pengajuan="Step 1 (Input Basic Info)"
                            console.log(this.pengajuan.status_pengajuan)
                            this.addPengajuan()
                            return true
                        }

                    })
                },
                formatDates(dateOne) {
                    let formattedDates = ''
                    if (dateOne) {
                        formattedDates = dateFns.format(dateOne, this.dateFormat)
                    }
                    return formattedDates
                },
                onClosed: function() {
                    var datesStr = this.formatDates(this.pengajuan.tglSurat_pemohon)
                    console.log('Dates Selected: ' + datesStr)
                    this.trigger = false
                },
                onMonthChange: function(dates) {
                    console.log('months changed', dates)
                },

                beforeTab2Switch: function() {  
                    return this.$validator.validateAll("step2").then((result) => {
                        if (!result) {
                            alert('mohon melengkapi seluruh form diatas')
                            return false;
                        } else {
                            this.uploadFile()
                            this.ShowOtherTabDJKN()
                            this.pengajuan.status_pengajuan = "Finish Input Dokumen" 
                            this.updatePengajuan()
                            return true
                        }
                    })
                    
                },
                getProvinsi() {
                    let self = this
                    axios.get(this.url + "/theme_costume/static_content/provinsi_kantor.json")
                        .then(response => {
                            self.option_provinsi = response.data
                        })
                },
                getKabupaten() {
                    let self = this
                    axios.get(this.url + "/theme_costume/static_content/provinsi_kantor.json")
                        .then(response => {
                            self.kabupaten = response.data;
                            let dataKabupaten = []
                            self.kabupaten.map((data, idx)=>{ 
                                                            for (let key in data.kabupaten) {
                                                                kab_kantor = {
                                                                               name:data.kabupaten[key].name,
                                                                               provinsi:data.provinsi,
                                                                               kantor:data.kantor,
                                                                               email:data.email,
                                                                               alamat:data.alamat 
                                                                            }
                                                                dataKabupaten.push(kab_kantor)
                                                            }
                                                        })
                            self.option_kabupaten = dataKabupaten

                        })
                },
                getKementerianLembaga() {
                    let self = this
                    axios.get(this.url + "/theme_costume/static_content/kementerian_lembaga.json")
                        .then(response => {
                            self.option_kementerian_lembaga = response.data.nama_kemeterian_lembaga
                        })
                },
                name_kementerian_lembaga({no,nama_KL}) {

                    return `${nama_KL}`
                },
                nameJenisBMN({name}) {

                    return `${name}`
                },
                name_provinsi({provinsi}) {

                    return `${provinsi}`
                },
                name_kabupaten({name}) {

                    return `${name}`
                },
                ShowOtherTabDJKN() {
                    this.clearNotif()
                    console.log("masuk1")
                    console.log(this.pengajuan.jenis_bmn.name)
                    if (this.pengajuan.jenis_bmn.name === 'Tanah' || this.pengajuan.jenis_bmn.name === 'Bangunan' || this.pengajuan.jenis_bmn.name === 'Tanah dan Bangunan') {
                        console.log("masuk5")
                        if (this.pengajuan.totalnilai_bmn >= 75000000000) {
                            console.log("masuk4")
                            this.isShowOtherTabDJKN = false
                            if ((this.pengajuan.totalnilai_bmn >= 75000000000) && (this.pengajuan.totalnilai_bmn <= 100000000000)) {
                                this.notif75M = true
                                this.pengajuan.status_proses = 'DJKN Pusat'
                                //------------------>insert DB Table status 
                            } else {
                                this.notif100M = true
                                this.pengajuan.status_proses = 'PKNSI'
                                //------------------>insert DB Table status 
                            }
                        } else {
                            //pilah akan dikelola kanwil atau KPKNL
                            this.isShowOtherTabDJKN = true
                            this.notifProses = true
                            console.log("masuk2")
                            if ((this.pengajuan.totalnilai_bmn >= 10000000000) && (this.pengajuan.totalnilai_bmn < 75000000000)) {
                                console.log("masuk3")    
                                this.KanwilProses = true
                                this.areaProsesText = 'Kanwil DJKN Papua, Papua Barat dan Maluku'
                                this.pengajuan.status_proses = 'KANWIL Papua, Papua Barat dan Maluku'
                                this.pengajuan.email_djkn = 'pknkanwil17@gmail.com'
                                //------------------>insert DB Table status 
                            } else {
                                this.DjknProses = true
                                this.areaProsesText = this.pengajuan.kabupaten.kantor
                                this.pengajuan.status_proses = this.pengajuan.kabupaten.kantor                                
                                this.pengajuan.email_djkn = this.pengajuan.kabupaten.email
                                //------------------>insert DB Table status 
                            }

                        }
                    }

                },
                clearNotif() {
                    this.isShowOtherTabDJKN = false
                    this.notif100M = false
                    this.notif75M = false
                    this.KanwilProses = false
                    this.DjknProses = false
                    this.notifProses = false
                    this.areaProsesText = ''
                },

                uploadFile: function(e) {
                    this.file1 = this.$refs.fileSuratPermohon.files[0];
                    this.file2 = this.$refs.fileDaftarRincian.files[0];
                    this.file3 = this.$refs.fileDokumenKelengkapan.files[0];



                    if (this.file1 && this.file2 && this.file3) {

                        let formData = new FormData();
                        formData.append('file1', this.file1);
                        formData.append('file2', this.file2);
                        formData.append('file3', this.file3);
                        let self = this
                        let ax = axios.post(this.url + '/hideend/pengajuan/uploadFile', formData, {
                                headers: {
                                    'Content-Type': 'multipart/form-data'
                                }
                            })
                            .then(function(response) {
                                    self.fileSuratPermohon = response.data.file[0]
                                    self.fileDaftarRincian = response.data.file[1]
                                    self.fileDokumenKelengkapan = response.data.file[2]
                            })
                            .catch(function(error) {
                                console.log(error);
                            });

                            console.log("axios return")
                            console.log(ax)
                    }

                },
                clearPengajuanData() {
                    this.updatePengajuan()
                    this.resetTab()
                    window.location.href = myUrl + 'hideend/pengajuan/status';
                },
                resetTab() {
                    
                   this.$refs.vuewizard.reset()
                   this.errors.clear()
                },
                updatePengajuan() {
                    //get Select name
                    this.pengajuan.fileSuratPermohon = this.fileSuratPermohon
                    this.pengajuan.fileDaftarRincian = this.fileDaftarRincian
                    this.pengajuan.fileDokumenKelengkapan = this.fileDaftarRincian

                    this.pengajuan.nama_kementerian_lembaga = this.pengajuan.kementerian_lembaga.nama_KL
                    this.pengajuan.nama_provinsi =      this.pengajuan.kabupaten.provinsi
                    this.pengajuan.nama_kabupaten = this.pengajuan.kabupaten.name
                    this.pengajuan.nama_jenis_bmn = this.pengajuan.jenis_bmn.name

                    var formData = this.formData(this.pengajuan);
                    axios.post(this.url + "/hideend/pengajuan/update", formData).then(function(response) {
                        if (response.data.error) {
                            console.log(response.data.msg);
                        } else {
                            console.log('Update Success')
                        }
                    })
                },
                addPengajuan() {
                    //get Select name
                    this.pengajuan.nama_kementerian_lembaga = this.pengajuan.kementerian_lembaga.nama_KL
                    this.pengajuan.nama_kabupaten = this.pengajuan.kabupaten.name
                    this.pengajuan.nama_jenis_bmn = this.pengajuan.jenis_bmn.name                    
                    this.pengajuan.detail_djkn = JSON.stringify(this.pengajuan.kabupaten)
                    if(this.pengajuan.id===''){
                        var formData = this.formData(this.pengajuan);
                        //kudu ada assign spt ini karena di tengah axios we couldn't call "this"> it would return promise
                        let self = this;
                        axios.post(this.url + "/hideend/pengajuan/add", formData).then(function(response) {
                            self.pengajuan.id = response.data.id
                            if (response.data.error) {
                                console.log(response.data.msg);
                            } 

                        })
                    }else{
                      this.updatePengajuan()
                    }

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
Vue.component('table-status-pengajuan-pspbmn', {
            template: '#pspTablePengajuan',
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

                    gotoEditData(id){
                       window.location.href = myUrl + 'hideend/pengajuan/index/'+id;  
                    },
                    refresh(){
                        this.showAll(); //for preventing
                    },

                    showAll(){ 
                        let self = this
                        axios.post(this.url+"/hideend/pengajuan/showAll").then(function(response){
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


Vue.component('hasil-pengajuan-pspbmn-kanwil', {
            template: '#pspHasilPengajuanFormKANWIL',
            props: ['datapengajuan','tipepengajuan','jenisform'],
            data() {
                 return {
                    url: myUrl,
                    choosePengajuan:this.datapengajuan,          
                    showDocumentVerifikasiFinal:false,         
                    showDocumentKekuranganFinal:false,         
                    showDocumentSurveyFinal:false,         
                    daftarTembusan:[
                                    { nama:''}
                                    ],          
                    daftarKekuranganData:(this.datapengajuan.daftarKekuranganData==="null"||this.datapengajuan.daftarKekuranganData==="")?"":JSON.parse(this.datapengajuan.daftarKekuranganData),
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
                        generateHasilVerifikasiKANWIL : false
                }

            },
            created(){
            },
            computed: {

                // a computed getter
                hreffileHasilVerifikasi: function () {
                    // `this` points to the vm instance
                    return this.url+this.choosePengajuan.suratHasilVerifikasifinal
                    //return this.url
                },

                 // a computed getter
                hreffileNDSPersetujuan: function () {
                    // `this` points to the vm instance
                    return this.url+this.choosePengajuan.suratNDSPersetujuanfinal
                    // return this.url
                },



                // a computed getter
                hreffileKMK: function () {
                    // `this` points to the vm instance
                    return this.url+this.choosePengajuan.suratKMKfinal
                    //return this.url
                },


               // a computed getter
                hreffileSalinanKMK: function () {
                    // `this` points to the vm instance
                    return this.url+this.choosePengajuan.suratSalinanKMKfinal
                    //return this.url
                },
                // a computed getter
                hreffileNDSPermintaanKelengkapan: function () {
                    // `this` points to the vm instance
                    return this.url+this.choosePengajuan.suratNDSPermintaanKelengkapanfinal
                    //return this.url
                },
                // a computed getter
                hreffileNDSSurveyLapangan: function () {
                    // `this` points to the vm instance
                    return this.url+this.choosePengajuan.suratNDSSurveyLapanganfinal
                    //return this.url
                }
            },
            methods:{

                isEmptyDokumenCompleteFinal:function(){
                     console.log(this.choosePengajuan.suratHasilVerifikasifinal)
                    console.log((this.choosePengajuan.suratHasilVerifikasifinal==="null"||this.choosePengajuan.suratHasilVerifikasifinal===""))
                    return (this.choosePengajuan.suratHasilVerifikasifinal==="null"||this.choosePengajuan.suratHasilVerifikasifinal==="")
                },
                isEmptyDokumenKelengkapanFinal:function(){

                     console.log(this.choosePengajuan.suratHasilVerifikasifinal)
                    console.log((this.choosePengajuan.suratHasilVerifikasifinal==="null"||this.choosePengajuan.suratHasilVerifikasifinal===""))
                    return (this.choosePengajuan.suratHasilVerifikasifinal==="null"||this.choosePengajuan.suratHasilVerifikasifinal==="")
                },
                isEmptyDokumenSurveyFinal:function(){

                     console.log(this.choosePengajuan.suratHasilVerifikasifinal)
                    console.log((this.choosePengajuan.suratHasilVerifikasifinal==="null"||this.choosePengajuan.suratHasilVerifikasifinal===""))
                    return (this.choosePengajuan.suratHasilVerifikasifinal==="null"||this.choosePengajuan.suratHasilVerifikasifinal==="")
                },
                finishVerifikasiProses(){
                    this.isShowUploadWizardForm = false;
                    this.isShowVerifikasiForm = false;
                    let valueHide ={
                                    isShowFormKANWIL : false                                    
                                }
                    this.$emit('send-data', valueHide)
                },

        }
    })
Vue.component('hasil-pengajuan-pspbmn-kpknl', {
            template: '#pspHasilPengajuanFormKANWIL',
            props: ['datapengajuan','tipepengajuan','jenisform'],
            data() {
                 return {
                    url: myUrl,
                    choosePengajuan:this.datapengajuan,          
                    showDocumentVerifikasiFinal:false,         
                    showDocumentKekuranganFinal:false,         
                    showDocumentSurveyFinal:false,         
                    daftarTembusan:[
                                    { nama:''}
                                    ],          
                    daftarKekuranganData:(this.datapengajuan.daftarKekuranganData==="null"||this.datapengajuan.daftarKekuranganData==="")?"":JSON.parse(this.datapengajuan.daftarKekuranganData),
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
                        generateHasilVerifikasiKANWIL : false
                }

            },
            created(){
            },
            computed: {

                // a computed getter
                hreffileHasilVerifikasi: function () {
                    // `this` points to the vm instance
                    return (this.choosePengajuan.suratHasilVerifikasifinal==="null"||this.choosePengajuan.suratHasilVerifikasifinal==="")?"":(this.url+this.choosePengajuan.suratHasilVerifikasifinal)
                    //return this.url
                },

                 // a computed getter
                hreffileNDSPersetujuan: function () {
                    // `this` points to the vm instance
                    return (this.choosePengajuan.suratNDSPersetujuanfinal==="null"||this.choosePengajuan.suratNDSPersetujuanfinal==="")?"":(this.url+this.choosePengajuan.suratNDSPersetujuanfinal)
                    // return this.url
                },



                // a computed getter
                hreffileKMK: function () {
                    // `this` points to the vm instance
                    return (this.choosePengajuan.suratKMKfinal==="null"||this.choosePengajuan.suratKMKfinal==="")?"":(this.url+this.choosePengajuan.suratKMKfinal)
                    //return this.url
                },


               // a computed getter
                hreffileSalinanKMK: function () {
                    // `this` points to the vm instance
                    return (this.choosePengajuan.suratSalinanKMKfinal==="null"||this.choosePengajuan.suratSalinanKMKfinal==="")?"":(this.url+this.choosePengajuan.suratSalinanKMKfinal)
                    //return this.url
                },
                // a computed getter
                hreffileNDSPermintaanKelengkapan: function () {
                    // `this` points to the vm instance
                    return (this.choosePengajuan.suratNDSPermintaanKelengkapanfinal==="null"||this.choosePengajuan.suratNDSPermintaanKelengkapanfinal==="")?"":(this.url+this.choosePengajuan.suratNDSPermintaanKelengkapanfinal)
                    //return this.url
                },
                // a computed getter
                hreffileNDSSurveyLapangan: function () {
                    // `this` points to the vm instance
                    return (this.choosePengajuan.suratNDSSurveyLapanganfinal==="null"||this.choosePengajuan.suratNDSSurveyLapanganfinal==="")?"":(this.url+this.choosePengajuan.suratNDSSurveyLapanganfinal)
                    //return this.url
                }
            },
            methods:{
                isEmptyDokumenCompleteFinal:function(){

                     console.log(this.choosePengajuan.suratHasilVerifikasifinal)
                    console.log((this.choosePengajuan.suratHasilVerifikasifinal==="null"||this.choosePengajuan.suratHasilVerifikasifinal===""))
                    return (this.choosePengajuan.suratHasilVerifikasifinal==="null"||this.choosePengajuan.suratHasilVerifikasifinal==="")
                },
                isEmptyDokumenKelengkapanFinal:function(){
                    console.log(this.choosePengajuan.suratHasilVerifikasifinal)
                    console.log((this.choosePengajuan.suratHasilVerifikasifinal==="null"||this.choosePengajuan.suratHasilVerifikasifinal===""))
                    return (this.choosePengajuan.suratHasilVerifikasifinal==="null"||this.choosePengajuan.suratHasilVerifikasifinal==="")
                },
                isEmptyDokumenSurveyFinal:function(){
                    
                     console.log(this.choosePengajuan.suratHasilVerifikasifinal)
                    console.log((this.choosePengajuan.suratHasilVerifikasifinal==="null"||this.choosePengajuan.suratHasilVerifikasifinal===""))
                    return (this.choosePengajuan.suratHasilVerifikasifinal==="null"||this.choosePengajuan.suratHasilVerifikasifinal==="")
                },
                finishVerifikasiProses(){
                    this.isShowUploadWizardForm = false;
                    this.isShowVerifikasiForm = false;
                    let valueHide ={
                                    isShowFormKANWIL : false                                    
                                }
                    this.$emit('send-data', valueHide)
                },
                beforeTab4SwitchKANWIL: function() {
                    return true
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