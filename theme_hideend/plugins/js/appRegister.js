

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

Vue.component('register-pspbmn', {
            template: '#pspBMNRegister',
            data() {
                 return {
                    url: myUrl,

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
               
            },
            methods:{


                    }
 })







var v = new Vue({
    el: '#app',
    data: {
        url: myUrl,

    },
    created() {

    },
    computed: {

    },
    methods: {

      


    }
})