<!-- Responsive Table -->
<div class="row">
    <div class="col s12 m12 l12" v-if="showTableVendor">
        <table-vendor
            ref="tableVendor"
            @data-vendor="getDataVendor">
        </table-vendor>
    </div>
    <div class="col s12 m12 l12" v-if="showFormVendor">
        <form-vendor
            ref="formVendor"
            :datavendor="choosedVendor">
        </tabforme-vendor>
    </div>
</div>