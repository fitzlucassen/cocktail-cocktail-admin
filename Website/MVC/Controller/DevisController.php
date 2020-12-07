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

		$requests = Repository\RequestRepository::getAll($this->_repositoryManager->getConnection());

		$Model->_devis = [];

		foreach ($requests as $key => $request) {
			$currentDevis = $this->GetDataFromRequest($request->getId());

			// Push in $Model->_devis
			array_push($Model->_devis, $currentDevis);
		}

		// Une action finira toujours par un $this->_view->view contenant : 
		// cette fonction prend en paramètre le modèle
		$this->_view->view($Model);
	}

	private function GetDataFromRequest($idRequest) {
		$userRepository = $this->_repositoryManager->get('User');
		$requestCartRepository = $this->_repositoryManager->get('Requestcart');
		$menuRepository = $this->_repositoryManager->get('Cocktailcocktailmenu');
		$mealRepository = $this->_repositoryManager->get('Cocktailcocktailmeal');
		$requestRepository = $this->_repositoryManager->get('Request');
		$mealCategoryRepository = $this->_repositoryManager->get('Cocktailcocktailmealcategory');
		$request = $requestRepository->getById((int) $idRequest);

		$currentDevis = [
			"id" => $request->getId(),
			"isCompany" => $request->getIscompany(),
			"companyName" => $request->getCompanyname(),
			"companySiret" => $request->getCompanysiret(),
			"firstname" => $request->getFirstname(),
			"lastname" => $request->getLastname(),
			"phoneNumber" => $request->getPhonenumber(),
			"email" => $request->getEmail(),
			"fromCompany" => $request->getFromcompany(),
			"message" => $request->getMessage(),
			"eventDate" => $request->getEventdate(),
			"eventTime" => $request->getEventtime(),
			"people" => $request->getPeople(),
			"isCommand" => $request->getIscommand(),
			"creationDate" => $request->getCreationdate(),
			"zone" => $request->getZone(),
			"eventZipcode" => $request->getEventzipcode(),
			"cart" => []
		];
		
		$userId = $request->getId_User();
		$requestCart = $requestCartRepository->getBy("id_Request", $request->getId());

		if(isset($requestCart) && is_array($requestCart) && count($requestCart) > 0) {
			$price = 0;
			$quantity = 0;
			$requestZone = $request->getZone();

			// Get Menu Info
			foreach ($requestCart as $key => $menuMeal) {
				$idMenu = $menuMeal->getId_menu();
				$idMeal = $menuMeal->getId_meal();

				$menu = $menuRepository->getById($idMenu);
				$meal = $mealRepository->getById($idMeal);
				$mealCategory = $mealCategoryRepository->getById($meal->getId_Mealcategory());

				if(!isset($currentDevis["cart"][$idMenu]))
					$currentDevis["cart"][$idMenu] = [
						"menu" => $menu,
						"price" => $menu->getPrice()
					];

				if(isset($mealCategory)) {
					$currentDevis["cart"][$idMenu]["price"] += ($mealCategory->getPrice() * $menuMeal->getQuantity());
				}
					
				if(!isset($currentDevis["cart"][$idMenu]["meals"]))
					$currentDevis["cart"][$idMenu]["meals"] = [];

				array_push($currentDevis["cart"][$idMenu]["meals"], [
					"meal" => $meal,
					"quantity" => $menuMeal->getQuantity()
				]);
			}

			if(isset($requestZone) && !empty($requestZone)){
				$quantity = $request->getPeople();
				if($quantity > 7){
					$price = ($requestZone == 1 ? 0 : ($requestZone == 2 ? 15 : -1));
				}
				else {
					$price = ($requestZone == 1 ? 20 : ($requestZone == 2 ? 30 : -1));
				}
			}

			$currentDevis["isCommand"] = true;
			$currentDevis["fees"] = $price;
		}
		if(isset($userId) && !empty($userId)){
			$user = $userRepository->getById($userId);

			$currentDevis["userId"] = $userId;
			$currentDevis["isCompany"] = $user->getIscompany();
			$currentDevis["companyName"] = $user->getCompanyname();
			$currentDevis["companySiret"] = $user->getCompanySiret();
			$currentDevis["firstname"] = $user->getFirstname();
			$currentDevis["lastname"] = $user->getLastname();
			$currentDevis["phoneNumber"] = $user->getPhonenumber();
			$currentDevis["email"] = $user->getEmail();
			$currentDevis["fromCompany"] = $user->getFromcompany();
			$currentDevis["address"] = $user->getAddress();
			$currentDevis["city"] = $user->getCity();
			$currentDevis["zipcode"] = $user->getZipcode();
		}

		return $currentDevis;
	}

	public function SendCommand($params){
		$id = $params[0];
		$currentDevis = $this->GetDataFromRequest($id);
		$currentDevis["projectName"] = "Bon de commande";

		$pdf = new \Spipu\Html2Pdf\Html2Pdf("p","A4","fr");
		$pdf->pdf->SetAuthor('Cocktail-Cocktail');
		$pdf->pdf->SetTitle('Bon de commande numéro ' . $id);
		$pdf->pdf->SetSubject('Descriptif de la commande');
		$pdf->pdf->SetKeywords('Commande, Devis, Client');

		$content = $this->_view->getView("pdf", "commande", $currentDevis);

		$pdf->writeHTML($content);

		ob_end_clean();
		$pdf->Output('Devis.pdf');
	}

	public function Get($params)
	{
		$id = $params[0];
		$currentDevis = $this->GetDataFromRequest($id);

		$currentDevis['creationTime'] = explode(' ', $currentDevis['creationDate'])[1];
		$currentDevis['creationDateDate'] = explode(' ', $currentDevis['creationDate'])[0];

		$Model = new Model\WebserviceModel($this->_repositoryManager);

		// Process request...
		$Model->result = array(
			'devis' => $currentDevis
		);

		$Model->result = json_encode($Model->result);

		$this->setLayout('json');
		$this->setController('webservice');
		$this->setAction('index');
		$this->_view->view($Model, 'json');
	}

	public function CreateClient($params){
		$id = $params[0];
		$currentDevis = $this->GetDataFromRequest($id);

		$data = [
			"address" => $this->IsNullOrEmpty($currentDevis['address']) ? "" : $currentDevis['address'],
			"zipcode" => $this->IsNullOrEmpty($currentDevis['zipcode']) ? "" : $currentDevis['zipcode'],
			"city" => $this->IsNullOrEmpty($currentDevis['city']) ? "" : $currentDevis['city'],
			"fromCompany" => $this->IsNullOrEmpty($currentDevis['fromCompany']) ? "" : $currentDevis['fromCompany'],
			"isCompany" => $currentDevis['isCompany'] == 1 ? 1 : 0,
			"companyName" => $this->IsNullOrEmpty($currentDevis['companyName']) ? "" : $currentDevis['companyName'],
			"companySiret" => $this->IsNullOrEmpty($currentDevis['companySiret']) ? "" : $currentDevis['companySiret'],
			"firstname" => $this->IsNullOrEmpty($currentDevis['firstname']) ? "" : $currentDevis['firstname'],
			"lastname" => $this->IsNullOrEmpty($currentDevis['lastname']) ? "" : $currentDevis['lastname'],
			"phoneNumber" => $this->IsNullOrEmpty($currentDevis['phoneNumber']) ? "" : $currentDevis['phoneNumber'],
			"email" => $this->IsNullOrEmpty($currentDevis['email']) ? "" : $currentDevis['email'],
			"isActive" => 0,
			"creationDate" => $this->IsNullOrEmpty($currentDevis['creationDate']) ? "" : $currentDevis['creationDate']
		];

		$userRepository = $this->_repositoryManager->get('User');
		$devisRepository = $this->_repositoryManager->get('Request');
		
		$userId = $userRepository->add($data);
		$devisRepository->addUserId($id, $userId);

		$Model = new Model\WebserviceModel($this->_repositoryManager);

		// Process request...
		$Model->result = array(
			'userId' => $userId
		);
		$Model->result = json_encode($Model->result);
		$this->setLayout('json');
		$this->setController('webservice');
		$this->setAction('index');
		$this->_view->view($Model, 'json');
	}

	function IsNullOrEmpty($str){
		return (!isset($str) || trim($str) === '');
	}
}
