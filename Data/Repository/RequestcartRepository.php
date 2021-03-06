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

	class RequestcartRepository extends RepositoryBase\RequestcartRepositoryBase {
		public function __construct($pdo, $lang) {
			parent::__construct($pdo, $lang);
		}

		public function deleteByRequestId($id) {
			$query = $this->_queryBuilder->delete("requestcart")
											->where(array(array("link" => "", "left" => "id_Request", "operator" => "=", "right" => $id )))
											->getQuery();
			try {
				return $this->_pdo->Query($query);
			}
			catch(\PDOException $e){
				print $e->getMessage();
			}
			return array();
		}
	}
