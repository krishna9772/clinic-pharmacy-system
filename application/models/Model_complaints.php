<?php

class Model_complaints extends MY_Model 
{

	const DB_TABLE = 'ra_complaint';
	const DB_TABLE_PK = 'id';

    /**
     * 
     * Patient Id
     */
    public $patient_id;

    /**
     * 
     * Complaint
     */
    public $complaint;
    

    public function getComplaintData($patient_id='')
    {

          $this->db->select('*');
          $this->db->from('ra_complaint');
          $this->db->where('patient_id', $patient_id);
          $this->db->where('is_deleted', '0');
          $this->db->order_by('id','desc');
          $this->db->limit(2);
          $query = $this->db->get();
          return $query->result();

    }
 
    public function deleteComplaint($id)
    {

        $data = array(
         'is_deleted' => '1',
         'deleted_date' => date('Y-m-d H:i:s'));

        $this->db->where('id',$id);
        $update = $this->db->update('ra_complaint',$data);
        return($update == true) ? true : false;


    }

    public function getComplaintHint()
    {

     $this->db->select('*');
     $this->db->from('ra_complaint');
    // $this->db->where('LENGTH(complaint)<80',null,false);
     $this->db->group_by('complaint');
     $query = $this->db->get();

     $array = array();

     foreach ($query->result() as $row) 
     {

      $array = explode("</li>",$row->complaint);

      // print_r($array);

      foreach ($array as $key => $value) {

          $array[$key] = strip_tags($value);    

       }  

       array_pop($array);
       
     }
     return $array;  
    }
}