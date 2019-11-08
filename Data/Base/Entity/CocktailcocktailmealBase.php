<?php 
	/**********************************************************
	 **** File generated by fitzlucassen\DALGenerator tool ****
	 * All right reserved to fitzlucassen repository on github*
	 ************* https://github.com/fitzlucassen ************
	 **********************************************************/
	namespace fitzlucassen\FLFramework\Data\Base\Entity;

	use fitzlucassen\FLFramework\Library\Core;
	use fitzlucassen\FLFramework\Data\Entity;

	class CocktailcocktailmealBase  {
		private $_id;
		private $_id_Subcategory;
		private $_id_MealCategory;
		private $_description;
		private $_queryBuilder;

		public function __construct($id = '', $id_Subcategory = '', $id_MealCategory = '', $description = ''){
			$this->_queryBuilder = new Core\QueryBuilder(true);
			$this->fillObject(array("id" => $id, "id_Subcategory" => $id_Subcategory, "id_MealCategory" => $id_MealCategory, "description" => $description));
		}

		/***********
		 * GETTERS *
		 ***********/
		public function getId() {
			return $this->_id;
		}
		public function getId_Subcategory() {
			return $this->_id_Subcategory;
		}
		public function getId_MealCategory() {
			return $this->_id_MealCategory;
		}
		public function getDescription() {
			return $this->_description;
		}
		/*******
		 * END *
		 *******/

		public function fillObject($properties) {
			if(!empty($properties["id"]))
				$this->_id = $properties["id"];
			if(!empty($properties["id_Subcategory"]))
				$this->_id_Subcategory = $properties["id_Subcategory"];
			if(!empty($properties["id_MealCategory"]))
				$this->_id_MealCategory = $properties["id_MealCategory"];
			if(!empty($properties["description"]))
				$this->_description = $properties["description"];
		}
	}