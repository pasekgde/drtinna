<script type="text/x-template" id="componentTableVendor">
<div>
    <div id="responsive-table" class="card card card-default scrollspy">
        <div class="card-content">
            
            <div class="row">
                <div class="col s12">
                    <table class="responsive-table">
                        <thead>
                            <tr>
                                <th data-field="id">#</th>
                                <th data-field="name">Reg.</th>
                                <th data-field="price">Nama</th>
                                <th data-field="total">Perusahaan</th>
                                <th data-field="status">Uraian</th>
                                <th data-field="status">Status</th>
                                <th data-field="status">Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            
                                <tr v-for="data in vendor" class="table-default">
                                    <td>{{data.id}}</td>
                                    <td >{{data.no_reg}}</td>
                                    <td >{{data.nama}}</td>
                                    <td >{{data.perusahaan}}</td>
                                    <td >{{data.uraian}}</td>
                                    <td >{{data.status}}</td>
                                    
                                    
                                    <td>
                                        <a class="waves-effect waves-light btn mb-1" @click.prevent=
                                        "selectVendor(data);sendParentVendor()"><i class="material-icons dp48">info</i></a>
                                        <a class="waves-effect waves-light btn mb-1" @click.prevent=
                                        ""><i class="material-icons dp48">delete</i></a>
                                        
                                        
                                        
                                    </td>
                                </tr>
                                
                               <!--  <tr class="table-default">
                                    <td>&nbsp;</td>
                                    <td>&nbsp;</td>
                                    <td>&nbsp;</td>
                                    <td colspan="4">
                                        <tr class="">
                                            <td>ID :</td>
                                            <td>{{data.id}}</td>
                                            <td>&nbsp;</td>
                                            <td>&nbsp;</td>
                                             <td>ID :</td>
                                             <td>{{data.id}}</td>
                                        </tr>
                                        <tr>
                                            <td>Nama :</td>
                                            <td>{{data.nama}}</td>
                                        </tr>
                                    </td>
                                    
                                </tr> -->
                            <tr v-if="emptyResult">
                                <td colspan="9" rowspan="4" class="text-center h1">No Record Found</td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>
</script>