<?php

namespace fitzlucassen\FLFramework\Website\MVC\Controller;

use fitzlucassen\FLFramework\Website\MVC\Model;
use fitzlucassen\FLFramework\Library\Helper;
use fitzlucassen\FLFramework\Library\Adapter;
use fitzlucassen\FLFramework\Data\Repository;
use fitzlucassen\FLFramework\Library\Core;

/*
		Class : DevisController
		Déscription : Permet de gérer les actions en relation avec le groupe de page Home
	*/

class DevisController extends Controller
{
	public function __construct($action, $manager)
	{
		parent::__construct("devis", $action, $manager);
	}

	public function Index()
	{
		// Une action commencera toujours par l'initilisation de son modèle
		// Cette initialisation doit obligatoirement contenir le repository manager
		$Model = new Model\DevisModel($this->_repositoryManager);

		$Model->_devis = Repository\RequestRepository::getAll($this->_repositoryManager->getConnection());

		// Une action finira toujours par un $this->_view->view contenant : 
		// cette fonction prend en paramètre le modèle
		$this->_view->view($Model);
	}

	public function Get($params)
	{
		$id = $params[0];
		$requestRepository = $this->_repositoryManager->get('Request');
		$devis = $requestRepository->getById((int) $id);
		$Model = new Model\WebserviceModel($this->_repositoryManager);
		// Process request...
		$Model->result = array(
			'devis' => array(
				"id" => $devis->getId(),
				"creationDate" => $devis->getCreationDate(),
				"isCompany" => $devis->getIsCompany(),
				"fromCompany" => $devis->getFromCompany(),
				"firstname" => $devis->getFirstname(),
				"lastname" => $devis->getLastname(),
				"companyName" => $devis->getCompanyName(),
				"companySiret" => $devis->getCompanySiret(),
				"phoneNumber" => $devis->getPhoneNumber(),
				"eventDate" => $devis->getEventDate(),
				"eventTime" => $devis->getEventTime(),
				"people" => $devis->getPeople(),
				"email" => $devis->getEmail(),
				"message" => $devis->getMessage()
			)
		);

		$Model->result = json_encode($Model->result);

		$this->setLayout('json');
		$this->setController('webservice');
		$this->setAction('index');
		$this->_view->view($Model, 'json');
	}
}
