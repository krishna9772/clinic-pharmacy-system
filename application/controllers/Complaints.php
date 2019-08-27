<?php

defined('BASEPATH') OR exit('No direct script access allowed');


class Complaints extends Admin_Controller
{

	public function __construct()
	{

		parent::__construct();

		$this->not_logged_in();

		$this->data['page_title'] = 'Patients';

		$this->load->model('model_complaints');
		
	}

	public function create($patient_id)
	{

		 if($this->input->post())
		 {

	     $this->form_validation->set_rules('patient_id', 'Patient Id', 'trim|required');
		$this->form_validation->set_rules('complaint', 'Complaint', 'trim|required');

		 if($this->form_validation->run() == TRUE ){

		 $this->model_complaints->patient_id = $this->input->post('patient_id');
		 $this->model_complaints->complaint  = $this->input->post('complaint');
		 $this->model_complaints->save();
		 $this->model_complaints->load($this->model_complaints->id);
		 $this->data['complaint'] = $this->model_complaints;
		 $this->load->view('patients/complaint',$this->data);
		 }else{

		 	echo "Sorry An Error has occured";
		 }

	}
}

}