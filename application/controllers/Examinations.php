<?php

defined('BASEPATH') OR exit('No direct script access allowed');


class Examinations extends Admin_Controller
{

	public function __construct()
	{

		parent::__construct();

		$this->not_logged_in();

		$this->data['page_title'] = 'Examination';

		$this->load->model('model_examinations');
		$this->load->model('model_notifications');
		$this->data['expiryproduct'] = $this->model_notifications->getExpiryProduct();
		$this->data['ofsproduct'] = $this->model_notifications->getOfsProduct();
		$this->data['totalexpnoti'] = $this->model_notifications->getTotalExpNoti();
		$this->data['totalofspnoti'] = $this->model_notifications->getTotalOfsNoti();
		
	}

	public function create()
	{

		if($this->input->post()){

		$this->form_validation->set_rules('patient_id', 'Patient Id', 'trim|required');
		$this->form_validation->set_rules('s_bp', 'Systolic', 'trim|required');
		$this->form_validation->set_rules('d_bp', 'Diastolic', 'trim|required');

		if($this->form_validation->run() == TRUE){
		 foreach ($this->input->post() as $key => $value)
          $this->model_examinations->$key = $value;
          $this->model_examinations->save();
          $this->model_examinations->load($this->model_examinations->id);
          $this->data['examination'] = $this->model_examinations;
          $this->load->view('patients/examination',$this->data);
        
		  }else{

		  	
		  }
		}
	}

	public function delete($id)
    {

        if(!in_array('createPatient', $this->permission)){

            redirect('dashboard','refresh');
        }

        $this->form_validation->set_rules(array(
        array( 'field' => 'examination_id', 'label' => 'ID', 'rules' => 'required|trim|is_numeric|has_no_schar', ),
        array( 'field' => 'patient_id', 'label' => 'Patient ID', 'rules' => 'required|trim|is_numeric|has_no_schar', ),
        
      ));


        if($this->input->post('examination_id') == $id){

            $this->model_examinations->load($this->input->post('examination_id'));

            if($this->model_examinations->patient_id == $this->input->post('patient_id')){

                $this->model_examinations->deleteExamination($id);
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