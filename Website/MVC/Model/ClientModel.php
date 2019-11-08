<?php

	namespace fitzlucassen\FLFramework\Website\MVC\Model;
	
	class ClientModel extends Model{
		public $_clients = [];
		public $_message = '';

		public function __construct($manager) {
			parent::__construct($manager);
		}
	}
