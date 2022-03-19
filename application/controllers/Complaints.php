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
		$this->load->model('model_notifications');
		$this->data['expiryproduct'] = $this->model_notifications->getExpiryProduct();
		$this->data['ofsproduct'] = $this->model_notifications->getOfsProduct();
		$this->data['totalexpnoti'] = $this->model_notifications->getTotalExpNoti();
		$this->data['totalofspnoti'] = $this->model_notifications->getTotalOfsNoti();
		
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
		 }

	}
}

    public function delete($id)
    {

    	if(!in_array('createPatient', $this->permission)){

			redirect('dashboard','refresh');
		}

		$this->form_validation->set_rules(array(
        array( 'field' => 'complaint_id', 'label' => 'ID', 'rules' => 'required|trim|is_numeric|has_no_schar', ),
        array( 'field' => 'patient_id', 'label' => 'Patient ID', 'rules' => 'required|trim|is_numeric|has_no_schar', ),
        
      	));


		if($this->input->post('complaint_id') == $id){

			$this->model_complaints->load($this->input->post('complaint_id'));

			if($this->model_complaints->patient_id == $this->input->post('patient_id')){

				$this->model_complaints->deleteComplaint($id);
				unset($_POST);
                echo 'ok';
			}else{
			 echo 'mismatch';
			}
		}else{

			echo "Still Error";
		}

    }
    
    public function getComplaintHint()
    {

    	$complaints = $this->model_complaints->getComplaintHint();

    	echo json_encode($complaints);

    }

}