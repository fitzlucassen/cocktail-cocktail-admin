<?php 
	/**********************************************************
	 **** File generated by fitzlucassen\DALGenerator tool ****
	 * All right reserved to fitzlucassen repository on github*
	 ************* https://github.com/fitzlucassen ************
	 **********************************************************/
	namespace fitzlucassen\FLFramework\Data\Base\Repository;

	use fitzlucassen\FLFramework\Library\Core;
	use fitzlucassen\FLFramework\Data\Entity;
	use fitzlucassen\FLFramework\Data\Base\Entity as EntityBase;

	class RequestRepositoryBase  {
		protected $_pdo;
		protected $_lang;
		protected $_pdoHelper;
		protected $_queryBuilder;

		public function __construct($pdo, $lang) {
			$this->_pdoHelper = $pdo;
			$this->_pdo = $pdo->getConnection();
			$this->_queryBuilder = new Core\QueryBuilder(true);
			$this->_lang = $lang;
		}

		/**************************
		 * REPOSITORIES FUNCTIONS *
		 **************************/
		public static function getAll($Connection) {
			$qb = new Core\QueryBuilder(true);
			$query = $qb->select()->from(array("request"))->getQuery();
			try {
				$result = $Connection->selectTable($query);
				$array = array();
				foreach ($result as $object){
					$o = new Entity\Request();
					$o->fillObject($object);
					$array[] = $o;
				}
				return $array;
			}
			catch(PDOException $e){
				print $e->getMessage();
			}
			return array();
		}

		public function getById($id) {
			$query = $this->_queryBuilder->select()->from(array("request"))
											->where(array(array("link" => "", "left" => "id", "operator" => "=", "right" => $id)))->getQuery();
			try {
				$properties = $this->_pdoHelper->select($query);
				$object = new Entity\Request();
				$object->fillObject($properties);
				return $object;
			}
			catch(PDOException $e){
				print $e->getMessage();
			}
			return array();
		}

		public function getBy($key, $value) {
			$query = $this->_queryBuilder->select()->from(array("request"))
											->where(array(array("link" => "", "left" => $key, "operator" => "=", "right" => $value)))->getQuery();
			try {
				$properties = $this->_pdoHelper->selectTable($query);
				$array = array();
				foreach ($properties as $object){
					$o = new Entity\Request();
					$o->fillObject($object);
					$array[] = $o;
				}
				return $array;
			}
			catch(PDOException $e){
				print $e->getMessage();
			}
			return array();
		}

		public function delete($id) {
			$query = $this->_queryBuilder->delete("request")
											->where(array(array("link" => "", "left" => "id", "operator" => "=", "right" => $id )))
											->getQuery();
			try {
				return $this->_pdo->Query($query);
			}
			catch(PDOException $e){
				print $e->getMessage();
			}
			return array();
		}

		public function add($properties) {
			$query = $this->_queryBuilder->insert("request", array('id_User' => $properties["id_User"], 'isCompany' => $properties["isCompany"], 'companyName' => $properties["companyName"], 'companySiret' => $properties["companySiret"], 'firstname' => $properties["firstname"], 'lastname' => $properties["lastname"], 'phoneNumber' => $properties["phoneNumber"], 'email' => $properties["email"], 'fromCompany' => $properties["fromCompany"], 'message' => $properties["message"], 'zone' => $properties["zone"], 'eventZipcode' => $properties["eventZipcode"], 'eventDate' => $properties["eventDate"], 'eventTime' => $properties["eventTime"], 'people' => $properties["people"], 'isCommand' => $properties["isCommand"], 'creationDate' => $properties["creationDate"], 'isProcessed' => $properties["isProcessed"], ))->getQuery();
			try {
				return $this->_pdo->Query($query);
			}
			catch(PDOException $e){
				print $e->getMessage();
			}
			return array();
		}

		public function update($id, $properties) {
			$query = $this->_queryBuilder->update("request", array('id_User' => $properties["id_User"], 'isCompany' => $properties["isCompany"], 'companyName' => $properties["companyName"], 'companySiret' => $properties["companySiret"], 'firstname' => $properties["firstname"], 'lastname' => $properties["lastname"], 'phoneNumber' => $properties["phoneNumber"], 'email' => $properties["email"], 'fromCompany' => $properties["fromCompany"], 'message' => $properties["message"], 'zone' => $properties["zone"], 'eventZipcode' => $properties["eventZipcode"], 'eventDate' => $properties["eventDate"], 'eventTime' => $properties["eventTime"], 'people' => $properties["people"], 'isCommand' => $properties["isCommand"], 'creationDate' => $properties["creationDate"], 'isProcessed' => $properties["isProcessed"], ))->where(array(array("link" => "", "left" => "id", "operator" => "=", "right" => $id )))->getQuery();
			try {
				return $this->_pdo->Query($query);
			}
			catch(PDOException $e){
				print $e->getMessage();
			}
			return array();
		}
		/*******
		 * END *
		 *******/

	}
