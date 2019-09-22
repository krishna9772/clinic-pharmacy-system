<?php

class Model_medpatients extends My_Model {

	const DB_TABLE = 'ra_med_patient';
	const DB_TABLE_PK = 'med_patient_id';

	 /**
     * patient id
     * @var int
     */
    public $patient_id;

    /**
     * medicine id
     * @var int
     */
    public $med_id;

    /**
     * quantity
     * @var int
     */
    public $quantity;

    /**
     * Total Cost
     * @var int
     */
    public $total_cost;

    /**
     * assign date
     * @var int
     */
    public $assign_date;


}