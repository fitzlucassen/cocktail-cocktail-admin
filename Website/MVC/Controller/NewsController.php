<?php

namespace fitzlucassen\FLFramework\Website\MVC\Controller;

use fitzlucassen\FLFramework\Website\MVC\Model;
use fitzlucassen\FLFramework\Library\Helper;
use fitzlucassen\FLFramework\Library\Adapter;
use fitzlucassen\FLFramework\Data\Repository;
use fitzlucassen\FLFramework\Library\Core;

class NewsController extends Controller
{
	public function __construct($action, $manager)
	{
		parent::__construct("news", $action, $manager);
	}

	public function Index()
	{
		// Une action commencera toujours par l'initilisation de son modèle
		// Cette initialisation doit obligatoirement contenir le repository manager
		$Model = new Model\HomeModel($this->_repositoryManager);

		$Model->_news = Repository\NewsRepository::getAll($this->_repositoryManager->getConnection());

		// Une action finira toujours par un $this->_view->view contenant : 
		// cette fonction prend en paramètre le modèle
		$this->_view->view($Model);
	}

	public function Get($params)
	{
		$id = $params[0];
		$currentNews = $this->GetDataFromRequest($id);

		$Model = new Model\WebserviceModel($this->_repositoryManager);

		// Process request...
		$Model->result = array(
			'news' => $currentNews
		);

		$Model->result = json_encode($Model->result);

		$this->setLayout('json');
		$this->setController('webservice');
		$this->setAction('index');
		$this->_view->view($Model, 'json');
	}

	function GetDataFromRequest($newsId)
	{
		$newsRepository = $this->_repositoryManager->get('News');

		$news = $newsRepository->getById((int) $newsId);

		return [
			"id" => $news->getId(),
			"title" => $news->getTitle(),
			"description" => $news->getDescription(),
			"creationDate" => $news->getCreationdate(),
			"fromCompany" => $news->getFromcompany()
		];
	}

	public function Add() {
		$Model = new Model\HomeModel($this->_repositoryManager);

		if (Core\Request::isPost() || Core\Request::isPost()) {
			// It's a form validation
			// Clean all vars
			$data = Core\Request::cleanRequest();

			$newsRepository = $this->_repositoryManager->get('News');

			$data["creationDate"] = (new \DateTime())->format('Y-m-d H:i:s');
			$newsRepository->add($data);
		} else {
			$Model->_message = "Un problème est survenue, veuillez remplir tous les champs marqués d'une étoile";
			$Model->_news = Repository\NewsRepository::getAll($this->_repositoryManager->getConnection());

			$this->_view->setAction("Index");
			$this->_view->view($Model);
		}

		Core\Request::redirectTo("/news");
	}

	public function Update()
	{
		$Model = new Model\HomeModel($this->_repositoryManager);

		if (Core\Request::isPost() || Core\Request::isPost()) {
			// It's a form validation
			// Clean all vars
			$data = Core\Request::cleanRequest();

			$newsRepository = $this->_repositoryManager->get('News');
			$newsRepository->update((int)$data["id"], $data);
		} else {
			$Model->_message = "Un problème est survenue, veuillez remplir tous les champs marqués d'une étoile";
			$Model->_news = Repository\NewsRepository::getAll($this->_repositoryManager->getConnection());

			$this->_view->setAction("Index");
			$this->_view->view($Model);
		}

		Core\Request::redirectTo("/news");
	}
}
