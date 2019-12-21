<script type="text/x-template" id="componentFormVendor">
<div>
    <div id="responsive-table" class="card card card-default scrollspy">
        <div class="card-content">
            
            <div class="row">
                <div class="col s12">
                    <form-wizard shape="tab" :start-index.sync="stepIndex">
                        <wizard-step slot-scope="props" slot="step" :tab="props.tab" :transition="props.transition" :index="props.index">
                        </wizard-step>
                        <h3 slot="title"></h3>
                        <tab-content title="Inital Input" icon="fa fa-user" :before-change="beforeTab1SwitchKANWIL" >
                            <!-- Form with icon prefixes -->
                            <div style="width:100%">
                                <div id="prefixes" class="card card card-default scrollspy">
                                    <div class="card-content">
                                        <h4 class="card-title">Data with validation</h4>
                                        <div class="col s12">
                                            <div class="row">
                                                <div class="input-field col s12">
                                                    <i class="material-icons prefix hide-on-small-only">account_circle</i>
                                                    <input class="col s12" id="name3" type="text">
                                                    <label for="name3" class="hideMarginSmall">Name</label>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="input-field col s12">
                                                    <i class="material-icons prefix hide-on-small-only">email</i>
                                                    <input id="email3" type="email">
                                                    <label for="email3" class="hideMarginSmall">Email</label>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="input-field col s12">
                                                    <i class="material-icons prefix hide-on-small-only">lock_outline</i>
                                                    <input id="password3" type="password">
                                                    <label for="password3" class="hideMarginSmall">Password</label>
                                                </div>
                                            </div>
                                            
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </tab-content>
                        <tab-content title="Pengecekan Dokumen" icon="fa fa-certificate" >
                        
                        </tab-content>
                        <tab-content title="Input Dokumen" icon="fa fa-envelope-o"  :before-change="beforeTab2SwitchKANWIL">
                        </tab-content>
                        <tab-content title="Hasil Verifikasi" icon="fa fa-certificate" :before-change="beforeTab3SwitchKANWIL" >
                        
                        </tab-content>
                        <tab-content title="Last step" icon="fa fa-check-circle">
                        <div class="callout callout-success">
                            <h4>Terima Kasih</h4>
                            <h4>Permohonan Verifikasi Dokumen Telah Selesai dilakukan.</h4>
                        </div>
                        </tab-content>
                        <template slot="footer" slot-scope="props">
                        <div class="wizard-footer-right2">
                            <wizard-button v-if="!props.isLastStep" @click.native="props.nextTab()" class="wizard-footer-right" :style="props.fillButtonStyle">Save & Next</wizard-button>
                            <wizard-button v-else @click.native="finishVerifikasiProses" class="wizard-footer-right finish-button" :style="props.fillButtonStyle">{{props.isLastStep ? 'Done' : 'Next'}}</wizard-button>
                            <wizard-button v-if="props.activeTabIndex > 0" @click.native="props.prevTab()" class="btn btn-warning" :style="props.fillButtonStyle">Back</wizard-button>
                        </div>
                        </template>
                    </form-wizard>
                </div>
            </div>
        </div>
    </div>
</div>
</script>