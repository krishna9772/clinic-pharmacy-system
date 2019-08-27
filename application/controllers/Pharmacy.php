<?php if ( !defined('BASEPATH')) exit('No direct script access allowed');


class Pharmacy extends Admin_Controller
{

	/**
     * Product::__construct()
     *
     */
	public function __construct()
	{

		parent::__construct();

	    $this->not_logged_in();


		$this->data['page_title'] = 'Pharmacy';
	    $this->load->model('model_pharmacy');


	}
     public function index()
    {
	
       if(!in_array('viewPharmacy', $this->permission)) {

			redirect('dashboard', 'refresh');
		}

	  $this->render_template('pharmacy/index',$this->data);
    }

     public function fetchProductData()
     {

     	 $result = array('data' => array());

         $data = $this->model_pharmacy->getProductData();

		foreach ($data as $key=>$value){

		    $buttons = '';
            
             if(in_array('updatePharmacy', $this->permission)) {
    			$buttons .= '<a href="'.base_url('pharmacy/update/'.$value['id']).'" class="btn btn-default"><i class="fa fa-pencil"></i></a>';
            }

			if(in_array('deletePharmacy', $this->permission)) {
				$buttons .= ' <button type="button" class="btn btn-default" onclick="removeFunc('.$value['id'].')" data-toggle="modal" data-target="#removeModal"><i class="fa fa-trash"></i></button>';
			}

			if(in_array('createPharmacy', $this->permission)) {

				$buttons .='<a href="'.base_url('pharmacy/check/'.$value['id']).'" class="btn btn-default" title="Check Availability"><i class="fa fa-file"></i></a>';
			}

			$status = ($value['status'] == 1) ? '<span class="label label-success">Active</span>' : '<span class="label label-warning">Inactive</span>';

		     $buttons .="&nbsp;&nbsp;&nbsp;".$status;


			$result['data'][$key] = array(

				$value['medicine_name'],
				$value['remain_quantity'],
				$value['expire_date'],
				$value['selling_price'],
				$buttons
			
			);

     }

     echo json_encode($result);

   }  
	/**
  *add_product
  *
  */
	public function create()
	{

		 if(!in_array('createPharmacy', $this->permission)){

		 	redirect('dashboard','refresh');

		 }

		$this->form_validation->set_rules('medicine_name', 'Medicine Name', 'trim|required');
		$this->form_validation->set_rules('quantity', 'Quntity', 'trim|required');
		$this->form_validation->set_rules('sell_type', 'Sell Type', 'trim|required');
		$this->form_validation->set_rules('expire_date', 'Expire Date', 'trim|required');
		$this->form_validation->set_rules('status', 'Status','trim|required');
        
        if($this->form_validation->run() == TRUE){
      
		if ($this->input->post())
		{
				unset($_POST['submit']);
				$product = $this->input->post();
				foreach($product as $key => $value)
				$this->model_pharmacy->$key = $value;
				$this->model_pharmacy->save();
				//$this->product->addProductQty($product);
				unset($_POST);
				$this->session->set_flashdata('success', 'Successfully created');
				redirect('pharmacy/create/', 'refresh');
		}else{

			    $this->session->set_flashdata('error', 'Something Went Wrong');
			    redirect('pharmacy/create/', 'refresh');
		}

	   }else{
	        $this->data['error'] = validation_errors('<div class="alert alert-danger">','</div>');
	      }

			$this->data['unit'] = $this->_fill_product_unit();
			$this->render_template('pharmacy/create',$this->data);
		
	}


	/**
  *update_product
  *
  */

	public function update($product_id=0)
	{

		if(!in_array('updatePharmacy', $this->permission)) {

			redirect('dashboard','refresh');
		}

		if(!$product_id) {

			redirect('dashboard','refresh');
		}

		$this->form_validation->set_rules('medicine_name', 'Medicine Name', 'trim|required');
		$this->form_validation->set_rules('quantity', 'Quntity', 'trim|required');
		$this->form_validation->set_rules('sell_type', 'Sell Type', 'trim|required');
		$this->form_validation->set_rules('expire_date', 'Expire Date', 'trim|required');
		$this->form_validation->set_rules('status', 'Status','trim|required');

		if($this->form_validation->run() == TRUE) {

		$this->model_pharmacy->load($product_id);


		if($this->input->post() && $product_id != '')
		{
				unset($_POST['submit']);
				$product = $this->input->post(); 
				foreach($product as $key => $value)
				$this->model_pharmacy->$key = $value;
				$this->model_pharmacy->save();	
				$this->model_pharmacy->updateDate($product_id);

				unset($_POST);

				//$data['script'] = '<script>alert("'.html_escape($this->product->medicine_name). 'has been edited successfuly.");</script>';
			
			$this->session->set_flashdata('success', $this->model_pharmacy->medicine_name.' has been edited successfuly.');
				redirect('pharmacy/update/'.$product_id, 'refresh');

		}else{

			    $this->session->set_flashdata('error', 'Something Went Wrong');
			    redirect('pharmacy/update/'.$product_id, 'refresh');
		}

	   }else{

	        $this->data['error'] = validation_errors('<div class="alert alert-danger">','</div>');
	    }
	      
	
		$this->model_pharmacy->load($product_id);
		$this->data['product'] = $this->model_pharmacy;
	    $this->data['unit'] = $this->_fill_product_unit();


		$this->render_template('pharmacy/edit',$this->data);
	}

	public function delete($product_id=0)
	{

		if(!in_array('deletePatient', $this->permission)) {

			redirect('dashboard','refresh');
		}

		$product_id = $this->input->post('product_id');

        $response = array();
		
        if($product_id) {

            $delete = $this->model_pharmacy->deleteProduct($product_id);
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
	
	public function check()
	{

		$product_id= urldecode($this->uri->segment(3));
		$this->data['product'] = $this->model_pharmacy->getProductData($product_id);

		$this->load->view('pharmacy/check',$this->data);

	}
	
	public function _fill_product_unit()
	{
		return array( 'Bot'=>'Bot',
					  'Stp'=>'Stp',
					  'Tab'=>'Tab',
					  'Box'=>'Box',
					  'Tube'=>'Tube',
					  'Unit'=>'Unit',
					  'Sachet'=>'Sachet',);
	}
}
