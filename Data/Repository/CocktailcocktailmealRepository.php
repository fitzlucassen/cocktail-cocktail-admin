<?php 
	/**********************************************************
	 **** File generated by fitzlucassen\DALGenerator tool ****
	 * All right reserved to fitzlucassen repository on github*
	 ************* https://github.com/fitzlucassen ************
	 **********************************************************/
	namespace fitzlucassen\FLFramework\Data\Repository;

	use fitzlucassen\FLFramework\Library\Core;
	use fitzlucassen\FLFramework\Data\Entity;
	use fitzlucassen\FLFramework\Data\Base\Entity as EntityBase;
	use fitzlucassen\FLFramework\Data\Base\Repository as RepositoryBase;

	class CocktailcocktailmealRepository extends RepositoryBase\CocktailcocktailmealRepositoryBase {
		public function __construct($pdo, $lang) {
			parent::__construct($pdo, $lang);
		}

		public function add($properties) {
			$array = array('id_Subcategory' => $properties["id_Subcategory"], 'description' => $properties["description"]);
			if(isset($properties["id_MealCategory"]) && !empty($properties["id_MealCategory"]))
				$array['id_MealCategory'] = $properties["id_MealCategory"];

			$query = $this->_queryBuilder->insert("cocktailcocktailmeal", $array)->getQuery();
			try {
				$result = $this->_pdo->Query($query);
				return $this->_pdo->lastInsertId();
			}
			catch(PDOException $e){
				print $e->getMessage();
			}
			return array();
		}
	}
