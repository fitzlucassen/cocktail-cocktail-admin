<?php

	namespace fitzlucassen\FLFramework\Website\MVC\Model;
	
	class MenuModel extends Model{
		public $_categories = [];
		public $_subcategories = [];

		public function __construct($manager) {
			parent::__construct($manager);
		}
	}
