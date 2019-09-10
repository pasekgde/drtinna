<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');
/* @property phpword_model $phpword_model */
include_once(APPPATH."third_party/PhpWord/Autoloader.php");


use PhpOffice\PhpWord\Autoloader;
use PhpOffice\PhpWord\Settings;
Autoloader::register();
Settings::loadConfig();
class Verifikasi extends CI_Controller
{

	public function __construct()
	{
		parent::__construct();
		$this->load->model("content_model");
		$this->load->model("forex_model");
		$this->load->model("user_model");
		$this->load->model("pengajuan_model");
		$this->load->model("verifikasi_model");
	//	$this->load->helper(array('form', 'url'));
		if (!$this->user->loggedin) $this->template->error(lang("error_1"));
		// if(!$this->common->has_permissions(array(
		// 		"admin", "content_manager", "content_worker"), $this->user)) {
		// 		$this->template->error(lang("error_81"));
		// }
	}


	public function index()
	{
		$this->template->loadData("activeLink",
			array("content" => array("general" => 1)));
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
			'<script src="'.$this->common->theme_hideend().'plugins/js/vue-airbnb-style-datepicker.min.js"></script>'.
			'<script src="'.$this->common->theme_hideend().'plugins/js/date_fns.js"></script>'.
			'<script src="'.$this->common->theme_hideend().'plugins/js/appPengajuanPSP.js"></script>'
			);
		$this->template->loadContent("hidepage/pengajuan/index.php", array(
			)
		);
	}


	public function generateHasilVerifikasiKPKNL(){
		$file = 'Kanwil 1 Hasil Verifikasi.docx';
		$targetFile = "./uploads/template/";		
		$targetSaveFile = "./uploads/verifikasi/kanwil/";

		$templateProcessor = new \PhpOffice\PhpWord\templateProcessor($targetFile.$file);
		$tanggal_surat_permohonan = $this->common->tgl_indo($this->input->post('tglSurat_pemohon'));

		$dataArray = array(
						'hasil_verifikasi'=>$this->input->post('hasil_verifikasi'),
						"jabatan_pemohon" => $this->input->post('jabatan_pemohon'),
						"nama_satker" => $this->input->post('satuan_kerja'),
						"nomor_surat_permohonan" => $this->input->post('noSurat_pemohon'),
						"tanggal_surat_permohonan" => $tanggal_surat_permohonan,
						"sesuai_catatan_khusus" => $this->input->post('noteDokumen'),
						"plh_plt" => $this->input->post('plh_plt'),
						"nama_kepala_seksi" => $this->input->post('nama_kepala_seksi'),
						"nip_kepala_seksi" => $this->input->post('nip_kepala_seksi'),
						"nama_verifikator" => $this->input->post('nama_verifikator'),
						"nip_verifikator" => $this->input->post('nip_verifikator')
		);

		$templateProcessor->setValue('jabatan_pemohon',$dataArray["jabatan_pemohon"]);
		$templateProcessor->setValue('nama_satker',$dataArray["nama_satker"]);
		$templateProcessor->setValue('nomor_surat_permohonan',$dataArray["nomor_surat_permohonan"]);
		$templateProcessor->setValue('tanggal_surat_permohonan',$dataArray["tanggal_surat_permohonan"]);
		$templateProcessor->setValue('sesuai_catatan_khusus',$dataArray["sesuai_catatan_khusus"]);
		$templateProcessor->setValue('plh_plt',$dataArray["plh_plt"]);
		$templateProcessor->setValue('nama_kepala_seksi',$dataArray["nama_kepala_seksi"]);
		$templateProcessor->setValue('nip_kepala_seksi',$dataArray["nip_kepala_seksi"]);
		$templateProcessor->setValue('nama_verifikator',$dataArray["nama_verifikator"]);
		$templateProcessor->setValue('nip_verifikator',$dataArray["nip_verifikator"]);



		$fileSave = 'Kanwil - Hasil Verifikasi-'.$this->input->post("kementerian_lembaga").'-'.$this->input->post("noSurat_pemohon").'.docx';

		$templateProcessor->saveAs($targetSaveFile.$fileSave);
		return $targetSaveFile.$fileSave;
	}

	public function generateDocKPKNL(){
		$fileNDSPersetujuanKANWIL=$this->generateNDSPersetujuanKANWIL();
		$fileHasilVerifikasiKANWIL=$this->generateHasilVerifikasiKANWIL();
		$fileKMKKANWIL=$this->generateKMKKANWIL();
		$fileSalinanKMKKANWIL=$this->generateSalinanKMKKANWIL();
		$fileNDSPermintaanKelengkapanKANWIL=$this->generateNDSPermintaanKelengkapanKANWIL();
		$fileNDSSurveyLapanganKANWIL=$this->generateNDSSurveyLapanganKANWIL();

		$dataArray = array(
						'fileNDSPersetujuan'=>$fileNDSPersetujuanKANWIL,
						'fileHasilVerifikasi'=>$fileHasilVerifikasiKANWIL,
						'fileKMK'=>$fileKMKKANWIL,
						'fileSalinanKMK'=>$fileSalinanKMKKANWIL,
						'fileNDSPermintaanKelengkapan'=>$fileNDSPermintaanKelengkapanKANWIL,
						'fileNDSSurveyLapangan'=>$fileNDSSurveyLapanganKANWIL,
			        	'daftarKekuranganData' => '',
			        	'rencana_survey' => '',
						'nama_survey' => '',
						'cp_survey' => '',
						'isGenerateDokumenKMK'=>1,
						'isButuhKelengkapanData'=>0,
						'isButuhSurveyLapangan'=>0
						);

		$dokumen = array(
					'dokumen'=>$dataArray
					);
            
        $id = $this->input->post('id');
		$this->verifikasi_model->update($id, $dataArray);

		echo json_encode($dokumen);

	}

	public function generateKelengkapanDataKPKNL(){
		$fileHasilVerifikasiKANWIL=$this->generateHasilVerifikasiKANWIL();
		$fileNDSPermintaanKelengkapanKANWIL=$this->generateNDSPermintaanKelengkapanKANWIL();
		$dataArray = array(
						'fileNDSPersetujuan'=>'',
						'fileHasilVerifikasi'=>$fileHasilVerifikasiKANWIL,
						'fileKMK'=>'',
						'fileSalinanKMK'=>'',
						'fileNDSPermintaanKelengkapan'=>$fileNDSPermintaanKelengkapanKANWIL,
						'fileNDSSurveyLapangan'=>'',
						'rencana_survey' => '',
						'nama_survey' => '',
						'cp_survey' => '',
			        	'daftarKekuranganData' => $this->input->post('daftarKekuranganData'),
						'isGenerateDokumenKMK'=>0,
						'isButuhKelengkapanData'=>1,
						'isButuhSurveyLapangan'=>0
						);

		$dokumen = array(
					'dokumen'=>$dataArray
					);
            
        $id = $this->input->post('id');
		$this->verifikasi_model->update($id, $dataArray);

		echo json_encode($dokumen);

	}

	
	public function generateSurveyLapanganKPKNL(){
		
		$fileHasilVerifikasiKANWIL=$this->generateHasilVerifikasiKANWIL();
		$fileNDSSurveyLapanganKANWIL=$this->generateNDSSurveyLapanganKANWIL();
		
		$dataArray = array(
						'fileNDSPersetujuan'=>'',
						'fileHasilVerifikasi'=>$fileHasilVerifikasiKANWIL,
						'fileKMK'=>'',
						'fileSalinanKMK'=>'',
						'fileNDSPermintaanKelengkapan'=>'',
						'fileNDSSurveyLapangan'=>$fileNDSSurveyLapanganKANWIL,
						'daftarKekuranganData' => '',
						'rencana_survey' => $this->input->post('rencana_survey'),
						'nama_survey' => $this->input->post('nama_survey'),
						'cp_survey' => $this->input->post('cp_survey'),
						'isGenerateDokumenKMK'=>0,
						'isButuhKelengkapanData'=>0,
						'isButuhSurveyLapangan'=>1
						);

		$dokumen = array(
					'dokumen'=>$dataArray
					);
            
        $id = $this->input->post('id');
		$this->verifikasi_model->update($id, $dataArray);

		echo json_encode($dokumen);

	}


	public function generateNDSPersetujuanKPKNL(){
		$file = "Kanwil 2 ND S Persetujuan1.docx";
		$targetFile = "./uploads/template/";				
		$targetSaveFile = "./uploads/verifikasi/kanwil/";

		$templateProcessor = new \PhpOffice\PhpWord\templateProcessor($targetFile.$file);

		$dataArray = array(
						"tahun_terbit" => "2019", //diambil dari tanggal dokumen tergenerate
						"nama_kl" => "Budi Angkasa",
						"nama_satker" => "Satria Planet",
						"tanggal_cetak" => "19/7/2019", //Berubah ketika tombol di Generate
						"jabatan_pemohon" => "Sekretaris Daerah",
						"nomor_surat_permohonan" => "01/INS-KOTA/VIII/2019",
						"tanggal_surat_permohonan" => "11/7/2019",
						"perihal_surat_permohonan" => "Rekomendasi",
						"tanggal_penginputan" => "19/7/2019", //kapan dokumen diajukan, masukin timestamp di database
						"jenis_bmn" => "ATK",
						"total_nilai_bmn" => "100000",
						"huruf_total_nilai_bmn" => "Seratus Ribu Rupiah",
						"peraturan_pelimpahan_wewenang_kementrian_lembaga_pemohon" => "Peratuan Contoh Pasal 1",
						"plh_plt" => "PLT",
						"nama_kepala_bidang" => "Anjasmara Kilat",
						"alamat_kantor_pemohon" => "JL. Inajadulu Nomor 22 Papua Barat",
						"nama_kepala_kanwil"	=> "Siti Komah Prandita Nugraha",
						"nama_verifikator" => "Bahdrun Saothi Soma",
						"nama_kepala_seksi" => "Suindro suiono",
						"kmk_nomor" => "01KMK", //isi manual oleh petugas
						"jabatan_kepala_seksi" => "Ketua Umum",
						"nip_kepala_seksi" => "199554212 215 2 002",
						"nip_kepala_bidang" => "199554212 215 2 001",
						"nama_kepala_kantor" => "Joni Iskandar",
						"nip_kepala_kantor" => "199554212 215 2 001"
		);

		$templateProcessor->setValue('tahun_terbit', $dataArray["tahun_terbit"]);
		$templateProcessor->setValue('nama_kl', $dataArray["nama_kl"]);
		$templateProcessor->setValue('nama_satker', $dataArray["nama_satker"]);
		$templateProcessor->setValue('tanggal_cetak', $dataArray["tanggal_cetak"]);
		$templateProcessor->setValue('jabatan_pemohon', $dataArray["jabatan_pemohon"]);
		$templateProcessor->setValue('nomor_surat_permohonan', $dataArray["nomor_surat_permohonan"]);
		$templateProcessor->setValue('tanggal_surat_permohonan', $dataArray["tanggal_surat_permohonan"]);
		$templateProcessor->setValue('perihal_surat_permohonan', $dataArray["perihal_surat_permohonan"]);
		$templateProcessor->setValue('tanggal_penginputan', $dataArray["tanggal_penginputan"]);
		$templateProcessor->setValue('jenis_bmn', $dataArray["jenis_bmn"]);
		$templateProcessor->setValue('total_nilai_bmn', $dataArray["total_nilai_bmn"]);
		$templateProcessor->setValue('huruf_total_nilai_bmn', $dataArray["huruf_total_nilai_bmn"]);
		$templateProcessor->setValue('peraturan_pelimpahan_wewenang_kementrian_lembaga_pemohon', $dataArray["peraturan_pelimpahan_wewenang_kementrian_lembaga_pemohon"]);
		$templateProcessor->setValue('plh_plt', $dataArray["plh_plt"]);
		$templateProcessor->setValue('nama_kepala_bidang', $dataArray["nama_kepala_bidang"]);
		$templateProcessor->setValue('alamat_kantor_pemohon', $dataArray["alamat_kantor_pemohon"]);
		$templateProcessor->setValue('nama_kepala_kanwil', $dataArray["nama_kepala_kanwil"]);
		$templateProcessor->setValue('nama_verifikator', $dataArray["nama_verifikator"]);
		$templateProcessor->setValue('nama_kepala_seksi', $dataArray["nama_kepala_seksi"]);
		$templateProcessor->setValue('kmk_nomor', $dataArray["kmk_nomor"]);
		$templateProcessor->setValue('jabatan_kepala_seksi', $dataArray["jabatan_kepala_seksi"]);
		$templateProcessor->setValue('nip_kepala_seksi', $dataArray["nip_kepala_seksi"]);
		$templateProcessor->setValue('nip_kepala_bidang', $dataArray["nip_kepala_bidang"]);
		$templateProcessor->setValue('nama_kepala_kantor', $dataArray["nama_kepala_kantor"]);
		$templateProcessor->setValue('nip_kepala_kantor', $dataArray["nip_kepala_kantor"]);


		$fileSave = 'Kanwil - ND S Persetujuan-'.$this->input->post("kementerian_lembaga").'-'.$this->input->post("noSurat_pemohon").'.docx';

		$templateProcessor->saveAs($targetSaveFile.$fileSave);
		return $targetSaveFile.$fileSave;
	}


	public function generateKMKKPKNL()
	{
		$jsonTembusan = $this->input->post("daftar_tembusan");
		$arrayTembusan = json_decode($jsonTembusan,true);		
		$targetSaveFile = "./uploads/verifikasi/kanwil/";

		$strTembusan = '';
		$no = 0;
		foreach ($arrayTembusan as $key=>$tembusan) {
			$no =($key+1);
			$strTembusan.= $no.".".$tembusan["nama"].'<w:br/>';
		}

		
		//ubah sesuai nama template word
		$file = 'Kanwil 3 KMK1.docx';

		//biarkan ini
		$targetFile = "./uploads/template/";		
		$targetSaveFile = "./uploads/verifikasi/kanwil/";

		//Inisiasi Awal (biarkan ini)
		$templateProcessor = new \PhpOffice\PhpWord\templateProcessor($targetFile.$file);

		//set seuai nama variable yang diganti
		$dataArray=array(
					"tahun_terbit" => "2019",
					"kementerian_lembaga" => $this->input->post("kementerian_lembaga"),
					"kementerian_pemohon" => "Direktorat Jendral Kekayaan Negara",
					"jabatan_pemohon" => "Ketua Umum",
					"nama_satker" => $this->input->post("kementerian_lembaga"),
					"nomor_surat_permohonan" => $this->input->post("noSurat_pemohon"),
					"perihal_surat_permohonan" => "PERIHAL SURAT",
					"tanggal_surat_permohonan" => $this->common->tgl_indo($this->input->post("tglSurat_pemohon")),
					"total_nilai_bmn" => $this->common->formatIDR($this->input->post("totalnilai_bmn")),
					"jenis_bmn" => $this->input->post("jenis_bmn"),
					"huruf_total_nilai_bmn" => $this->common->terbilang($this->input->post("totalnilai_bmn")),
					"nama_tembusan" => $strTembusan,
					"nama_KPKNL" => "Sapto Arianto",
					"tanggal_cetak" => "30/08/2019",
					"plh_plt" => "PLT",
					"nama_kepala_kantor" => "Made Ariandana"
					);


		//echo "<pre>"; print_r($dataArray);die;
		$templateProcessor->setValue('tahun_terbit', $dataArray["tahun_terbit"]);
		 $templateProcessor->setValue('kementerian_lembaga', $dataArray["kementerian_lembaga"]);	
		 $templateProcessor->setValue('kementerian_pemohon', $dataArray["kementerian_pemohon"]);
		 $templateProcessor->setValue('jabatan_pemohon', $dataArray["jabatan_pemohon"]);
		 $templateProcessor->setValue('nama_satker', $dataArray["nama_satker"]);
		 $templateProcessor->setValue('nomor_surat_permohonan', $dataArray["nomor_surat_permohonan"]);
		 $templateProcessor->setValue('tanggal_surat_permohonan', $dataArray["tanggal_surat_permohonan"]);
		 $templateProcessor->setValue('perihal_surat_permohonan', $dataArray["perihal_surat_permohonan"]);
		$templateProcessor->setValue('jenis_bmn', $dataArray["jenis_bmn"]);
		 $templateProcessor->setValue('total_nilai_bmn', $dataArray["total_nilai_bmn"]);
		 $templateProcessor->setValue('huruf_total_nilai_bmn', $dataArray["huruf_total_nilai_bmn"]);
		 $templateProcessor->setValue('nama_KPKNL', $dataArray["nama_KPKNL"]);
		 $templateProcessor->setValue('tanggal_cetak', $dataArray["tanggal_cetak"]);
		 $templateProcessor->setValue('plh_plt', $dataArray["plh_plt"]);
		 $templateProcessor->setValue('nama_kepala_kantor', $dataArray["nama_kepala_kantor"]);

		 $templateProcessor->cloneRow('no', 5);		 
		 $templateProcessor->setValue('no#1', '1.');
		 $templateProcessor->setValue('no#2', '2.');
		 $templateProcessor->setValue('no#3', '2.');
		 $templateProcessor->setValue('no#4', '2.');
		 $templateProcessor->setValue('no#5', '2.');
		 $templateProcessor->setValue('nama_tembusan#1', $dataArray["nama_kepala_kantor"]);
		 $templateProcessor->setValue('nama_tembusan#2', 'Direktur Pengelolaan Kekayaan Negara dan Sistem Informasi');
		 $templateProcessor->setValue('nama_tembusan#3', 'Kepala Kantor Wilayah DJKN Papua, Papua Barat dan Maluku');
		 $templateProcessor->setValue('nama_tembusan#4', 'Ketua Umum DEWAN PERWAKILAN RAKYAT');

		 $templateProcessor->setValue('nama_tembusan#5', 'Kepala KPKNL Sapto Arianto');



		$fileSave = 'Kanwil - KMK-'.$this->input->post("kementerian_lembaga").'-'.$this->input->post("noSurat_pemohon").'.docx';

		$templateProcessor->saveAs($targetSaveFile.$fileSave);
		return $targetSaveFile.$fileSave;
	}

	public function generateSalinanKMKKPKNL(){
		$file = 'Kanwil 4 Salinan KMK1.docx';
		$targetFile = './uploads/template/';		
		$targetSaveFile = "./uploads/verifikasi/kanwil/";

		$templateProcessor = new \PhpOffice\PhpWord\templateProcessor($targetFile.$file);

		$dataArray = array(
							"tahun_terbit" => "2019",
							"nama_kl" => "Direktorat A",
							"jabatan_pemohon" => "Sekjen Umum",
							"nama_satker" => "Aulia Mijil",
							"nomor_surat_permohonan" => "12/INS-KOTA/VIII/2019",
							"tanggal_surat_permohonan" => "10/07/2019",
							"perihal_surat_permohonan" => "Permohonan Pendanaan",
							"jenis_bmn" => "ATK",
							"total_nilai_bmn" => "500000",
							"huruf_total_nilai_bmn" => "Lima Ratus Ribu Rupiah",
							"daftar_nama_tembusan_1" => "Kepala Daerah1",
							"daftar_nama_tembusan_2" => "Kepala Daerah2",
							"daftar_nama_tembusan_3" => "Kepala Daerah3",
							"nama_KPKNL" => "David Kambek",
							"tanggal_cetak" => "30/07/2019",
							"plh_plt" => "PLT",
							"nama_kepala_kantor" => "Lingard Jojo",
							"jabatan_salinan" => "Bendahara Umum",
							"nama_salinan" => "Kim Jon Tos",
							"nip_salinan" => "19950711 200801 1 001",
							"kementerian_pemohon" => "Direktorat Keuangan"
		);

		$templateProcessor->setValue('tahun_terbit', $dataArray["tahun_terbit"]);
		$templateProcessor->setValue('nama_kl', $dataArray["nama_kl"]);
		$templateProcessor->setValue('jabatan_pemohon', $dataArray["jabatan_pemohon"]);
		$templateProcessor->setValue('nama_satker', $dataArray["nama_satker"]);
		$templateProcessor->setValue('nomor_surat_permohonan', $dataArray["nomor_surat_permohonan"]);
		$templateProcessor->setValue('tanggal_surat_permohonan', $dataArray["tanggal_surat_permohonan"]);
		$templateProcessor->setValue('perihal_surat_permohonan', $dataArray["perihal_surat_permohonan"]);
		$templateProcessor->setValue('jenis_bmn', $dataArray["jenis_bmn"]);
		$templateProcessor->setValue('total_nilai_bmn', $dataArray["total_nilai_bmn"]);
		$templateProcessor->setValue('huruf_total_nilai_bmn', $dataArray["huruf_total_nilai_bmn"]);
		$templateProcessor->setValue('daftar_nama_tembusan_1', $dataArray["daftar_nama_tembusan_1"]);
		$templateProcessor->setValue('daftar_nama_tembusan_2', $dataArray["daftar_nama_tembusan_2"]);
		$templateProcessor->setValue('daftar_nama_tembusan_3', $dataArray["daftar_nama_tembusan_3"]);
		$templateProcessor->setValue('nama_KPKNL', $dataArray["nama_KPKNL"]);
		$templateProcessor->setValue('tanggal_cetak', $dataArray["tanggal_cetak"]);
		$templateProcessor->setValue('plh_plt', $dataArray["plh_plt"]);
		$templateProcessor->setValue('nama_kepala_kantor', $dataArray["nama_kepala_kantor"]);
		$templateProcessor->setValue('jabatan_salinan', $dataArray["jabatan_salinan"]);
		$templateProcessor->setValue('nama_salinan', $dataArray["nama_salinan"]);
		$templateProcessor->setValue('nip_salinan', $dataArray["nip_salinan"]);
		$templateProcessor->setValue('kementerian_pemohon', $dataArray["kementerian_pemohon"]);

		$fileSave = 'Kanwil - SALINAN-KMK-'.$this->input->post("kementerian_lembaga").'-'.$this->input->post("noSurat_pemohon").'.docx';

		$templateProcessor->saveAs($targetSaveFile.$fileSave);
		return $targetSaveFile.$fileSave;
	}
	

	public function generateNDSPermintaanKelengkapanKPKNL() {
		$file = 'Kanwil 5 ND S Permintaan Kelengkapan1.docx';
		$targetFile = "./uploads/template/";		
		$targetSaveFile = "./uploads/verifikasi/kanwil/";

		$templateProcessor = new \PhpOffice\PhpWord\templateProcessor($targetFile.$file);

		$dataArray = array(
						"tahun_terbit" => "2019",
						"nama_kl" => "Sitikomah",
						"nama_satker" => "Gusti Aji",
						"tanggal_cetak" => "22/09/2019",
						"jabatan_pemohon" => "Setda",
						"nomor_surat_permohonan" => "01/INS-KOTA/VIII/2019",
						"tanggal_surat_permohonan" => "10/10/2019",
						"perihal_surat_permohonan" => "Permohonan PSP",
						"tanggal_penginputan" => "1/08/2019",
						"jenis_bmn" => "Dokumen",
						"total_nilai_bmn" => "100000",
						"huruf_total_nilai_bmn" => "Seratus Ribu Rupiah",
						"data_yang_perlu_dilengkapi" => "Dokumen Akta Kelahiran",
						"plh_plt" => "PLH",
						"alamat_kantor_pemohon" => "JL.Sudirman Nomor 1 Denpasar",
						"nama_verifikator" => "Ita Dewi",
						"nama_kepala_seksi" => "Cika Dogen",
						"jabatan_kepala_seksi" => "Sekretaris",
						"nip_kepala_seksi" => "19950920 200801 1 001",
						"nama_kepala_bidang" => "Dian Sinta",
						"nip_kepala_bidang" => "19950920 200801 1 002",
						"nama_kepala_kantor" => "Cok Gita",
						"nip_kepala_kantor" => "19950920 200801 1 003"
		);

		$templateProcessor->setValue('tahun_terbit', $dataArray["tahun_terbit"]);
		$templateProcessor->setValue('nama_kl', $dataArray["nama_kl"]);
		$templateProcessor->setValue('nama_satker', $dataArray["nama_satker"]);
		$templateProcessor->setValue('tanggal_cetak', $dataArray["tanggal_cetak"]);
		$templateProcessor->setValue('jabatan_pemohon', $dataArray["jabatan_pemohon"]);
		$templateProcessor->setValue('nomor_surat_permohonan', $dataArray["nomor_surat_permohonan"]);
		$templateProcessor->setValue('tanggal_surat_permohonan', $dataArray["tanggal_surat_permohonan"]);
		$templateProcessor->setValue('perihal_surat_permohonan', $dataArray["perihal_surat_permohonan"]);
		$templateProcessor->setValue('tanggal_penginputan', $dataArray["tanggal_penginputan"]);
		$templateProcessor->setValue('jenis_bmn', $dataArray["jenis_bmn"]);
		$templateProcessor->setValue('total_nilai_bmn', $dataArray["total_nilai_bmn"]);
		$templateProcessor->setValue('huruf_total_nilai_bmn', $dataArray["huruf_total_nilai_bmn"]);
		$templateProcessor->setValue('data_yang_perlu_dilengkapi', $dataArray["data_yang_perlu_dilengkapi"]);
		$templateProcessor->setValue('plh_plt', $dataArray["plh_plt"]);
		$templateProcessor->setValue('alamat_kantor_pemohon', $dataArray["alamat_kantor_pemohon"]);
		$templateProcessor->setValue('nama_verifikator', $dataArray["nama_verifikator"]);
		$templateProcessor->setValue('nama_kepala_seksi', $dataArray["nama_kepala_seksi"]);
		$templateProcessor->setValue('jabatan_kepala_seksi', $dataArray["jabatan_kepala_seksi"]);
		$templateProcessor->setValue('nip_kepala_seksi', $dataArray["nip_kepala_seksi"]);
		$templateProcessor->setValue('nama_kepala_bidang', $dataArray["nama_kepala_bidang"]);
		$templateProcessor->setValue('nip_kepala_bidang', $dataArray["nip_kepala_bidang"]);
		$templateProcessor->setValue('nama_kepala_kantor', $dataArray["nama_kepala_kantor"]);
		$templateProcessor->setValue('nip_kepala_kantor', $dataArray["nip_kepala_kantor"]);


		$fileSave = 'Kanwil - ND S Permintaan Kelengkapan-'.$this->input->post("kementerian_lembaga").'-'.$this->input->post("noSurat_pemohon").'.docx';

		$templateProcessor->saveAs($targetSaveFile.$fileSave);
		return $targetSaveFile.$fileSave;
	}


	public function generateNDSSurveyLapanganKPKNL() {
		$file = 'Kanwil 6 ND S Survei Lapangan1.docx';
		$targetFile = "./uploads/template/";		
		$targetSaveFile = "./uploads/verifikasi/kanwil/";
		
		$templateProcessor = new \PhpOffice\PhpWord\templateProcessor($targetFile.$file);

		$dataArray = array(
						"tahun_terbit" => "2019",
						"nama_kl" => "Sitikomah",
						"nama_satker" => "Gusti Aji",
						"tanggal_cetak" => "22/09/2019",
						"jabatan_pemohon" => "Setda",
						"nomor_surat_permohonan" => "01/INS-KOTA/VIII/2019",
						"tanggal_surat_permohonan" => "10/10/2019",
						"perihal_surat_permohonan" => "Permohonan PSP",
						"tanggal_penginputan" => "1/08/2019",
						"jenis_bmn" => "Dokumen",
						"total_nilai_bmn" => "100000",
						"huruf_total_nilai_bmn" => "Seratus Ribu Rupiah",
						"nama_kasi_pkn" => "Mahendra Diggayu",
						"plh_plt" => "PLH",
						"waktu_survei" => "1/8/2019",
						"cp_survei_lapangan" => "Dian Sastro",
						"alamat_kantor_pemohon" => "JL.Sudirman Nomor 1 Denpasar",
						"nama_verifikator" => "Ita Dewi",
						"nama_kepala_seksi" => "Cika Dogen",
						"jabatan_kepala_seksi" => "Sekretaris",
						"nip_kepala_seksi" => "19950920 200801 1 001",
						"nama_kepala_bidang" => "Dian Sinta",
						"nip_kepala_bidang" => "19950920 200801 1 002",
						"nama_kepala_kantor" => "Cok Gita",
						"nip_kepala_kantor" => "19950920 200801 1 003"
		);

		$templateProcessor->setValue('tahun_terbit', $dataArray["tahun_terbit"]);
		$templateProcessor->setValue('nama_kl', $dataArray["nama_kl"]);
		$templateProcessor->setValue('nama_satker', $dataArray["nama_satker"]);
		$templateProcessor->setValue('tanggal_cetak', $dataArray["tanggal_cetak"]);
		$templateProcessor->setValue('jabatan_pemohon', $dataArray["jabatan_pemohon"]);
		$templateProcessor->setValue('nomor_surat_permohonan', $dataArray["nomor_surat_permohonan"]);
		$templateProcessor->setValue('tanggal_surat_permohonan', $dataArray["tanggal_surat_permohonan"]);
		$templateProcessor->setValue('perihal_surat_permohonan', $dataArray["perihal_surat_permohonan"]);
		$templateProcessor->setValue('tanggal_penginputan', $dataArray["tanggal_penginputan"]);
		$templateProcessor->setValue('jenis_bmn', $dataArray["jenis_bmn"]);
		$templateProcessor->setValue('total_nilai_bmn', $dataArray["total_nilai_bmn"]);
		$templateProcessor->setValue('huruf_total_nilai_bmn', $dataArray["huruf_total_nilai_bmn"]);
		$templateProcessor->setValue('nama_kasi_pkn', $dataArray["nama_kasi_pkn"]);
		$templateProcessor->setValue('plh_plt', $dataArray["plh_plt"]);
		$templateProcessor->setValue('waktu_survei', $dataArray["waktu_survei"]);
		$templateProcessor->setValue('cp_survei_lapangan', $dataArray["cp_survei_lapangan"]);
		$templateProcessor->setValue('alamat_kantor_pemohon', $dataArray["alamat_kantor_pemohon"]);
		$templateProcessor->setValue('nama_kepala_kantor', $dataArray["nama_kepala_kantor"]);
		$templateProcessor->setValue('nama_verifikator', $dataArray["nama_verifikator"]);
		$templateProcessor->setValue('nama_kepala_seksi', $dataArray["nama_kepala_seksi"]);
		$templateProcessor->setValue('jabatan_kepala_seksi', $dataArray["jabatan_kepala_seksi"]);
		$templateProcessor->setValue('nip_kepala_seksi', $dataArray["nip_kepala_seksi"]);
		$templateProcessor->setValue('nama_kepala_bidang', $dataArray["nama_kepala_bidang"]);
		$templateProcessor->setValue('nip_kepala_bidang', $dataArray["nip_kepala_bidang"]);
		$templateProcessor->setValue('nama_kepala_kantor', $dataArray["nama_kepala_kantor"]);
		$templateProcessor->setValue('nip_kepala_kantor', $dataArray["nip_kepala_kantor"]);

		$fileSave = 'Kanwil - ND S Survey Lapangan -'.$this->input->post("kementerian_lembaga").'-'.$this->input->post("noSurat_pemohon").'.docx';

		$templateProcessor->saveAs($targetSaveFile.$fileSave);
		return $targetSaveFile.$fileSave;
	}


	public function generateHasilVerifikasiKANWIL(){
		$file = 'Kanwil 1 Hasil Verifikasi.docx';
		$targetFile = "./uploads/template/";		
		$targetSaveFile = "./uploads/verifikasi/kanwil/";

		$templateProcessor = new \PhpOffice\PhpWord\templateProcessor($targetFile.$file);
		$tanggal_surat_permohonan = $this->common->tgl_indo($this->input->post('tglSurat_pemohon'));

		$dataArray = array(
						'hasil_verifikasi'=>$this->input->post('hasil_verifikasi'),
						"jabatan_pemohon" => $this->input->post('jabatan_pemohon'),
						"nama_satker" => $this->input->post('satuan_kerja'),
						"nomor_surat_permohonan" => $this->input->post('noSurat_pemohon'),
						"tanggal_surat_permohonan" => $tanggal_surat_permohonan,
						"sesuai_catatan_khusus" => $this->input->post('noteDokumen'),
						"plh_plt" => $this->input->post('plh_plt'),
						"nama_kepala_seksi" => $this->input->post('nama_kepala_seksi'),
						"nip_kepala_seksi" => $this->input->post('nip_kepala_seksi'),
						"nama_verifikator" => $this->input->post('nama_verifikator'),
						"nip_verifikator" => $this->input->post('nip_verifikator')
		);

		$templateProcessor->setValue('jabatan_pemohon',$dataArray["jabatan_pemohon"]);
		$templateProcessor->setValue('nama_satker',$dataArray["nama_satker"]);
		$templateProcessor->setValue('nomor_surat_permohonan',$dataArray["nomor_surat_permohonan"]);
		$templateProcessor->setValue('tanggal_surat_permohonan',$dataArray["tanggal_surat_permohonan"]);
		$templateProcessor->setValue('sesuai_catatan_khusus',$dataArray["sesuai_catatan_khusus"]);
		$templateProcessor->setValue('plh_plt',$dataArray["plh_plt"]);
		$templateProcessor->setValue('nama_kepala_seksi',$dataArray["nama_kepala_seksi"]);
		$templateProcessor->setValue('nip_kepala_seksi',$dataArray["nip_kepala_seksi"]);
		$templateProcessor->setValue('nama_verifikator',$dataArray["nama_verifikator"]);
		$templateProcessor->setValue('nip_verifikator',$dataArray["nip_verifikator"]);



		$fileSave = 'Kanwil - Hasil Verifikasi-'.$this->input->post("kementerian_lembaga").'-'.$this->input->post("noSurat_pemohon").'.docx';

		$templateProcessor->saveAs($targetSaveFile.$fileSave);
		return $targetSaveFile.$fileSave;
	}
	public function generateDocKANWIL(){
		$fileNDSPersetujuanKANWIL=$this->generateNDSPersetujuanKANWIL();
		$fileHasilVerifikasiKANWIL=$this->generateHasilVerifikasiKANWIL();
		$fileKMKKANWIL=$this->generateKMKKANWIL();
		$fileSalinanKMKKANWIL=$this->generateSalinanKMKKANWIL();
		$fileNDSPermintaanKelengkapanKANWIL=$this->generateNDSPermintaanKelengkapanKANWIL();
		$fileNDSSurveyLapanganKANWIL=$this->generateNDSSurveyLapanganKANWIL();

		$dataArray = array(
						'fileNDSPersetujuan'=>$fileNDSPersetujuanKANWIL,
						'fileHasilVerifikasi'=>$fileHasilVerifikasiKANWIL,
						'fileKMK'=>$fileKMKKANWIL,
						'fileSalinanKMK'=>$fileSalinanKMKKANWIL,
						'fileNDSPermintaanKelengkapan'=>$fileNDSPermintaanKelengkapanKANWIL,
						'fileNDSSurveyLapangan'=>$fileNDSSurveyLapanganKANWIL,
			        	'daftarKekuranganData' => '',
			        	'rencana_survey' => '',
						'nama_survey' => '',
						'cp_survey' => '',
						'isGenerateDokumenKMK'=>1,
						'isButuhKelengkapanData'=>0,
						'isButuhSurveyLapangan'=>0
						);

		$dokumen = array(
					'dokumen'=>$dataArray
					);
            
        $id = $this->input->post('id');
		$this->verifikasi_model->update($id, $dataArray);

		echo json_encode($dokumen);

	}

	public function generateKelengkapanDataKANWIL(){
		$fileHasilVerifikasiKANWIL=$this->generateHasilVerifikasiKANWIL();
		$fileNDSPermintaanKelengkapanKANWIL=$this->generateNDSPermintaanKelengkapanKANWIL();
		$dataArray = array(
						'fileNDSPersetujuan'=>'',
						'fileHasilVerifikasi'=>$fileHasilVerifikasiKANWIL,
						'fileKMK'=>'',
						'fileSalinanKMK'=>'',
						'fileNDSPermintaanKelengkapan'=>$fileNDSPermintaanKelengkapanKANWIL,
						'fileNDSSurveyLapangan'=>'',
						'rencana_survey' => '',
						'nama_survey' => '',
						'cp_survey' => '',
			        	'daftarKekuranganData' => $this->input->post('daftarKekuranganData'),
						'isGenerateDokumenKMK'=>0,
						'isButuhKelengkapanData'=>1,
						'isButuhSurveyLapangan'=>0
						);

		$dokumen = array(
					'dokumen'=>$dataArray
					);
            
        $id = $this->input->post('id');
		$this->verifikasi_model->update($id, $dataArray);

		echo json_encode($dokumen);

	}

	public function generateSurveyLapanganKANWIL(){
		
		$fileHasilVerifikasiKANWIL=$this->generateHasilVerifikasiKANWIL();
		$fileNDSSurveyLapanganKANWIL=$this->generateNDSSurveyLapanganKANWIL();
		
		$dataArray = array(
						'fileNDSPersetujuan'=>'',
						'fileHasilVerifikasi'=>$fileHasilVerifikasiKANWIL,
						'fileKMK'=>'',
						'fileSalinanKMK'=>'',
						'fileNDSPermintaanKelengkapan'=>'',
						'fileNDSSurveyLapangan'=>$fileNDSSurveyLapanganKANWIL,
						'daftarKekuranganData' => '',
						'rencana_survey' => $this->input->post('rencana_survey'),
						'nama_survey' => $this->input->post('nama_survey'),
						'cp_survey' => $this->input->post('cp_survey'),
						'isGenerateDokumenKMK'=>0,
						'isButuhKelengkapanData'=>0,
						'isButuhSurveyLapangan'=>1
						);

		$dokumen = array(
					'dokumen'=>$dataArray
					);
            
        $id = $this->input->post('id');
		$this->verifikasi_model->update($id, $dataArray);

		echo json_encode($dokumen);

	}


	public function generateNDSPersetujuanKANWIL(){
		$file = "Kanwil 2 ND S Persetujuan1.docx";
		$targetFile = "./uploads/template/";				
		$targetSaveFile = "./uploads/verifikasi/kanwil/";

		$templateProcessor = new \PhpOffice\PhpWord\templateProcessor($targetFile.$file);

		$dataArray = array(
						"tahun_terbit" => "2019", //diambil dari tanggal dokumen tergenerate
						"nama_kl" => "Budi Angkasa",
						"nama_satker" => "Satria Planet",
						"tanggal_cetak" => "19/7/2019", //Berubah ketika tombol di Generate
						"jabatan_pemohon" => "Sekretaris Daerah",
						"nomor_surat_permohonan" => "01/INS-KOTA/VIII/2019",
						"tanggal_surat_permohonan" => "11/7/2019",
						"perihal_surat_permohonan" => "Rekomendasi",
						"tanggal_penginputan" => "19/7/2019", //kapan dokumen diajukan, masukin timestamp di database
						"jenis_bmn" => "ATK",
						"total_nilai_bmn" => "100000",
						"huruf_total_nilai_bmn" => "Seratus Ribu Rupiah",
						"peraturan_pelimpahan_wewenang_kementrian_lembaga_pemohon" => "Peratuan Contoh Pasal 1",
						"plh_plt" => "PLT",
						"nama_kepala_bidang" => "Anjasmara Kilat",
						"alamat_kantor_pemohon" => "JL. Inajadulu Nomor 22 Papua Barat",
						"nama_kepala_kanwil"	=> "Siti Komah Prandita Nugraha",
						"nama_verifikator" => "Bahdrun Saothi Soma",
						"nama_kepala_seksi" => "Suindro suiono",
						"kmk_nomor" => "01KMK", //isi manual oleh petugas
						"jabatan_kepala_seksi" => "Ketua Umum",
						"nip_kepala_seksi" => "199554212 215 2 002",
						"nip_kepala_bidang" => "199554212 215 2 001",
						"nama_kepala_kantor" => "Joni Iskandar",
						"nip_kepala_kantor" => "199554212 215 2 001"
		);

		$templateProcessor->setValue('tahun_terbit', $dataArray["tahun_terbit"]);
		$templateProcessor->setValue('nama_kl', $dataArray["nama_kl"]);
		$templateProcessor->setValue('nama_satker', $dataArray["nama_satker"]);
		$templateProcessor->setValue('tanggal_cetak', $dataArray["tanggal_cetak"]);
		$templateProcessor->setValue('jabatan_pemohon', $dataArray["jabatan_pemohon"]);
		$templateProcessor->setValue('nomor_surat_permohonan', $dataArray["nomor_surat_permohonan"]);
		$templateProcessor->setValue('tanggal_surat_permohonan', $dataArray["tanggal_surat_permohonan"]);
		$templateProcessor->setValue('perihal_surat_permohonan', $dataArray["perihal_surat_permohonan"]);
		$templateProcessor->setValue('tanggal_penginputan', $dataArray["tanggal_penginputan"]);
		$templateProcessor->setValue('jenis_bmn', $dataArray["jenis_bmn"]);
		$templateProcessor->setValue('total_nilai_bmn', $dataArray["total_nilai_bmn"]);
		$templateProcessor->setValue('huruf_total_nilai_bmn', $dataArray["huruf_total_nilai_bmn"]);
		$templateProcessor->setValue('peraturan_pelimpahan_wewenang_kementrian_lembaga_pemohon', $dataArray["peraturan_pelimpahan_wewenang_kementrian_lembaga_pemohon"]);
		$templateProcessor->setValue('plh_plt', $dataArray["plh_plt"]);
		$templateProcessor->setValue('nama_kepala_bidang', $dataArray["nama_kepala_bidang"]);
		$templateProcessor->setValue('alamat_kantor_pemohon', $dataArray["alamat_kantor_pemohon"]);
		$templateProcessor->setValue('nama_kepala_kanwil', $dataArray["nama_kepala_kanwil"]);
		$templateProcessor->setValue('nama_verifikator', $dataArray["nama_verifikator"]);
		$templateProcessor->setValue('nama_kepala_seksi', $dataArray["nama_kepala_seksi"]);
		$templateProcessor->setValue('kmk_nomor', $dataArray["kmk_nomor"]);
		$templateProcessor->setValue('jabatan_kepala_seksi', $dataArray["jabatan_kepala_seksi"]);
		$templateProcessor->setValue('nip_kepala_seksi', $dataArray["nip_kepala_seksi"]);
		$templateProcessor->setValue('nip_kepala_bidang', $dataArray["nip_kepala_bidang"]);
		$templateProcessor->setValue('nama_kepala_kantor', $dataArray["nama_kepala_kantor"]);
		$templateProcessor->setValue('nip_kepala_kantor', $dataArray["nip_kepala_kantor"]);


		$fileSave = 'Kanwil - ND S Persetujuan-'.$this->input->post("kementerian_lembaga").'-'.$this->input->post("noSurat_pemohon").'.docx';

		$templateProcessor->saveAs($targetSaveFile.$fileSave);
		return $targetSaveFile.$fileSave;
	}


	public function generateKMKKANWIL()
	{
		$jsonTembusan = $this->input->post("daftar_tembusan");
		$arrayTembusan = json_decode($jsonTembusan,true);		
		$targetSaveFile = "./uploads/verifikasi/kanwil/";

		$strTembusan = '';
		$no = 0;
		foreach ($arrayTembusan as $key=>$tembusan) {
			$no =($key+1);
			$strTembusan.= $no.".".$tembusan["nama"].'<w:br/>';
		}

		
		//ubah sesuai nama template word
		$file = 'Kanwil 3 KMK1.docx';

		//biarkan ini
		$targetFile = "./uploads/template/";		
		$targetSaveFile = "./uploads/verifikasi/kanwil/";

		//Inisiasi Awal (biarkan ini)
		$templateProcessor = new \PhpOffice\PhpWord\templateProcessor($targetFile.$file);

		//set seuai nama variable yang diganti
		$dataArray=array(
					"tahun_terbit" => "2019",
					"kementerian_lembaga" => $this->input->post("kementerian_lembaga"),
					"kementerian_pemohon" => "Direktorat Jendral Kekayaan Negara",
					"jabatan_pemohon" => "Ketua Umum",
					"nama_satker" => $this->input->post("kementerian_lembaga"),
					"nomor_surat_permohonan" => $this->input->post("noSurat_pemohon"),
					"perihal_surat_permohonan" => "PERIHAL SURAT",
					"tanggal_surat_permohonan" => $this->common->tgl_indo($this->input->post("tglSurat_pemohon")),
					"total_nilai_bmn" => $this->common->formatIDR($this->input->post("totalnilai_bmn")),
					"jenis_bmn" => $this->input->post("jenis_bmn"),
					"huruf_total_nilai_bmn" => $this->common->terbilang($this->input->post("totalnilai_bmn")),
					"nama_tembusan" => $strTembusan,
					"nama_KPKNL" => "Sapto Arianto",
					"tanggal_cetak" => "30/08/2019",
					"plh_plt" => "PLT",
					"nama_kepala_kantor" => "Made Ariandana"
					);


		//echo "<pre>"; print_r($dataArray);die;
		$templateProcessor->setValue('tahun_terbit', $dataArray["tahun_terbit"]);
		 $templateProcessor->setValue('kementerian_lembaga', $dataArray["kementerian_lembaga"]);	
		 $templateProcessor->setValue('kementerian_pemohon', $dataArray["kementerian_pemohon"]);
		 $templateProcessor->setValue('jabatan_pemohon', $dataArray["jabatan_pemohon"]);
		 $templateProcessor->setValue('nama_satker', $dataArray["nama_satker"]);
		 $templateProcessor->setValue('nomor_surat_permohonan', $dataArray["nomor_surat_permohonan"]);
		 $templateProcessor->setValue('tanggal_surat_permohonan', $dataArray["tanggal_surat_permohonan"]);
		 $templateProcessor->setValue('perihal_surat_permohonan', $dataArray["perihal_surat_permohonan"]);
		$templateProcessor->setValue('jenis_bmn', $dataArray["jenis_bmn"]);
		 $templateProcessor->setValue('total_nilai_bmn', $dataArray["total_nilai_bmn"]);
		 $templateProcessor->setValue('huruf_total_nilai_bmn', $dataArray["huruf_total_nilai_bmn"]);
		 $templateProcessor->setValue('nama_KPKNL', $dataArray["nama_KPKNL"]);
		 $templateProcessor->setValue('tanggal_cetak', $dataArray["tanggal_cetak"]);
		 $templateProcessor->setValue('plh_plt', $dataArray["plh_plt"]);
		 $templateProcessor->setValue('nama_kepala_kantor', $dataArray["nama_kepala_kantor"]);

		 $templateProcessor->cloneRow('no', 5);		 
		 $templateProcessor->setValue('no#1', '1.');
		 $templateProcessor->setValue('no#2', '2.');
		 $templateProcessor->setValue('no#3', '2.');
		 $templateProcessor->setValue('no#4', '2.');
		 $templateProcessor->setValue('no#5', '2.');
		 $templateProcessor->setValue('nama_tembusan#1', $dataArray["nama_kepala_kantor"]);
		 $templateProcessor->setValue('nama_tembusan#2', 'Direktur Pengelolaan Kekayaan Negara dan Sistem Informasi');
		 $templateProcessor->setValue('nama_tembusan#3', 'Kepala Kantor Wilayah DJKN Papua, Papua Barat dan Maluku');
		 $templateProcessor->setValue('nama_tembusan#4', 'Ketua Umum DEWAN PERWAKILAN RAKYAT');

		 $templateProcessor->setValue('nama_tembusan#5', 'Kepala KPKNL Sapto Arianto');



		$fileSave = 'Kanwil - KMK-'.$this->input->post("kementerian_lembaga").'-'.$this->input->post("noSurat_pemohon").'.docx';

		$templateProcessor->saveAs($targetSaveFile.$fileSave);
		return $targetSaveFile.$fileSave;
	}

	public function generateSalinanKMKKANWIL(){
		$file = 'Kanwil 4 Salinan KMK1.docx';
		$targetFile = './uploads/template/';		
		$targetSaveFile = "./uploads/verifikasi/kanwil/";

		$templateProcessor = new \PhpOffice\PhpWord\templateProcessor($targetFile.$file);

		$dataArray = array(
							"tahun_terbit" => "2019",
							"nama_kl" => "Direktorat A",
							"jabatan_pemohon" => "Sekjen Umum",
							"nama_satker" => "Aulia Mijil",
							"nomor_surat_permohonan" => "12/INS-KOTA/VIII/2019",
							"tanggal_surat_permohonan" => "10/07/2019",
							"perihal_surat_permohonan" => "Permohonan Pendanaan",
							"jenis_bmn" => "ATK",
							"total_nilai_bmn" => "500000",
							"huruf_total_nilai_bmn" => "Lima Ratus Ribu Rupiah",
							"daftar_nama_tembusan_1" => "Kepala Daerah1",
							"daftar_nama_tembusan_2" => "Kepala Daerah2",
							"daftar_nama_tembusan_3" => "Kepala Daerah3",
							"nama_KPKNL" => "David Kambek",
							"tanggal_cetak" => "30/07/2019",
							"plh_plt" => "PLT",
							"nama_kepala_kantor" => "Lingard Jojo",
							"jabatan_salinan" => "Bendahara Umum",
							"nama_salinan" => "Kim Jon Tos",
							"nip_salinan" => "19950711 200801 1 001",
							"kementerian_pemohon" => "Direktorat Keuangan"
		);

		$templateProcessor->setValue('tahun_terbit', $dataArray["tahun_terbit"]);
		$templateProcessor->setValue('nama_kl', $dataArray["nama_kl"]);
		$templateProcessor->setValue('jabatan_pemohon', $dataArray["jabatan_pemohon"]);
		$templateProcessor->setValue('nama_satker', $dataArray["nama_satker"]);
		$templateProcessor->setValue('nomor_surat_permohonan', $dataArray["nomor_surat_permohonan"]);
		$templateProcessor->setValue('tanggal_surat_permohonan', $dataArray["tanggal_surat_permohonan"]);
		$templateProcessor->setValue('perihal_surat_permohonan', $dataArray["perihal_surat_permohonan"]);
		$templateProcessor->setValue('jenis_bmn', $dataArray["jenis_bmn"]);
		$templateProcessor->setValue('total_nilai_bmn', $dataArray["total_nilai_bmn"]);
		$templateProcessor->setValue('huruf_total_nilai_bmn', $dataArray["huruf_total_nilai_bmn"]);
		$templateProcessor->setValue('daftar_nama_tembusan_1', $dataArray["daftar_nama_tembusan_1"]);
		$templateProcessor->setValue('daftar_nama_tembusan_2', $dataArray["daftar_nama_tembusan_2"]);
		$templateProcessor->setValue('daftar_nama_tembusan_3', $dataArray["daftar_nama_tembusan_3"]);
		$templateProcessor->setValue('nama_KPKNL', $dataArray["nama_KPKNL"]);
		$templateProcessor->setValue('tanggal_cetak', $dataArray["tanggal_cetak"]);
		$templateProcessor->setValue('plh_plt', $dataArray["plh_plt"]);
		$templateProcessor->setValue('nama_kepala_kantor', $dataArray["nama_kepala_kantor"]);
		$templateProcessor->setValue('jabatan_salinan', $dataArray["jabatan_salinan"]);
		$templateProcessor->setValue('nama_salinan', $dataArray["nama_salinan"]);
		$templateProcessor->setValue('nip_salinan', $dataArray["nip_salinan"]);
		$templateProcessor->setValue('kementerian_pemohon', $dataArray["kementerian_pemohon"]);

		$fileSave = 'Kanwil - SALINAN-KMK-'.$this->input->post("kementerian_lembaga").'-'.$this->input->post("noSurat_pemohon").'.docx';

		$templateProcessor->saveAs($targetSaveFile.$fileSave);
		return $targetSaveFile.$fileSave;
	}
	

	public function generateNDSPermintaanKelengkapanKANWIL() {
		$file = 'Kanwil 5 ND S Permintaan Kelengkapan1.docx';
		$targetFile = "./uploads/template/";		
		$targetSaveFile = "./uploads/verifikasi/kanwil/";

		$templateProcessor = new \PhpOffice\PhpWord\templateProcessor($targetFile.$file);

		$dataArray = array(
						"tahun_terbit" => "2019",
						"nama_kl" => "Sitikomah",
						"nama_satker" => "Gusti Aji",
						"tanggal_cetak" => "22/09/2019",
						"jabatan_pemohon" => "Setda",
						"nomor_surat_permohonan" => "01/INS-KOTA/VIII/2019",
						"tanggal_surat_permohonan" => "10/10/2019",
						"perihal_surat_permohonan" => "Permohonan PSP",
						"tanggal_penginputan" => "1/08/2019",
						"jenis_bmn" => "Dokumen",
						"total_nilai_bmn" => "100000",
						"huruf_total_nilai_bmn" => "Seratus Ribu Rupiah",
						"data_yang_perlu_dilengkapi" => "Dokumen Akta Kelahiran",
						"plh_plt" => "PLH",
						"alamat_kantor_pemohon" => "JL.Sudirman Nomor 1 Denpasar",
						"nama_verifikator" => "Ita Dewi",
						"nama_kepala_seksi" => "Cika Dogen",
						"jabatan_kepala_seksi" => "Sekretaris",
						"nip_kepala_seksi" => "19950920 200801 1 001",
						"nama_kepala_bidang" => "Dian Sinta",
						"nip_kepala_bidang" => "19950920 200801 1 002",
						"nama_kepala_kantor" => "Cok Gita",
						"nip_kepala_kantor" => "19950920 200801 1 003"
		);

		$templateProcessor->setValue('tahun_terbit', $dataArray["tahun_terbit"]);
		$templateProcessor->setValue('nama_kl', $dataArray["nama_kl"]);
		$templateProcessor->setValue('nama_satker', $dataArray["nama_satker"]);
		$templateProcessor->setValue('tanggal_cetak', $dataArray["tanggal_cetak"]);
		$templateProcessor->setValue('jabatan_pemohon', $dataArray["jabatan_pemohon"]);
		$templateProcessor->setValue('nomor_surat_permohonan', $dataArray["nomor_surat_permohonan"]);
		$templateProcessor->setValue('tanggal_surat_permohonan', $dataArray["tanggal_surat_permohonan"]);
		$templateProcessor->setValue('perihal_surat_permohonan', $dataArray["perihal_surat_permohonan"]);
		$templateProcessor->setValue('tanggal_penginputan', $dataArray["tanggal_penginputan"]);
		$templateProcessor->setValue('jenis_bmn', $dataArray["jenis_bmn"]);
		$templateProcessor->setValue('total_nilai_bmn', $dataArray["total_nilai_bmn"]);
		$templateProcessor->setValue('huruf_total_nilai_bmn', $dataArray["huruf_total_nilai_bmn"]);
		$templateProcessor->setValue('data_yang_perlu_dilengkapi', $dataArray["data_yang_perlu_dilengkapi"]);
		$templateProcessor->setValue('plh_plt', $dataArray["plh_plt"]);
		$templateProcessor->setValue('alamat_kantor_pemohon', $dataArray["alamat_kantor_pemohon"]);
		$templateProcessor->setValue('nama_verifikator', $dataArray["nama_verifikator"]);
		$templateProcessor->setValue('nama_kepala_seksi', $dataArray["nama_kepala_seksi"]);
		$templateProcessor->setValue('jabatan_kepala_seksi', $dataArray["jabatan_kepala_seksi"]);
		$templateProcessor->setValue('nip_kepala_seksi', $dataArray["nip_kepala_seksi"]);
		$templateProcessor->setValue('nama_kepala_bidang', $dataArray["nama_kepala_bidang"]);
		$templateProcessor->setValue('nip_kepala_bidang', $dataArray["nip_kepala_bidang"]);
		$templateProcessor->setValue('nama_kepala_kantor', $dataArray["nama_kepala_kantor"]);
		$templateProcessor->setValue('nip_kepala_kantor', $dataArray["nip_kepala_kantor"]);


		$fileSave = 'Kanwil - ND S Permintaan Kelengkapan-'.$this->input->post("kementerian_lembaga").'-'.$this->input->post("noSurat_pemohon").'.docx';

		$templateProcessor->saveAs($targetSaveFile.$fileSave);
		return $targetSaveFile.$fileSave;
	}


	public function generateNDSSurveyLapanganKANWIL() {
		$file = 'Kanwil 6 ND S Survei Lapangan1.docx';
		$targetFile = "./uploads/template/";		
		$targetSaveFile = "./uploads/verifikasi/kanwil/";
		
		$templateProcessor = new \PhpOffice\PhpWord\templateProcessor($targetFile.$file);

		$dataArray = array(
						"tahun_terbit" => "2019",
						"nama_kl" => "Sitikomah",
						"nama_satker" => "Gusti Aji",
						"tanggal_cetak" => "22/09/2019",
						"jabatan_pemohon" => "Setda",
						"nomor_surat_permohonan" => "01/INS-KOTA/VIII/2019",
						"tanggal_surat_permohonan" => "10/10/2019",
						"perihal_surat_permohonan" => "Permohonan PSP",
						"tanggal_penginputan" => "1/08/2019",
						"jenis_bmn" => "Dokumen",
						"total_nilai_bmn" => "100000",
						"huruf_total_nilai_bmn" => "Seratus Ribu Rupiah",
						"nama_kasi_pkn" => "Mahendra Diggayu",
						"plh_plt" => "PLH",
						"waktu_survei" => "1/8/2019",
						"cp_survei_lapangan" => "Dian Sastro",
						"alamat_kantor_pemohon" => "JL.Sudirman Nomor 1 Denpasar",
						"nama_verifikator" => "Ita Dewi",
						"nama_kepala_seksi" => "Cika Dogen",
						"jabatan_kepala_seksi" => "Sekretaris",
						"nip_kepala_seksi" => "19950920 200801 1 001",
						"nama_kepala_bidang" => "Dian Sinta",
						"nip_kepala_bidang" => "19950920 200801 1 002",
						"nama_kepala_kantor" => "Cok Gita",
						"nip_kepala_kantor" => "19950920 200801 1 003"
		);

		$templateProcessor->setValue('tahun_terbit', $dataArray["tahun_terbit"]);
		$templateProcessor->setValue('nama_kl', $dataArray["nama_kl"]);
		$templateProcessor->setValue('nama_satker', $dataArray["nama_satker"]);
		$templateProcessor->setValue('tanggal_cetak', $dataArray["tanggal_cetak"]);
		$templateProcessor->setValue('jabatan_pemohon', $dataArray["jabatan_pemohon"]);
		$templateProcessor->setValue('nomor_surat_permohonan', $dataArray["nomor_surat_permohonan"]);
		$templateProcessor->setValue('tanggal_surat_permohonan', $dataArray["tanggal_surat_permohonan"]);
		$templateProcessor->setValue('perihal_surat_permohonan', $dataArray["perihal_surat_permohonan"]);
		$templateProcessor->setValue('tanggal_penginputan', $dataArray["tanggal_penginputan"]);
		$templateProcessor->setValue('jenis_bmn', $dataArray["jenis_bmn"]);
		$templateProcessor->setValue('total_nilai_bmn', $dataArray["total_nilai_bmn"]);
		$templateProcessor->setValue('huruf_total_nilai_bmn', $dataArray["huruf_total_nilai_bmn"]);
		$templateProcessor->setValue('nama_kasi_pkn', $dataArray["nama_kasi_pkn"]);
		$templateProcessor->setValue('plh_plt', $dataArray["plh_plt"]);
		$templateProcessor->setValue('waktu_survei', $dataArray["waktu_survei"]);
		$templateProcessor->setValue('cp_survei_lapangan', $dataArray["cp_survei_lapangan"]);
		$templateProcessor->setValue('alamat_kantor_pemohon', $dataArray["alamat_kantor_pemohon"]);
		$templateProcessor->setValue('nama_kepala_kantor', $dataArray["nama_kepala_kantor"]);
		$templateProcessor->setValue('nama_verifikator', $dataArray["nama_verifikator"]);
		$templateProcessor->setValue('nama_kepala_seksi', $dataArray["nama_kepala_seksi"]);
		$templateProcessor->setValue('jabatan_kepala_seksi', $dataArray["jabatan_kepala_seksi"]);
		$templateProcessor->setValue('nip_kepala_seksi', $dataArray["nip_kepala_seksi"]);
		$templateProcessor->setValue('nama_kepala_bidang', $dataArray["nama_kepala_bidang"]);
		$templateProcessor->setValue('nip_kepala_bidang', $dataArray["nip_kepala_bidang"]);
		$templateProcessor->setValue('nama_kepala_kantor', $dataArray["nama_kepala_kantor"]);
		$templateProcessor->setValue('nip_kepala_kantor', $dataArray["nip_kepala_kantor"]);

		$fileSave = 'Kanwil - ND S Survey Lapangan -'.$this->input->post("kementerian_lembaga").'-'.$this->input->post("noSurat_pemohon").'.docx';

		$templateProcessor->saveAs($targetSaveFile.$fileSave);
		return $targetSaveFile.$fileSave;
	}






	public function status()
	{
		$this->template->loadData("activeLink",
			array("content" => array("general" => 1)));

		$vueComponent = $this->load->view("hidepage/vue/ComponentPspBMNVerifikasiWizard.js",'',true);
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
			'<script src="'.$this->common->theme_hideend().'plugins/js/vue-airbnb-style-datepicker.min.js"></script>'.
			'<script src="'.$this->common->theme_hideend().'plugins/js/date_fns.js"></script>'.
			$vueComponent.
			'<script src="'.$this->common->theme_hideend().'plugins/js/appStatusVerifikasi.js"></script>'
			);
		$this->template->loadContent("hidepage/verifikasi/status.php", array(
			)
		);
	}


	public function checkDocumentVerifikasi($idPengajuan){
       	$query =  $this->verifikasi_model->showAllbyIDPengajuan($idPengajuan);
       	
        if($query){
            $result['dokumen'] = $query;
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

	public function add()
    {	

    	if(true){
            
            
            
            $data = array(
                'idPengajuan' => $this->input->post('idPengajuan'),
                'nama_verifikator' => $this->input->post('nama_verifikator'),
                'nip_verifikator' => $this->input->post('nip_verifikator'),
                'nip_kepala_seksi' => $this->input->post('nip_kepala_seksi'),
                'nama_kepala_seksi' => $this->input->post('nama_kepala_seksi'),
                'jabatan_kepala_seksi' => $this->input->post('jabatan_kepala_seksi'),
                'status_kepala_seksi' => $this->input->post('status_kepala_seksi'),
                'nip_kepala_bidang' => $this->input->post('nip_kepala_bidang'),
                'nama_kepala_bidang' => $this->input->post('nama_kepala_bidang'),
                'jabatan_kepala_bidang' => $this->input->post('jabatan_kepala_bidang'),
                'status_kepala_bidang' => $this->input->post('status_kepala_bidang'),
                'nip_kepala_kanwil' => $this->input->post('nip_kepala_kanwil'),
                'nama_kepala_kanwil' => $this->input->post('nama_kepala_kanwil'),
                'jabatan_kepala_kanwil' => $this->input->post('jabatan_kepala_kanwil'),
                'status_kepala_kanwil' => $this->input->post('status_kepala_kanwil'),
                'submitdate' =>  date("Y/m/d")
            );
            
            $idPengajuan = $this->verifikasi_model->insert($data);

       	
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



    public function update()
    {	
    	if(true){
            
            
            $id = $this->input->post('id');
           
            $data = array(
                'idPengajuan' => $this->input->post('idPengajuan'),
                'nama_verifikator' => $this->input->post('nama_verifikator'),
                'nip_verifikator' => $this->input->post('nip_verifikator'),
                'nip_kepala_seksi' => $this->input->post('nip_kepala_seksi'),
                'nama_kepala_seksi' => $this->input->post('nama_kepala_seksi'),
                'jabatan_kepala_seksi' => $this->input->post('jabatan_kepala_seksi'),
                'status_kepala_seksi' => $this->input->post('status_kepala_seksi'),
                'nip_kepala_bidang' => $this->input->post('nip_kepala_bidang'),
                'nama_kepala_bidang' => $this->input->post('nama_kepala_bidang'),
                'jabatan_kepala_bidang' => $this->input->post('jabatan_kepala_bidang'),
                'status_kepala_bidang' => $this->input->post('status_kepala_bidang'),
                'nip_kepala_kanwil' => $this->input->post('nip_kepala_kanwil'),
                'nama_kepala_kanwil' => $this->input->post('nama_kepala_kanwil'),
                'jabatan_kepala_kanwil' => $this->input->post('jabatan_kepala_kanwil'),
                'status_kepala_kanwil' => $this->input->post('status_kepala_kanwil'),
                'status_kepala_kanwil' => $this->input->post('status_kepala_kanwil'),                                
	            'check_jenis_bmn'=>$this->input->post('check_jenis_bmn'),
	            'check_nilai_bmn'=>$this->input->post('check_nilai_bmn'),
	            'check_surat_permohonan'=>$this->input->post('check_surat_permohonan'),
	            'check_rincian_usulan_bmn'=>$this->input->post('check_rincian_usulan_bmn'),
	            'check_kib'=>$this->input->post('check_kib'),
	            'check_foto_bmn'=>$this->input->post('check_foto_bmn'),
	            'check_sk_delegasi'=>$this->input->post('check_sk_delegasi'),
	            'check_dokumen_kepemilikan'=>$this->input->post('check_dokumen_kepemilikan'),
	            'check_fc_dokumen_kepemilikan'=>$this->input->post('check_fc_dokumen_kepemilikan'),
	            'check_sptjm_bermaterai'=>$this->input->post('check_sptjm_bermaterai'),
	            'check_kebenaran_fc_dokumen_kepemilikan'=>$this->input->post('check_kebenaran_fc_dokumen_kepemilikan'),
	            'noteDokumen'=>$this->input->post('noteDokumen'),
	            'daftar_tembusan'=>$this->input->post('daftar_tembusan'),
	            'jabatan_salinan'=>$this->input->post('jabatan_salinan'),
	            'nama_salinan'=>$this->input->post('nama_salinan'),
	            'hasil_verifikasi'=>$this->input->post('hasil_verifikasi'),
	            'nip_salinan'=>$this->input->post('nip_salinan'),	            
                'peraturan_pendelegasian_wewenang_KL' => $this->input->post('peraturan_pendelegasian_wewenang_KL'),
                'rencana_survey' => $this->input->post('rencana_survey'),
				'nama_survey' => $this->input->post('nama_survey'),
				'cp_survey' => $this->input->post('cp_survey'),            
                'suratNDSPersetujuanfinal' => $this->input->post('suratNDSPersetujuanfinal'),	            
                'suratHasilVerifikasifinal' => $this->input->post('suratHasilVerifikasifinal'),	            
                'suratKMKfinal' => $this->input->post('suratKMKfinal'),	            
                'suratSalinanKMKfinal' => $this->input->post('suratSalinanKMKfinal'),	            
                'suratNDSSurveyLapanganfinal' => $this->input->post('suratNDSSurveyLapanganfinal'),	            
                'suratNDSPermintaanKelengkapanfinal' => $this->input->post('suratNDSPermintaanKelengkapanfinal'),	            
                'updatedate' =>  date("Y/m/d")
            );
            
            $this->verifikasi_model->update($id, $data);
            $result = array(
            				'error'=>false,
            				'msg' => 'Data updated'
            			);
           
        }
        echo json_encode($result);
    }

	public function uploadFile()
	{
		$this->load->library("upload");
		if (($_FILES['file1']['size'] > 0) && ($_FILES['file2']['size'] > 0) && ($_FILES['file3']['size'] > 0) && ($_FILES['file4']['size'] > 0) ) {
			$this->upload->initialize(array(
		       "upload_path" => $this->settings->info->upload_path."/verifikasi/",
		       "overwrite" => FALSE,
		       "max_filename" => 300,
		       "encrypt_name" => false,
		       "remove_spaces" => TRUE,
		       "allowed_types" => "docx|doc|xlsx|xls",
		       "max_size" => 200000
		    ));

		    $file = array();
		    $msg = array();
		    $error = array();

			if($this->upload->do_upload('file1')){
				$data = $this->upload->data();
				$FileData = $data['file_name'];
				$error[] = false;
		    	$file[] = "/verifikasi/".$FileData;
		    	$msg[] = "Successfully upload!";
			}else{
				$error[] = true;
		    	$msg[] = $this->upload->display_errors();
			}			

			if($this->upload->do_upload('file2')){
				$data = $this->upload->data();
				$FileData = $data['file_name'];
				$error[] = false;
		    	$file[] = "/verifikasi/".$FileData;		    	
		    	$msg[] = "Successfully upload!";
			}else{
				$error[] = true;
		    	$msg[] = $this->upload->display_errors();
			}		

			if($this->upload->do_upload('file3')){
				$data = $this->upload->data();
				$FileData = $data['file_name'];
				$error[] = false;
		    	$file[] = "/verifikasi/".$FileData;
		    	$msg[] = "Successfully upload!";
			}else{
				$error[] = true;
		    	$msg[] = $this->upload->display_errors();
			}	

			if($this->upload->do_upload('file4')){
				$data = $this->upload->data();
				$FileData = $data['file_name'];
				$error[] = false;
		    	$file[] = "/verifikasi/".$FileData;
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

	public function uploadFileFinal()
	{
		$this->load->library("upload");
		if (($_FILES['file1']['size'] > 0) && ($_FILES['file2']['size'] > 0) && ($_FILES['file3']['size'] > 0) && ($_FILES['file4']['size'] > 0) ) {
			$this->upload->initialize(array(
		       "upload_path" => $this->settings->info->upload_path."/verifikasi/final/",
		       "overwrite" => FALSE,
		       "max_filename" => 300,
		       "encrypt_name" => false,
		       "remove_spaces" => TRUE,
		       "allowed_types" => "docx|doc|xlsx|xls",
		       "max_size" => 200000
		    ));

		    $file = array();
		    $msg = array();
		    $error = array();

			if($this->upload->do_upload('file1')){
				$data = $this->upload->data();
				$FileData = $data['file_name'];
				$error[] = false;
		    	$file[] = "/verifikasi/final/".$FileData;
		    	$msg[] = "Successfully upload!";
			}else{
				$error[] = true;
		    	$msg[] = $this->upload->display_errors();
			}			

			if($this->upload->do_upload('file2')){
				$data = $this->upload->data();
				$FileData = $data['file_name'];
				$error[] = false;
		    	$file[] = "/verifikasi/final/".$FileData;		    	
		    	$msg[] = "Successfully upload!";
			}else{
				$error[] = true;
		    	$msg[] = $this->upload->display_errors();
			}		

			if($this->upload->do_upload('file3')){
				$data = $this->upload->data();
				$FileData = $data['file_name'];
				$error[] = false;
		    	$file[] = "/verifikasi/final/".$FileData;
		    	$msg[] = "Successfully upload!";
			}else{
				$error[] = true;
		    	$msg[] = $this->upload->display_errors();
			}	

			if($this->upload->do_upload('file4')){
				$data = $this->upload->data();
				$FileData = $data['file_name'];
				$error[] = false;
		    	$file[] = "/verifikasi/final/".$FileData;
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
	public function uploadFileKelengkapan()
	{
		$this->load->library("upload");
		if (($_FILES['file1']['size'] > 0) && ($_FILES['file2']['size'] > 0)) {
			$this->upload->initialize(array(
		       "upload_path" => $this->settings->info->upload_path."/verifikasi/kuranglengkap/",
		       "overwrite" => FALSE,
		       "max_filename" => 300,
		       "encrypt_name" => false,
		       "remove_spaces" => TRUE,
		       "allowed_types" => "docx|doc|xlsx|xls",
		       "max_size" => 200000
		    ));

		    $file = array();
		    $msg = array();
		    $error = array();

			if($this->upload->do_upload('file1')){
				$data = $this->upload->data();
				$FileData = $data['file_name'];
				$error[] = false;
		    	$file[] = "/verifikasi/kuranglengkap/".$FileData;
		    	$msg[] = "Successfully upload!";
			}else{
				$error[] = true;
		    	$msg[] = $this->upload->display_errors();
			}			

			if($this->upload->do_upload('file2')){
				$data = $this->upload->data();
				$FileData = $data['file_name'];
				$error[] = false;
		    	$file[] = "/verifikasi/kuranglengkap/".$FileData;		    	
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
	public function uploadFileSurvey()
	{
		$this->load->library("upload");
		if (($_FILES['file1']['size'] > 0) && ($_FILES['file2']['size'] > 0)) {
			$this->upload->initialize(array(
		       "upload_path" => $this->settings->info->upload_path."/verifikasi/survey/",
		       "overwrite" => FALSE,
		       "max_filename" => 300,
		       "encrypt_name" => false,
		       "remove_spaces" => TRUE,
		       "allowed_types" => "docx|doc|xlsx|xls",
		       "max_size" => 200000
		    ));

		    $file = array();
		    $msg = array();
		    $error = array();

			if($this->upload->do_upload('file1')){
				$data = $this->upload->data();
				$FileData = $data['file_name'];
				$error[] = false;
		    	$file[] = "/verifikasi/survey/".$FileData;
		    	$msg[] = "Successfully upload!";
			}else{
				$error[] = true;
		    	$msg[] = $this->upload->display_errors();
			}			

			if($this->upload->do_upload('file2')){
				$data = $this->upload->data();
				$FileData = $data['file_name'];
				$error[] = false;
		    	$file[] = "/verifikasi/survey/".$FileData;		    	
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
