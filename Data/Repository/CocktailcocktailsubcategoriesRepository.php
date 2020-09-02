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

	class CocktailcocktailsubcategoriesRepository extends RepositoryBase\CocktailcocktailsubcategoriesRepositoryBase {
		public function __construct($pdo, $lang) {
			parent::__construct($pdo, $lang);
		}

		public function add($properties) {
			$query = $this->_queryBuilder->insert("cocktailcocktailsubcategories", array('name' => $properties["name"]))->getQuery();
			try {
				$result = $this->_pdo->Query($query);
				return $this->_pdo->lastInsertId();
			}
			catch(\PDOException $e){
				print $e->getMessage();
			}
			return array();
		}
	}
