<?php

defined('BASEPATH') OR exit('No direct script access allowed');


class Historys extends Admin_Controller
{

	public function __construct()
	{

		parent::__construct();

		$this->not_logged_in();

		$this->data['page_title'] = 'Patients';

		$this->load->model('model_historys');
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
		$this->form_validation->set_rules('history', 'Complaint', 'trim|required');

		 if($this->form_validation->run() == TRUE ){	

		 $this->model_historys->patient_id = $this->input->post('patient_id');
		 $this->model_historys->history  = $this->input->post('history');
		 $this->model_historys->save();
		 $this->model_historys->load($this->model_historys->id);
		 $this->data['history'] = $this->model_historys;
		 $this->load->view('patients/history',$this->data);
		 }else{

		 	echo "Field cannot be empty";
		 }

	}
}

public function delete($id)
    {

    	if(!in_array('createPatient', $this->permission)){

			redirect('dashboard','refresh');
		}

		$this->form_validation->set_rules(array(
        array( 'field' => 'history_id', 'label' => 'ID', 'rules' => 'required|trim|is_numeric|has_no_schar', ),
        array( 'field' => 'patient_id', 'label' => 'Patient ID', 'rules' => 'required|trim|is_numeric|has_no_schar', ),
        
      ));


		if($this->input->post('history_id') == $id){

			$this->model_historys->load($this->input->post('history_id'));

			if($this->model_historys->patient_id == $this->input->post('patient_id')){

				$this->model_historys->deleteHistory($id);
				unset($_POST);
                echo 'ok';
			}else{
			 echo 'mismatch';
			}
		}else{

			echo "Still Error";
		}

    }

}