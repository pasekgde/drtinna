<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');
/* @property PhpWord_model $PhpWord_model */
include_once(APPPATH."third_party/PhpWord/Autoloader.php");


use PhpOffice\PhpWord\Autoloader;
use PhpOffice\PhpWord\Settings;
use PhpOffice\PhpWord\PhpWord;
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
		if (!$this->user->loggedin) $this->template->error(lang("error_1"));
	}

	//Generate document fix
	public function generateHasilVerifikasiKANWIL(){
		$file = 'Kanwil 1 Hasil Verifikasi.docx';
		$targetFile = "./uploads/template/";		
		$targetSaveFile = "./uploads/verifikasi/kanwil/";

		$TemplateProcessor = new \PhpOffice\PhpWord\TemplateProcessor($targetFile.$file);
		$tanggal_surat_permohonan = $this->common->tgl_indo($this->input->post('tglSurat_pemohon'));

		$dataArray = array(
						'hasil_verifikasi'=>$this->input->post('hasil_verifikasi'),
						"jabatan_pemohon" => $this->input->post('jabatan_pemohon'),
						"nama_satker" => $this->input->post('satuan_kerja'),
						"nomor_surat_permohonan" => $this->input->post('noSurat_pemohon'),
						"tanggal_surat_permohonan" => $tanggal_surat_permohonan,
						"sesuai_catatan_khusus" => $this->input->post('noteDokumen'),
						
						"plh_plt_kabid" => ($this->input->post('status_kepala_bidang')==='definitif')?'':'Plt',
						"plh_plt_kanwil" => ($this->input->post('status_kepala_kanwil')==='definitif')?'':'Plt',
						"plh_plt_kasi" => ($this->input->post('status_kepala_kanwil')==='definitif')?'':'Plt',
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

		 $surat_permohonan_ada=($this->input->post('check_surat_permohonan')==='sesuai' || $this->input->post('check_surat_permohonan')==='tidak sesuai'||$this->input->post('check_surat_permohonan')==='ada')?'✓':'-';;
		 $surat_permohonan_tdk=($this->input->post('check_surat_permohonan')==='tidak ada')?'✓':'-';
		 $surat_permohonan_ses=($this->input->post('check_surat_permohonan')==='sesuai')?'✓':'-';
		 $surat_permohonan_tdkses=($this->input->post('check_surat_permohonan')==='tidak sesuai')?'✓':'-';
		 //------------
		 $data_rincian_ada=($this->input->post('check_rincian_usulan_bmn')==='tidak sesuai'||$this->input->post('check_rincian_usulan_bmn')==='sesuai'||$this->input->post('check_rincian_usulan_bmn')==='ada')?'✓':'-';;
		 $data_rincian_tdk=($this->input->post('check_rincian_usulan_bmn')==='tidak ada')?'✓':'-';
		 $data_rincian_ses=($this->input->post('check_rincian_usulan_bmn')==='sesuai')?'✓':'-';
		 $data_rincian_tdkses=($this->input->post('check_rincian_usulan_bmn')==='tidak sesuai')?'✓':'-';

		 //--------------
		 $kib_ada=($this->input->post('check_kib')==='tidak sesuai'||$this->input->post('check_kib')==='sesuai'||$this->input->post('check_kib')==='ada')?'✓':'-';;
		 $kib_tdk=($this->input->post('check_kib')==='tidak ada')?'✓':'-';
		 $kib_ses=($this->input->post('check_kib')==='sesuai')?'✓':'-';
		 $kib_tdkses=($this->input->post('check_kib')==='tidak sesuai')?'✓':'-';

		 //---------------------
		 $foto_ada=($this->input->post('check_foto_bmn')==='tidak sesuai'||$this->input->post('check_foto_bmn')==='sesuai'||$this->input->post('check_foto_bmn')==='ada')?'✓':'-';;
		 $foto_tdk=($this->input->post('check_foto_bmn')==='tidak ada')?'✓':'-';
		 $foto_ses=($this->input->post('check_foto_bmn')==='sesuai')?'✓':'-';
		 $foto_tdkses=($this->input->post('check_foto_bmn')==='tidak sesuai')?'✓':'-';

		 //------------------
		 $fc_sk_ada=($this->input->post('check_sk_delegasi')==='tidak sesuai'||$this->input->post('check_sk_delegasi')==='sesuai'||$this->input->post('check_sk_delegasi')==='ada')?'✓':'-';;
		 $fc_sk_tdk=($this->input->post('check_sk_delegasi')==='tidak ada')?'✓':'-';
		 $fc_sk_ses=($this->input->post('check_sk_delegasi')==='sesuai')?'✓':'-';
		 $fc_sk_tdkses=($this->input->post('check_sk_delegasi')==='tidak sesuai')?'✓':'-';


		$TemplateProcessor->setValue('jenis_bmn_ada', $jenis_bmn_ada);
		$TemplateProcessor->setValue('jenis_bmn_tdk', $jenis_bmn_tdk);
		$TemplateProcessor->setValue('jenis_bmn_ses', $jenis_bmn_ses);
		$TemplateProcessor->setValue('jenis_bmn_tdkses', $jenis_bmn_tdkses);
		
		$TemplateProcessor->setValue('nilai_bmn_ada', $nilai_bmn_ada);
		$TemplateProcessor->setValue('nilai_bmn_tdk', $nilai_bmn_tdk);
		$TemplateProcessor->setValue('nilai_bmn_ses', $nilai_bmn_ses);
		$TemplateProcessor->setValue('nilai_bmn_tdkses', $nilai_bmn_tdkses);

		$TemplateProcessor->setValue('surat_permohonan_ada', $surat_permohonan_ada);
		$TemplateProcessor->setValue('surat_permohonan_tdk', $surat_permohonan_tdk);
		$TemplateProcessor->setValue('surat_permohonan_ses', $surat_permohonan_ses);
		$TemplateProcessor->setValue('surat_permohonan_tdkses', $surat_permohonan_tdkses);
		
		$TemplateProcessor->setValue('data_rincian_ada', $data_rincian_ada);
		$TemplateProcessor->setValue('data_rincian_tdk', $data_rincian_tdk);
		$TemplateProcessor->setValue('data_rincian_ses', $data_rincian_ses);
		$TemplateProcessor->setValue('data_rincian_tdkses', $data_rincian_tdkses);

		$TemplateProcessor->setValue('kib_ada', $kib_ada);
		$TemplateProcessor->setValue('kib_tdk', $kib_tdk);
		$TemplateProcessor->setValue('kib_ses', $kib_ses);
		$TemplateProcessor->setValue('kib_tdkses', $kib_tdkses);

		$TemplateProcessor->setValue('foto_ada', $foto_ada);
		$TemplateProcessor->setValue('foto_tdk', $foto_tdk);
		$TemplateProcessor->setValue('foto_ses', $foto_ses);
		$TemplateProcessor->setValue('foto_tdkses', $foto_tdkses);

		$TemplateProcessor->setValue('fc_sk_ada', $fc_sk_ada);
		$TemplateProcessor->setValue('fc_sk_tdk', $fc_sk_tdk);
		$TemplateProcessor->setValue('fc_sk_ses', $fc_sk_ses);
		$TemplateProcessor->setValue('fc_sk_tdkses', $fc_sk_tdkses);
		



		if($this->input->post('check_dokumen_kepemilikan')==="ada"){
			$TemplateProcessor->cloneRow('no', 2);		 
		 	$TemplateProcessor->setValue('no#1', '8.');
		 	$TemplateProcessor->setValue('no#2', '9.');


			$fc_dokumen_kepemilikan_ada=($this->input->post('check_fc_dokumen_kepemilikan')==='tidak sesuai'||$this->input->post('check_fc_dokumen_kepemilikan')==='sesuai'||$this->input->post('check_fc_dokumen_kepemilikan')==='ada')?'✓':'-';;
			$fc_dokumen_kepemilikan_tdk=($this->input->post('check_fc_dokumen_kepemilikan')==='tidak ada')?'✓':'-';
			$fc_dokumen_kepemilikan_ses=($this->input->post('check_fc_dokumen_kepemilikan')==='sesuai')?'✓':'-';
			$fc_dokumen_kepemilikan_tdkses=($this->input->post('check_fc_dokumen_kepemilikan')==='tidak sesuai')?'✓':'-';


			$kebenaran_fc_dokumen_kepemilikan_ada=($this->input->post('check_kebenaran_fc_dokumen_kepemilikan')==='sesuai'||$this->input->post('check_kebenaran_fc_dokumen_kepemilikan')==='tidak sesuai'||$this->input->post('check_kebenaran_fc_dokumen_kepemilikan')==='ada')?'✓':'-';
			$kebenaran_fc_dokumen_kepemilikan_tdk=($this->input->post('check_kebenaran_fc_dokumen_kepemilikan')==='tidak ada')?'✓':'-';
			$kebenaran_fc_dokumen_kepemilikan_ses=($this->input->post('check_kebenaran_fc_dokumen_kepemilikan')==='sesuai')?'✓':'-';
			$kebenaran_fc_dokumen_kepemilikan_tdkses=($this->input->post('check_kebenaran_fc_dokumen_kepemilikan')==='tidak sesuai')?'✓':'-';



			$TemplateProcessor->setValue('data#1', 'Fotocopy dokumen kepemilikan');
			$TemplateProcessor->setValue('data#2', 'Surat penyataan kebenaran fotocopy dokumen kepemilikan');

			$TemplateProcessor->setValue('data_ada#1', $fc_dokumen_kepemilikan_ada);
			$TemplateProcessor->setValue('data_ada#2', $kebenaran_fc_dokumen_kepemilikan_ada);

			$TemplateProcessor->setValue('data_tdk#1', $fc_dokumen_kepemilikan_tdk);
			$TemplateProcessor->setValue('data_tdk#2', $kebenaran_fc_dokumen_kepemilikan_tdk);

			$TemplateProcessor->setValue('data_ses#1', $fc_dokumen_kepemilikan_ses);
			$TemplateProcessor->setValue('data_ses#2', $kebenaran_fc_dokumen_kepemilikan_ses);

			$TemplateProcessor->setValue('data_tdkses#1', $fc_dokumen_kepemilikan_tdkses);
			$TemplateProcessor->setValue('data_tdkses#2', $kebenaran_fc_dokumen_kepemilikan_tdkses);

		}else{
			$TemplateProcessor->setValue('no', '8.');			
			$TemplateProcessor->setValue('data', 'SPTJM bermaterai bahwa barang tersebut adalah BMN dan digunakan untuk tugas dan fungsi.');

			$sptjm_bermaterai_ada=($this->input->post('check_sptjm_bermaterai')==='tidak sesuai'||$this->input->post('check_sptjm_bermaterai')==='sesuai'||$this->input->post('check_sptjm_bermaterai')==='ada')?'✓':'-';;
			$sptjm_bermaterai_tdk=($this->input->post('check_sptjm_bermaterai')==='tidak ada')?'✓':'-';
			$sptjm_bermaterai_ses=($this->input->post('check_sptjm_bermaterai')==='sesuai')?'✓':'-';
			$sptjm_bermaterai_tdkses=($this->input->post('check_sptjm_bermaterai')==='tidak sesuai')?'✓':'-';


			$TemplateProcessor->setValue('data_ada', $sptjm_bermaterai_ada);
			$TemplateProcessor->setValue('data_tdk', $sptjm_bermaterai_tdk);
			$TemplateProcessor->setValue('data_ses', $sptjm_bermaterai_ses);
			$TemplateProcessor->setValue('data_tdkses', $sptjm_bermaterai_tdkses);

		}


		$TemplateProcessor->setValue('jabatan_pemohon',$dataArray["jabatan_pemohon"]);
		$TemplateProcessor->setValue('nama_satker',$dataArray["nama_satker"]);
		$TemplateProcessor->setValue('nomor_surat_permohonan',$dataArray["nomor_surat_permohonan"]);
		$TemplateProcessor->setValue('tanggal_surat_permohonan',$dataArray["tanggal_surat_permohonan"]);
		$TemplateProcessor->setValue('catatan_khusus',$dataArray["sesuai_catatan_khusus"]);
		$TemplateProcessor->setValue('plh_plt_kasi',$dataArray["plh_plt_kasi"]);
		$TemplateProcessor->setValue('plh_plt_kabid',$dataArray["plh_plt_kabid"]);
		$TemplateProcessor->setValue('plh_plt_kanwil',$dataArray["plh_plt_kanwil"]);
		$TemplateProcessor->setValue('nama_kepala_seksi',$dataArray["nama_kepala_seksi"]);
		$TemplateProcessor->setValue('nip_kepala_seksi',$dataArray["nip_kepala_seksi"]);
		$TemplateProcessor->setValue('nama_verifikator',$dataArray["nama_verifikator"]);
		$TemplateProcessor->setValue('nip_verifikator',$dataArray["nip_verifikator"]);


		$noSurat = $this->common->cleanString($this->input->post("noSurat_pemohon"));
		$kementerian_lembaga = $this->common->cleanString($this->input->post("kementerian_lembaga"));
		$fileSave = 'Kanwil-Hasil Verifikasi-'.$kementerian_lembaga.'-'.$noSurat.'.docx';
		$TemplateProcessor->saveAs($targetSaveFile.$fileSave);
		return $targetSaveFile.$fileSave;
	}


	public function generateHasilVerifikasiKPKNL(){
		$file = 'KPKNL 1 Hasil Verifikasi.docx';
		$targetFile = "./uploads/template/";		
		$targetSaveFile = "./uploads/verifikasi/kpknl/";

		$TemplateProcessor = new \PhpOffice\PhpWord\TemplateProcessor($targetFile.$file);
		$tanggal_surat_permohonan = $this->common->tgl_indo($this->input->post('tglSurat_pemohon'));

		$dataArray = array(
						'hasil_verifikasi'=>$this->input->post('hasil_verifikasi'),
						"jabatan_pemohon" => $this->input->post('jabatan_pemohon'),
						"nama_satker" => $this->input->post('satuan_kerja'),
						"nomor_surat_permohonan" => $this->input->post('noSurat_pemohon'),
						"tanggal_surat_permohonan" => $tanggal_surat_permohonan,
						"sesuai_catatan_khusus" => $this->input->post('noteDokumen'),						
						"plh_plt_kabid" => ($this->input->post('status_kepala_bidang')==='definitif')?'':'Plt',
						"plh_plt_kanwil" => ($this->input->post('status_kepala_kanwil')==='definitif')?'':'Plt',
						"plh_plt_kasi" => ($this->input->post('status_kepala_kanwil')==='definitif')?'':'Plt',
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


		$TemplateProcessor->setValue('jenis_bmn_ada', $jenis_bmn_ada);
		$TemplateProcessor->setValue('jenis_bmn_tdk', $jenis_bmn_tdk);
		$TemplateProcessor->setValue('jenis_bmn_ses', $jenis_bmn_ses);
		$TemplateProcessor->setValue('jenis_bmn_tdkses', $jenis_bmn_tdkses);
		
		$TemplateProcessor->setValue('nilai_bmn_ada', $nilai_bmn_ada);
		$TemplateProcessor->setValue('nilai_bmn_tdk', $nilai_bmn_tdk);
		$TemplateProcessor->setValue('nilai_bmn_ses', $nilai_bmn_ses);
		$TemplateProcessor->setValue('nilai_bmn_tdkses', $nilai_bmn_tdkses);

		$TemplateProcessor->setValue('surat_permohonan_ada', $surat_permohonan_ada);
		$TemplateProcessor->setValue('surat_permohonan_tdk', $surat_permohonan_tdk);
		$TemplateProcessor->setValue('surat_permohonan_ses', $surat_permohonan_ses);
		$TemplateProcessor->setValue('surat_permohonan_tdkses', $surat_permohonan_tdkses);
		
		$TemplateProcessor->setValue('data_rincian_ada', $data_rincian_ada);
		$TemplateProcessor->setValue('data_rincian_tdk', $data_rincian_tdk);
		$TemplateProcessor->setValue('data_rincian_ses', $data_rincian_ses);
		$TemplateProcessor->setValue('data_rincian_tdkses', $data_rincian_tdkses);

		$TemplateProcessor->setValue('kib_ada', $kib_ada);
		$TemplateProcessor->setValue('kib_tdk', $kib_tdk);
		$TemplateProcessor->setValue('kib_ses', $kib_ses);
		$TemplateProcessor->setValue('kib_tdkses', $kib_tdkses);

		$TemplateProcessor->setValue('foto_ada', $foto_ada);
		$TemplateProcessor->setValue('foto_tdk', $foto_tdk);
		$TemplateProcessor->setValue('foto_ses', $foto_ses);
		$TemplateProcessor->setValue('foto_tdkses', $foto_tdkses);

		$TemplateProcessor->setValue('fc_sk_ada', $fc_sk_ada);
		$TemplateProcessor->setValue('fc_sk_tdk', $fc_sk_tdk);
		$TemplateProcessor->setValue('fc_sk_ses', $fc_sk_ses);
		$TemplateProcessor->setValue('fc_sk_tdkses', $fc_sk_tdkses);
		



		if($this->input->post('check_dokumen_kepemilikan')==="ada"){
			$TemplateProcessor->cloneRow('no', 2);		 
		 	$TemplateProcessor->setValue('no#1', '8.');
		 	$TemplateProcessor->setValue('no#2', '9.');


			$fc_dokumen_kepemilikan_ada=($this->input->post('check_fc_dokumen_kepemilikan')==='sesuai'||$this->input->post('check_fc_dokumen_kepemilikan')==='ada')?'✓':'-';;
			$fc_dokumen_kepemilikan_tdk=($this->input->post('check_fc_dokumen_kepemilikan')==='tidak ada')?'✓':'-';
			$fc_dokumen_kepemilikan_ses=($this->input->post('check_fc_dokumen_kepemilikan')==='sesuai')?'✓':'-';
			$fc_dokumen_kepemilikan_tdkses=($this->input->post('check_fc_dokumen_kepemilikan')==='tidak sesuai')?'✓':'-';


			$kebenaran_fc_dokumen_kepemilikan_ada=($this->input->post('check_kebenaran_fc_dokumen_kepemilikan')==='sesuai'||$this->input->post('check_kebenaran_fc_dokumen_kepemilikan')==='ada')?'✓':'-';
			$kebenaran_fc_dokumen_kepemilikan_tdk=($this->input->post('check_kebenaran_fc_dokumen_kepemilikan')==='tidak ada')?'✓':'-';
			$kebenaran_fc_dokumen_kepemilikan_ses=($this->input->post('check_kebenaran_fc_dokumen_kepemilikan')==='sesuai')?'✓':'-';
			$kebenaran_fc_dokumen_kepemilikan_tdkses=($this->input->post('check_kebenaran_fc_dokumen_kepemilikan')==='tidak sesuai')?'✓':'-';



			$TemplateProcessor->setValue('data#1', 'Fotocopy dokumen kepemilikan');
			$TemplateProcessor->setValue('data#2', 'Surat penyataan kebenaran fotocopy dokumen kepemilikan');

			$TemplateProcessor->setValue('data_ada#1', $fc_dokumen_kepemilikan_ada);
			$TemplateProcessor->setValue('data_ada#2', $kebenaran_fc_dokumen_kepemilikan_ada);

			$TemplateProcessor->setValue('data_tdk#1', $fc_dokumen_kepemilikan_tdk);
			$TemplateProcessor->setValue('data_tdk#2', $kebenaran_fc_dokumen_kepemilikan_tdk);

			$TemplateProcessor->setValue('data_ses#1', $fc_dokumen_kepemilikan_ses);
			$TemplateProcessor->setValue('data_ses#2', $kebenaran_fc_dokumen_kepemilikan_tdkses);

			$TemplateProcessor->setValue('data_tdkses#1', $fc_dokumen_kepemilikan_tdkses);
			$TemplateProcessor->setValue('data_tdkses#2', $kebenaran_fc_dokumen_kepemilikan_tdkses);

		}else{
			$TemplateProcessor->setValue('no', '8.');			
			$TemplateProcessor->setValue('data#1', 'SPTJM bermaterai bahwa barang tersebut adalah BMN dan digunakan untuk tugas dan fungsi.');

			$sptjm_bermaterai_ada=($this->input->post('check_sptjm_bermaterai')==='sesuai'||$this->input->post('check_sptjm_bermaterai')==='ada')?'✓':'-';;
			$sptjm_bermaterai_tdk=($this->input->post('check_sptjm_bermaterai')==='tidak ada')?'✓':'-';
			$sptjm_bermaterai_ses=($this->input->post('check_sptjm_bermaterai')==='sesuai')?'✓':'-';
			$sptjm_bermaterai_tdkses=($this->input->post('check_sptjm_bermaterai')==='tidak sesuai')?'✓':'-';


			$TemplateProcessor->setValue('data_ada', $sptjm_bermaterai_ada);
			$TemplateProcessor->setValue('data_tdk', $sptjm_bermaterai_tdk);
			$TemplateProcessor->setValue('data_ses', $sptjm_bermaterai_ses);
			$TemplateProcessor->setValue('data_tdkses', $sptjm_bermaterai_tdkses);

		}


		$TemplateProcessor->setValue('jabatan_pemohon',$dataArray["jabatan_pemohon"]);
		$TemplateProcessor->setValue('nama_satker',$dataArray["nama_satker"]);
		$TemplateProcessor->setValue('nomor_surat_permohonan',$dataArray["nomor_surat_permohonan"]);
		$TemplateProcessor->setValue('tanggal_surat_permohonan',$dataArray["tanggal_surat_permohonan"]);
		$TemplateProcessor->setValue('catatan_khusus',$dataArray["sesuai_catatan_khusus"]);
		$TemplateProcessor->setValue('plh_plt_kabid',$dataArray["plh_plt_kabid"]);
		$TemplateProcessor->setValue('plh_plt_kanwil',$dataArray["plh_plt_kanwil"]);
		$TemplateProcessor->setValue('plh_plt_kasi',$dataArray["plh_plt_kasi"]);
		$TemplateProcessor->setValue('nama_kepala_seksi',$dataArray["nama_kepala_seksi"]);
		$TemplateProcessor->setValue('nip_kepala_seksi',$dataArray["nip_kepala_seksi"]);
		$TemplateProcessor->setValue('nama_verifikator',$dataArray["nama_verifikator"]);
		$TemplateProcessor->setValue('nip_verifikator',$dataArray["nip_verifikator"]);


		$detail_djkn = json_decode($this->input->post("detail_djkn"));
		$TemplateProcessor->setValue('kode_kpknl', $detail_djkn->kode);
		$TemplateProcessor->setValue('nama_kpknl', $detail_djkn->kantor);
		$TemplateProcessor->setValue('alamat_kpknl', $detail_djkn->alamat);
		$TemplateProcessor->setValue('cp_kpknl',$detail_djkn->email);

		$noSurat = $this->common->cleanString($this->input->post("noSurat_pemohon"));
		$kementerian_lembaga = $this->common->cleanString($this->input->post("kementerian_lembaga"));
		$fileSave = 'KPKNL-Hasil Verifikasi-'.$kementerian_lembaga.'-'.$noSurat.'.docx';

		$TemplateProcessor->saveAs($targetSaveFile.$fileSave);
		return $targetSaveFile.$fileSave;
	}


	public function generateNDSPersetujuanKANWIL(){
		$file = "Kanwil 2 ND S Persetujuan1.docx";
		$targetFile = "./uploads/template/";				
		$targetSaveFile = "./uploads/verifikasi/kanwil/";

		$TemplateProcessor = new \PhpOffice\PhpWord\TemplateProcessor($targetFile.$file);
		$tahun_terbit=substr($this->input->post('tglSurat_pemohon'), 0, 4); 
		$dataArray = array( //diambil dari tanggal dokumen tergenerate
						"tahun_terbit" => $tahun_terbit, //diambil dari tanggal dokumen tergenerate
						"nama_kasi_pkn" => $this->input->post('nama_kepala_seksi'),
						"jumlah_unit" => $this->input->post('jumlah_unit'),
						"nama_kl" => ucfirst($this->input->post('kementerian_lembaga')),
						"nama_satker" => $this->input->post('satuan_kerja'),
						"nama_kpknl" => $this->input->post('status_proses'),
						"tanggal_cetak" => $this->common->tgl_indo($this->input->post("tglSurat_pemohon")), 
						"jabatan_pemohon" => $this->input->post("jabatan_pemohon"),
						"nomor_surat_permohonan" => ($this->input->post("noSurat_pemohon")),
						"tanggal_surat_permohonan" => $this->common->tgl_indo($this->input->post("tglSurat_pemohon")),
						"perihal_surat_permohonan" => ($this->input->post("perihalSurat_pemohon")),
						"tanggal_penginputan" => $this->common->tgl_indo($this->input->post("tglSurat_pemohon")), 
						"jenis_bmn" => $this->input->post("jenis_bmn"),
						"total_nilai_bmn" => $this->common->formatIDR($this->input->post("totalnilai_bmn")),
						"huruf_total_nilai_bmn" => $this->common->terbilang($this->input->post("totalnilai_bmn")),
						"peraturan_pelimpahan_wewenang_kementrian_lembaga_pemohon" => $this->input->post("peraturan_pendelegasian_wewenang_KL"),
						"plh_plt_kabid" => ($this->input->post("status_kepala_bidang")==='definitif')?'':'Plt',
						"plh_plt_kanwil" => ($this->input->post("status_kepala_kanwil")==='definitif')?'':'Plt',
						"plh_plt_kasi" => ($this->input->post("status_kepala_kasi")==='definitif')?'':'Plt',
						"nama_kepala_bidang" => $this->input->post("nama_kepala_bidang"),
						"alamat_kantor_pemohon" => $this->input->post("alamat_kantor_pemohon"),
						"nama_kepala_kanwil"	=> $this->input->post("nama_kepala_kanwil"),
						"nama_verifikator" => $this->input->post("nama_verifikator"),
						"nama_kepala_seksi" => $this->input->post("nama_kepala_seksi"),
						"kmk_nomor" => $this->input->post("noSurat_pemohon"), 
						"jabatan_kepala_seksi" => $this->input->post("jabatan_kepala_seksi"),
						"nip_kepala_seksi" => $this->input->post("nip_kepala_seksi"),
						"nip_kepala_bidang" => $this->input->post("nip_kepala_bidang"),
						"nama_kepala_kantor" => $this->input->post("nama_kepala_bidang"),
						"nip_kepala_kantor" => $this->input->post("nip_kepala_bidang")
		);
		
		$detail_djkn = json_decode($this->input->post("detail_djkn"));
		$bapak_ibu = (substr($this->input->post("nip_kepala_bidang"),-5,1)==='1')?'Bapak':'Ibu';
		$plt_plh_spesial = ($this->input->post("plt_plh")==='plt_plh')?'Kepala Kanwil DJKN Papua, Papua Barat, dan Maluku':'Kepala Kantor';
		$TemplateProcessor->setValue('plt_plh_spesial', $plt_plh_spesial);
		$TemplateProcessor->setValue('bapak_ibu', $bapak_ibu);
		$TemplateProcessor->setValue('jumlah_unit', $dataArray["jumlah_unit"]);
		$TemplateProcessor->setValue('nama_kasi_pkn', $dataArray["nama_kasi_pkn"]);
		
		$TemplateProcessor->setValue('nama_KPKNL', $dataArray["nama_KPKNL"]);
		$TemplateProcessor->setValue('nama_KPKNL_besar', strtoupper($dataArray["nama_KPKNL"]));
		$TemplateProcessor->setValue('tahun_terbit', $dataArray["tahun_terbit"]);
		$TemplateProcessor->setValue('nama_kl', $dataArray["nama_kl"]);
		$TemplateProcessor->setValue('nama_kl_besar', $dataArray["nama_kl_besar"]);
		$TemplateProcessor->setValue('nama_satker', $dataArray["nama_satker"]);
		$TemplateProcessor->setValue('tanggal_cetak', $dataArray["tanggal_cetak"]);
		$TemplateProcessor->setValue('jabatan_pemohon', $dataArray["jabatan_pemohon"]);
		$TemplateProcessor->setValue('nomor_surat_permohonan', $dataArray["nomor_surat_permohonan"]);
		$TemplateProcessor->setValue('tanggal_surat_permohonan', $dataArray["tanggal_surat_permohonan"]);
		$TemplateProcessor->setValue('perihal_surat_permohonan', $dataArray["perihal_surat_permohonan"]);
		$TemplateProcessor->setValue('tanggal_penginputan', $dataArray["tanggal_penginputan"]);
		$TemplateProcessor->setValue('jenis_bmn', $dataArray["jenis_bmn"]);
		$TemplateProcessor->setValue('total_nilai_bmn', $dataArray["total_nilai_bmn"]);
		$TemplateProcessor->setValue('huruf_total_nilai_bmn', $dataArray["huruf_total_nilai_bmn"]);
		$TemplateProcessor->setValue('peraturan_pelimpahan_wewenang_kementrian_lembaga_pemohon', $dataArray["peraturan_pelimpahan_wewenang_kementrian_lembaga_pemohon"]);
		$TemplateProcessor->setValue('plh_plt_kabid', $dataArray["plh_plt_kabid"]);
		$TemplateProcessor->setValue('plh_plt_kanwil', $dataArray["plh_plt_kanwil"]);
		$TemplateProcessor->setValue('plh_plt_kasi', $dataArray["plh_plt_kasi"]);
		$TemplateProcessor->setValue('nama_kepala_bidang', $dataArray["nama_kepala_bidang"]);
		$TemplateProcessor->setValue('alamat_kantor_pemohon', $dataArray["alamat_kantor_pemohon"]);
		$TemplateProcessor->setValue('nama_kepala_kanwil', $dataArray["nama_kepala_kanwil"]);
		$TemplateProcessor->setValue('nama_verifikator', $dataArray["nama_verifikator"]);
		$TemplateProcessor->setValue('nama_kepala_seksi', $dataArray["nama_kepala_seksi"]);
		$TemplateProcessor->setValue('kmk_nomor', $dataArray["kmk_nomor"]);
		$TemplateProcessor->setValue('jabatan_kepala_seksi', $dataArray["jabatan_kepala_seksi"]);
		$TemplateProcessor->setValue('nip_kepala_seksi', $dataArray["nip_kepala_seksi"]);
		$TemplateProcessor->setValue('nip_kepala_bidang', $dataArray["nip_kepala_bidang"]);
		$TemplateProcessor->setValue('nama_kepala_kantor', $dataArray["nama_kepala_kantor"]);
		$TemplateProcessor->setValue('nip_kepala_kantor', $dataArray["nip_kepala_kantor"]);


		$noSurat = $this->common->cleanString($this->input->post("noSurat_pemohon"));
		$kementerian_lembaga = $this->common->cleanString($this->input->post("kementerian_lembaga"));
		
		$fileSave = 'Kanwil-ND S Persetujuan-'.$kementerian_lembaga.'-'.$noSurat.'.docx';

		$TemplateProcessor->saveAs($targetSaveFile.$fileSave);
		return $targetSaveFile.$fileSave;
	}

	public function generateNDSPersetujuanKPKNL(){
		$file = "KPKNL 2 ND S Persetujuan1.docx";
		$targetFile = "./uploads/template/";				
		$targetSaveFile = "./uploads/verifikasi/kpknl/";

		$TemplateProcessor = new \PhpOffice\PhpWord\TemplateProcessor($targetFile.$file);
		$tahun_terbit=substr($this->input->post('tglSurat_pemohon'), 0, 4); 
		$dataArray = array( //diambil dari tanggal dokumen tergenerate
						"tahun_terbit" => $tahun_terbit, //diambil dari tanggal dokumen tergenerate
						"jumlah_unit" => $this->input->post('jumlah_unit'),
						"nama_kasi_pkn" => $this->input->post('nama_kepala_seksi'),
						"nama_kl" => ucfirst($this->input->post('kementerian_lembaga')),
						"nama_satker" => $this->input->post('satuan_kerja'),
						"nama_kpknl" => $this->input->post('status_proses'),
						"tanggal_cetak" => $this->common->tgl_indo($this->input->post("tglSurat_pemohon")), 
						"jabatan_pemohon" => $this->input->post("jabatan_pemohon"),
						"nomor_surat_permohonan" => ($this->input->post("noSurat_pemohon")),
						"tanggal_surat_permohonan" => $this->common->tgl_indo($this->input->post("tglSurat_pemohon")),
						"perihal_surat_permohonan" => ($this->input->post("perihalSurat_pemohon")),
						"tanggal_penginputan" => $this->common->tgl_indo($this->input->post("tglSurat_pemohon")), 
						"jenis_bmn" => $this->input->post("jenis_bmn"),
						"total_nilai_bmn" => $this->common->formatIDR($this->input->post("totalnilai_bmn")),
						"huruf_total_nilai_bmn" => $this->common->terbilang($this->input->post("totalnilai_bmn")),
						"peraturan_pelimpahan_wewenang_kementrian_lembaga_pemohon" => $this->input->post("peraturan_pendelegasian_wewenang_KL"),
						"plh_plt_kabid" => ($this->input->post("status_kepala_bidang")==='definitif')?'':'Plt',
						"plh_plt_kanwil" => ($this->input->post("status_kepala_kanwil")==='definitif')?'':'Plt',
						"plh_plt_kasi" => ($this->input->post("status_kepala_kasi")==='definitif')?'':'Plt',
						"nama_kepala_bidang" => $this->input->post("nama_kepala_bidang"),
						"alamat_kantor_pemohon" => $this->input->post("alamat_kantor_pemohon"),
						"nama_kepala_kanwil"	=> $this->input->post("nama_kepala_kanwil"),
						"nama_verifikator" => $this->input->post("nama_verifikator"),
						"nama_kepala_seksi" => $this->input->post("nama_kepala_seksi"),
						"kmk_nomor" => $this->input->post("noSurat_pemohon"), 
						"jabatan_kepala_seksi" => $this->input->post("jabatan_kepala_seksi"),
						"nip_kepala_seksi" => $this->input->post("nip_kepala_seksi"),
						"nip_kepala_bidang" => $this->input->post("nip_kepala_bidang"),
						"nama_kepala_kantor" => $this->input->post("nama_kepala_bidang"),
						"nip_kepala_kantor" => $this->input->post("nip_kepala_bidang")
		);
		$detail_djkn = json_decode($this->input->post("detail_djkn"));
		$bapak_ibu = (substr($this->input->post("nip_kepala_bidang"),-5,1)==='1')?'Bapak':'Ibu';
		$plt_plh_spesial = ($this->input->post("plt_plh")==='plt_plh')?'Kepala '.$this->input->post('status_proses'):'Kepala Kantor';


		$TemplateProcessor->setValue('plt_plh_spesial', $plt_plh_spesial);
		$TemplateProcessor->setValue('bapak_ibu', $bapak_ibu);
		$TemplateProcessor->setValue('jumlah_unit', $dataArray["jumlah_unit"]);
		$TemplateProcessor->setValue('kode_kpknl', $detail_djkn->kode);
		$TemplateProcessor->setValue('alamat_kpknl', $detail_djkn->alamat);
		$TemplateProcessor->setValue('cp_kpknl', $detail_djkn->email);
		$TemplateProcessor->setValue('nama_kasi_pkn', $dataArray["nama_kasi_pkn"]);
		
		$TemplateProcessor->setValue('nama_KPKNL', $dataArray["nama_KPKNL"]);
		$TemplateProcessor->setValue('nama_KPKNL_besar', strtoupper($dataArray["nama_KPKNL"]));
		$TemplateProcessor->setValue('tahun_terbit', $dataArray["tahun_terbit"]);
		$TemplateProcessor->setValue('nama_kl', $dataArray["nama_kl"]);
		$TemplateProcessor->setValue('nama_kl_besar', $dataArray["nama_kl_besar"]);
		$TemplateProcessor->setValue('nama_satker', $dataArray["nama_satker"]);
		$TemplateProcessor->setValue('tanggal_cetak', $dataArray["tanggal_cetak"]);
		$TemplateProcessor->setValue('jabatan_pemohon', $dataArray["jabatan_pemohon"]);
		$TemplateProcessor->setValue('nomor_surat_permohonan', $dataArray["nomor_surat_permohonan"]);
		$TemplateProcessor->setValue('tanggal_surat_permohonan', $dataArray["tanggal_surat_permohonan"]);
		$TemplateProcessor->setValue('perihal_surat_permohonan', $dataArray["perihal_surat_permohonan"]);
		$TemplateProcessor->setValue('tanggal_penginputan', $dataArray["tanggal_penginputan"]);
		$TemplateProcessor->setValue('jenis_bmn', $dataArray["jenis_bmn"]);
		$TemplateProcessor->setValue('total_nilai_bmn', $dataArray["total_nilai_bmn"]);
		$TemplateProcessor->setValue('huruf_total_nilai_bmn', $dataArray["huruf_total_nilai_bmn"]);
		$TemplateProcessor->setValue('peraturan_pelimpahan_wewenang_kementrian_lembaga_pemohon', $dataArray["peraturan_pelimpahan_wewenang_kementrian_lembaga_pemohon"]);
		$TemplateProcessor->setValue('plh_plt_kabid', $dataArray["plh_plt_kabid"]);
		$TemplateProcessor->setValue('plh_plt_kanwil', $dataArray["plh_plt_kanwil"]);
		$TemplateProcessor->setValue('plh_plt_kasi', $dataArray["plh_plt_kasi"]);
		$TemplateProcessor->setValue('nama_kepala_bidang', $dataArray["nama_kepala_bidang"]);
		$TemplateProcessor->setValue('alamat_kantor_pemohon', $dataArray["alamat_kantor_pemohon"]);
		$TemplateProcessor->setValue('nama_kepala_kanwil', $dataArray["nama_kepala_kanwil"]);
		$TemplateProcessor->setValue('nama_verifikator', $dataArray["nama_verifikator"]);
		$TemplateProcessor->setValue('nama_kepala_seksi', $dataArray["nama_kepala_seksi"]);
		$TemplateProcessor->setValue('kmk_nomor', $dataArray["kmk_nomor"]);
		$TemplateProcessor->setValue('jabatan_kepala_seksi', $dataArray["jabatan_kepala_seksi"]);
		$TemplateProcessor->setValue('nip_kepala_seksi', $dataArray["nip_kepala_seksi"]);
		$TemplateProcessor->setValue('nip_kepala_bidang', $dataArray["nip_kepala_bidang"]);
		$TemplateProcessor->setValue('nama_kepala_kantor', $dataArray["nama_kepala_kantor"]);
		$TemplateProcessor->setValue('nip_kepala_kantor', $dataArray["nip_kepala_kantor"]);
		$noSurat = $this->common->cleanString($this->input->post("noSurat_pemohon"));
		$kementerian_lembaga = $this->common->cleanString($this->input->post("kementerian_lembaga"));
		$fileSave = 'KPKNL-ND S Persetujuan-'.$kementerian_lembaga.'-'.$noSurat.'.docx';

		$TemplateProcessor->saveAs($targetSaveFile.$fileSave);
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

		$file = 'Kanwil 3 KMK1.docx';
		//biarkan ini
		$targetFile = "./uploads/template/";		
		$targetSaveFile = "./uploads/verifikasi/kpknl/";
		//Inisiasi Awal (biarkan ini)
		$TemplateProcessor = new \PhpOffice\PhpWord\TemplateProcessor($targetFile.$file);
		$tahun_terbit=substr($this->input->post('tglSurat_pemohon'), 0, 4); 
		//set seuai nama variable yang diganti
		$dataArray=array(
					"tahun_terbit" => $tahun_terbit,
					"kementerian_lembaga" =>ucfirst($this->input->post("kementerian_lembaga")),
					"kementerian_pemohon" => "Direktorat Jendral Kekayaan Negara",
					"jabatan_pemohon" => $this->input->post("jabatan_petugas"),
					"nama_satker" => ucfirst($this->input->post("satuan_kerja")),
					"nomor_surat_permohonan" => $this->input->post("noSurat_pemohon"),
					"perihal_surat_permohonan" => $this->input->post("perihalSurat_pemohon"),
					"tanggal_surat_permohonan" => $this->common->tgl_indo($this->input->post("tglSurat_pemohon")),
					"total_nilai_bmn" => $this->common->formatIDR($this->input->post("totalnilai_bmn")),
					"jenis_bmn" => $this->input->post("jenis_bmn"),
					"huruf_total_nilai_bmn" => $this->common->terbilang($this->input->post("totalnilai_bmn")),
					"nama_tembusan" => $strTembusan,
					"nama_KPKNL" => $this->input->post("status_proses"),
					"tanggal_cetak" => $this->common->tgl_indo($this->input->post("tglSurat_pemohon")),
					"plh_plt_kabid" => ($this->input->post("status_kepala_bidang")==='definitif')?'':'Plt',
					"plh_plt_kanwil" => ($this->input->post("status_kepala_kanwil")==='definitif')?'':'Plt',
					"plh_plt_kasi" => ($this->input->post("status_kepala_kasi")==='definitif')?'':'Plt',
					"nama_kepala_kantor" => $this->input->post("nama_kepala_bidang")
					);
		$TemplateProcessor->setValue('tahun_terbit', $dataArray["tahun_terbit"]);
		$TemplateProcessor->setValue('kementerian_lembaga', $dataArray["kementerian_lembaga"]);	
	 	$TemplateProcessor->setValue('kementerian_pemohon', $dataArray["kementerian_pemohon"]);
		$TemplateProcessor->setValue('jabatan_pemohon', $dataArray["jabatan_pemohon"]);
		$TemplateProcessor->setValue('nama_satker', $dataArray["nama_satker"]);
		$TemplateProcessor->setValue('nomor_surat_permohonan', $dataArray["nomor_surat_permohonan"]);
		$TemplateProcessor->setValue('tanggal_surat_permohonan', $dataArray["tanggal_surat_permohonan"]);
		$TemplateProcessor->setValue('perihal_surat_permohonan', $dataArray["perihal_surat_permohonan"]);
		$TemplateProcessor->setValue('jenis_bmn', $dataArray["jenis_bmn"]);
		$TemplateProcessor->setValue('total_nilai_bmn', $dataArray["total_nilai_bmn"]);
		$TemplateProcessor->setValue('huruf_total_nilai_bmn', $dataArray["huruf_total_nilai_bmn"]);
		
		$TemplateProcessor->setValue('nama_KPKNL', $dataArray["nama_KPKNL"]);
		$TemplateProcessor->setValue('nama_KPKNL_besar', strtoupper($dataArray["nama_KPKNL"]));
		$TemplateProcessor->setValue('tanggal_cetak', $dataArray["tanggal_cetak"]);
		$TemplateProcessor->setValue('plh_plt_kabid', $dataArray["plh_plt_kabid"]);
		$TemplateProcessor->setValue('plh_plt_kanwil', $dataArray["plh_plt_kanwil"]);
		$TemplateProcessor->setValue('plh_plt_kasi', $dataArray["plh_plt_kasi"]);
		$TemplateProcessor->setValue('nama_kepala_kantor', $dataArray["nama_kepala_kantor"]);
		$clonenumber = count($arrayTembusan)+4;
		$TemplateProcessor->cloneRow('no', $clonenumber);		
		$TemplateProcessor->setValue('no#1', '1.');
	    $TemplateProcessor->setValue('no#2', '2.');
		$TemplateProcessor->setValue('nama_tembusan#1', 'Menteri Keuangan');
		$TemplateProcessor->setValue('nama_tembusan#2', $this->input->post('jabatan_pemohon'));
		
		$no = 2;	

		foreach ($arrayTembusan as $key=>$tembusan) {
			$no =($no+1);
			$no_txt = $no.".";
			$noidx = 'no#'.$no;
			$namaidx = 'nama_tembusan#'.$no;
			$TemplateProcessor->setValue($noidx, $no_txt);
			$TemplateProcessor->setValue($namaidx, $tembusan["nama"]);
		} 
		 
		 $TemplateProcessor->setValue('no#'.($no+1), ($no+1).'.');
		 $TemplateProcessor->setValue('no#'.($no+2), ($no+2).'.');
		 $TemplateProcessor->setValue('nama_tembusan#'.($no+1), 'Direktur Pengelolaan Kekayaan Negara dan Sistem Informasi');
		 $TemplateProcessor->setValue('nama_tembusan#'.($no+2), 'Kepala Kantor Wilayah DJKN Papua, Papua Barat dan Maluku');

		$detail_djkn = json_decode($this->input->post("detail_djkn"));
		 $TemplateProcessor->setValue('nama_tembusan#'.($no+3), 'Kepala KPKNL '. $detail_djkn->kantor);



		$noSurat = $this->common->cleanString($this->input->post("noSurat_pemohon"));
		$kementerian_lembaga = $this->common->cleanString($this->input->post("kementerian_lembaga"));
		$fileSave = 'Kanwil-KMK-'.$kementerian_lembaga.'-'.$noSurat.'.docx';
		$TemplateProcessor->saveAs($targetSaveFile.$fileSave);
		return $targetSaveFile.$fileSave;
	}	


	public function generateKMKKPKNL()
	{
		$jsonTembusan = $this->input->post("daftar_tembusan");
		$arrayTembusan = json_decode($jsonTembusan,true);		
		$targetSaveFile = "./uploads/verifikasi/kpknl/";

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
		$TemplateProcessor = new \PhpOffice\PhpWord\TemplateProcessor($targetFile.$file);
		$tahun_terbit=substr($this->input->post('tglSurat_pemohon'), 0, 4); 
		//set seuai nama variable yang diganti
		$dataArray=array(
					"tahun_terbit" => $tahun_terbit,
					"nama_kl" =>ucfirst($this->input->post("kementerian_lembaga")),
					"kementerian_pemohon" => "Direktorat Jendral Kekayaan Negara",
					"jabatan_pemohon" => $this->input->post("jabatan_petugas"),
					"nama_satker" => ucfirst($this->input->post("satuan_kerja")),
					"nomor_surat_permohonan" => $this->input->post("noSurat_pemohon"),
					"perihal_surat_permohonan" => $this->input->post("perihalSurat_pemohon"),
					"tanggal_surat_permohonan" => $this->common->tgl_indo($this->input->post("tglSurat_pemohon")),
					"total_nilai_bmn" => $this->common->formatIDR($this->input->post("totalnilai_bmn")),
					"jenis_bmn" => $this->input->post("jenis_bmn"),
					"huruf_total_nilai_bmn" => $this->common->terbilang($this->input->post("totalnilai_bmn")),
					"nama_tembusan" => $strTembusan,
					"nama_KPKNL" => $this->input->post("status_proses"),
					"tanggal_cetak" => $this->common->tgl_indo($this->input->post("tglSurat_pemohon")),
					"plh_plt_kabid" => ($this->input->post("status_kepala_bidang")==='definitif')?'':'Plt',
					"plh_plt_kanwil" => ($this->input->post("status_kepala_kanwil")==='definitif')?'':'Plt',
					"plh_plt_kasi" => ($this->input->post("status_kepala_kasi")==='definitif')?'':'Plt',
					"nama_kepala_kantor" => $this->input->post("nama_kepala_bidang")
					);


		//echo "<pre>"; print_r($dataArray);die;
			$TemplateProcessor->setValue('tahun_terbit', $dataArray["tahun_terbit"]);
		 $TemplateProcessor->setValue('nama_kl', $dataArray["nama_kl"]);	
		 $TemplateProcessor->setValue('nama_kl_besar', $dataArray["nama_kl"]);	
		 $TemplateProcessor->setValue('kementerian_pemohon', $dataArray["kementerian_pemohon"]);
		 $TemplateProcessor->setValue('jabatan_pemohon', $dataArray["jabatan_pemohon"]);
		 $TemplateProcessor->setValue('nama_satker', $dataArray["nama_satker"]);
		 $TemplateProcessor->setValue('nomor_surat_permohonan', $dataArray["nomor_surat_permohonan"]);
		 $TemplateProcessor->setValue('tanggal_surat_permohonan', $dataArray["tanggal_surat_permohonan"]);
		 $TemplateProcessor->setValue('perihal_surat_permohonan', $dataArray["perihal_surat_permohonan"]);
		 $TemplateProcessor->setValue('jenis_bmn', $dataArray["jenis_bmn"]);
		 $TemplateProcessor->setValue('total_nilai_bmn', $dataArray["total_nilai_bmn"]);
		 $TemplateProcessor->setValue('huruf_total_nilai_bmn', $dataArray["huruf_total_nilai_bmn"]);
		 
		$TemplateProcessor->setValue('nama_KPKNL', $dataArray["nama_KPKNL"]);
		$TemplateProcessor->setValue('nama_KPKNL_besar', strtoupper($dataArray["nama_KPKNL"]));
		 $TemplateProcessor->setValue('tanggal_cetak', $dataArray["tanggal_cetak"]);
		 $TemplateProcessor->setValue('plh_plt_kabid', $dataArray["plh_plt_kabid"]);
		 $TemplateProcessor->setValue('plh_plt_kanwil', $dataArray["plh_plt_kanwil"]);
		 $TemplateProcessor->setValue('plh_plt_kasi', $dataArray["plh_plt_kasi"]);
		 $TemplateProcessor->setValue('nama_kepala_kantor', $dataArray["nama_kepala_kantor"]);

		$clonenumber = count($arrayTembusan)+4;
		$TemplateProcessor->cloneRow('no', $clonenumber);		

		$TemplateProcessor->setValue('no#1', '1.');
	    $TemplateProcessor->setValue('no#2', '2.');

		$TemplateProcessor->setValue('nama_tembusan#1', 'Menteri Keuangan');
		$TemplateProcessor->setValue('nama_tembusan#2', $this->input->post('jabatan_pemohon'));
		
		$no = 2;	
		foreach ($arrayTembusan as $key=>$tembusan) {

		
			$no =($no+1);
			$no_txt = $no.".";
			$noidx = 'no#'.$no;
			$namaidx = 'nama_tembusan#'.$no;
			$TemplateProcessor->setValue($noidx, $no_txt);
			$TemplateProcessor->setValue($namaidx, $tembusan["nama"]);
		} 
		$TemplateProcessor->setValue('no#'.($no+1), ($no+1).'.');
		$TemplateProcessor->setValue('no#'.($no+2), ($no+2).'.');
		$TemplateProcessor->setValue('nama_tembusan#'.($no+1), 'Direktur Pengelolaan Kekayaan Negara dan Sistem Informasi');
		$TemplateProcessor->setValue('nama_tembusan#'.($no+2), 'Kepala Kantor Wilayah DJKN Papua, Papua Barat dan Maluku');

		$detail_djkn = json_decode($this->input->post("detail_djkn"));
		$TemplateProcessor->setValue('nama_kpknl', $detail_djkn->kantor);
		$TemplateProcessor->setValue('kode_kpknl', $detail_djkn->kode);



		$noSurat = $this->common->cleanString($this->input->post("noSurat_pemohon"));
		$kementerian_lembaga = $this->common->cleanString($this->input->post("kementerian_lembaga"));
		$fileSave = 'KPKNL-KMK-'.$kementerian_lembaga.'-'.$noSurat.'.docx';

		$TemplateProcessor->saveAs($targetSaveFile.$fileSave);
		return $targetSaveFile.$fileSave;
	}

	public function generateSalinanKMKKPKNL()
	{
		$jsonTembusan = $this->input->post("daftar_tembusan");
		$arrayTembusan = json_decode($jsonTembusan,true);		
		$targetSaveFile = "./uploads/verifikasi/kpknl/";

		$strTembusan = '';
		$no = 0;
		foreach ($arrayTembusan as $key=>$tembusan) {
			$no =($key+1);
			$strTembusan.= $no.".".$tembusan["nama"].'<w:br/>';
		}

		
		//ubah sesuai nama template word
		$file = 'KPKNL 4 Salinan KMK1.docx';

		//biarkan ini
		$targetFile = "./uploads/template/";		
		$targetSaveFile = "./uploads/verifikasi/kpknl/";

		//Inisiasi Awal (biarkan ini)
		$TemplateProcessor = new \PhpOffice\PhpWord\TemplateProcessor($targetFile.$file);
		$tahun_terbit=substr($this->input->post('tglSurat_pemohon'), 0, 4); 
		//set seuai nama variable yang diganti
		$dataArray=array(
					"tahun_terbit" => $tahun_terbit,
					"nama_kl" =>ucfirst($this->input->post("kementerian_lembaga")),
					"kementerian_pemohon" => "Direktorat Jendral Kekayaan Negara",
					"jabatan_pemohon" => $this->input->post("jabatan_petugas"),
					"nama_satker" => ucfirst($this->input->post("satuan_kerja")),
					"nomor_surat_permohonan" => $this->input->post("noSurat_pemohon"),
					"perihal_surat_permohonan" => $this->input->post("perihalSurat_pemohon"),
					"tanggal_surat_permohonan" => $this->common->tgl_indo($this->input->post("tglSurat_pemohon")),
					"total_nilai_bmn" => $this->common->formatIDR($this->input->post("totalnilai_bmn")),
					"jenis_bmn" => $this->input->post("jenis_bmn"),
					"huruf_total_nilai_bmn" => $this->common->terbilang($this->input->post("totalnilai_bmn")),
					"nama_tembusan" => $strTembusan,
					"nama_KPKNL" => $this->input->post("status_proses"),
					"tanggal_cetak" => $this->common->tgl_indo($this->input->post("tglSurat_pemohon")),
					"plh_plt_kabid" => ($this->input->post("status_kepala_bidang")==='definitif')?'':'Plt',
					"plh_plt_kanwil" => ($this->input->post("status_kepala_kanwil")==='definitif')?'':'Plt',
					"plh_plt_kasi" => ($this->input->post("status_kepala_kasi")==='definitif')?'':'Plt',
					"nama_kepala_kantor" => $this->input->post("nama_kepala_bidang"),
					"jabatan_salinan" => $this->input->post("jabatan_salinan"),
					"nama_salinan" => $this->input->post("nama_salinan"),
					"nip_salinan" => $this->input->post("nip_salinan")
					);
		 $TemplateProcessor->setValue('jabatan_salinan', $dataArray["jabatan_salinan"]);
		 $TemplateProcessor->setValue('nama_salinan', $dataArray["nama_salinan"]);
		 $TemplateProcessor->setValue('nip_salinan', $dataArray["nip_salinan"]);
			$TemplateProcessor->setValue('tahun_terbit', $dataArray["tahun_terbit"]);
		 $TemplateProcessor->setValue('nama_kl', $dataArray["nama_kl"]);	
		 $TemplateProcessor->setValue('nama_kl_besar', $dataArray["nama_kl"]);	
		 $TemplateProcessor->setValue('kementerian_pemohon', $dataArray["kementerian_pemohon"]);
		 $TemplateProcessor->setValue('jabatan_pemohon', $dataArray["jabatan_pemohon"]);
		 $TemplateProcessor->setValue('nama_satker', $dataArray["nama_satker"]);
		 $TemplateProcessor->setValue('nomor_surat_permohonan', $dataArray["nomor_surat_permohonan"]);
		 $TemplateProcessor->setValue('tanggal_surat_permohonan', $dataArray["tanggal_surat_permohonan"]);
		 $TemplateProcessor->setValue('perihal_surat_permohonan', $dataArray["perihal_surat_permohonan"]);
		 $TemplateProcessor->setValue('jenis_bmn', $dataArray["jenis_bmn"]);
		 $TemplateProcessor->setValue('total_nilai_bmn', $dataArray["total_nilai_bmn"]);
		 $TemplateProcessor->setValue('huruf_total_nilai_bmn', $dataArray["huruf_total_nilai_bmn"]);
		 
		$TemplateProcessor->setValue('nama_KPKNL', $dataArray["nama_KPKNL"]);
		$TemplateProcessor->setValue('nama_KPKNL_besar', strtoupper($dataArray["nama_KPKNL"]));
		 $TemplateProcessor->setValue('tanggal_cetak', $dataArray["tanggal_cetak"]);
		 $TemplateProcessor->setValue('plh_plt_kabid', $dataArray["plh_plt_kabid"]);
		 $TemplateProcessor->setValue('plh_plt_kanwil', $dataArray["plh_plt_kanwil"]);
		 $TemplateProcessor->setValue('plh_plt_kasi', $dataArray["plh_plt_kasi"]);
		 $TemplateProcessor->setValue('nama_kepala_kantor', $dataArray["nama_kepala_kantor"]);

		$clonenumber = count($arrayTembusan)+4;
		$TemplateProcessor->cloneRow('no', $clonenumber);		

		$TemplateProcessor->setValue('no#1', '1.');
	    $TemplateProcessor->setValue('no#2', '2.');

		$TemplateProcessor->setValue('nama_tembusan#1', 'Menteri Keuangan');
		$TemplateProcessor->setValue('nama_tembusan#2', $this->input->post('jabatan_pemohon'));
		
		$no = 2;	
		foreach ($arrayTembusan as $key=>$tembusan) {

		
			$no =($no+1);
			$no_txt = $no.".";
			$noidx = 'no#'.$no;
			$namaidx = 'nama_tembusan#'.$no;
			$TemplateProcessor->setValue($noidx, $no_txt);
			$TemplateProcessor->setValue($namaidx, $tembusan["nama"]);
		} 
		$TemplateProcessor->setValue('no#'.($no+1), ($no+1).'.');
		$TemplateProcessor->setValue('no#'.($no+2), ($no+2).'.');
		$TemplateProcessor->setValue('nama_tembusan#'.($no+1), 'Direktur Pengelolaan Kekayaan Negara dan Sistem Informasi');
		$TemplateProcessor->setValue('nama_tembusan#'.($no+2), 'Kepala Kantor Wilayah DJKN Papua, Papua Barat dan Maluku');

		$detail_djkn = json_decode($this->input->post("detail_djkn"));
		$TemplateProcessor->setValue('nama_kpknl', $detail_djkn->kantor);
		$TemplateProcessor->setValue('kode_kpknl', $detail_djkn->kode);



		$noSurat = $this->common->cleanString($this->input->post("noSurat_pemohon"));
		$kementerian_lembaga = $this->common->cleanString($this->input->post("kementerian_lembaga"));
		$fileSave = 'KPKNL-Salinan KMK-'.$kementerian_lembaga.'-'.$noSurat.'.docx';
		$TemplateProcessor->saveAs($targetSaveFile.$fileSave);
		return $targetSaveFile.$fileSave;
	}

	
	public function generateSalinanKMKKANWIL()
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

		
		$file = 'Kanwil 4 Salinan KMK1.docx';

		$targetFile = "./uploads/template/";		
		$targetSaveFile = "./uploads/verifikasi/kpknl/";

		$TemplateProcessor = new \PhpOffice\PhpWord\TemplateProcessor($targetFile.$file);
		$tahun_terbit=substr($this->input->post('tglSurat_pemohon'), 0, 4); 
		$dataArray=array(
					"tahun_terbit" => $tahun_terbit,
					"kementerian_lembaga" =>ucfirst($this->input->post("kementerian_lembaga")),
					"kementerian_pemohon" => "Direktorat Jendral Kekayaan Negara",
					"jabatan_pemohon" => $this->input->post("jabatan_petugas"),
					"nama_satker" => ucfirst($this->input->post("satuan_kerja")),
					"nomor_surat_permohonan" => $this->input->post("noSurat_pemohon"),
					"perihal_surat_permohonan" => $this->input->post("perihalSurat_pemohon"),
					"tanggal_surat_permohonan" => $this->common->tgl_indo($this->input->post("tglSurat_pemohon")),
					"total_nilai_bmn" => $this->common->formatIDR($this->input->post("totalnilai_bmn")),
					"jenis_bmn" => $this->input->post("jenis_bmn"),
					"huruf_total_nilai_bmn" => $this->common->terbilang($this->input->post("totalnilai_bmn")),
					"nama_tembusan" => $strTembusan,
					"nama_KPKNL" => $this->input->post("status_proses"),
					"tanggal_cetak" => $this->common->tgl_indo($this->input->post("tglSurat_pemohon")),
					"plh_plt_kabid" => ($this->input->post("status_kepala_bidang")==='definitif')?'':'Plt',
					"plh_plt_kanwil" => ($this->input->post("status_kepala_kanwil")==='definitif')?'':'Plt',
					"plh_plt_kasi" => ($this->input->post("status_kepala_kasi")==='definitif')?'':'Plt',
					"nama_kepala_kantor" => $this->input->post("nama_kepala_bidang"),
					"nama_salinan" => $this->input->post("nama_salinan"),
					"nip_salinan" => $this->input->post("nip_salinan"),
					"jabatan_salinan" => $this->input->post("jabatan_salinan")
					);
		$TemplateProcessor->setValue('jabatan_salinan', $dataArray["jabatan_salinan"]);
		$TemplateProcessor->setValue('nama_salinan', $dataArray["nama_salinan"]);
		$TemplateProcessor->setValue('nip_salinan', $dataArray["nip_salinan"]);
		$TemplateProcessor->setValue('tahun_terbit', $dataArray["tahun_terbit"]);
		$TemplateProcessor->setValue('kementerian_lembaga', $dataArray["kementerian_lembaga"]);	
		$TemplateProcessor->setValue('kementerian_pemohon', $dataArray["kementerian_pemohon"]);
		$TemplateProcessor->setValue('jabatan_pemohon', $dataArray["jabatan_pemohon"]);
		$TemplateProcessor->setValue('nama_satker', $dataArray["nama_satker"]);
		$TemplateProcessor->setValue('nomor_surat_permohonan', $dataArray["nomor_surat_permohonan"]);
		$TemplateProcessor->setValue('tanggal_surat_permohonan', $dataArray["tanggal_surat_permohonan"]);
		$TemplateProcessor->setValue('perihal_surat_permohonan', $dataArray["perihal_surat_permohonan"]);
		$TemplateProcessor->setValue('jenis_bmn', $dataArray["jenis_bmn"]);
		$TemplateProcessor->setValue('total_nilai_bmn', $dataArray["total_nilai_bmn"]);
		$TemplateProcessor->setValue('huruf_total_nilai_bmn', $dataArray["huruf_total_nilai_bmn"]);
		
		$TemplateProcessor->setValue('nama_KPKNL', $dataArray["nama_KPKNL"]);
		$TemplateProcessor->setValue('nama_KPKNL_besar', strtoupper($dataArray["nama_KPKNL"]));
		$TemplateProcessor->setValue('tanggal_cetak', $dataArray["tanggal_cetak"]);
		$TemplateProcessor->setValue('plh_plt_kabid', $dataArray["plh_plt_kabid"]);
		$TemplateProcessor->setValue('plh_plt_kanwil', $dataArray["plh_plt_kanwil"]);
		$TemplateProcessor->setValue('plh_plt_kasi', $dataArray["plh_plt_kasi"]);
		$TemplateProcessor->setValue('nama_kepala_kantor', $dataArray["nama_kepala_kantor"]);

		$clonenumber = count($arrayTembusan)+4;
		$TemplateProcessor->cloneRow('no', $clonenumber);		

		$TemplateProcessor->setValue('no#1', '1.');
	    $TemplateProcessor->setValue('no#2', '2.');

		$TemplateProcessor->setValue('nama_tembusan#1', 'Menteri Keuangan');
		$TemplateProcessor->setValue('nama_tembusan#2', $this->input->post('jabatan_pemohon'));
		
		$no = 2;	

		foreach ($arrayTembusan as $key=>$tembusan) {
			$no =($no+1);
			$no_txt = $no.".";
			$noidx = 'no#'.$no;
			$namaidx = 'nama_tembusan#'.$no;
			$TemplateProcessor->setValue($noidx, $no_txt);
			$TemplateProcessor->setValue($namaidx, $tembusan["nama"]);
		} 
		 
		$TemplateProcessor->setValue('no#'.($no+1), ($no+1).'.');
		$TemplateProcessor->setValue('no#'.($no+2), ($no+2).'.');
		$TemplateProcessor->setValue('no#'.($no+3), ($no+3).'.');
		$TemplateProcessor->setValue('no#'.($no+4), ($no+4).'.');
		$TemplateProcessor->setValue('nama_tembusan#'.($no+1), 'Direktur Pengelolaan Kekayaan Negara dan Sistem Informasi');
		$TemplateProcessor->setValue('nama_tembusan#'.($no+2), 'Kepala Kantor Wilayah DJKN Papua, Papua Barat dan Maluku');

		$detail_djkn = json_decode($this->input->post("detail_djkn"));
		$TemplateProcessor->setValue('nama_tembusan#'.($no+3), 'Kepala KPKNL '. $detail_djkn->kantor);



		$noSurat = $this->common->cleanString($this->input->post("noSurat_pemohon"));
		$kementerian_lembaga = $this->common->cleanString($this->input->post("kementerian_lembaga"));
		
		$fileSave = 'Kanwil-Salinan KMK-'.$kementerian_lembaga.'-'.$noSurat.'.docx';

		$TemplateProcessor->saveAs($targetSaveFile.$fileSave);
		return $targetSaveFile.$fileSave;
	}



	public function generateNDSPermintaanKelengkapanKPKNL() {
		$file = 'KPKNL 5 ND S Permintaan Kelengkapan1.docx';
		$targetFile = "./uploads/template/";		
		$targetSaveFile = "./uploads/verifikasi/kpknl/";

		$TemplateProcessor = new \PhpOffice\PhpWord\TemplateProcessor($targetFile.$file);
		$tahun_terbit=substr($this->input->post('tglSurat_pemohon'), 0, 4); 
		$dataArray = array(
						"tahun_terbit" => $tahun_terbit, //diambil dari tanggal dokumen tergenerate
						"nama_kl" => ucfirst($this->input->post('kementerian_lembaga')),
						"nama_satker" => $this->input->post('satuan_kerja'),
						"tanggal_cetak" => ($this->input->post("tglSurat_pemohon")), 
						"jabatan_pemohon" => $this->input->post("jabatan_pemohon"),
						"nomor_surat_permohonan" => $this->input->post("noSurat_pemohon"),
						"tanggal_surat_permohonan" => ($this->input->post("tglSurat_pemohon")),
						"perihal_surat_permohonan" => $this->input->post("perihalSurat_pemohon"),
						"tanggal_penginputan" => ($this->input->post("tglSurat_pemohon")), 
						"jenis_bmn" => $this->input->post("jenis_bmn"),
						"total_nilai_bmn" => $this->common->formatIDR($this->input->post("totalnilai_bmn")),
						"huruf_total_nilai_bmn" => $this->common->terbilang($this->input->post("totalnilai_bmn")),
						"peraturan_pelimpahan_wewenang_kementrian_lembaga_pemohon" => $this->input->post("peraturan_pendelegasian_wewenang_KL"),						
						"plh_plt_kabid" => ($this->input->post('status_kepala_bidang')==='definitif')?'':'Plt',
						"plh_plt_kanwil" => ($this->input->post('status_kepala_kanwil')==='definitif')?'':'Plt',
						"plh_plt_kasi" => ($this->input->post('status_kepala_kanwil')==='definitif')?'':'Plt',
						"nama_kepala_bidang" => $this->input->post("nama_kepala_bidang"),
						"alamat_kantor_pemohon" => $this->input->post("alamat_kantor_pemohon"),
						"nama_kepala_kanwil"	=> $this->input->post("nama_kepala_kanwil"),
						"nama_verifikator" => $this->input->post("nama_verifikator"),
						"nama_kepala_seksi" => $this->input->post("nama_kepala_seksi"),
						"kmk_nomor" => $this->input->post("noSurat_pemohon"), 
						"jabatan_kepala_seksi" => $this->input->post("jabatan_kepala_seksi"),
						"nip_kepala_seksi" => $this->input->post("nip_kepala_seksi"),
						"nip_kepala_bidang" => $this->input->post("nip_kepala_bidang"),
						"nama_kepala_kantor" => $this->input->post("nama_kepala_bidang"),
						"nip_kepala_kantor" => $this->input->post("nip_kepala_bidang")
		);
		$plt_plh_spesial = ($this->input->post("plt_plh")==='plt_plh')?'Kepala '.$this->input->post('status_proses'):'Kepala Kantor';

		$bapak_ibu = (substr($this->input->post("nip_kepala_bidang"),-5,1)==='1')?'Bapak':'Ibu';
		$TemplateProcessor->setValue('jumlah_unit', $this->input->post("jumlah_unit"));
		$TemplateProcessor->setValue('bapak_ibu', $bapak_ibu);
		$TemplateProcessor->setValue('plt_plh_spesial', $plt_plh_spesial);
		$TemplateProcessor->setValue('tahun_terbit', $dataArray["tahun_terbit"]);
		$TemplateProcessor->setValue('nama_kl', $dataArray["nama_kl"]);
		$TemplateProcessor->setValue('nama_kl_besar', $dataArray["nama_kl_besar"]);
		$TemplateProcessor->setValue('nama_satker', $dataArray["nama_satker"]);
		$TemplateProcessor->setValue('tanggal_cetak', $this->common->tgl_indo($dataArray["tanggal_cetak"]));
		$TemplateProcessor->setValue('jabatan_pemohon', $dataArray["jabatan_pemohon"]);
		$TemplateProcessor->setValue('nomor_surat_permohonan', $dataArray["nomor_surat_permohonan"]);
		$TemplateProcessor->setValue('tanggal_surat_permohonan', $this->common->tgl_indo($dataArray["tanggal_surat_permohonan"]));
		$TemplateProcessor->setValue('perihal_surat_permohonan', $dataArray["perihal_surat_permohonan"]);
		$TemplateProcessor->setValue('tanggal_penginputan', $this->common->tgl_indo($dataArray["tanggal_penginputan"]));
		$TemplateProcessor->setValue('jenis_bmn', $dataArray["jenis_bmn"]);
		$TemplateProcessor->setValue('total_nilai_bmn', $dataArray["total_nilai_bmn"]);
		$TemplateProcessor->setValue('huruf_total_nilai_bmn', $dataArray["huruf_total_nilai_bmn"]);
		$TemplateProcessor->setValue('plh_plt_kabid', $dataArray["plh_plt_kabid"]);
		$TemplateProcessor->setValue('plh_plt_kanwil', $dataArray["plh_plt_kanwil"]);
		$TemplateProcessor->setValue('plh_plt_kasi', $dataArray["plh_plt_kasi"]);
		$TemplateProcessor->setValue('alamat_kantor_pemohon', $dataArray["alamat_kantor_pemohon"]);
		$TemplateProcessor->setValue('nama_verifikator', $dataArray["nama_verifikator"]);
		$TemplateProcessor->setValue('nama_kepala_seksi', $dataArray["nama_kepala_seksi"]);
		$TemplateProcessor->setValue('jabatan_kepala_seksi', $dataArray["jabatan_kepala_seksi"]);
		$TemplateProcessor->setValue('nip_kepala_seksi', $dataArray["nip_kepala_seksi"]);
		$TemplateProcessor->setValue('nama_kepala_bidang', $dataArray["nama_kepala_bidang"]);
		$TemplateProcessor->setValue('nip_kepala_bidang', $dataArray["nip_kepala_bidang"]);
		$TemplateProcessor->setValue('nama_kepala_kantor', $dataArray["nama_kepala_kantor"]);
		$TemplateProcessor->setValue('nip_kepala_kantor', $dataArray["nip_kepala_kantor"]);


		$daftarKekuranganData = json_decode($this->input->post('daftarKekuranganData'));
		$clonenumber = count($daftarKekuranganData);
		$TemplateProcessor->cloneRow('no', $clonenumber);		
		$TemplateProcessor->cloneRow('no1', $clonenumber);		

		$no = 0;	

		foreach ($daftarKekuranganData as $key=>$kurang) {
			$no =($key+1);
			$no_txt = $no.".";
			$noidx = 'no#'.$no;
			$namaidx = 'data#'.$no;
			$noidx1 = 'no1#'.$no;
			$namaidx1 = 'data1#'.$no;
			$TemplateProcessor->setValue($noidx, $no_txt);
			$TemplateProcessor->setValue($namaidx, $kurang->nama);
			$TemplateProcessor->setValue($noidx1, $no_txt);
			$TemplateProcessor->setValue($namaidx1, $kurang->nama);

		} 
		$noSurat = $this->common->cleanString($this->input->post("noSurat_pemohon"));
		$kementerian_lembaga = $this->common->cleanString($this->input->post("kementerian_lembaga"));
		$fileSave = 'KPKNL-ND S Permintaan Kelengkapan-'.$kementerian_lembaga.'-'.$noSurat.'.docx';

		$TemplateProcessor->saveAs($targetSaveFile.$fileSave);
		return $targetSaveFile.$fileSave;
	}



	public function generateNDSPermintaanKelengkapanKANWIL() {
		$file = 'Kanwil 5 ND S Permintaan Kelengkapan1.docx';
		$targetFile = "./uploads/template/";		
		$targetSaveFile = "./uploads/verifikasi/kanwil/";

		$TemplateProcessor = new \PhpOffice\PhpWord\TemplateProcessor($targetFile.$file);
		$tahun_terbit=substr($this->input->post('tglSurat_pemohon'), 0, 4); 
		$dataArray = array(
						"tahun_terbit" => $tahun_terbit, 
						"nama_kl" => ucfirst($this->input->post('kementerian_lembaga')),
						"nama_satker" => $this->input->post('satuan_kerja'),
						"tanggal_cetak" => $this->common->tgl_indo($this->input->post("tglSurat_pemohon")), 
						"jabatan_pemohon" => $this->input->post("jabatan_pemohon"),
						"nomor_surat_permohonan" => $this->input->post("noSurat_pemohon"),
						"tanggal_surat_permohonan" => $this->common->tgl_indo($this->input->post("tglSurat_pemohon")),
						"perihal_surat_permohonan" => $this->input->post("perihalSurat_pemohon"),
						"tanggal_penginputan" => $this->common->tgl_indo($this->input->post("tglSurat_pemohon")),
						"jenis_bmn" => $this->input->post("jenis_bmn"),
						"total_nilai_bmn" => $this->common->formatIDR($this->input->post("totalnilai_bmn")),
						"huruf_total_nilai_bmn" => $this->common->terbilang($this->input->post("totalnilai_bmn")),
						"peraturan_pelimpahan_wewenang_kementrian_lembaga_pemohon" => $this->input->post("peraturan_pendelegasian_wewenang_KL"),
						"plh_plt_kabid" => ($this->input->post('status_kepala_bidang')==='definitif')?'':'Plt',
						"plh_plt_kanwil" => ($this->input->post('status_kepala_kanwil')==='definitif')?'':'Plt',
						"plh_plt_kasi" => ($this->input->post('status_kepala_kanwil')==='definitif')?'':'Plt',
						"nama_kepala_bidang" => $this->input->post("nama_kepala_bidang"),
						"alamat_kantor_pemohon" => $this->input->post("alamat_kantor_pemohon"),
						"nama_kepala_kanwil"	=> $this->input->post("nama_kepala_kanwil"),
						"nama_verifikator" => $this->input->post("nama_verifikator"),
						"nama_kepala_seksi" => $this->input->post("nama_kepala_seksi"),
						"kmk_nomor" => $this->input->post("noSurat_pemohon"), 
						"jabatan_kepala_seksi" => $this->input->post("jabatan_kepala_seksi"),
						"nip_kepala_seksi" => $this->input->post("nip_kepala_seksi"),
						"nip_kepala_bidang" => $this->input->post("nip_kepala_bidang"),
						"nama_kepala_kantor" => $this->input->post("nama_kepala_bidang"),
						"jumlah_unit" => $this->input->post("jumlah_unit"),
						"nip_kepala_kantor" => $this->input->post("nip_kepala_bidang")
		);
		$plt_plh_spesial = ($this->input->post("plt_plh")==='plt_plh')?'Kepala Kanwil DJKN Papua, Papua Barat, dan Maluku':'Kepala Kantor';
		
		$bapak_ibu = (substr($this->input->post("nip_kepala_bidang"),-5,1)==='1')?'Bapak':'Ibu';	
		$TemplateProcessor->setValue('bapak_ibu', $bapak_ibu);
		$TemplateProcessor->setValue('plt_plh_spesial', $plt_plh_spesial);
		$TemplateProcessor->setValue('jumlah_unit', $dataArray["jumlah_unit"]);
		$TemplateProcessor->setValue('tahun_terbit', $dataArray["tahun_terbit"]);
		$TemplateProcessor->setValue('nama_kl', ucfirst($dataArray["nama_kl"]));
		$TemplateProcessor->setValue('nama_satker', $dataArray["nama_satker"]);
		$TemplateProcessor->setValue('tanggal_cetak', $dataArray["tanggal_cetak"]);
		$TemplateProcessor->setValue('jabatan_pemohon', $dataArray["jabatan_pemohon"]);
		$TemplateProcessor->setValue('nomor_surat_permohonan', $dataArray["nomor_surat_permohonan"]);
		$TemplateProcessor->setValue('tanggal_surat_permohonan', $dataArray["tanggal_surat_permohonan"]);
		$TemplateProcessor->setValue('perihal_surat_permohonan', $dataArray["perihal_surat_permohonan"]);
		$TemplateProcessor->setValue('tanggal_penginputan', $dataArray["tanggal_penginputan"]);
		$TemplateProcessor->setValue('jenis_bmn', $dataArray["jenis_bmn"]);
		$TemplateProcessor->setValue('total_nilai_bmn', $dataArray["total_nilai_bmn"]);
		$TemplateProcessor->setValue('huruf_total_nilai_bmn', $dataArray["huruf_total_nilai_bmn"]);
		$TemplateProcessor->setValue('plh_plt_kabid', $dataArray["plh_plt_kabid"]);
		$TemplateProcessor->setValue('plh_plt_kanwil', $dataArray["plh_plt_kanwil"]);
		$TemplateProcessor->setValue('plh_plt_kasi', $dataArray["plh_plt_kasi"]);
		$TemplateProcessor->setValue('alamat_kantor_pemohon', $dataArray["alamat_kantor_pemohon"]);
		$TemplateProcessor->setValue('nama_verifikator', $dataArray["nama_verifikator"]);
		$TemplateProcessor->setValue('nama_kepala_seksi', $dataArray["nama_kepala_seksi"]);
		$TemplateProcessor->setValue('jabatan_kepala_seksi', $dataArray["jabatan_kepala_seksi"]);
		$TemplateProcessor->setValue('nip_kepala_seksi', $dataArray["nip_kepala_seksi"]);
		$TemplateProcessor->setValue('nama_kepala_bidang', $dataArray["nama_kepala_bidang"]);
		$TemplateProcessor->setValue('nip_kepala_bidang', $dataArray["nip_kepala_bidang"]);
		$TemplateProcessor->setValue('nama_kepala_kantor', $dataArray["nama_kepala_kantor"]);
		$TemplateProcessor->setValue('nip_kepala_kantor', $dataArray["nip_kepala_kantor"]);


		$daftarKekuranganData = json_decode($this->input->post('daftarKekuranganData'));
		$clonenumber = count($daftarKekuranganData);
		$TemplateProcessor->cloneRow('no', $clonenumber);		
		$TemplateProcessor->cloneRow('no1', $clonenumber);		

		$no = 0;	

		foreach ($daftarKekuranganData as $key=>$kurang) {
			$no =($key+1);
			$no_txt = $no.".";
			$noidx = 'no#'.$no;
			$namaidx = 'data#'.$no;
			$noidx1 = 'no1#'.$no;
			$namaidx1 = 'data1#'.$no;
			$TemplateProcessor->setValue($noidx, $no_txt);
			$TemplateProcessor->setValue($namaidx, $kurang->nama);
			$TemplateProcessor->setValue($noidx1, $no_txt);
			$TemplateProcessor->setValue($namaidx1, $kurang->nama);

		} 
		$noSurat = $this->common->cleanString($this->input->post("noSurat_pemohon"));
		$kementerian_lembaga = $this->common->cleanString($this->input->post("kementerian_lembaga"));
		$fileSave = 'Kanwil - ND S Permintaan Kelengkapan-'.$kementerian_lembaga.'-'.$noSurat.'.docx';

		$TemplateProcessor->saveAs($targetSaveFile.$fileSave);
		return $targetSaveFile.$fileSave;
	}


	public function generateNDSSurveyLapanganKANWIL() {
		$file = 'Kanwil 6 ND S Survei Lapangan1.docx';
		$targetFile = "./uploads/template/";		
		$targetSaveFile = "./uploads/verifikasi/kanwil/";
		
		$TemplateProcessor = new \PhpOffice\PhpWord\TemplateProcessor($targetFile.$file);
		$tahun_terbit=substr($this->input->post('tglSurat_pemohon'), 0, 4); 
		$dataArray = array(
						"tahun_terbit" => $tahun_terbit, //diambil dari tanggal dokumen tergenerate
						"nama_kasi_pkn" => $this->input->post('nama_kepala_seksi'),
						"nama_kl" => ucfirst($this->input->post('kementerian_lembaga')),
						"nama_satker" => $this->input->post('satuan_kerja'),
						"nama_kpknl" => $this->input->post('status_proses'),						
						"jumlah_unit" => $this->input->post('jumlah_unit'),
						"tanggal_cetak" => $this->common->tgl_indo($this->input->post("tglSurat_pemohon")),
						"jabatan_pemohon" => $this->input->post("jabatan_pemohon"),
						"nomor_surat_permohonan" => $this->input->post("noSurat_pemohon"),
						"tanggal_surat_permohonan" => $this->common->tgl_indo($this->input->post("tglSurat_pemohon")),
						"perihal_surat_permohonan" => ($this->input->post("perihalSurat_pemohon")),
						"tanggal_penginputan" => $this->common->tgl_indo($this->input->post("tglSurat_pemohon")), 
						"jenis_bmn" => $this->input->post("jenis_bmn"),
						"total_nilai_bmn" => $this->common->formatIDR($this->input->post("totalnilai_bmn")),
						"huruf_total_nilai_bmn" => $this->common->terbilang($this->input->post("totalnilai_bmn")),
						"peraturan_pelimpahan_wewenang_kementrian_lembaga_pemohon" => $this->input->post("peraturan_pendelegasian_wewenang_KL"),
						"plh_plt_kabid" => ($this->input->post("status_kepala_bidang")==='definitif')?'':'Plt',
						"plh_plt_kanwil" => ($this->input->post("status_kepala_kanwil")==='definitif')?'':'Plt',
						"plh_plt_kasi" => ($this->input->post("status_kepala_kasi")==='definitif')?'':'Plt',
						"nama_kepala_bidang" => $this->input->post("nama_kepala_bidang"),
						"alamat_kantor_pemohon" => $this->input->post("alamat_kantor_pemohon"),
						"nama_kepala_kanwil"	=> $this->input->post("nama_kepala_kanwil"),
						"nama_verifikator" => $this->input->post("nama_verifikator"),
						"nama_kepala_seksi" => $this->input->post("nama_kepala_seksi"),
						"kmk_nomor" => $this->input->post("noSurat_pemohon"), 
						"jabatan_kepala_seksi" => $this->input->post("jabatan_kepala_seksi"),
						"nip_kepala_seksi" => $this->input->post("nip_kepala_seksi"),
						"nip_kepala_bidang" => $this->input->post("nip_kepala_bidang"),
						"nama_kepala_kantor" => $this->input->post("nama_kepala_bidang"),
						"nip_kepala_kantor" => $this->input->post("nip_kepala_bidang"),
						"nama_survei_lapangan" => $this->input->post("nama_survey"),
						"waktu_survei" => $this->input->post("rencana_survey"),
						"cp_survei_lapangan" => $this->input->post("cp_survey"),
						"nama_KPKNL" => $this->input->post("status_proses")
		);

		$plt_plh_spesial = ($this->input->post("plt_plh")==='plt_plh')?'Kepala Kanwil DJKN Papua, Papua Barat, dan Maluku,'.$this->input->post('status_proses'):'Kepala Kantor';

		$bapak_ibu = (substr($this->input->post("nip_kepala_bidang"),-5,1)==='1')?'Bapak':'Ibu';
		$TemplateProcessor->setValue('bapak_ibu', $bapak_ibu);		
		$TemplateProcessor->setValue('plt_plh_spesial', $plt_plh_spesial);		
		$TemplateProcessor->setValue('tahun_terbit', $dataArray["tahun_terbit"]);
		$TemplateProcessor->setValue('nama_kl', $dataArray["nama_kl"]);
		$TemplateProcessor->setValue('nama_kl_besar', $dataArray["nama_kl_besar"]);
		$TemplateProcessor->setValue('nama_satker', $dataArray["nama_satker"]);
		$TemplateProcessor->setValue('tanggal_cetak', $dataArray["tanggal_cetak"]);
		$TemplateProcessor->setValue('jumlah_unit', $dataArray["jumlah_unit"]);
		$TemplateProcessor->setValue('jabatan_pemohon', $dataArray["jabatan_pemohon"]);
		$TemplateProcessor->setValue('nomor_surat_permohonan', $dataArray["nomor_surat_permohonan"]);
		$TemplateProcessor->setValue('tanggal_surat_permohonan', $dataArray["tanggal_surat_permohonan"]);
		$TemplateProcessor->setValue('perihal_surat_permohonan', $dataArray["perihal_surat_permohonan"]);
		$TemplateProcessor->setValue('tanggal_penginputan', $dataArray["tanggal_penginputan"]);
		$TemplateProcessor->setValue('jenis_bmn', $dataArray["jenis_bmn"]);
		$TemplateProcessor->setValue('total_nilai_bmn', $dataArray["total_nilai_bmn"]);
		$TemplateProcessor->setValue('huruf_total_nilai_bmn', $dataArray["huruf_total_nilai_bmn"]);
		$TemplateProcessor->setValue('nama_kasi_pkn', $dataArray["nama_kasi_pkn"]);
		$TemplateProcessor->setValue('plh_plt_kabid', $dataArray["plh_plt_kabid"]);
		$TemplateProcessor->setValue('plh_plt_kanwil', $dataArray["plh_plt_kanwil"]);
		$TemplateProcessor->setValue('plh_plt_kasi', $dataArray["plh_plt_kasi"]);
		$TemplateProcessor->setValue('waktu_survei', $dataArray["waktu_survei"]);
		$TemplateProcessor->setValue('nama_survei_lapangan', $dataArray["nama_survei_lapangan"]);
		$TemplateProcessor->setValue('cp_survei_lapangan', $dataArray["cp_survei_lapangan"]);
		$TemplateProcessor->setValue('alamat_kantor_pemohon', $dataArray["alamat_kantor_pemohon"]);
		$TemplateProcessor->setValue('nama_kepala_kantor', $dataArray["nama_kepala_kantor"]);
		$TemplateProcessor->setValue('nama_verifikator', $dataArray["nama_verifikator"]);
		$TemplateProcessor->setValue('nama_kepala_seksi', $dataArray["nama_kepala_seksi"]);
		$TemplateProcessor->setValue('jabatan_kepala_seksi', $dataArray["jabatan_kepala_seksi"]);
		$TemplateProcessor->setValue('nip_kepala_seksi', $dataArray["nip_kepala_seksi"]);
		$TemplateProcessor->setValue('nama_kepala_bidang', $dataArray["nama_kepala_bidang"]);
		$TemplateProcessor->setValue('nip_kepala_bidang', $dataArray["nip_kepala_bidang"]);
		$TemplateProcessor->setValue('nama_kepala_kantor', $dataArray["nama_kepala_kantor"]);
		$TemplateProcessor->setValue('nip_kepala_kantor', $dataArray["nip_kepala_kantor"]);
		
		$TemplateProcessor->setValue('nama_KPKNL', $dataArray["nama_KPKNL"]);
		$TemplateProcessor->setValue('nama_KPKNL_besar', strtoupper($dataArray["nama_KPKNL"]));



		$noSurat = $this->common->cleanString($this->input->post("noSurat_pemohon"));
		$kementerian_lembaga = $this->common->cleanString($this->input->post("kementerian_lembaga"));
		$fileSave = 'Kanwil - ND S Survey Lapangan -'.$kementerian_lembaga.'-'.$noSurat.'.docx';

		$TemplateProcessor->saveAs($targetSaveFile.$fileSave);
		return $targetSaveFile.$fileSave;
	}
	public function generateNDSSurveyLapanganKPKNL() {
		$file = 'KPKNL 6 ND S Survei Lapangan1.docx';
		$targetFile = "./uploads/template/";		
		$targetSaveFile = "./uploads/verifikasi/kpknl/";
		
		$TemplateProcessor = new \PhpOffice\PhpWord\TemplateProcessor($targetFile.$file);
		$tahun_terbit=substr($this->input->post('tglSurat_pemohon'), 0, 4); 
		$dataArray = array(
						"tahun_terbit" => $tahun_terbit, //diambil dari tanggal dokumen tergenerate
						"nama_kasi_pkn" => $this->input->post('nama_kepala_seksi'),
						"nama_kl" => ucfirst($this->input->post('kementerian_lembaga')),
						"jumlah_unit" => $this->input->post('jumlah_unit'),
						"nama_satker" => $this->input->post('satuan_kerja'),
						"nama_kpknl" => $this->input->post('status_proses'),
						"tanggal_cetak" => $this->common->tgl_indo($this->input->post("tglSurat_pemohon")), 
						"jabatan_pemohon" => $this->input->post("jabatan_pemohon"),
						"nomor_surat_permohonan" => $this->input->post("noSurat_pemohon"),
						"tanggal_surat_permohonan" => $this->common->tgl_indo($this->input->post("tglSurat_pemohon")),
						"perihal_surat_permohonan" => ($this->input->post("perihalSurat_pemohon")),
						"tanggal_penginputan" => $this->common->tgl_indo($this->input->post("tglSurat_pemohon")), 
						"jenis_bmn" => $this->input->post("jenis_bmn"),
						"total_nilai_bmn" => $this->common->formatIDR($this->input->post("totalnilai_bmn")),
						"huruf_total_nilai_bmn" => $this->common->terbilang($this->input->post("totalnilai_bmn")),
						"peraturan_pelimpahan_wewenang_kementrian_lembaga_pemohon" => $this->input->post("peraturan_pendelegasian_wewenang_KL"),
						"plh_plt_kabid" => ($this->input->post("status_kepala_bidang")==='definitif')?'':'Plt',
						"plh_plt_kanwil" => ($this->input->post("status_kepala_kanwil")==='definitif')?'':'Plt',
						"plh_plt_kasi" => ($this->input->post("status_kepala_kasi")==='definitif')?'':'Plt',
						"nama_kepala_bidang" => $this->input->post("nama_kepala_bidang"),
						"alamat_kantor_pemohon" => $this->input->post("alamat_kantor_pemohon"),
						"nama_kepala_kanwil"	=> $this->input->post("nama_kepala_kanwil"),
						"nama_verifikator" => $this->input->post("nama_verifikator"),
						"nama_kepala_seksi" => $this->input->post("nama_kepala_seksi"),
						"kmk_nomor" => $this->input->post("noSurat_pemohon"), 
						"jabatan_kepala_seksi" => $this->input->post("jabatan_kepala_seksi"),
						"nip_kepala_seksi" => $this->input->post("nip_kepala_seksi"),
						"nip_kepala_bidang" => $this->input->post("nip_kepala_bidang"),
						"nama_kepala_kantor" => $this->input->post("nama_kepala_bidang"),
						"nip_kepala_kantor" => $this->input->post("nip_kepala_bidang"),
						"waktu_survei" => $this->input->post("rencana_survey"),
						"cp_survei_lapangan" => $this->input->post("cp_survey"),
						"nama_KPKNL" => $this->input->post("status_proses")
		);

		$plt_plh_spesial = ($this->input->post("plt_plh")==='plt_plh')?'Kepala '.$this->input->post('status_proses'):'Kepala Kantor';
		$bapak_ibu = (substr($this->input->post("nip_kepala_bidang"),-5,1)==='1')?'Bapak':'Ibu';
		$TemplateProcessor->setValue('plt_plh_spesial', $plt_plh_spesial);
		$detail_djkn = json_decode($this->input->post("detail_djkn"));
		$TemplateProcessor->setValue('kode_kpknl', $detail_djkn->kode);
		$TemplateProcessor->setValue('alamat_kpknl', $detail_djkn->alamat);
		$TemplateProcessor->setValue('telepon_dan_email_kpknl', $detail_djkn->email);
		$TemplateProcessor->setValue('jumlah_unit', $dataArray["jumlah_unit"]);
		$TemplateProcessor->setValue('tahun_terbit', $dataArray["tahun_terbit"]);
		$TemplateProcessor->setValue('nama_kl', $dataArray["nama_kl"]);
		$TemplateProcessor->setValue('nama_kl_besar', $dataArray["nama_kl_besar"]);
		$TemplateProcessor->setValue('nama_satker', $dataArray["nama_satker"]);
		$TemplateProcessor->setValue('tanggal_cetak', $dataArray["tanggal_cetak"]);
		$TemplateProcessor->setValue('jabatan_pemohon', $dataArray["jabatan_pemohon"]);
		$TemplateProcessor->setValue('nomor_surat_permohonan', $dataArray["nomor_surat_permohonan"]);
		$TemplateProcessor->setValue('tanggal_surat_permohonan', $dataArray["tanggal_surat_permohonan"]);
		$TemplateProcessor->setValue('perihal_surat_permohonan', $dataArray["perihal_surat_permohonan"]);
		$TemplateProcessor->setValue('tanggal_penginputan', $dataArray["tanggal_penginputan"]);
		$TemplateProcessor->setValue('jenis_bmn', $dataArray["jenis_bmn"]);
		$TemplateProcessor->setValue('total_nilai_bmn', $dataArray["total_nilai_bmn"]);
		$TemplateProcessor->setValue('huruf_total_nilai_bmn', $dataArray["huruf_total_nilai_bmn"]);
		$TemplateProcessor->setValue('nama_kasi_pkn', $dataArray["nama_kasi_pkn"]);
		$TemplateProcessor->setValue('plh_plt_kabid', $dataArray["plh_plt_kabid"]);
		$TemplateProcessor->setValue('plh_plt_kanwil', $dataArray["plh_plt_kanwil"]);
		$TemplateProcessor->setValue('plh_plt_kasi', $dataArray["plh_plt_kasi"]);
		$TemplateProcessor->setValue('waktu_survei', $dataArray["waktu_survei"]);
		$TemplateProcessor->setValue('cp_survei_lapangan', $dataArray["cp_survei_lapangan"]);
		$TemplateProcessor->setValue('alamat_kantor_pemohon', $dataArray["alamat_kantor_pemohon"]);
		$TemplateProcessor->setValue('nama_kepala_kantor', $dataArray["nama_kepala_kantor"]);
		$TemplateProcessor->setValue('nama_verifikator', $dataArray["nama_verifikator"]);
		$TemplateProcessor->setValue('nama_kepala_seksi', $dataArray["nama_kepala_seksi"]);
		$TemplateProcessor->setValue('jabatan_kepala_seksi', $dataArray["jabatan_kepala_seksi"]);
		$TemplateProcessor->setValue('nip_kepala_seksi', $dataArray["nip_kepala_seksi"]);
		$TemplateProcessor->setValue('nama_kepala_bidang', $dataArray["nama_kepala_bidang"]);
		$TemplateProcessor->setValue('nip_kepala_bidang', $dataArray["nip_kepala_bidang"]);
		$TemplateProcessor->setValue('nama_kepala_kantor', $dataArray["nama_kepala_kantor"]);
		$TemplateProcessor->setValue('nip_kepala_kantor', $dataArray["nip_kepala_kantor"]);
		
		$TemplateProcessor->setValue('nama_KPKNL', $dataArray["nama_KPKNL"]);
		$TemplateProcessor->setValue('nama_KPKNL_besar', strtoupper($dataArray["nama_KPKNL"]));



		$noSurat = $this->common->cleanString($this->input->post("noSurat_pemohon"));
		$kementerian_lembaga = $this->common->cleanString($this->input->post("kementerian_lembaga"));
		$fileSave = 'KPKNL-ND S Survey Lapangan -'.$kementerian_lembaga.'-'.$noSurat.'.docx';

		$TemplateProcessor->saveAs($targetSaveFile.$fileSave);
		return $targetSaveFile.$fileSave;
	}

	public function generateSurveyLapanganKANWIL(){
		
		$fileHasilVerifikasi=$this->generateHasilVerifikasiKANWIL();
		$fileNDSSurveyLapangan=$this->generateNDSSurveyLapanganKANWIL();
		
		$dataArray = array(
						'fileNDSPersetujuan'=>'',
						'fileHasilVerifikasi'=>$fileHasilVerifikasi,
						'fileKMK'=>'',
						'fileSalinanKMK'=>'',
						'fileNDSPermintaanKelengkapan'=>'',
						'fileNDSSurveyLapangan'=>$fileNDSSurveyLapangan,
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


	public function generateDocKMKKPKNL(){
		$fileNDSPersetujuanKPKNL=$this->generateNDSPersetujuanKPKNL();
		$fileHasilVerifikasiKPKNL=$this->generateHasilVerifikasiKPKNL();
		$fileKMKKPKNL=$this->generateKMKKPKNL();
		$fileSalinanKMKKANWIL=$this->generateSalinanKMKKPKNL();


		$dataArray = array(
						'fileNDSPersetujuan'=>$fileNDSPersetujuanKPKNL,
						'fileHasilVerifikasi'=>$fileHasilVerifikasiKPKNL,
						'fileKMK'=>$fileKMKKPKNL,
						'fileSalinanKMK'=>$fileSalinanKMKKANWIL,
						'fileNDSPermintaanKelengkapan'=>'',
						'fileNDSSurveyLapangan'=>'',
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
		$fileHasilVerifikasiKPKNL=$this->generateHasilVerifikasiKPKNL();
		$fileNDSPermintaanKelengkapanKPKNL=$this->generateNDSPermintaanKelengkapanKPKNL();
		$dataArray = array(
						'fileNDSPersetujuan'=>'',
						'fileHasilVerifikasi'=>$fileHasilVerifikasiKPKNL,
						'fileKMK'=>'',
						'fileSalinanKMK'=>'',
						'fileNDSPermintaanKelengkapan'=>$fileNDSPermintaanKelengkapanKPKNL,
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





	public function generateDocKMKKANWIL(){

		$fileHasilVerifikasiKANWIL=$this->generateHasilVerifikasiKANWIL();

		$fileNDSPersetujuanKANWIL=$this->generateNDSPersetujuanKANWIL();
		$fileKMKKANWIL=$this->generateKMKKANWIL();
		$fileSalinanKMKKANWIL=$this->generateSalinanKMKKANWIL();

		$dataArray = array(
						'fileNDSPersetujuan'=>$fileNDSPersetujuanKANWIL,
						'fileHasilVerifikasi'=>$fileHasilVerifikasiKANWIL,
						'fileKMK'=>$fileKMKKANWIL,
						'fileSalinanKMK'=>$fileSalinanKMKKANWIL,
						'fileNDSPermintaanKelengkapan'=>'',
						'fileNDSSurveyLapangan'=>'',
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
                'suratHasilVerifikasifinal' => $this->input->post('suratHasilVerifikasifinal'),	            
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
