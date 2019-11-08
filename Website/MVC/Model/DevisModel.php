<?php

	namespace fitzlucassen\FLFramework\Website\MVC\Model;
	
	class DevisModel extends Model{
		public $_devis = [];
		public $_message = '';

		public function __construct($manager) {
			parent::__construct($manager);
		}
	}
