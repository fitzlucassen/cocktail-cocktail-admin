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

	class RequestRepository extends RepositoryBase\RequestRepositoryBase {
		public function __construct($pdo, $lang) {
			parent::__construct($pdo, $lang);
		}

	}
