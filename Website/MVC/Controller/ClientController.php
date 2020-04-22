<?php

namespace fitzlucassen\FLFramework\Website\MVC\Controller;

use fitzlucassen\FLFramework\Website\MVC\Model;
use fitzlucassen\FLFramework\Library\Helper;
use fitzlucassen\FLFramework\Library\Adapter;
use fitzlucassen\FLFramework\Data\Repository;
use fitzlucassen\FLFramework\Library\Core;

class ClientController extends Controller
{
	public function __construct($action, $manager)
	{
		parent::__construct("client", $action, $manager);
	}

	public function Index()
	{
		// Une action commencera toujours par l'initilisation de son modèle
		// Cette initialisation doit obligatoirement contenir le repository manager
		$Model = new Model\ClientModel($this->_repositoryManager);

		$Model->_clients = Repository\UserRepository::getAll($this->_repositoryManager->getConnection());

		// Une action finira toujours par un $this->_view->view contenant : 
		// cette fonction prend en paramètre le modèle
		$this->_view->view($Model);
	}

	public function Get($params){
		$id = $params[0];
		$userRepository = $this->_repositoryManager->get('User');
		$user = $userRepository->getById((int)$id);
		$Model = new Model\WebserviceModel($this->_repositoryManager);
		// Process request...
		$Model->result = array(
			'user' => array(
				"id" => $user->getId(),
				"isActive" => $user->getIsActive(),
				"creationDate" => $user->getCreationDate(),
				"isCompany" => $user->getIsCompany(),
				"fromCompany" => $user->getFromCompany(),
				"firstname" => $user->getFirstname(),
				"lastname" => $user->getLastname(),
				"companyName" => $user->getCompanyName(),
				"companySiret" => $user->getCompanySiret(),
				"phoneNumber" => $user->getPhoneNumber(),
				"address" => $user->getAddress(),
				"city" => $user->getCity(),
				"email" => $user->getEmail(),
			)
		);

		$Model->result = json_encode($Model->result);

		$this->setLayout('json');
		$this->setController('webservice');
		$this->setAction('index');
		$this->_view->view($Model, 'json');
	}

	public function Activate(){
		if (Core\Request::isPost() || Core\Request::isPost()) {
			$data = Core\Request::cleanRequest();
			
			$userRepository = $this->_repositoryManager->get('User');
			$user = $userRepository->getById($data["id"]);
			$isActive = $data["isActive"] == "false" ? 0 : 1;

			$userRepository->activate($data["id"], $isActive);

			if($isActive) {
				$password = $this->GenerateRandomString();
				$userRepository->createPassword($data["id"], $password);

				$Email = new Helper\Email();
	
				// On configure l'email
				$Email->from("contact@cocktailcocktail.fr")
						->to($user->getEmail())
						->subject($user->getFromcompany() . " vous crée un compte client")
						->fromName($user->getFromcompany())
						->layout("email")
						->view("default")
						->vars(array(
							"company" => $user->getFromcompany(),
							"email" => $user->getEmail(),
							"password" => $password
						));
	
				// Puis on construit le header et on l'envoi
				$Email->buildHeaders()->send();
			}
		}

		$Model = new Model\WebserviceModel($this->_repositoryManager);
		$Model->result = "{}";
		$this->setLayout('json');
		$this->setController('webservice');
		$this->setAction('index');
		$this->_view->view($Model, 'json');
	}

	public function Add()
	{
		$Model = new Model\ClientModel($this->_repositoryManager);

		if (Core\Request::isPost() || Core\Request::isPost()) {
			// It's a form validation
			// Clean all vars
			$data = Core\Request::cleanRequest();

			if (
				isset($data["isCompany"]) && isset($data["fromCompany"]) && 
				((!Adapter\StringAdapter::isNullOrEmpty($data["firstname"]) && !Adapter\StringAdapter::isNullOrEmpty($data["lastname"])) || 
				(!Adapter\StringAdapter::isNullOrEmpty($data["companyName"]) && !Adapter\StringAdapter::isNullOrEmpty($data["companySiret"]))) && 
				(!Adapter\StringAdapter::isNullOrEmpty($data["email"]) || !Adapter\StringAdapter::isNullOrEmpty($data["phoneNumber"]))
			) {

				$data["creationDate"] = (new \DateTime())->format('Y-m-d H:i:s');
				$data["isActive"] = 0;
				$data["isCompany"] = $data["isCompany"] == "1" ? 1 : 0;
				// Process request...

				$userRepository = $this->_repositoryManager->get('User');
				$userRepository->add($data);
			} else {
				$Model->_message = "Un problème est survenue, veuillez remplir tous les champs marqués d'une étoile";
				$Model->_clients = Repository\UserRepository::getAll($this->_repositoryManager->getConnection());

				$this->_view->setAction("Index");
				$this->_view->view($Model);
			}
		}

		Core\Request::redirectTo("/client");
	}

	public function Update()
	{
		$Model = new Model\ClientModel($this->_repositoryManager);

		if (Core\Request::isPost() || Core\Request::isPost()) {
			// It's a form validation
			// Clean all vars
			$data = Core\Request::cleanRequest();

			if (
				isset($data["isCompany"]) && isset($data["fromCompany"]) && 
				((!Adapter\StringAdapter::isNullOrEmpty($data["firstname"]) && !Adapter\StringAdapter::isNullOrEmpty($data["lastname"])) || 
				(!Adapter\StringAdapter::isNullOrEmpty($data["companyName"]) && !Adapter\StringAdapter::isNullOrEmpty($data["companySiret"]))) && 
				(!Adapter\StringAdapter::isNullOrEmpty($data["email"]) || !Adapter\StringAdapter::isNullOrEmpty($data["phoneNumber"]))
			) {
				$data["isCompany"] = $data["isCompany"] == "1" ? 1 : 0;
				$data["isActive"] = $data["isActive"] == "1" ? 1 : 0;
				// Process request...

				$userRepository = $this->_repositoryManager->get('User');
				$userRepository->update((int)$data["id"], $data);
			} else {
				$Model->_message = "Un problème est survenue, veuillez remplir tous les champs marqués d'une étoile";
				$Model->_clients = Repository\UserRepository::getAll($this->_repositoryManager->getConnection());

				$this->_view->setAction("Index");
				$this->_view->view($Model);
			}
		}

		Core\Request::redirectTo("/client");
	}

	private function GenerateRandomString($length = 10) {
		$characters = '0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ';
		$charactersLength = strlen($characters);
		$randomString = '';
		for ($i = 0; $i < $length; $i++) {
			$randomString .= $characters[rand(0, $charactersLength - 1)];
		}
		return $randomString;
	}
}
