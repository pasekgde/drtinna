
  <!-- Responsive Table -->
  <div class="row">
    <div class="col s12 m12 l12">
           <table-verifikasi-pspbmn 
                            ref="form" 
                            v-on:send-data="getDataChoosePengajuan"
                            v-on:send-jenisform="getJenisForm"
                            v-on:show-hasil="showHasilForm"
                        />   
    </div>
  </div>

