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

if(url.includes("localhost")){
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
                            nama_petugas: '',
                            nip_petugas: '',
                            jabatan_petugas: '',
                            kontak_petugas: '',
                            status_pengajuan: '',
                            email_petugas: '',
                            kementerian_lembaga: null, //becarefull disini, karena yang dipassing select adalah object. selalu akses spesifik value
                            nama_kementerian_lembaga: '', //becarefull disini, karena yang dipassing select adalah object. selalu akses spesifik value
                            alamat_kantorKL: '',
                            satuan_kerja: '',
                            jenis_bmn: null,
                            nama_jenis_bmn: '',
                            totalnilai_bmn: '',
                            provinsi: null,
                            nama_provinsi: '',
                            kabupaten: null,
                            nama_kabupaten: '',
                            status_proses: '',
                            jabatan_pemohon: '',
                            noSurat_pemohon: '',
                            tglSurat_pemohon: '',
                            perihalSurat_pemohon: '',
                            status_pengajuan: '',
                            fileSuratPermohon: '',
                            fileDaftarRincian: '',
                            fileDokumenKelengkapan: '',
                            fileUploadBackupSimak: ''
                        },
                        fileSuratPermohon: '',
                        fileDaftarRincian: '',
                        fileDokumenKelengkapan: '',
                        fileUploadBackupSimak: '',
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
                this.getProvinsi()

            },
            methods: {
                
                beforeTab1Switch: function() {
                    return this.$validator.validateAll("step1").then((result) => {

                        if (!result) {
                            alert('mohon melengkapi seluruh form diatas')
                            return false;
                        } else {
                             this.ShowOtherTabDJKN()
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
            let validateVar =  this.$validator.validateAll("step2").then((result) => {
                if (!result) {
                    alert('mohon melengkapi seluruh form diatas')
                    return false;
                } else {
                    this.uploadFile()
                    this.ShowOtherTabDJKN()

                    console.log("this.fileDokumenKelengkapan")
                    console.log(this.fileDokumenKelengkapan)
                    this.updatePengajuan()

                    console.log("this.fileDokumenKelengkapan after updatePengajuan()")
                    console.log(this.fileDokumenKelengkapan)
                    return true
                }
            })
                return validateVar
            
        },
        resetTab: function() {

            this.$refs.wizard.reset()
        },
        getProvinsi() {
            let self = this
            axios.get(this.url + "/theme_costume/static_content/provinsi_kantor.json")
                .then(response => {
                    self.option_provinsi = response.data
                })
        },
        getKabupaten(provinsiName) {
            let self = this
            axios.get(this.url + "/theme_costume/static_content/provinsi_kantor.json")
                .then(response => {
                    self.kabupaten = (response.data.filter(d => d.provinsi === provinsiName.provinsi));
                    self.option_kabupaten = self.kabupaten[0]["kabupaten"]

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
            if (this.pengajuan.jenis_bmn.name == 'Tanah' || this.pengajuan.jenis_bmn.name === 'Bangunan' || this.pengajuan.jenis_bmn.name === 'Tanah & Bangunan') {
                if (this.pengajuan.totalnilai_bmn >= 75000000000) {
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
                    if ((this.pengajuan.totalnilai_bmn >= 10000000000) && (this.pengajuan.totalnilai_bmn < 75000000000)) {
                        this.KanwilProses = true
                        this.areaProsesText = 'Kanwil DJKN Papua, Papua Barat dan Maluku'
                        this.pengajuan.status_proses = 'KANWIL Papua, Papua Barat dan Maluku'
                        //------------------>insert DB Table status 
                    } else {
                        this.DjknProses = true
                        this.areaProsesText = this.pengajuan.provinsi.kantor
                        this.pengajuan.status_proses = this.pengajuan.provinsi.kantor
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
            this.file4 = this.$refs.fileUploadBackupSimak.files[0];



            if (this.file1 && this.file2 && this.file3 && this.file4) {

                let formData = new FormData();
                formData.append('file1', this.file1);
                formData.append('file2', this.file2);
                formData.append('file3', this.file3);
                formData.append('file4', this.file4);
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
                            self.fileUploadBackupSimak = response.data.file[3]

                            


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
            this.pengajuan = {
                nama_petugas: '',
                nip_petugas: '',
                jabatan_petugas: '',
                kontak_petugas: '',
                email_petugas: '',
                kementerian_lembaga: '', //becarefull disini, karena yang dipassing select adalah object. selalu akses spesifik value
                alamat_kantorKL: '',
                satuan_kerja: '',
                jenis_bmn: {
                    name: ''
                },
                totalnilai_bmn: '',
                provinsi: '',
                kabupaten: '',
                status_proses: '',
                status_pengajuan: '',
                jabatan_pemohon: '',
                noSurat_pemohon: '',
                tglSurat_pemohon: '',
                perihalSurat_pemohon: '',
                fileSuratPermohon: '',
                fileDaftarRincian: '',
                fileDokumenKelengkapan: '',
                fileUploadBackupSimak: ''
            }
            this.resetTab()
        },
        resetTab() {
            
           this.$refs.vuewizard.reset()
        },
        updatePengajuan() {
            //get Select name
            this.pengajuan.fileSuratPermohon = this.fileSuratPermohon
            this.pengajuan.fileDaftarRincian = this.fileDaftarRincian
            this.pengajuan.fileDokumenKelengkapan = this.fileDaftarRincian
            this.pengajuan.fileUploadBackupSimak = this.fileDaftarRincian

            this.pengajuan.nama_kementerian_lembaga = this.pengajuan.kementerian_lembaga.nama_KL
            this.pengajuan.nama_provinsi = this.pengajuan.provinsi.provinsi
            this.pengajuan.nama_kabupaten = this.pengajuan.kabupaten.name
            this.pengajuan.nama_jenis_bmn = this.pengajuan.jenis_bmn.name
            this.pengajuan.status_pengajuan = "Dokumen Terkirim"

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
            this.pengajuan.nama_provinsi = this.pengajuan.provinsi.provinsi
            this.pengajuan.nama_kabupaten = this.pengajuan.kabupaten.name
            this.pengajuan.nama_jenis_bmn = this.pengajuan.jenis_bmn.name
            this.pengajuan.status_pengajuan = "Finish Terkirim"
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
            },
            computed: {
                valName() {
                    if (this.pengajuan.nama_petugas.length === 0 || this.pengajuan.nama_petugas.length > 50) {
                        return true;
                    } 
                    return false;
                }
            }
        })

var v = new Vue({
    el: '#app',
    data: {
        
    },
    methods: {

    }
})