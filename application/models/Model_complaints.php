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
}