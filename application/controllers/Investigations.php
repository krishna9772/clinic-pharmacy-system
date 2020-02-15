<?php

defined('BASEPATH') OR exit('No direct script access allowed');


class Investigations extends Admin_Controller
{

	public function __construct()
	{

		parent::__construct();

		$this->not_logged_in();

		$this->data['page_title'] = 'Patients';

		$this->load->model('model_investigations');
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
		$this->form_validation->set_rules('investigation', 'Complaint', 'trim|required');

		 if($this->form_validation->run() == TRUE ){	

		 $this->model_investigations->patient_id = $this->input->post('patient_id');
		 $this->model_investigations->investigation  = $this->input->post('investigation');
		 $this->model_investigations->save();
		 $this->model_investigations->load($this->model_investigations->id);
		 $this->data['investigation'] = $this->model_investigations;
		 $this->load->view('patients/investigation',$this->data);
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
        array( 'field' => 'investigation_id', 'label' => 'ID', 'rules' => 'required|trim|is_numeric|has_no_schar', ),
        array( 'field' => 'patient_id', 'label' => 'Patient ID', 'rules' => 'required|trim|is_numeric|has_no_schar', ),
        
      ));


        if($this->input->post('investigation_id') == $id){

            $this->model_investigations->load($this->input->post('investigation_id'));

            if($this->model_investigations->patient_id == $this->input->post('patient_id')){

                $this->model_investigations->deleteInvestigation($id);
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