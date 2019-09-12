<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Pengajuan extends CI_Controller
{

	public function __construct()
	{
		parent::__construct();
		$this->load->model("content_model");
		$this->load->model("forex_model");
		$this->load->model("user_model");
		$this->load->model("pengajuan_model");
	//	$this->load->helper(array('form', 'url'));
		if (!$this->user->loggedin) $this->template->error(lang("error_1"));
		// if(!$this->common->has_permissions(array(
		// 		"admin", "content_manager", "content_worker"), $this->user)) {
		// 		$this->template->error(lang("error_81"));
		// }
	}


	public function index($idPengajuan='')
	{
		$this->template->loadData("activeLink",
			array("content" => array("general" => 1)));

		$vueComponent = $this->load->view("hidepage/vue/ComponentPspBMNPengajuanWizardForm.js",'',true);

		$this->template->loadExternal(
			'<link rel="stylesheet" href="https://unpkg.com/vue-form-wizard/dist/vue-form-wizard.min.css">'.
			'<link rel="stylesheet" href="https://unpkg.com/vue-multiselect@2.1.0/dist/vue-multiselect.min.css">'.
			'<link rel="stylesheet" href="https://unpkg.com/vue-airbnb-style-datepicker@2.7.1/dist/vue-airbnb-style-datepicker.min.css">'
			);
		$this->template->loadExternalJs(
			'<script src="https://unpkg.com/vue-form-wizard/dist/vue-form-wizard.js"></script>'.
			'<script src="https://cdn.jsdelivr.net/npm/vue-the-mask@0.11.1/dist/vue-the-mask.min.js"></script>'.
			'<script src="https://unpkg.com/vee-validate@2.0.0-rc.21/dist/vee-validate.js"></script>'.
			'<script src="https://unpkg.com/vue-multiselect@2.1.6/dist/vue-multiselect.min.js"></script>'.
			'<script src="https://unpkg.com/v-money@0.8.1/dist/v-money.js"></script>'.
			'<script src="'.$this->common->theme_hideend().'plugins/js/vue-airbnb-style-datepicker.min.js"></script>'.
			'<script src="'.$this->common->theme_hideend().'plugins/js/date_fns.js"></script>'.
			$vueComponent.
			'<script src="'.$this->common->theme_hideend().'plugins/js/appPengajuanPSP.js"></script>'
			);
		$this->template->loadContent("hidepage/pengajuan/index.php", array(
				"idPengajuan" => $idPengajuan
			)
		);
	}


	public function status()
	{
		$this->template->loadData("activeLink",
			array("content" => array("general" => 1)));
		$vueComponent = $this->load->view("hidepage/vue/ComponentPspBMNPengajuanWizardForm.js",'',true);

		$this->template->loadExternal(
			'<link rel="stylesheet" href="https://unpkg.com/vue-form-wizard/dist/vue-form-wizard.min.css">'.
			'<link rel="stylesheet" href="https://unpkg.com/vue-multiselect@2.1.0/dist/vue-multiselect.min.css">'.
			'<link rel="stylesheet" href="https://unpkg.com/vue-airbnb-style-datepicker@latest/dist/vue-airbnb-style-datepicker.min.css">'
			);

		$this->template->loadExternalJs(
			'<script src="https://unpkg.com/vue-form-wizard/dist/vue-form-wizard.js"></script>'.
			'<script src="https://cdn.jsdelivr.net/npm/vue-the-mask@0.11.1/dist/vue-the-mask.min.js"></script>'.
			'<script src="https://unpkg.com/vee-validate@2.0.0-rc.21/dist/vee-validate.js"></script>'.
			'<script src="https://unpkg.com/vue-multiselect@2.1.6/dist/vue-multiselect.min.js"></script>'.
			'<script src="https://unpkg.com/v-money@0.8.1/dist/v-money.js"></script>'.
			'<script src="'.$this->common->theme_hideend().'plugins/js/vue-airbnb-style-datepicker.min.js"></script>'.
			'<script src="'.$this->common->theme_hideend().'plugins/js/date_fns.js"></script>'.
			$vueComponent.
			'<script src="'.$this->common->theme_hideend().'plugins/js/appPengajuanPSP.js"></script>'
			);
		$this->template->loadContent("hidepage/pengajuan/status.php", array(
			)
		);
	}

	public function show($id){
       	$query =  $this->pengajuan_model->showAllbyID($id);
       	$result = [];
        if($query){
            $result['pengajuan'] = $query;
        }
        echo json_encode($result);
    }

	public function showAll(){
       	$query =  $this->pengajuan_model->showAll();
       	$result = [];
        if($query){
            $result['pengajuan'] = $query;
        }
        echo json_encode($result);
    }

	public function test(){
		echo $this->user->info->user_role_id;
	}
	public function add()
    {	

    	if(true){
            
            
            
            $data = array(
                'jenis_bmn' => $this->input->post('nama_jenis_bmn'),
                'totalnilai_bmn' => $this->input->post('totalnilai_bmn'),
                'provinsi' => $this->input->post('nama_provinsi'),
                'kabupaten' => $this->input->post('nama_kabupaten'),
                'kementerian_lembaga' => $this->input->post('nama_kementerian_lembaga'),
                'alamat_kantorKL' => $this->input->post('alamat_kantorKL'),
                'email_djkn' => $this->input->post('email_djkn'),
                'satuan_kerja' => $this->input->post('satuan_kerja'),
                'nama_petugas' => $this->input->post('nama_petugas'),
                'nip_petugas' => $this->input->post('nip_petugas'),
                'jabatan_petugas' => $this->input->post('jabatan_petugas'),
                'kontak_petugas' => $this->input->post('kontak_petugas'),
                'email_petugas' => $this->input->post('email_petugas'),
                'status_proses' => $this->input->post('status_proses'),
                'status_pengajuan' => $this->input->post('status_pengajuan'),
                'jabatan_pemohon' => $this->input->post('jabatan_pemohon'),
                'noSurat_pemohon' => $this->input->post('noSurat_pemohon'),
                'tglSurat_pemohon' => date($this->input->post('tglSurat_pemohon')), //format to date
                'perihalSurat_pemohon' => $this->input->post('perihalSurat_pemohon'),
                'fileSuratPermohon' => $this->input->post('fileSuratPermohon'),
                'fileDaftarRincian' => $this->input->post('fileDaftarRincian'),
                'fileDokumenKelengkapan' => $this->input->post('fileDokumenKelengkapan'),
                'submitdate' =>  date("Y/m/d")
            );
            
            $idPengajuan = $this->pengajuan_model->insert($data);

       	
            if($idPengajuan){
	            $result['error'] = false;
	            $result['msg']   = 'Data added successfully';
	            $result['id']   = $idPengajuan;
            }else{
            	$result['error'] = true;
            	$result['msg']   = 'Something wrong! Cannot insert data';
            	$result['id']   = '';
            }

            //IF MENTOK SAMPAI STEP 2, langsung kirim email
                      
        }
        echo json_encode($result);
    }



    public function updateStatusPengajuan()
    {
    	$id = $this->input->post('idPengajuan');


        $data = array(
                'status_pengajuan' => $this->input->post('status_pengajuan'));
        if($this->pengajuan_model->update($id, $data)){
        	 $result['error'] = false;
             $result['msg']   = 'Data updated successfully';
        }else{
        	$result['error'] = true;
        	$result['msg']   = 'Update Data ERROR';
        }

        echo json_encode($result);
    }

   	public function update()
    {	

    	if(true){
            
            
            $id = $this->input->post('id');
            $data = array(
                'jenis_bmn' => $this->input->post('nama_jenis_bmn'),
                'totalnilai_bmn' => $this->input->post('totalnilai_bmn'),
                'provinsi' => $this->input->post('nama_provinsi'),
                'detail_djkn' => $this->input->post('detail_djkn'),
                'email_djkn' => $this->input->post('email_djkn'),
                'kabupaten' => $this->input->post('nama_kabupaten'),
                'kementerian_lembaga' => $this->input->post('nama_kementerian_lembaga'),
                'alamat_kantorKL' => $this->input->post('alamat_kantorKL'),
                'satuan_kerja' => $this->input->post('satuan_kerja'),
                'nama_petugas' => $this->input->post('nama_petugas'),
                'nip_petugas' => $this->input->post('nip_petugas'),
                'jabatan_petugas' => $this->input->post('jabatan_petugas'),
                'kontak_petugas' => $this->input->post('kontak_petugas'),
                'email_petugas' => $this->input->post('email_petugas'),
                'status_proses' => $this->input->post('status_proses'),
                'status_pengajuan' => $this->input->post('status_pengajuan'),
                'jabatan_pemohon' => $this->input->post('jabatan_pemohon'),
                'noSurat_pemohon' => $this->input->post('noSurat_pemohon'),
                'tglSurat_pemohon' => date($this->input->post('tglSurat_pemohon')), //format to date
                'perihalSurat_pemohon' => $this->input->post('perihalSurat_pemohon'),
                'fileSuratPermohon' => $this->input->post('fileSuratPermohon'),
                'fileDaftarRincian' => $this->input->post('fileDaftarRincian'),
                'fileDokumenKelengkapan' => $this->input->post('fileDokumenKelengkapan'),
                'submitdate' =>  date("Y/m/d")//format to date
            );
            
            
            if ($this->pengajuan_model->update($id, $data)) {
                $result['error'] = false;
                $result['msg']   = 'Booking added successfully';
               

                
            }else{
            	
                $result['error'] = false;
                $result['msg']   = 'Booking added successfully';
            }
            
        }
        echo json_encode($result);
    }

	public function uploadFile()
	{
		$this->load->library("upload");
		if (($_FILES['file1']['size'] > 0) && ($_FILES['file2']['size'] > 0) && ($_FILES['file3']['size'] > 0)) {
			$this->upload->initialize(array(
		       "upload_path" => $this->settings->info->upload_path."/pengajuan/",
		       "overwrite" => FALSE,
		       "max_filename" => 300,
		       "encrypt_name" => false,
		       "remove_spaces" => TRUE,
		       "allowed_types" => "docx|doc|xlsx|xls|pdf",
		       "max_size" => 200000
		    ));

		    $file = array();
		    $msg = array();
		    $error = array();

			if($this->upload->do_upload('file1')){
				$data = $this->upload->data();
				$FileData = $data['file_name'];
				$error[] = false;
		    	$file[] = "/pengajuan/".$FileData;
		    	$msg[] = "Successfully upload!";
			}else{
				$error[] = true;
		    	$msg[] = $this->upload->display_errors();
			}			

			if($this->upload->do_upload('file2')){
				$data = $this->upload->data();
				$FileData = $data['file_name'];
				$error[] = false;
		    	$file[] = "/pengajuan/".$FileData;		    	
		    	$msg[] = "Successfully upload!";
			}else{
				$error[] = true;
		    	$msg[] = $this->upload->display_errors();
			}		

			if($this->upload->do_upload('file3')){
				$data = $this->upload->data();
				$FileData = $data['file_name'];
				$error[] = false;
		    	$file[] = "/pengajuan/".$FileData;
		    	$msg[] = "Successfully upload!";
			}else{
				$error[] = true;
		    	$msg[] = $this->upload->display_errors();
			}	

		     $dataArray = array(
							"error" => $error,
							"msg" => $msg,
							"file" => $file
				);
		    

		}else{

		}

		echo json_encode($dataArray);

	}





	
	


}

?>
