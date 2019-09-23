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
		//$this->load->helper(array('form', 'url'));
		if (!$this->user->loggedin) $this->template->error(lang("error_1"));
		// if(!$this->common->has_permissions(array(
		// 		"admin", "content_manager", "content_worker"), $this->user)) {
		// 		$this->template->error(lang("error_81"));
		// }
	}

	//Generate document fix
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
						"plh_plt" => ($this->input->post('status_kepala_seksi')==='definitif')?'':'Plt',
						"nama_kepala_seksi" => $this->input->post('nama_kepala_seksi'),
						"nip_kepala_seksi" => $this->input->post('nip_kepala_seksi'),
						"nama_verifikator" => $this->input->post('nama_verifikator'),
						"nip_verifikator" => $this->input->post('nip_verifikator')
		);

		 $jenis_bmn_ada='✓';
		 $jenis_bmn_tdk='-';
		 $jenis_bmn_ses=($this->input->post('check_jenis_bmn')==='sesuai')?'✓':'-';
		 $jenis_bmn_tdkses=($this->input->post('check_jenis_bmn')==='tidak sesuai')?'✓':'-';


		 $nilai_bmn_ada='✓';
		 $nilai_bmn_tdk='-';
		 $nilai_bmn_ses=($this->input->post('check_nilai_bmn')==='sesuai')?'✓':'-';
		 $nilai_bmn_tdkses=($this->input->post('check_nilai_bmn')==='tidak sesuai')?'✓':'-';		 

		 $surat_permohonan_ada=($this->input->post('check_surat_permohonan')==='sesuai'||$this->input->post('check_surat_permohonan')==='ada')?'✓':'-';;
		 $surat_permohonan_tdk=($this->input->post('check_surat_permohonan')==='tidak ada')?'✓':'-';
		 $surat_permohonan_ses=($this->input->post('check_surat_permohonan')==='sesuai')?'✓':'-';
		 $surat_permohonan_tdkses=($this->input->post('check_surat_permohonan')==='tidak sesuai')?'✓':'-';

		 $data_rincian_ada=($this->input->post('check_rincian_usulan_bmn')==='sesuai'||$this->input->post('check_rincian_usulan_bmn')==='ada')?'✓':'-';;
		 $data_rincian_tdk=($this->input->post('check_rincian_usulan_bmn')==='tidak ada')?'✓':'-';
		 $data_rincian_ses=($this->input->post('check_rincian_usulan_bmn')==='sesuai')?'✓':'-';
		 $data_rincian_tdkses=($this->input->post('check_rincian_usulan_bmn')==='tidak sesuai')?'✓':'-';

		 $kib_ada=($this->input->post('check_kib')==='sesuai'||$this->input->post('check_kib')==='ada')?'✓':'-';;
		 $kib_tdk=($this->input->post('check_kib')==='tidak ada')?'✓':'-';
		 $kib_ses=($this->input->post('check_kib')==='sesuai')?'✓':'-';
		 $kib_tdkses=($this->input->post('check_kib')==='tidak sesuai')?'✓':'-';

		 $foto_ada=($this->input->post('check_foto_bmn')==='sesuai'||$this->input->post('check_foto_bmn')==='ada')?'✓':'-';;
		 $foto_tdk=($this->input->post('check_foto_bmn')==='tidak ada')?'✓':'-';
		 $foto_ses=($this->input->post('check_foto_bmn')==='sesuai')?'✓':'-';
		 $foto_tdkses=($this->input->post('check_foto_bmn')==='tidak sesuai')?'✓':'-';

		 $fc_sk_ada=($this->input->post('check_sk_delegasi')==='sesuai'||$this->input->post('check_sk_delegasi')==='ada')?'✓':'-';;
		 $fc_sk_tdk=($this->input->post('check_sk_delegasi')==='tidak ada')?'✓':'-';
		 $fc_sk_ses=($this->input->post('check_sk_delegasi')==='sesuai')?'✓':'-';
		 $fc_sk_tdkses=($this->input->post('check_sk_delegasi')==='tidak sesuai')?'✓':'-';


		$templateProcessor->setValue('jenis_bmn_ada', $jenis_bmn_ada);
		$templateProcessor->setValue('jenis_bmn_tdk', $jenis_bmn_tdk);
		$templateProcessor->setValue('jenis_bmn_ses', $jenis_bmn_ses);
		$templateProcessor->setValue('jenis_bmn_tdkses', $jenis_bmn_tdkses);
		
		$templateProcessor->setValue('nilai_bmn_ada', $nilai_bmn_ada);
		$templateProcessor->setValue('nilai_bmn_tdk', $nilai_bmn_tdk);
		$templateProcessor->setValue('nilai_bmn_ses', $nilai_bmn_ses);
		$templateProcessor->setValue('nilai_bmn_tdkses', $nilai_bmn_tdkses);

		$templateProcessor->setValue('surat_permohonan_ada', $surat_permohonan_ada);
		$templateProcessor->setValue('surat_permohonan_tdk', $surat_permohonan_tdk);
		$templateProcessor->setValue('surat_permohonan_ses', $surat_permohonan_ses);
		$templateProcessor->setValue('surat_permohonan_tdkses', $surat_permohonan_tdkses);
		
		$templateProcessor->setValue('data_rincian_ada', $data_rincian_ada);
		$templateProcessor->setValue('data_rincian_tdk', $data_rincian_tdk);
		$templateProcessor->setValue('data_rincian_ses', $data_rincian_ses);
		$templateProcessor->setValue('data_rincian_tdkses', $data_rincian_tdkses);

		$templateProcessor->setValue('kib_ada', $kib_ada);
		$templateProcessor->setValue('kib_tdk', $kib_tdk);
		$templateProcessor->setValue('kib_ses', $kib_ses);
		$templateProcessor->setValue('kib_tdkses', $kib_tdkses);

		$templateProcessor->setValue('foto_ada', $foto_ada);
		$templateProcessor->setValue('foto_tdk', $foto_tdk);
		$templateProcessor->setValue('foto_ses', $foto_ses);
		$templateProcessor->setValue('foto_tdkses', $foto_tdkses);

		$templateProcessor->setValue('fc_sk_ada', $fc_sk_ada);
		$templateProcessor->setValue('fc_sk_tdk', $fc_sk_tdk);
		$templateProcessor->setValue('fc_sk_ses', $fc_sk_ses);
		$templateProcessor->setValue('fc_sk_tdkses', $fc_sk_tdkses);
		



		if($this->input->post('check_dokumen_kepemilikan')==="ada"){
			$templateProcessor->cloneRow('no', 2);		 
		 	$templateProcessor->setValue('no#1', '8.');
		 	$templateProcessor->setValue('no#2', '9.');


			$fc_dokumen_kepemilikan_ada=($this->input->post('check_fc_dokumen_kepemilikan')==='sesuai'||$this->input->post('check_fc_dokumen_kepemilikan')==='ada')?'✓':'-';;
			$fc_dokumen_kepemilikan_tdk=($this->input->post('check_fc_dokumen_kepemilikan')==='tidak ada')?'✓':'-';
			$fc_dokumen_kepemilikan_ses=($this->input->post('check_fc_dokumen_kepemilikan')==='sesuai')?'✓':'-';
			$fc_dokumen_kepemilikan_tdkses=($this->input->post('check_fc_dokumen_kepemilikan')==='tidak sesuai')?'✓':'-';


			$kebenaran_fc_dokumen_kepemilikan_ada=($this->input->post('check_kebenaran_fc_dokumen_kepemilikan')==='sesuai'||$this->input->post('check_kebenaran_fc_dokumen_kepemilikan')==='ada')?'✓':'-';
			$kebenaran_fc_dokumen_kepemilikan_tdk=($this->input->post('check_kebenaran_fc_dokumen_kepemilikan')==='tidak ada')?'✓':'-';
			$kebenaran_fc_dokumen_kepemilikan_ses=($this->input->post('check_kebenaran_fc_dokumen_kepemilikan')==='sesuai')?'✓':'-';
			$kebenaran_fc_dokumen_kepemilikan_tdkses=($this->input->post('check_kebenaran_fc_dokumen_kepemilikan')==='tidak sesuai')?'✓':'-';



			$templateProcessor->setValue('data#1', 'Fotocopy dokumen kepemilikan');
			$templateProcessor->setValue('data#2', 'Surat penyataan kebenaran fotocopy dokumen kepemilikan');

			$templateProcessor->setValue('data_ada#1', $fc_dokumen_kepemilikan_ada);
			$templateProcessor->setValue('data_ada#2', $kebenaran_fc_dokumen_kepemilikan_ada);

			$templateProcessor->setValue('data_tdk#1', $fc_dokumen_kepemilikan_tdk);
			$templateProcessor->setValue('data_tdk#2', $kebenaran_fc_dokumen_kepemilikan_tdk);

			$templateProcessor->setValue('data_ses#1', $fc_dokumen_kepemilikan_ses);
			$templateProcessor->setValue('data_ses#2', $kebenaran_fc_dokumen_kepemilikan_tdkses);

			$templateProcessor->setValue('data_tdkses#1', $fc_dokumen_kepemilikan_tdkses);
			$templateProcessor->setValue('data_tdkses#2', $kebenaran_fc_dokumen_kepemilikan_tdkses);

		}else{
			$templateProcessor->setValue('no', '8.');			
			$templateProcessor->setValue('data#1', 'SPTJM bermaterai bahwa barang tersebut adalah BMN dan digunakan untuk tugas dan fungsi.');

			$sptjm_bermaterai_ada=($this->input->post('check_sptjm_bermaterai')==='sesuai'||$this->input->post('check_sptjm_bermaterai')==='ada')?'✓':'-';;
			$sptjm_bermaterai_tdk=($this->input->post('check_sptjm_bermaterai')==='tidak ada')?'✓':'-';
			$sptjm_bermaterai_ses=($this->input->post('check_sptjm_bermaterai')==='sesuai')?'✓':'-';
			$sptjm_bermaterai_tdkses=($this->input->post('check_sptjm_bermaterai')==='tidak sesuai')?'✓':'-';


			$templateProcessor->setValue('data_ada', $sptjm_bermaterai_ada);
			$templateProcessor->setValue('data_tdk', $sptjm_bermaterai_tdk);
			$templateProcessor->setValue('data_ses', $sptjm_bermaterai_ses);
			$templateProcessor->setValue('data_tdkses', $sptjm_bermaterai_tdkses);

		}


		$templateProcessor->setValue('jabatan_pemohon',$dataArray["jabatan_pemohon"]);
		$templateProcessor->setValue('nama_satker',$dataArray["nama_satker"]);
		$templateProcessor->setValue('nomor_surat_permohonan',$dataArray["nomor_surat_permohonan"]);
		$templateProcessor->setValue('tanggal_surat_permohonan',$dataArray["tanggal_surat_permohonan"]);
		$templateProcessor->setValue('catatan_khusus',$dataArray["sesuai_catatan_khusus"]);
		$templateProcessor->setValue('plh_plt',$dataArray["plh_plt"]);
		$templateProcessor->setValue('nama_kepala_seksi',$dataArray["nama_kepala_seksi"]);
		$templateProcessor->setValue('nip_kepala_seksi',$dataArray["nip_kepala_seksi"]);
		$templateProcessor->setValue('nama_verifikator',$dataArray["nama_verifikator"]);
		$templateProcessor->setValue('nip_verifikator',$dataArray["nip_verifikator"]);



		$fileSave = 'Kanwil - Hasil Verifikasi-'.$this->input->post("kementerian_lembaga").'-'.$this->input->post("noSurat_pemohon").'.docx';

		$templateProcessor->saveAs($targetSaveFile.$fileSave);
		return $targetSaveFile.$fileSave;
	}

	//Generate document
	public function generateHasilVerifikasiKPKNL(){
		$file = 'KPKNL 1 Hasil Verifikasi.docx';
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
						"plh_plt" => ($this->input->post('status_kepala_seksi')==='definitif')?'':'Plt',
						"nama_kepala_seksi" => $this->input->post('nama_kepala_seksi'),
						"nip_kepala_seksi" => $this->input->post('nip_kepala_seksi'),
						"nama_verifikator" => $this->input->post('nama_verifikator'),
						"nip_verifikator" => $this->input->post('nip_verifikator')
		);

		 $jenis_bmn_ada='✓';
		 $jenis_bmn_tdk='-';
		 $jenis_bmn_ses=($this->input->post('check_jenis_bmn')==='sesuai')?'✓':'-';
		 $jenis_bmn_tdkses=($this->input->post('check_jenis_bmn')==='tidak sesuai')?'✓':'-';


		 $nilai_bmn_ada='✓';
		 $nilai_bmn_tdk='-';
		 $nilai_bmn_ses=($this->input->post('check_nilai_bmn')==='sesuai')?'✓':'-';
		 $nilai_bmn_tdkses=($this->input->post('check_nilai_bmn')==='tidak sesuai')?'✓':'-';		 

		 $surat_permohonan_ada=($this->input->post('check_surat_permohonan')==='sesuai'||$this->input->post('check_surat_permohonan')==='ada')?'✓':'-';;
		 $surat_permohonan_tdk=($this->input->post('check_surat_permohonan')==='tidak ada')?'✓':'-';
		 $surat_permohonan_ses=($this->input->post('check_surat_permohonan')==='sesuai')?'✓':'-';
		 $surat_permohonan_tdkses=($this->input->post('check_surat_permohonan')==='tidak sesuai')?'✓':'-';

		 $data_rincian_ada=($this->input->post('check_rincian_usulan_bmn')==='sesuai'||$this->input->post('check_rincian_usulan_bmn')==='ada')?'✓':'-';;
		 $data_rincian_tdk=($this->input->post('check_rincian_usulan_bmn')==='tidak ada')?'✓':'-';
		 $data_rincian_ses=($this->input->post('check_rincian_usulan_bmn')==='sesuai')?'✓':'-';
		 $data_rincian_tdkses=($this->input->post('check_rincian_usulan_bmn')==='tidak sesuai')?'✓':'-';

		 $kib_ada=($this->input->post('check_kib')==='sesuai'||$this->input->post('check_kib')==='ada')?'✓':'-';;
		 $kib_tdk=($this->input->post('check_kib')==='tidak ada')?'✓':'-';
		 $kib_ses=($this->input->post('check_kib')==='sesuai')?'✓':'-';
		 $kib_tdkses=($this->input->post('check_kib')==='tidak sesuai')?'✓':'-';

		 $foto_ada=($this->input->post('check_foto_bmn')==='sesuai'||$this->input->post('check_foto_bmn')==='ada')?'✓':'-';;
		 $foto_tdk=($this->input->post('check_foto_bmn')==='tidak ada')?'✓':'-';
		 $foto_ses=($this->input->post('check_foto_bmn')==='sesuai')?'✓':'-';
		 $foto_tdkses=($this->input->post('check_foto_bmn')==='tidak sesuai')?'✓':'-';

		 $fc_sk_ada=($this->input->post('check_sk_delegasi')==='sesuai'||$this->input->post('check_sk_delegasi')==='ada')?'✓':'-';;
		 $fc_sk_tdk=($this->input->post('check_sk_delegasi')==='tidak ada')?'✓':'-';
		 $fc_sk_ses=($this->input->post('check_sk_delegasi')==='sesuai')?'✓':'-';
		 $fc_sk_tdkses=($this->input->post('check_sk_delegasi')==='tidak sesuai')?'✓':'-';


		$templateProcessor->setValue('jenis_bmn_ada', $jenis_bmn_ada);
		$templateProcessor->setValue('jenis_bmn_tdk', $jenis_bmn_tdk);
		$templateProcessor->setValue('jenis_bmn_ses', $jenis_bmn_ses);
		$templateProcessor->setValue('jenis_bmn_tdkses', $jenis_bmn_tdkses);
		
		$templateProcessor->setValue('nilai_bmn_ada', $nilai_bmn_ada);
		$templateProcessor->setValue('nilai_bmn_tdk', $nilai_bmn_tdk);
		$templateProcessor->setValue('nilai_bmn_ses', $nilai_bmn_ses);
		$templateProcessor->setValue('nilai_bmn_tdkses', $nilai_bmn_tdkses);

		$templateProcessor->setValue('surat_permohonan_ada', $surat_permohonan_ada);
		$templateProcessor->setValue('surat_permohonan_tdk', $surat_permohonan_tdk);
		$templateProcessor->setValue('surat_permohonan_ses', $surat_permohonan_ses);
		$templateProcessor->setValue('surat_permohonan_tdkses', $surat_permohonan_tdkses);
		
		$templateProcessor->setValue('data_rincian_ada', $data_rincian_ada);
		$templateProcessor->setValue('data_rincian_tdk', $data_rincian_tdk);
		$templateProcessor->setValue('data_rincian_ses', $data_rincian_ses);
		$templateProcessor->setValue('data_rincian_tdkses', $data_rincian_tdkses);

		$templateProcessor->setValue('kib_ada', $kib_ada);
		$templateProcessor->setValue('kib_tdk', $kib_tdk);
		$templateProcessor->setValue('kib_ses', $kib_ses);
		$templateProcessor->setValue('kib_tdkses', $kib_tdkses);

		$templateProcessor->setValue('foto_ada', $foto_ada);
		$templateProcessor->setValue('foto_tdk', $foto_tdk);
		$templateProcessor->setValue('foto_ses', $foto_ses);
		$templateProcessor->setValue('foto_tdkses', $foto_tdkses);

		$templateProcessor->setValue('fc_sk_ada', $fc_sk_ada);
		$templateProcessor->setValue('fc_sk_tdk', $fc_sk_tdk);
		$templateProcessor->setValue('fc_sk_ses', $fc_sk_ses);
		$templateProcessor->setValue('fc_sk_tdkses', $fc_sk_tdkses);
		



		if($this->input->post('check_dokumen_kepemilikan')==="ada"){
			$templateProcessor->cloneRow('no', 2);		 
		 	$templateProcessor->setValue('no#1', '8.');
		 	$templateProcessor->setValue('no#2', '9.');


			$fc_dokumen_kepemilikan_ada=($this->input->post('check_fc_dokumen_kepemilikan')==='sesuai'||$this->input->post('check_fc_dokumen_kepemilikan')==='ada')?'✓':'-';;
			$fc_dokumen_kepemilikan_tdk=($this->input->post('check_fc_dokumen_kepemilikan')==='tidak ada')?'✓':'-';
			$fc_dokumen_kepemilikan_ses=($this->input->post('check_fc_dokumen_kepemilikan')==='sesuai')?'✓':'-';
			$fc_dokumen_kepemilikan_tdkses=($this->input->post('check_fc_dokumen_kepemilikan')==='tidak sesuai')?'✓':'-';


			$kebenaran_fc_dokumen_kepemilikan_ada=($this->input->post('check_kebenaran_fc_dokumen_kepemilikan')==='sesuai'||$this->input->post('check_kebenaran_fc_dokumen_kepemilikan')==='ada')?'✓':'-';
			$kebenaran_fc_dokumen_kepemilikan_tdk=($this->input->post('check_kebenaran_fc_dokumen_kepemilikan')==='tidak ada')?'✓':'-';
			$kebenaran_fc_dokumen_kepemilikan_ses=($this->input->post('check_kebenaran_fc_dokumen_kepemilikan')==='sesuai')?'✓':'-';
			$kebenaran_fc_dokumen_kepemilikan_tdkses=($this->input->post('check_kebenaran_fc_dokumen_kepemilikan')==='tidak sesuai')?'✓':'-';



			$templateProcessor->setValue('data#1', 'Fotocopy dokumen kepemilikan');
			$templateProcessor->setValue('data#2', 'Surat penyataan kebenaran fotocopy dokumen kepemilikan');

			$templateProcessor->setValue('data_ada#1', $fc_dokumen_kepemilikan_ada);
			$templateProcessor->setValue('data_ada#2', $kebenaran_fc_dokumen_kepemilikan_ada);

			$templateProcessor->setValue('data_tdk#1', $fc_dokumen_kepemilikan_tdk);
			$templateProcessor->setValue('data_tdk#2', $kebenaran_fc_dokumen_kepemilikan_tdk);

			$templateProcessor->setValue('data_ses#1', $fc_dokumen_kepemilikan_ses);
			$templateProcessor->setValue('data_ses#2', $kebenaran_fc_dokumen_kepemilikan_tdkses);

			$templateProcessor->setValue('data_tdkses#1', $fc_dokumen_kepemilikan_tdkses);
			$templateProcessor->setValue('data_tdkses#2', $kebenaran_fc_dokumen_kepemilikan_tdkses);

		}else{
			$templateProcessor->setValue('no', '8.');			
			$templateProcessor->setValue('data#1', 'SPTJM bermaterai bahwa barang tersebut adalah BMN dan digunakan untuk tugas dan fungsi.');

			$sptjm_bermaterai_ada=($this->input->post('check_sptjm_bermaterai')==='sesuai'||$this->input->post('check_sptjm_bermaterai')==='ada')?'✓':'-';;
			$sptjm_bermaterai_tdk=($this->input->post('check_sptjm_bermaterai')==='tidak ada')?'✓':'-';
			$sptjm_bermaterai_ses=($this->input->post('check_sptjm_bermaterai')==='sesuai')?'✓':'-';
			$sptjm_bermaterai_tdkses=($this->input->post('check_sptjm_bermaterai')==='tidak sesuai')?'✓':'-';


			$templateProcessor->setValue('data_ada', $sptjm_bermaterai_ada);
			$templateProcessor->setValue('data_tdk', $sptjm_bermaterai_tdk);
			$templateProcessor->setValue('data_ses', $sptjm_bermaterai_ses);
			$templateProcessor->setValue('data_tdkses', $sptjm_bermaterai_tdkses);

		}


		$templateProcessor->setValue('jabatan_pemohon',$dataArray["jabatan_pemohon"]);
		$templateProcessor->setValue('nama_satker',$dataArray["nama_satker"]);
		$templateProcessor->setValue('nomor_surat_permohonan',$dataArray["nomor_surat_permohonan"]);
		$templateProcessor->setValue('tanggal_surat_permohonan',$dataArray["tanggal_surat_permohonan"]);
		$templateProcessor->setValue('catatan_khusus',$dataArray["sesuai_catatan_khusus"]);
		$templateProcessor->setValue('plh_plt',$dataArray["plh_plt"]);
		$templateProcessor->setValue('nama_kepala_seksi',$dataArray["nama_kepala_seksi"]);
		$templateProcessor->setValue('nip_kepala_seksi',$dataArray["nip_kepala_seksi"]);
		$templateProcessor->setValue('nama_verifikator',$dataArray["nama_verifikator"]);
		$templateProcessor->setValue('nip_verifikator',$dataArray["nip_verifikator"]);



		$fileSave = 'KPKNL - Hasil Verifikasi-'.$this->input->post("kementerian_lembaga").'-'.$this->input->post("noSurat_pemohon").'.docx';

		$templateProcessor->saveAs($targetSaveFile.$fileSave);
		return $targetSaveFile.$fileSave;
	}


	public function generateNDSPersetujuanKPKNL(){
		$file = "KPKNL 2 ND S Persetujuan1.docx";
		$targetFile = "./uploads/template/";				
		$targetSaveFile = "./uploads/verifikasi/kanwil/";

		$templateProcessor = new \PhpOffice\PhpWord\templateProcessor($targetFile.$file);
		$tahun_terbit=substr($this->input->post('tglSurat_pemohon'), 0, 4); 
		$dataArray = array( //diambil dari tanggal dokumen tergenerate
						"tahun_terbit" => $tahun_terbit, //diambil dari tanggal dokumen tergenerate
						"nama_kasi_pkn" => $this->input->post('nama_kepala_seksi'),
						"nama_kl" => $this->input->post('kementerian_lembaga'),
						"nama_satker" => $this->input->post('satuan_kerja'),
						"nama_kpknl" => $this->input->post('status_proses'),
						"tanggal_cetak" => $this->common->tgl_indo($this->input->post("tglSurat_pemohon")), //Berubah ketika tombol di Generate
						"jabatan_pemohon" => $this->input->post("Sekretaris Daerah"),
						"nomor_surat_permohonan" => $this->input->post("noSurat_pemohon"),
						"tanggal_surat_permohonan" => $this->input->post("tglSurat_pemohon"),
						"perihal_surat_permohonan" => $this->input->post("perihalSurat_pemohon"),
						"tanggal_penginputan" => $this->common->tgl_indo($this->input->post("tglSurat_pemohon")), //kapan dokumen diajukan), masukin timestamp di database
						"jenis_bmn" => $this->input->post("jenis_bmn"),
						"total_nilai_bmn" => $this->common->formatIDR($this->input->post("totalnilai_bmn")),
						"huruf_total_nilai_bmn" => $this->common->terbilang($this->input->post("totalnilai_bmn")),
						"peraturan_pelimpahan_wewenang_kementrian_lembaga_pemohon" => $this->input->post("peraturan_pendelegasian_wewenang_KL"),
						"plh_plt" => ($this->input->post("plt_plh")==='definitif')?'':'Plt',
						"nama_kepala_bidang" => $this->input->post("nama_kepala_bidang"),
						"alamat_kantor_pemohon" => $this->input->post("alamat_kantor_pemohon"),
						"nama_kepala_kanwil"	=> $this->input->post("nama_kepala_kanwil"),
						"nama_verifikator" => $this->input->post("nama_verifikator"),
						"nama_kepala_seksi" => $this->input->post("nama_kepala_seksi"),
						"kmk_nomor" => $this->input->post("noSurat_pemohon"), //isi manual oleh petugas
						"jabatan_kepala_seksi" => $this->input->post("jabatan_kepala_seksi"),
						"nip_kepala_seksi" => $this->input->post("nip_kepala_seksi"),
						"nip_kepala_bidang" => $this->input->post("nip_kepala_bidang"),
						"nama_kepala_kantor" => $this->input->post("nama_kepala_bidang"),
						"nip_kepala_kantor" => $this->input->post("nip_kepala_bidang")
		);
		$detail_djkn = json_decode($this->input->post("detail_djkn"));
		$templateProcessor->setValue('kode_kpknl', $detail_djkn->kode);
		$templateProcessor->setValue('nama_kasi_pkn', $dataArray["nama_kasi_pkn"]);
		$templateProcessor->setValue('nama_kpknl', $dataArray["nama_kpknl"]);
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


		$fileSave = 'KPKNL - ND S Persetujuan-'.$this->input->post("kementerian_lembaga").'-'.$this->input->post("noSurat_pemohon").'.docx';

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
		$file = 'KPKNL 3 KMK1.docx';

		//biarkan ini
		$targetFile = "./uploads/template/";		
		$targetSaveFile = "./uploads/verifikasi/kpknl/";

		//Inisiasi Awal (biarkan ini)
		$templateProcessor = new \PhpOffice\PhpWord\templateProcessor($targetFile.$file);
		$tahun_terbit=substr($this->input->post('tglSurat_pemohon'), 0, 4); 
		//set seuai nama variable yang diganti
		$dataArray=array(
					"tahun_terbit" => $tahun_terbit,
					"kementerian_lembaga" => strtotime($this->input->post("kementerian_lembaga")),
					"kementerian_pemohon" => "Direktorat Jendral Kekayaan Negara",
					"jabatan_pemohon" => $this->input->post("jabatan_petugas"),
					"nama_satker" => strtoupper($this->input->post("kementerian_lembaga")),
					"nomor_surat_permohonan" => $this->input->post("noSurat_pemohon"),
					"perihal_surat_permohonan" => $this->input->post("perihalSurat_pemohon"),
					"tanggal_surat_permohonan" => $this->common->tgl_indo($this->input->post("tglSurat_pemohon")),
					"total_nilai_bmn" => $this->common->formatIDR($this->input->post("totalnilai_bmn")),
					"jenis_bmn" => $this->input->post("jenis_bmn"),
					"huruf_total_nilai_bmn" => $this->common->terbilang($this->input->post("totalnilai_bmn")),
					"nama_tembusan" => $strTembusan,
					"nama_KPKNL" => $this->input->post("status_proses"),
					"tanggal_cetak" => $this->common->tgl_indo($this->input->post("tglSurat_pemohon")),
					"plh_plt" => ($this->input->post("plt_plh")==='definitif')?'':'Plt',
					"nama_kepala_kantor" => $this->input->post("nama_kepala_bidang")
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

		$clonenumber = count($arrayTembusan)+4;
		$templateProcessor->cloneRow('no', $clonenumber);		

		$no = 0;	
		foreach ($arrayTembusan as $key=>$tembusan) {
			$no =($key+1);
			$no_txt = $no.".";
			$noidx = 'no#'.$no;
			$namaidx = 'nama_tembusan#'.$no;
			$templateProcessor->setValue($noidx, $no_txt);
			$templateProcessor->setValue($namaidx, $tembusan["nama"]);
		} 
		 
		 $templateProcessor->setValue('no#'.($no+1), ($no+1).'.');
		 $templateProcessor->setValue('no#'.($no+2), ($no+2).'.');
		 $templateProcessor->setValue('no#'.($no+3), ($no+3).'.');
		 $templateProcessor->setValue('no#'.($no+4), ($no+4).'.');
		 $templateProcessor->setValue('nama_tembusan#'.($no+1), 'Direktur Pengelolaan Kekayaan Negara dan Sistem Informasi');
		 $templateProcessor->setValue('nama_tembusan#'.($no+2), 'Kepala Kantor Wilayah DJKN Papua, Papua Barat dan Maluku');
		 $templateProcessor->setValue('nama_tembusan#'.($no+3), 'Ketua Umum DEWAN PERWAKILAN RAKYAT');

		 $templateProcessor->setValue('nama_tembusan#'.($no+4), 'Kepala KPKNL Sapto Arianto');



		$fileSave = 'KPKNL - KMK-'.$this->input->post("kementerian_lembaga").'-'.$this->input->post("noSurat_pemohon").'.docx';

		$templateProcessor->saveAs($targetSaveFile.$fileSave);
		return $targetSaveFile.$fileSave;
	}


	public function generateNDSPermintaanKelengkapanKPKNL() {
		$file = 'KPKNL 5 ND S Permintaan Kelengkapan1.docx';
		$targetFile = "./uploads/template/";		
		$targetSaveFile = "./uploads/verifikasi/kpknl/";

		$templateProcessor = new \PhpOffice\PhpWord\templateProcessor($targetFile.$file);
		$tahun_terbit=substr($this->input->post('tglSurat_pemohon'), 0, 4); 
		$dataArray = array(
						"tahun_terbit" => $tahun_terbit, //diambil dari tanggal dokumen tergenerate
						"nama_kl" => $this->input->post('kementerian_lembaga'),
						"nama_satker" => $this->input->post('satuan_kerja'),
						"tanggal_cetak" => $this->input->post("tglSurat_pemohon"), //Berubah ketika tombol di Generate
						"jabatan_pemohon" => $this->input->post("Sekretaris Daerah"),
						"nomor_surat_permohonan" => $this->input->post("noSurat_pemohon"),
						"tanggal_surat_permohonan" => $this->input->post("tglSurat_pemohon"),
						"perihal_surat_permohonan" => $this->input->post("perihalSurat_pemohon"),
						"tanggal_penginputan" => $this->input->post("tglSurat_pemohon"), //kapan dokumen diajukan), masukin timestamp di database
						"jenis_bmn" => $this->input->post("jenis_bmn"),
						"total_nilai_bmn" => $this->common->formatIDR($this->input->post("totalnilai_bmn")),
						"huruf_total_nilai_bmn" => $this->common->terbilang($this->input->post("totalnilai_bmn")),
						"peraturan_pelimpahan_wewenang_kementrian_lembaga_pemohon" => $this->input->post("peraturan_pendelegasian_wewenang_KL"),
						"plh_plt" => $this->input->post("plt_plh"),
						"nama_kepala_bidang" => $this->input->post("nama_kepala_bidang"),
						"alamat_kantor_pemohon" => $this->input->post("alamat_kantor_pemohon"),
						"nama_kepala_kanwil"	=> $this->input->post("nama_kepala_kanwil"),
						"nama_verifikator" => $this->input->post("nama_verifikator"),
						"nama_kepala_seksi" => $this->input->post("nama_kepala_seksi"),
						"kmk_nomor" => $this->input->post("noSurat_pemohon"), //isi manual oleh petugas
						"jabatan_kepala_seksi" => $this->input->post("jabatan_kepala_seksi"),
						"nip_kepala_seksi" => $this->input->post("nip_kepala_seksi"),
						"nip_kepala_bidang" => $this->input->post("nip_kepala_bidang"),
						"nama_kepala_kantor" => $this->input->post("nama_kepala_bidang"),
						"nip_kepala_kantor" => $this->input->post("nip_kepala_bidang")
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


		$daftarKekuranganData = json_decode($this->input->post('daftarKekuranganData'));

		//echo "<pre>"; print_r($daftarKekuranganData);


		$clonenumber = count($daftarKekuranganData);
		$templateProcessor->cloneRow('no', $clonenumber);		
		$templateProcessor->cloneRow('no1', $clonenumber);		

		$no = 0;	

		foreach ($daftarKekuranganData as $key=>$kurang) {
			$no =($key+1);
			$no_txt = $no.".";
			$noidx = 'no#'.$no;
			$namaidx = 'data#'.$no;
			$noidx1 = 'no1#'.$no;
			$namaidx1 = 'data1#'.$no;
			$templateProcessor->setValue($noidx, $no_txt);
			$templateProcessor->setValue($namaidx, $kurang->nama);
			$templateProcessor->setValue($noidx1, $no_txt);
			$templateProcessor->setValue($namaidx1, $kurang->nama);

		} 
		$fileSave = 'KPKNL - ND S Permintaan Kelengkapan-'.$this->input->post("kementerian_lembaga").'-'.$this->input->post("noSurat_pemohon").'.docx';

		$templateProcessor->saveAs($targetSaveFile.$fileSave);
		return $targetSaveFile.$fileSave;
	}


	public function generateNDSSurveyLapanganKPKNL() {
		$file = 'KPKNL 6 ND S Survei Lapangan1.docx';
		$targetFile = "./uploads/template/";		
		$targetSaveFile = "./uploads/verifikasi/kpknl/";
		
		$templateProcessor = new \PhpOffice\PhpWord\templateProcessor($targetFile.$file);
		$tahun_terbit=substr($this->input->post('tglSurat_pemohon'), 0, 4); 
		$dataArray = array(
						"tahun_terbit" => $tahun_terbit, //diambil dari tanggal dokumen tergenerate
						"nama_kasi_pkn" => $this->input->post('nama_kepala_seksi'),
						"nama_kl" => $this->input->post('kementerian_lembaga'),
						"nama_satker" => $this->input->post('satuan_kerja'),
						"nama_kpknl" => $this->input->post('status_proses'),
						"tanggal_cetak" => $this->common->tgl_indo($this->input->post("tglSurat_pemohon")), //Berubah ketika tombol di Generate
						"jabatan_pemohon" => $this->input->post("Sekretaris Daerah"),
						"nomor_surat_permohonan" => $this->input->post("noSurat_pemohon"),
						"tanggal_surat_permohonan" => $this->input->post("tglSurat_pemohon"),
						"perihal_surat_permohonan" => $this->input->post("perihalSurat_pemohon"),
						"tanggal_penginputan" => $this->common->tgl_indo($this->input->post("tglSurat_pemohon")), //kapan dokumen diajukan), masukin timestamp di database
						"jenis_bmn" => $this->input->post("jenis_bmn"),
						"total_nilai_bmn" => $this->common->formatIDR($this->input->post("totalnilai_bmn")),
						"huruf_total_nilai_bmn" => $this->common->terbilang($this->input->post("totalnilai_bmn")),
						"peraturan_pelimpahan_wewenang_kementrian_lembaga_pemohon" => $this->input->post("peraturan_pendelegasian_wewenang_KL"),
						"plh_plt" => ($this->input->post("plt_plh")==='definitif')?'':'Plt',
						"nama_kepala_bidang" => $this->input->post("nama_kepala_bidang"),
						"alamat_kantor_pemohon" => $this->input->post("alamat_kantor_pemohon"),
						"nama_kepala_kanwil"	=> $this->input->post("nama_kepala_kanwil"),
						"nama_verifikator" => $this->input->post("nama_verifikator"),
						"nama_kepala_seksi" => $this->input->post("nama_kepala_seksi"),
						"kmk_nomor" => $this->input->post("noSurat_pemohon"), //isi manual oleh petugas
						"jabatan_kepala_seksi" => $this->input->post("jabatan_kepala_seksi"),
						"nip_kepala_seksi" => $this->input->post("nip_kepala_seksi"),
						"nip_kepala_bidang" => $this->input->post("nip_kepala_bidang"),
						"nama_kepala_kantor" => $this->input->post("nama_kepala_bidang"),
						"nip_kepala_kantor" => $this->input->post("nip_kepala_bidang"),
						"waktu_survei" => $this->input->post("rencana_survey"),
						"cp_survei_lapangan" => $this->input->post("cp_survey"),
						"nama_KPKNL" => $this->input->post("status_proses")
		);
		$detail_djkn = json_decode($this->input->post("detail_djkn"));
		$templateProcessor->setValue('kode_kpknl', $detail_djkn->kode);
		$templateProcessor->setValue('alamat_kpknl', $detail_djkn->alamat);
		$templateProcessor->setValue('telepon_dan_email_kpknl', $detail_djkn->email);
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
		$templateProcessor->setValue('nama_KPKNL', $dataArray["nama_KPKNL"]);




		$fileSave = 'KPKNL - ND S Survey Lapangan -'.$this->input->post("kementerian_lembaga").'-'.$this->input->post("noSurat_pemohon").'.docx';

		$templateProcessor->saveAs($targetSaveFile.$fileSave);
		return $targetSaveFile.$fileSave;
	}
	public function generateSurveyLapanganKPKPNL(){
		
		$fileHasilVerifikasiKPKNL=$this->generateHasilVerifikasiKPKNL();
		$fileNDSSurveyLapanganKPKNL=$this->generateNDSSurveyLapanganKPKNL();
		
		$dataArray = array(
						'fileNDSPersetujuan'=>'',
						'fileHasilVerifikasi'=>$fileHasilVerifikasiKPKNL,
						'fileKMK'=>'',
						'fileSalinanKMK'=>'',
						'fileNDSPermintaanKelengkapan'=>'',
						'fileNDSSurveyLapangan'=>$fileNDSSurveyLapanganKPKNL,
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


	public function generateSurveyLapanganKPKNL(){
		$fileHasilVerifikasiKANWIL=$this->generateHasilVerifikasiKPKNL();
		$fileNDSSurveyLapanganKANWIL=$this->generateNDSSurveyLapanganKPKNL();
		
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


	public function generateDocKPKNL(){
		$fileNDSPersetujuanKPKNL=$this->generateNDSPersetujuanKPKNL();
		$fileHasilVerifikasiKPKNL=$this->generateHasilVerifikasiKPKNL();
		$fileKMKKPKNL=$this->generateKMKKPKNL();
		$fileSalinanKMKKANWIL=$this->generateKMKKPKNL();
		$fileNDSPermintaanKelengkapanKANWIL=$this->generateNDSPermintaanKelengkapanKPKNL();
		$fileNDSSurveyLapanganKANWIL=$this->generateNDSSurveyLapanganKANWIL();

		$dataArray = array(
						'fileNDSPersetujuan'=>$fileNDSPersetujuanKPKNL,
						'fileHasilVerifikasi'=>$fileHasilVerifikasiKPKNL,
						'fileKMK'=>$fileKMKKPKNL,
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
		$fileNDSPermintaanKelengkapanKANWIL=$this->generateNDSPermintaanKelengkapanKPKNL();
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



	public function generateNDSPersetujuanKANWIL(){
		$file = "Kanwil 2 ND S Persetujuan1.docx";
		$targetFile = "./uploads/template/";				
		$targetSaveFile = "./uploads/verifikasi/kanwil/";

		$templateProcessor = new \PhpOffice\PhpWord\templateProcessor($targetFile.$file);
		$tahun_terbit=substr($this->input->post('tglSurat_pemohon'), 0, 4); 
		$dataArray = array(
						"tahun_terbit" => $tahun_terbit, //diambil dari tanggal dokumen tergenerate
						"nama_kl" => $this->input->post('kementerian_lembaga'),
						"nama_satker" => $this->input->post('satuan_kerja'),
						"tanggal_cetak" => $this->input->post("tglSurat_pemohon"), //Berubah ketika tombol di Generate
						"jabatan_pemohon" => $this->input->post("Sekretaris Daerah"),
						"nomor_surat_permohonan" => $this->input->post("noSurat_pemohon"),
						"tanggal_surat_permohonan" => $this->input->post("tglSurat_pemohon"),
						"perihal_surat_permohonan" => $this->input->post("perihalSurat_pemohon"),
						"tanggal_penginputan" => $this->input->post("tglSurat_pemohon"), //kapan dokumen diajukan), masukin timestamp di database
						"jenis_bmn" => $this->input->post("jenis_bmn"),
						"total_nilai_bmn" => $this->common->formatIDR($this->input->post("totalnilai_bmn")),
						"huruf_total_nilai_bmn" => $this->common->terbilang($this->input->post("totalnilai_bmn")),
						"peraturan_pelimpahan_wewenang_kementrian_lembaga_pemohon" => $this->input->post("peraturan_pendelegasian_wewenang_KL"),
						"plh_plt" => $this->input->post("plt_plh"),
						"nama_kepala_bidang" => $this->input->post("nama_kepala_bidang"),
						"alamat_kantor_pemohon" => $this->input->post("alamat_kantor_pemohon"),
						"nama_kepala_kanwil"	=> $this->input->post("nama_kepala_kanwil"),
						"nama_verifikator" => $this->input->post("nama_verifikator"),
						"nama_kepala_seksi" => $this->input->post("nama_kepala_seksi"),
						"kmk_nomor" => $this->input->post("noSurat_pemohon"), //isi manual oleh petugas
						"jabatan_kepala_seksi" => $this->input->post("jabatan_kepala_seksi"),
						"nip_kepala_seksi" => $this->input->post("nip_kepala_seksi"),
						"nip_kepala_bidang" => $this->input->post("nip_kepala_bidang"),
						"nama_kepala_kantor" => $this->input->post("nama_kepala_bidang"),
						"nip_kepala_kantor" => $this->input->post("nip_kepala_bidang")
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





	public function generateSalinanKMKKPKNL(){
		$file = 'Kanwil 4 Salinan KMK1.docx';
		$targetFile = './uploads/template/';		
		$targetSaveFile = "./uploads/verifikasi/kanwil/";

		$templateProcessor = new \PhpOffice\PhpWord\templateProcessor($targetFile.$file);
		$tahun_terbit=substr($this->input->post('tglSurat_pemohon'), 0, 4); 
		$dataArray = array(
							"tahun_terbit" => $tahun_terbit, //diambil dari tanggal dokumen tergenerate
						"nama_kl" => $this->input->post('kementerian_lembaga'),
						"nama_satker" => $this->input->post('satuan_kerja'),
						"tanggal_cetak" => $this->input->post("tglSurat_pemohon"), //Berubah ketika tombol di Generate
						"jabatan_pemohon" => $this->input->post("Sekretaris Daerah"),
						"nomor_surat_permohonan" => $this->input->post("noSurat_pemohon"),
						"tanggal_surat_permohonan" => $this->input->post("tglSurat_pemohon"),
						"perihal_surat_permohonan" => $this->input->post("perihalSurat_pemohon"),
						"tanggal_penginputan" => $this->input->post("tglSurat_pemohon"), //kapan dokumen diajukan), masukin timestamp di database
						"jenis_bmn" => $this->input->post("jenis_bmn"),
						"total_nilai_bmn" => $this->common->formatIDR($this->input->post("totalnilai_bmn")),
						"huruf_total_nilai_bmn" => $this->common->terbilang($this->input->post("totalnilai_bmn")),
						"peraturan_pelimpahan_wewenang_kementrian_lembaga_pemohon" => $this->input->post("peraturan_pendelegasian_wewenang_KL"),
						"plh_plt" => $this->input->post("plt_plh"),
						"nama_kepala_bidang" => $this->input->post("nama_kepala_bidang"),
						"alamat_kantor_pemohon" => $this->input->post("alamat_kantor_pemohon"),
						"nama_kepala_kanwil"	=> $this->input->post("nama_kepala_kanwil"),
						"nama_verifikator" => $this->input->post("nama_verifikator"),
						"nama_kepala_seksi" => $this->input->post("nama_kepala_seksi"),
						"kmk_nomor" => $this->input->post("noSurat_pemohon"), //isi manual oleh petugas
						"jabatan_kepala_seksi" => $this->input->post("jabatan_kepala_seksi"),
						"nip_kepala_seksi" => $this->input->post("nip_kepala_seksi"),
						"nip_kepala_bidang" => $this->input->post("nip_kepala_bidang"),
						"nama_kepala_kantor" => $this->input->post("nama_kepala_bidang"),
						"nip_kepala_kantor" => $this->input->post("nip_kepala_bidang")
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




	// public function generateNDSPersetujuanKANWIL(){
	// 	$file = "Kanwil 2 ND S Persetujuan1.docx";
	// 	$targetFile = "./uploads/template/";				
	// 	$targetSaveFile = "./uploads/verifikasi/kanwil/";

	// 	$templateProcessor = new \PhpOffice\PhpWord\templateProcessor($targetFile.$file);

	// 	$dataArray = array(
	// 					"tahun_terbit" => "2019", //diambil dari tanggal dokumen tergenerate
	// 					"nama_kl" => "Budi Angkasa",
	// 					"nama_satker" => "Satria Planet",
	// 					"tanggal_cetak" => "19/7/2019", //Berubah ketika tombol di Generate
	// 					"jabatan_pemohon" => "Sekretaris Daerah",
	// 					"nomor_surat_permohonan" => "01/INS-KOTA/VIII/2019",
	// 					"tanggal_surat_permohonan" => "11/7/2019",
	// 					"perihal_surat_permohonan" => "Rekomendasi",
	// 					"tanggal_penginputan" => "19/7/2019", //kapan dokumen diajukan, masukin timestamp di database
	// 					"jenis_bmn" => "ATK",
	// 					"total_nilai_bmn" => "100000",
	// 					"huruf_total_nilai_bmn" => "Seratus Ribu Rupiah",
	// 					"peraturan_pelimpahan_wewenang_kementrian_lembaga_pemohon" => "Peratuan Contoh Pasal 1",
	// 					"plh_plt" => "PLT",
	// 					"nama_kepala_bidang" => "Anjasmara Kilat",
	// 					"alamat_kantor_pemohon" => "JL. Inajadulu Nomor 22 Papua Barat",
	// 					"nama_kepala_kanwil"	=> "Siti Komah Prandita Nugraha",
	// 					"nama_verifikator" => "Bahdrun Saothi Soma",
	// 					"nama_kepala_seksi" => "Suindro suiono",
	// 					"kmk_nomor" => "01KMK", //isi manual oleh petugas
	// 					"jabatan_kepala_seksi" => "Ketua Umum",
	// 					"nip_kepala_seksi" => "199554212 215 2 002",
	// 					"nip_kepala_bidang" => "199554212 215 2 001",
	// 					"nama_kepala_kantor" => "Joni Iskandar",
	// 					"nip_kepala_kantor" => "199554212 215 2 001"
	// 	);

	// 	$templateProcessor->setValue('tahun_terbit', $dataArray["tahun_terbit"]);
	// 	$templateProcessor->setValue('nama_kl', $dataArray["nama_kl"]);
	// 	$templateProcessor->setValue('nama_satker', $dataArray["nama_satker"]);
	// 	$templateProcessor->setValue('tanggal_cetak', $dataArray["tanggal_cetak"]);
	// 	$templateProcessor->setValue('jabatan_pemohon', $dataArray["jabatan_pemohon"]);
	// 	$templateProcessor->setValue('nomor_surat_permohonan', $dataArray["nomor_surat_permohonan"]);
	// 	$templateProcessor->setValue('tanggal_surat_permohonan', $dataArray["tanggal_surat_permohonan"]);
	// 	$templateProcessor->setValue('perihal_surat_permohonan', $dataArray["perihal_surat_permohonan"]);
	// 	$templateProcessor->setValue('tanggal_penginputan', $dataArray["tanggal_penginputan"]);
	// 	$templateProcessor->setValue('jenis_bmn', $dataArray["jenis_bmn"]);
	// 	$templateProcessor->setValue('total_nilai_bmn', $dataArray["total_nilai_bmn"]);
	// 	$templateProcessor->setValue('huruf_total_nilai_bmn', $dataArray["huruf_total_nilai_bmn"]);
	// 	$templateProcessor->setValue('peraturan_pelimpahan_wewenang_kementrian_lembaga_pemohon', $dataArray["peraturan_pelimpahan_wewenang_kementrian_lembaga_pemohon"]);
	// 	$templateProcessor->setValue('plh_plt', $dataArray["plh_plt"]);
	// 	$templateProcessor->setValue('nama_kepala_bidang', $dataArray["nama_kepala_bidang"]);
	// 	$templateProcessor->setValue('alamat_kantor_pemohon', $dataArray["alamat_kantor_pemohon"]);
	// 	$templateProcessor->setValue('nama_kepala_kanwil', $dataArray["nama_kepala_kanwil"]);
	// 	$templateProcessor->setValue('nama_verifikator', $dataArray["nama_verifikator"]);
	// 	$templateProcessor->setValue('nama_kepala_seksi', $dataArray["nama_kepala_seksi"]);
	// 	$templateProcessor->setValue('kmk_nomor', $dataArray["kmk_nomor"]);
	// 	$templateProcessor->setValue('jabatan_kepala_seksi', $dataArray["jabatan_kepala_seksi"]);
	// 	$templateProcessor->setValue('nip_kepala_seksi', $dataArray["nip_kepala_seksi"]);
	// 	$templateProcessor->setValue('nip_kepala_bidang', $dataArray["nip_kepala_bidang"]);
	// 	$templateProcessor->setValue('nama_kepala_kantor', $dataArray["nama_kepala_kantor"]);
	// 	$templateProcessor->setValue('nip_kepala_kantor', $dataArray["nip_kepala_kantor"]);


	// 	$fileSave = 'Kanwil - ND S Persetujuan-'.$this->input->post("kementerian_lembaga").'-'.$this->input->post("noSurat_pemohon").'.docx';

	// 	$templateProcessor->saveAs($targetSaveFile.$fileSave);
	// 	return $targetSaveFile.$fileSave;
	// }


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
			'<script src="'.$this->common->theme_hideend().'plugins/js/appStatusVerifikasi.js"></script>'.
			'<script src="'.$this->common->theme_hideend().'plugins/js/appStatusVerifikasiKANWIL.js"></script>'.
			'<script src="'.$this->common->theme_hideend().'plugins/js/appStatusVerifikasiKPKNL.js"></script>'
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
                'alamat_kantor_pemohon' => $this->input->post('alamat_kantor_pemohon'),	            
                'daftarKekuranganData' => $this->input->post('daftarKekuranganData'),	            
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
		if (($_FILES['file1']['size'] > 0) || ($_FILES['file2']['size'] > 0) || ($_FILES['file3']['size'] > 0) || ($_FILES['file4']['size'] > 0) ) {
			$this->upload->initialize(array(
		       "upload_path" => $this->settings->info->upload_path."/verifikasi/",
		       "overwrite" => FALSE,
		       "max_filename" => 300,
		       "encrypt_name" => false,
		       "remove_spaces" => TRUE,
		       "allowed_types" => "docx|doc|xlsx|xls|pdf|jpg|png",
		       "max_size" => 200000
		    ));

		    $file = array();
		    $msg = array();
		    $error = array();

 			if(isset($_FILES['file1'])){
				if($this->upload->do_upload('file1')){
					$data = $this->upload->data();
					$FileData = $data['file_name'];
					$error[] = false;
			    	$file[] = "/verifikasi/".$FileData;			    	    	
			    	$tipe[] = "file1";
			    	$msg[] = "Successfully upload!";
				}else{
					$error[] = true;
			    	$msg[] = $this->upload->display_errors();
				}	

			}	
 			if(isset($_FILES['file2'])){
				if($this->upload->do_upload('file2')){
					$data = $this->upload->data();
					$FileData = $data['file_name'];
					$error[] = false;
			    	$file[] = "/verifikasi/".$FileData;			    	    	
			    	$tipe[] = "file2";
			    	$msg[] = "Successfully upload!";
				}else{
					$error[] = true;
			    	$msg[] = $this->upload->display_errors();
				}	

			}	
 			if(isset($_FILES['file3'])){
				if($this->upload->do_upload('file3')){
					$data = $this->upload->data();
					$FileData = $data['file_name'];
					$error[] = false;
			    	$file[] = "/verifikasi/".$FileData;			    	    	
			    	$tipe[] = "file3";
			    	$msg[] = "Successfully upload!";
				}else{
					$error[] = true;
			    	$msg[] = $this->upload->display_errors();
				}	

			}	
 			if(isset($_FILES['file4'])){
				if($this->upload->do_upload('file4')){
					$data = $this->upload->data();
					$FileData = $data['file_name'];
					$error[] = false;
			    	$file[] = "/verifikasi/".$FileData;			    	    	
			    	$tipe[] = "file4";
			    	$msg[] = "Successfully upload!";
				}else{
					$error[] = true;
			    	$msg[] = $this->upload->display_errors();
				}	

			}			


		     $dataArray = array(
							"error" => $error,
							"msg" => $msg,
							"tipe" => $tipe,
							"file" => $file
				);
		    

		}else{

		}

		echo json_encode($dataArray);

	}

	public function uploadFileFinal()
	{
		$this->load->library("upload");
		if (($_FILES['file1']['size'] > 0) || ($_FILES['file2']['size'] > 0) || ($_FILES['file3']['size'] > 0) || ($_FILES['file4']['size'] > 0) ) {
			$this->upload->initialize(array(
		       "upload_path" => $this->settings->info->upload_path."/verifikasi/final/",
		       "overwrite" => FALSE,
		       "max_filename" => 300,
		       "encrypt_name" => false,
		       "remove_spaces" => TRUE,
		       "allowed_types" => "docx|doc|xlsx|xls|pdf|jpg|png",
		       "max_size" => 200000
		    ));

		    $file = array();
		    $msg = array();
		    $error = array();

 			if(isset($_FILES['file1'])){
				if($this->upload->do_upload('file1')){
					$data = $this->upload->data();
					$FileData = $data['file_name'];
					$error[] = false;
			    	$file[] = "/verifikasi/final/".$FileData;			    	    	
			    	$tipe[] = "file1";
			    	$msg[] = "Successfully upload!";
				}else{
					$error[] = true;
			    	$msg[] = $this->upload->display_errors();
				}	

			}	
 			if(isset($_FILES['file2'])){
				if($this->upload->do_upload('file2')){
					$data = $this->upload->data();
					$FileData = $data['file_name'];
					$error[] = false;
			    	$file[] = "/verifikasi/final/".$FileData;			    	    	
			    	$tipe[] = "file2";
			    	$msg[] = "Successfully upload!";
				}else{
					$error[] = true;
			    	$msg[] = $this->upload->display_errors();
				}	

			}	
 			if(isset($_FILES['file3'])){
				if($this->upload->do_upload('file3')){
					$data = $this->upload->data();
					$FileData = $data['file_name'];
					$error[] = false;
			    	$file[] = "/verifikasi/final/".$FileData;			    	    	
			    	$tipe[] = "file3";
			    	$msg[] = "Successfully upload!";
				}else{
					$error[] = true;
			    	$msg[] = $this->upload->display_errors();
				}	

			}	
 			if(isset($_FILES['file4'])){
				if($this->upload->do_upload('file4')){
					$data = $this->upload->data();
					$FileData = $data['file_name'];
					$error[] = false;
			    	$file[] = "/verifikasi/final/".$FileData;			    	    	
			    	$tipe[] = "file4";
			    	$msg[] = "Successfully upload!";
				}else{
					$error[] = true;
			    	$msg[] = $this->upload->display_errors();
				}	

			}	

		    $dataArray = array(
							"error" => $error,
							"msg" => $msg,
							"tipe" => $tipe,
							"file" => $file
				);
		    

		}else{

		}

		echo json_encode($dataArray);

	}
	public function uploadFileKelengkapan()
	{
		$this->load->library("upload");
		if (isset($_FILES['file1']['size']) || isset($_FILES['file2']['size'] )) {
			$this->upload->initialize(array(
		       "upload_path" => $this->settings->info->upload_path."/verifikasi/kuranglengkap/",
		       "overwrite" => FALSE,
		       "max_filename" => 300,
		       "encrypt_name" => false,
		       "remove_spaces" => TRUE,
		       "allowed_types" => "docx|doc|xlsx|xls|pdf|jpg|png",
		       "max_size" => 200000
		    ));

		    $file = array();
		    $msg = array();
		    $error = array();

		    if(isset($_FILES['file1'])){
				if($this->upload->do_upload('file1')){
					$data = $this->upload->data();
					$FileData = $data['file_name'];
					$error[] = false;
			    	$file[] = "/verifikasi/kuranglengkap/".$FileData;			    	    	
			    	$tipe[] = "file1";
			    	$msg[] = "Successfully upload!";
				}else{
					$error[] = true;
			    	$msg[] = $this->upload->display_errors();
				}	

			}

		    if(isset($_FILES['file2'])){
				if($this->upload->do_upload('file2')){
					$data = $this->upload->data();
					$FileData = $data['file_name'];
					$error[] = false;
			    	$file[] = "/verifikasi/kuranglengkap/".$FileData;			    	    	
			    	$tipe[] = "file2";
			    	$msg[] = "Successfully upload!";
				}else{
					$error[] = true;
			    	$msg[] = $this->upload->display_errors();
				}	

			}

		



		     $dataArray = array(
							"error" => $error,
							"msg" => $msg,
							"tipe" => $tipe,
							"file" => $file
				);
		    

		}else{

		}

		echo json_encode($dataArray);

	}
	public function uploadFileSurvey()
	{
		$this->load->library("upload");
		if (($_FILES['file1']['size'] > 0) || ($_FILES['file2']['size'] > 0)) {
			$this->upload->initialize(array(
		       "upload_path" => $this->settings->info->upload_path."/verifikasi/survey/",
		       "overwrite" => FALSE,
		       "max_filename" => 300,
		       "encrypt_name" => false,
		       "remove_spaces" => TRUE,
		       "allowed_types" => "docx|doc|xlsx|xls|pdf|jpg|png",
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
