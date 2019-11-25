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

     $query = $this->db->get('ra_complaint');
    $array = array();

    foreach($query->result() as $row)
    {
        $array[] = htmlspecialchars(strip_tags($row->complaint)); 
    }

    return $array;  

    }
}