<?php

namespace fitzlucassen\FLFramework\Website\MVC\Controller;

use fitzlucassen\FLFramework\Website\MVC\Model;
use fitzlucassen\FLFramework\Library\Helper;
use fitzlucassen\FLFramework\Library\Adapter;
use fitzlucassen\FLFramework\Data\Repository;
use fitzlucassen\FLFramework\Library\Core;

/*
		Class : HomeController
		Déscription : Permet de gérer les actions en relation avec le groupe de page Home
	*/
class HomeController extends Controller
{
	public function __construct($action, $manager)
	{
		parent::__construct("home", $action, $manager);
	}

	public function Index()
	{
		// Une action commencera toujours par l'initilisation de son modèle
		// Cette initialisation doit obligatoirement contenir le repository manager
		$Model = new Model\HomeModel($this->_repositoryManager);

		// Une action finira toujours par un $this->_view->view contenant : 
		// cette fonction prend en paramètre le modèle
		$this->_view->view($Model);
	}

	public function Zipcode()
	{
		// Une action commencera toujours par l'initilisation de son modèle
		// Cette initialisation doit obligatoirement contenir le repository manager
		$Model = new Model\HomeModel($this->_repositoryManager);

		$Model->_zipcodezone = Repository\ZipcodezoneRepository::getAll($this->_repositoryManager->getConnection());

		// Une action finira toujours par un $this->_view->view contenant : 
		// cette fonction prend en paramètre le modèle
		$this->_view->view($Model);
	}

	public function AddZipcode()
	{
		$Model = new Model\WebserviceModel($this->_repositoryManager);

		if (Core\Request::isPost() || Core\Request::isPost()) {
			$data = Core\Request::cleanRequest();

			$rep = $this->_repositoryManager->get('zipcodezone');

			$rep->add($data);
		}

		$Model->result = json_encode(array());

		$this->setLayout('json');
		$this->setController('webservice');
		$this->setAction('index');
		$this->_view->view($Model, 'json');
	}

	public function DeleteZipcode()
	{
		$Model = new Model\WebserviceModel($this->_repositoryManager);

		if (Core\Request::isPost() || Core\Request::isPost()) {
			$data = Core\Request::cleanRequest();

			$rep = $this->_repositoryManager->get('zipcodezone');

			$rep->delete((int) $data["id"]);

			// Process request...
			$Model->result = array();
		}

		$Model->result = json_encode($Model->result);

		$this->setLayout('json');
		$this->setController('webservice');
		$this->setAction('index');
		$this->_view->view($Model, 'json');
	}

	public function Error404()
	{
		$Model = new Model\HomeModel($this->_repositoryManager);

		http_response_code(404);

		$this->_view->view($Model);
	}
}
