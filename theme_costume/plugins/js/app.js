var datepickerOptions = {}
Vue.use(window.AirbnbStyleDatepicker, datepickerOptions)
Vue.component('modal',{ //modal
    template:`
      <transition
                enter-active-class="animated rollIn"
                     leave-active-class="animated rollOut">
    <div class="modal is-active" >
  <div class="modal-card border border border-secondary">
    <div class="modal-card-head text-center bg-dark">
    <div class="modal-card-title text-white">
          <slot name="head"></slot>
    </div>
<button class="delete" @click="$emit('close')"></button>
    </div>
    <div class="modal-card-body">
         <slot name="body"></slot>
    </div>
    <div class="modal-card-foot" >
      <slot name="foot"></slot>
    </div>
  </div>
</div>
</transition>
    `
})
var v = new Vue({
   el:'#app',
    data:{
        url:'http://localhost/greenbike/',
        search: {text: ''},
        emptyResult:false,
        chooseTrade:{},
        formValidate:[],
        successMSG:'',
        tpBtn:0,
        isDisabled:1,
        enableEnquiry:false,
        inputDateOne: '',
        inputDateTwo: '',
        sundayFirst: false,
        alignRight: false,
        trigger: false,
        newBooking:{
              idroom:null,
              arrivaldate:'',
              departuredate:'',
              fullname:'',
              country:null,
              email:'',
              contact:'',
              ordernote:''},
        inlineDateOne: '',      
        dateFormat: 'D MMM YYYY',
        currentPage: 0,
        rowCountPage:5,
        totalTrades:0,
        pageRange:2
    },
     created(){
    },
    methods:{
          searchUser(){
            var formData = v.formData(v.search);
              axios.post(this.url+"tradeEdit/searchUser", formData).then(function(response){
                  if(response.data.users == null){
                      v.noResult()
                    }else{
                      v.getData(response.data.users);
                    
                    }  
            })
        },
        
        submitTour(){
            var formData = v.formData(v.chooseTrade); 

             axios.post(this.url+"/home/submitTour/"+v.tpBtn, formData).then(function(response){
                if(response.data.error){
                    v.formValidate = response.data.msg;
                }else{
                  v.successMSG = response.data.success;
                  
                }
            })
        },
         formData(obj){
      			var formData = new FormData();
      		      for ( var key in obj ) {
      		          formData.append(key, obj[key]);
      		      } 
      		      return formData;
		      },
        getData(trades){
            v.emptyResult = false; // become false if has a record
            v.totalTrades = trades.length //get total of user
            v.trades = trades.slice(v.currentPage * v.rowCountPage, (v.currentPage * v.rowCountPage) + v.rowCountPage); //slice the result for pagination
            
             // if the record is empty, go back a page
            if(v.trades.length == 0 && v.currentPage > 0){ 
            v.pageUpdate(v.currentPage - 1)
            v.clearAll();  
            }
        },
            
        selectTpButton(tpBtn){
            v.tpBtn = tpBtn; 
            console.log(v.tpBtn);
        },       

        selectTrade(trade){
            v.chooseTrade = trade; 
        },
        clearMSG(){
            setTimeout(function(){
			 v.successMSG=''
			 },3000); // disappearing message success in 2 sec
        },
        clearAll(){
            v.newTrades = { 
            firstname:'',
            lastname:'',
            gender:'',
            birthday:'',
            email:'',
            contact:'',
            address:''};
            v.formValidate = false;
            v.addModal= false;
            v.editModal=false;
            v.deleteModal=false;
            v.refresh()
            
        },
        noResult(){
          
               v.emptyResult = true;  // become true if the record is empty, print 'No Record Found'
                      v.users = null 
                     v.totalTrades = 0 //remove current page if is empty
            
        },

        pickGender(gender){
           return v.newTrades.gender = gender //add new user with selecting gender
        },
        changeGender(gender){
             return v.chooseTrade.gender = gender //update gender
        },
        imgGender(value){
            return v.url+'assets/img/gender_'+value+'.png' //for image gender sign in the table
        },
        pageUpdate(pageNumber){
              v.currentPage = pageNumber; //receive currentPage number came from pagination template
                v.refresh()  
        },
        refresh(){
             v.search.text ? v.searchUser() : v.showAll(); //for preventing
            
        },
        formatDates: function(dateOne, dateTwo) {
            var formattedDates = ''
            if (dateOne) {
              formattedDates = dateFns.format(dateOne, this.dateFormat)
            }
            if (dateTwo) {
              formattedDates += ' - ' + dateFns.format(dateTwo, this.dateFormat)
            }
            return formattedDates
          },
          onClosed: function() {
            var datesStr = this.formatDates(this.newBooking.arrivaldate, this.newBooking.departuredate)
            console.log('Dates Selected: ' + datesStr)
            this.trigger = false
          },
          toggleAlign: function() {
            this.alignRight = !this.alignRight
          },
          triggerDatepicker: function() {
            this.trigger = !this.trigger
          },
          onMonthChange: function(dates) {
            console.log('months changed', dates)
          }
    }
})