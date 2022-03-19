<?php

defined('BASEPATH') OR exit('No direct script access allowed');

class Diagnosis extends Admin_Controller
{

	public function __construct()
	{
       
        parent::__construct();

		$this->not_logged_in();

		$this->data['page_title'] = 'Diagnosis';

		$this->load->model('model_diagnosis');
        $this->load->model('model_diagpatients');
		$this->load->model('model_notifications');
		$this->data['expiryproduct'] = $this->model_notifications->getExpiryProduct();
		$this->data['ofsproduct'] = $this->model_notifications->getOfsProduct();
		$this->data['totalexpnoti'] = $this->model_notifications->getTotalExpNoti();
		$this->data['totalofspnoti'] = $this->model_notifications->getTotalOfsNoti();

    }

    public function create()
    {

        if($this->input->post())
        {

        	$this->form_validation->set_rules('name', 'Name', 'trim|required');

        	if($this->form_validation->run() == TRUE)
        	{

        		$this->model_diagnosis->name = $this->input->post('name');
        		$this->model_diagnosis->save();
        		$this->model_diagnosis->load($this->model_diagnosis->id);

        		echo '<li><input type="checkbox" name="diagnosis[]" id="'.$this->model_diagnosis->name.'" value="'.$this->model_diagnosis->name.'" />';
                echo '<label for="'.$this->model_diagnosis->name.'">'.$this->model_diagnosis->name.'</label></li> ';

                return;
        	}
        }else{

        	echo 'Something went wrong sorry';
        }

    }

    public function assign()
    {

        if($this->input->post()){
        
            $this->form_validation->set_rules(array(
                array( 'field' => 'patient_id', 'label' => 'Patient ID', 'rules' => 'required|is_numeric', ),
                array( 'TOS' => 'diagnosis', 'label' => 'Diagnosis', 'rules' => 'required|is_required', ),
            ));

        if($this->form_validation->run() == TRUE){

                $this->model_diagpatients->patient_id = $this->input->post('patient_id');
                $this->model_diagpatients->diagnosis  = implode(",",$this->input->post('diagnosis'));
                $this->model_diagpatients->save();
                $this->model_diagpatients->load($this->model_diagpatients->id);
                $this->data['diagnosis']  = $this->model_diagpatients;
                $this->load->view('patients/diagnosis',$this->data);

        }

    } 

}

public function delete($id)
    {

        if(!in_array('createPatient', $this->permission)){

            redirect('dashboard','refresh');
        }

        $this->form_validation->set_rules(array(
        array( 'field' => 'diagnosis_id', 'label' => 'ID', 'rules' => 'required|trim|is_numeric|has_no_schar', ),
        array( 'field' => 'patient_id', 'label' => 'Patient ID', 'rules' => 'required|trim|is_numeric|has_no_schar', ),
        
      ));


        if($this->input->post('diagnosis_id') == $id){

            $this->model_diagpatients->load($this->input->post('diagnosis_id'));

            if($this->model_diagpatients->patient_id == $this->input->post('patient_id')){

                $this->model_diagpatients->deleteDiagnosis($id);
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