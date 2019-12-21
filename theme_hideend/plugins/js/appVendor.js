var datepickerOptions = {}
Vue.use(window.AirbnbStyleDatepicker, datepickerOptions)
Vue.use(VueFormWizard)
// Vue.use(vuejsDatepicker)
Vue.use(VeeValidate)
Vue.config.debug = true;
Vue.use(VuejsDialog.main.default)
// Vue.use(VMoney)
Vue.use(VueMultiselect)
Vue.component('vue-multiselect', window.VueMultiselect.default)

//dynamic url
let myUrl = window.location.origin+"/";

if(myUrl.includes("localhost")){
  var pathArray = window.location.pathname.split( '/' );
  myUrl += pathArray [1] + "/";
}



componentTableVendor = {
            template: '#componentTableVendor',
            data() {
                 return {
                    url: myUrl,
                    rekap:[],
                    emptyResult: false,
                    successMSG: '',
                    totalData:0,
                    currentPage: 0,
                    rowCountPage: 5,
                    pageRange: 2,
                    vendor:{},
                    choosedVendor:{},
                    
                 }

            },
            created(){
                this.showAll()
            },
            methods:{          
                    selectVendor(data){
                        this.choosedVendor = data
                    },

                    sendParentVendor(){
                         this.$emit('data-vendor', this.choosedVendor)
                    },
                    refresh(){
                        this.showAll(); //for preventing
                    },
                    showAll(id){
                        if (typeof id === "undefined"){
                            id=""
                        }
                        let self = this
                        axios.post(this.url+"/hideend/vendor/showAll/"+id).then(function(response){
                                 if(response.data.vendor == null){
                                        self.vendor={}    
                                        console.log("error show all")
                                    }else{
                                        self.getData(response.data.vendor);
                                    }
                        })
                    },
                    getData(value){
                        this.emptyResult = false; // become false if has a record
                        this.totalData = value.length //get total of user
                        this.vendor = value.slice(this.currentPage * this.rowCountPage, (this.currentPage * this.rowCountPage) + this.rowCountPage); //slice the result for pagination
                        
                         // if the record is empty, go back a page
                        if(this.vendor.length == 0 && this.currentPage > 0){ 
                            this.pageUpdate(self.currentPage - 1)
                            this.clearAll();  
                        }
                    },
                    pageUpdate(pageNumber){
                        this.currentPage = pageNumber; //receive currentPage number came from pagination template
                        this.refresh()  
                    },
                    

        },
}

componentFormVendor = {
            template: '#componentFormVendor',
            data() {
                 return {
                    url: myUrl,
                    stepIndex:0
                 }

            },
            created(){
                this.showAll()
            },
            methods:{          
                    selectVendor(data){
                        this.choosedVendor = data
                    },

                    sendParentVendor(){
                         this.$emit('data-vendor', this.choosedVendor)
                    },
                    refresh(){
                        this.showAll(); //for preventing
                    },
                    showAll(id){
                        if (typeof id === "undefined"){
                            id=""
                        }
                        let self = this
                        axios.post(this.url+"/hideend/vendor/showAll/"+id).then(function(response){
                                 if(response.data.vendor == null){
                                        self.vendor={}    
                                        console.log("error show all")
                                    }else{
                                        self.getData(response.data.vendor);
                                    }
                        })
                    },
                    getData(value){
                        this.emptyResult = false; // become false if has a record
                        this.totalData = value.length //get total of user
                        this.vendor = value.slice(this.currentPage * this.rowCountPage, (this.currentPage * this.rowCountPage) + this.rowCountPage); //slice the result for pagination
                        
                         // if the record is empty, go back a page
                        if(this.vendor.length == 0 && this.currentPage > 0){ 
                            this.pageUpdate(self.currentPage - 1)
                            this.clearAll();  
                        }
                    },
                    pageUpdate(pageNumber){
                        this.currentPage = pageNumber; //receive currentPage number came from pagination template
                        this.refresh()  
                    },
                    

        },
}






var v = new Vue({
    el: '#app',
    components: {
        'table-vendor': componentTableVendor,
        'form-vendor': componentFormVendor,
    },
    data: {
        url: myUrl,
        choosedVendor:{},
        showFormVendor:false,
        showTableVendor:true,
       
    },

    methods: {
        getDataVendor(value){
            this.showFormVendor=true
            this.showTableVendor=false
            this.choosedVendor = value
        }







    }
})