<?php

defined('BASEPATH') OR exit('No direct script access allowed');

class Patients extends Admin_Controller
{


	public function __construct()
	{

		parent::__construct();

		$this->not_logged_in();

		$this->data['page_title'] = 'Patients';

		$this->load->model('model_patients');
		$this->load->model('model_complaints');					
		
	}

	public function index()
	{

		if(!in_array('viewPatient', $this->permission)) {

			redirect('dashboard', 'refresh');
		}

		$this->render_template('patients/index',$this->data);
	}

	public function fetchPatientData()
	{

		$result = array('data' => array());
        
		$data = $this->model_patients->getPatientData();

		foreach ($data as $key=>$value){

		    $buttons = '';
            
             if(in_array('updatePatient', $this->permission)) {
    			$buttons .= '<a href="'.base_url('patients/update/'.$value['id']).'" class="btn btn-default"><i class="fa fa-pencil"></i></a>';
            }

			if(in_array('deletePatient', $this->permission)) {
				$buttons .= ' <button type="button" class="btn btn-default" onclick="removeFunc('.$value['id'].')" data-toggle="modal" data-target="#removeModal"><i class="fa fa-trash"></i></button>';
			}

			if(in_array('createPatient', $this->permission)) {

				$buttons .='<a href="'.base_url('patients/panel/'.$value['id']).'" class="btn btn-default"><i class="fa fa-file"></i></a>';
			}

			$gender = ($value['gender'] == 1) ? '<span class="label label-success">Male</span>' : '<span class="label label-warning">Female</span>';

			$result['data'][$key] = array(
				$value['id'],
				$value['name'],
				$value['age'],
				$gender,
				$value['address'],
				$buttons
			);

		}

		echo json_encode($result);

	}

	public function create()
	{

		 if(!in_array('createPatient', $this->permission)){

		 	redirect('dashboard','refresh');

		 }

        $this->form_validation->set_rules('name', 'Name', 'trim|required');
		$this->form_validation->set_rules('gender', 'Gender', 'trim|required');
		$this->form_validation->set_rules('age', 'Age', 'trim|required');
		$this->form_validation->set_rules('address', 'Address', 'trim|required');

		if ($this->form_validation->run() == TRUE) {

             $data = array(
               
               'name' => $this->input->post('name'),
               'age'  => $this->input->post('age'),
               'gender' => $this->input->post('gender'),
               'address' => $this->input->post('address'),
              
             );

             	$patient_id = $this->model_patients->create($data);

             	if($patient_id) {

             	$this->session->set_flashdata('success','Saved Successfully');
             	redirect('patients/panel/'.$patient_id);

             	}else{

                $this->session->set_flashdata('errors', 'Error occurred!!');
        		redirect('patients/create/', 'refresh');
             	}
             }

            $this->data['error'] = validation_errors('<div class="alert alert-danger">','</div>');


		 $this->render_template('patients/create',$this->data);
	}

	public function panel($patient_id=0)
	{


		if(!in_array('createPatient', $this->permission)){

           redirect('dashboard','refresh');

		}

		if(!$patient_id) {

			redirect('dashboard','refresh');
		}

        $this->data['complaint']    = $this->model_complaints->get_by_fkey('patient_id',$patient_id,'desc',0);
        $this->data['patient_data'] = $this->model_patients->getPatientData($patient_id);

        $this->render_template('patients/panel',$this->data);

	}

	public function update($patient_id)
	{

		if(!in_array('updatePatient', $this->permission)) {

			redirect('dashboard','refresh');
		}

		if(!$patient_id) {

			redirect('dashboard','refresh');
		}

		$this->form_validation->set_rules('name', 'Name', 'trim|required');
		$this->form_validation->set_rules('gender', 'Gender', 'trim|required');
		$this->form_validation->set_rules('age', 'Age', 'trim|required');
		$this->form_validation->set_rules('address', 'Address', 'trim|required');


		if ($this->form_validation->run() == TRUE) {
            $data = array(
              
              'name' => $this->input->post('name'),
              'age'  => $this->input->post('age'),
              'gender' => $this->input->post('gender'),
              'address' => $this->input->post('address'),
             
            );

            $update = $this->model_patients->update($data,$patient_id);

            if($update == true) {
                $this->session->set_flashdata('success', 'Successfully updated');
                redirect('patients/', 'refresh');
            }
            else {
                $this->session->set_flashdata('errors', 'Error occurred!!');
                redirect('patients/edit/'.$patient_id, 'refresh');
            }

       }     
               $this->data['patient_data'] = $this->model_patients->getPatientData($patient_id);
               $this->render_template('patients/edit',$this->data);


	}

	public function delete()
	{

		if(!in_array('deletePatient', $this->permission)) {

			redirect('dashboard','refresh');
		}

		$patient_id = $this->input->post('patient_id');

		 $response = array();

        if($patient_id) {
            $delete = $this->model_patients->delete($patient_id);
            if($delete == true) {
                $response['success'] = true;
                $response['messages'] = "Successfully removed"; 
            }
            else {
                $response['success'] = false;
                $response['messages'] = "Error in the database while removing the product information";
            }
        }else {
            $response['success'] = false;
            $response['messages'] = "Refersh the page again!!";
        }

        echo json_encode($response);
	}

}