<?php

namespace fitzlucassen\FLFramework\Website\MVC\Controller;

use fitzlucassen\FLFramework\Website\MVC\Model;
use fitzlucassen\FLFramework\Library\Helper;
use fitzlucassen\FLFramework\Library\Adapter;
use fitzlucassen\FLFramework\Data\Repository;
use fitzlucassen\FLFramework\Library\Adapter\ArrayAdapter;
use fitzlucassen\FLFramework\Library\Core;

/*
		Class : HomeController
		Déscription : Permet de gérer les actions en relation avec le groupe de page Home
	*/

class MenuController extends Controller
{
	public function __construct($action, $manager)
	{
		parent::__construct("menu", $action, $manager);
	}

	public function CocktailCocktail()
	{
		// Une action commencera toujours par l'initilisation de son modèle
		// Cette initialisation doit obligatoirement contenir le repository manager
		$Model = new Model\MenuModel($this->_repositoryManager);

		$Model->_categories = Repository\CocktailcocktailcategoriesRepository::getAll($this->_repositoryManager->getConnection());

		// Une action finira toujours par un $this->_view->view contenant : 
		// cette fonction prend en paramètre le modèle
		$this->_view->view($Model);
	}

	public function Lesterrasses()
	{
		// Une action commencera toujours par l'initilisation de son modèle
		// Cette initialisation doit obligatoirement contenir le repository manager
		$Model = new Model\MenuModel($this->_repositoryManager);

		$Model->_categories = Repository\LesterrassescategoriesRepository::getAll($this->_repositoryManager->getConnection());

		// Une action finira toujours par un $this->_view->view contenant : 
		// cette fonction prend en paramètre le modèle
		$this->_view->view($Model);
	}

	public function LesterrassesGetMeals($params)
	{
		$id = $params[0];
		$repository = $this->_repositoryManager->get('Lesterrassesmeal');
		$meals = $repository->getBy('id_Category', (int) $id);
		$Model = new Model\WebserviceModel($this->_repositoryManager);

		// Process request...
		$Model->result = array();

		foreach ($meals as $meal) {
			array_push($Model->result, array(
				"id" => $meal->getId(),
				"description" => $meal->getDescription(),
				"price" => $meal->getPrice(),
				"id_Category" => $meal->getId_Category(),
				"creationDate" => $meal->getCreationDate(),
			));
		}

		$Model->result = json_encode($Model->result);

		$this->setLayout('json');
		$this->setController('webservice');
		$this->setAction('index');
		$this->_view->view($Model, 'json');
	}

	public function CocktailCocktailGetMenu($params)
	{
		$id = $params[0];
		$repository = $this->_repositoryManager->get('Cocktailcocktailmenu');
		$menus = $repository->getBy('id_Category', (int) $id);
		$Model = new Model\WebserviceModel($this->_repositoryManager);

		// Process request...
		$Model->result = array();

		foreach ($menus as $menu) {
			array_push($Model->result, array(
				"id" => $menu->getId(),
				"name" => $menu->getName(),
				"price" => $menu->getPrice(),
				"creationDate" => $menu->getCreationDate(),
				"image_url" => $menu->getImage_url(),
				"active" => $menu->getActive()
			));
		}

		$Model->result = json_encode($Model->result);

		$this->setLayout('json');
		$this->setController('webservice');
		$this->setAction('index');
		$this->_view->view($Model, 'json');
	}

	public function CocktailCocktailGetSubCategories()
	{
		$subcategories = Repository\CocktailcocktailsubcategoriesRepository::getAll($this->_repositoryManager->getConnection());
		$Model = new Model\WebserviceModel($this->_repositoryManager);

		// Process request...
		$Model->result = array();

		foreach ($subcategories as $subcategory) {
			array_push($Model->result, array(
				"id" => $subcategory->getId(),
				"name" => $subcategory->getName()
			));
		}

		$Model->result = json_encode($Model->result);

		$this->setLayout('json');
		$this->setController('webservice');
		$this->setAction('index');
		$this->_view->view($Model, 'json');
	}

	public function CocktailCocktailGetMealCategories()
	{
		$subcategories = Repository\CocktailcocktailmealcategoryRepository::getAll($this->_repositoryManager->getConnection());
		$Model = new Model\WebserviceModel($this->_repositoryManager);

		// Process request...
		$Model->result = array();

		foreach ($subcategories as $subcategory) {
			array_push($Model->result, array(
				"id" => $subcategory->getId(),
				"name" => $subcategory->getName(),
				"price" => $subcategory->getPrice()
			));
		}

		$Model->result = json_encode($Model->result);

		$this->setLayout('json');
		$this->setController('webservice');
		$this->setAction('index');
		$this->_view->view($Model, 'json');
	}

	public function CocktailCocktailGetMeal($params)
	{
		$id = $params[0];
		$repository = $this->_repositoryManager->get('Cocktailcocktailmenumeal');
		$mealRepository = $this->_repositoryManager->get('Cocktailcocktailmeal');
		$mealCategoryRepository = $this->_repositoryManager->get('Cocktailcocktailmealcategory');
		$subcategoryRepository = $this->_repositoryManager->get('Cocktailcocktailsubcategories');
		$menumeals = $repository->getBy('id_Menu', (int) $id);
		$Model = new Model\WebserviceModel($this->_repositoryManager);

		// Process request...
		$Model->result = array();

		foreach ($menumeals as $menumeal) {
			$mealArray = $mealRepository->getById((int) $menumeal->getId_Meal());
			$mealCategory = $mealCategoryRepository->getById($mealArray->getId_MealCategory());

			$subcategory = $subcategoryRepository->getById((int) $mealArray->getId_Subcategory());

			array_push($Model->result, array(
				"id" => $mealArray->getId(),
				"category" => $subcategory->getName(),
				"id_Category" => $subcategory->getId(),
				"description" => $mealArray->getDescription(),
				"mealCategoryName" => $mealCategory->getName(),
				"mealCategoryPrice" => $mealCategory->getPrice(),
				"mealCategoryId" => $mealCategory->getId(),
				"active" => $mealArray->getActive()
			));
		}

		$Model->result = json_encode($Model->result);

		$this->setLayout('json');
		$this->setController('webservice');
		$this->setAction('index');
		$this->_view->view($Model, 'json');
	}

	public function AddCategory()
	{
		$Model = new Model\WebserviceModel($this->_repositoryManager);

		if (Core\Request::isPost() || Core\Request::isPost()) {
			$data = Core\Request::cleanRequest();

			$categoryRepository = $this->_repositoryManager->get('Cocktailcocktailcategories');

			$categoryRepository->add($data);
			$categories = Repository\CocktailcocktailcategoriesRepository::getAll($this->_repositoryManager->getConnection());

			// Process request...
			$Model->result = array();

			foreach ($categories as $category) {
				array_push($Model->result, array(
					"id" => $category->getId(),
					"name" => $category->getName()
				));
			}
		}

		$Model->result = json_encode($Model->result);

		$this->setLayout('json');
		$this->setController('webservice');
		$this->setAction('index');
		$this->_view->view($Model, 'json');
	}

	public function AddLesTerrassesCategory()
	{
		$Model = new Model\WebserviceModel($this->_repositoryManager);

		if (Core\Request::isPost() || Core\Request::isPost()) {
			$data = Core\Request::cleanRequest();

			$categoryRepository = $this->_repositoryManager->get('Lesterrassescategories');

			$categoryRepository->add($data);
			$categories = Repository\LesterrassescategoriesRepository::getAll($this->_repositoryManager->getConnection());

			// Process request...
			$Model->result = array();

			foreach ($categories as $category) {
				array_push($Model->result, array(
					"id" => $category->getId(),
					"name" => $category->getName()
				));
			}
		}

		$Model->result = json_encode($Model->result);

		$this->setLayout('json');
		$this->setController('webservice');
		$this->setAction('index');
		$this->_view->view($Model, 'json');
	}

	public function AddMenu()
	{
		$Model = new Model\WebserviceModel($this->_repositoryManager);

		if (Core\Request::isPost() || Core\Request::isPost()) {
			$data = Core\Request::cleanRequest();

			$menuRepository = $this->_repositoryManager->get('Cocktailcocktailmenu');

			$data["creationDate"] = (new \DateTime())->format('Y-m-d H:i:s');
			$data["id_Category"] = (int) $data["id_Category"];
			$data["price"] = (float) $data["price"];

			$id = $menuRepository->add($data);
			$menus = $menuRepository->getBy('id_Category', $data["id_Category"]);

			// Process request...
			$Model->result = [
				"menus" => [],
				"id" => $id
			];

			foreach ($menus as $menu) {
				array_push($Model->result['menus'], array(
					"id" => $menu->getId(),
					"name" => $menu->getName(),
					"creationDate" => $menu->getCreationDate(),
					"price" => $menu->getPrice(),
					"image_url" => $menu->getImage_url()
				));
			}
		}

		$Model->result = json_encode($Model->result);

		$this->setLayout('json');
		$this->setController('webservice');
		$this->setAction('index');
		$this->_view->view($Model, 'json');
	}

	public function AddMeal()
	{
		$Model = new Model\WebserviceModel($this->_repositoryManager);

		if (Core\Request::isPost() || Core\Request::isPost()) {
			$data = Core\Request::cleanRequest();

			$mealRepository = $this->_repositoryManager->get('Cocktailcocktailmeal');
			$mealCategoryRepository = $this->_repositoryManager->get('Cocktailcocktailmealcategory');
			$menumealRepository = $this->_repositoryManager->get('Cocktailcocktailmenumeal');
			$subcategoryRepository = $this->_repositoryManager->get('Cocktailcocktailsubcategories');

			// Add or update meal category if there is
			$idMealCategory = null;
			if (!Adapter\StringAdapter::isNullOrEmpty($data["mealCategoryName"]) && !Adapter\StringAdapter::isNullOrEmpty($data["mealCategoryPrice"])) {
				$mealCategory = array(
					"name" => $data["mealCategoryName"],
					"price" => $data["mealCategoryPrice"],
				);

				if (!Adapter\StringAdapter::isNullOrEmpty($data["mealCategoryId"]))
					$mealCategoryRepository->update((int) $data["mealCategoryId"], $mealCategory);
				else
					$idMealCategory = $mealCategoryRepository->add($mealCategory);
			}

			// Then add the meal itself
			if (isset($idMealCategory) && !empty($idMealCategory))
				$data["id_MealCategory"] = (int) $idMealCategory;
			else
				$data["id_MealCategory"] = null;

			$data["creationDate"] = (new \DateTime())->format('Y-m-d H:i:s');
			$data["id_Subcategory"] = (int) $data["id_Subcategory"];
			$data["category"] = $subcategoryRepository->getById($data["id_Subcategory"])->getName();

			$added = $mealRepository->add($data);

			// And finaly link the meal to the menu
			$data["id_Meal"] = (int) $added;
			$data["id_Menu"] = (int) $data["id_Menu"];

			$menumealRepository->add($data);

			$Model->result = $data;
		}

		$Model->result = json_encode($Model->result);

		$this->setLayout('json');
		$this->setController('webservice');
		$this->setAction('index');
		$this->_view->view($Model, 'json');
	}

	public function AddLesTerrassesMeal()
	{
		$Model = new Model\WebserviceModel($this->_repositoryManager);

		if (Core\Request::isPost() || Core\Request::isPost()) {
			$data = Core\Request::cleanRequest();

			$mealRepository = $this->_repositoryManager->get('Lesterrassesmeal');
			$categoryRepository = $this->_repositoryManager->get('Lesterrassescategories');

			$data["creationDate"] = (new \DateTime())->format('Y-m-d H:i:s');
			$data["id_Category"] = (int) $data["id_Category"];
			$data["category"] = $categoryRepository->getById($data["id_Category"])->getName();

			$mealRepository->add($data);

			$Model->result = $data;
		}

		$Model->result = json_encode($Model->result);

		$this->setLayout('json');
		$this->setController('webservice');
		$this->setAction('index');
		$this->_view->view($Model, 'json');
	}

	public function DeleteCategory()
	{
		$Model = new Model\WebserviceModel($this->_repositoryManager);

		if (Core\Request::isPost() || Core\Request::isPost()) {
			$data = Core\Request::cleanRequest();

			$categoryRepository = $this->_repositoryManager->get('Cocktailcocktailcategories');

			$categoryRepository->delete((int) $data["id_Category"]);

			// Process request...
			$Model->result = array();
		}

		$Model->result = json_encode($Model->result);

		$this->setLayout('json');
		$this->setController('webservice');
		$this->setAction('index');
		$this->_view->view($Model, 'json');
	}

	public function DeleteLesTerrassesCategory()
	{
		$Model = new Model\WebserviceModel($this->_repositoryManager);

		if (Core\Request::isPost() || Core\Request::isPost()) {
			$data = Core\Request::cleanRequest();

			$categoryRepository = $this->_repositoryManager->get('Lesterrassescategories');

			$categoryRepository->delete((int) $data["id_Category"]);

			// Process request...
			$Model->result = array();
		}

		$Model->result = json_encode($Model->result);

		$this->setLayout('json');
		$this->setController('webservice');
		$this->setAction('index');
		$this->_view->view($Model, 'json');
	}

	public function DeleteMenu()
	{
		$Model = new Model\WebserviceModel($this->_repositoryManager);

		if (Core\Request::isPost() || Core\Request::isPost()) {
			$data = Core\Request::cleanRequest();

			$menuRepository = $this->_repositoryManager->get('Cocktailcocktailmenu');

			$menuRepository->delete((int) $data["id_Menu"]);

			// Process request...
			$Model->result = array();
		}

		$Model->result = json_encode($Model->result);

		$this->setLayout('json');
		$this->setController('webservice');
		$this->setAction('index');
		$this->_view->view($Model, 'json');
	}

	public function DeleteMeal()
	{
		$Model = new Model\WebserviceModel($this->_repositoryManager);

		if (Core\Request::isPost() || Core\Request::isPost()) {
			$data = Core\Request::cleanRequest();

			$mealRepository = $this->_repositoryManager->get('Cocktailcocktailmeal');

			$mealRepository->delete((int) $data["id_Meal"]);

			// Process request...
			$Model->result = array();
		}

		$Model->result = json_encode($Model->result);

		$this->setLayout('json');
		$this->setController('webservice');
		$this->setAction('index');
		$this->_view->view($Model, 'json');
	}

	public function DeleteLesTerrassesMeal()
	{
		$Model = new Model\WebserviceModel($this->_repositoryManager);

		if (Core\Request::isPost() || Core\Request::isPost()) {
			$data = Core\Request::cleanRequest();

			$mealRepository = $this->_repositoryManager->get('Lesterrassesmeal');

			$mealRepository->delete((int) $data["id_Meal"]);

			// Process request...
			$Model->result = array();
		}

		$Model->result = json_encode($Model->result);

		$this->setLayout('json');
		$this->setController('webservice');
		$this->setAction('index');
		$this->_view->view($Model, 'json');
	}

	public function UpdateMenu()
	{
		$Model = new Model\WebserviceModel($this->_repositoryManager);

		if (Core\Request::isPost() || Core\Request::isPost()) {
			$data = Core\Request::cleanRequest();

			$menuRepository = $this->_repositoryManager->get('Cocktailcocktailmenu');

			$data["creationDate"] = (new \DateTime())->format('Y-m-d H:i:s');
			$data["id"] = (int) $data["id"];
			$data["id_Category"] = (int) $data["id_Category"];
			$data["price"] = (float) $data["price"];

			$menuRepository->update($data["id"], $data);
			$menus = $menuRepository->getBy('id_Category', $data["id_Category"]);

			// Process request...
			$Model->result = array();

			foreach ($menus as $menu) {
				array_push($Model->result, array(
					"id" => $menu->getId(),
					"name" => $menu->getName(),
					"creationDate" => $menu->getCreationDate(),
					"price" => $menu->getPrice(),
					"active" => $menu->getActive()
				));
			}
		}

		$Model->result = json_encode($Model->result);

		$this->setLayout('json');
		$this->setController('webservice');
		$this->setAction('index');
		$this->_view->view($Model, 'json');
	}

	public function UpdateMeal()
	{
		$Model = new Model\WebserviceModel($this->_repositoryManager);

		if (Core\Request::isPost() || Core\Request::isPost()) {
			$data = Core\Request::cleanRequest();

			$mealRepository = $this->_repositoryManager->get('Cocktailcocktailmeal');
			$mealCategoryRepository = $this->_repositoryManager->get('Cocktailcocktailmealcategory');
			$menumealRepository = $this->_repositoryManager->get('Cocktailcocktailmenumeal');
			$subcategoryRepository = $this->_repositoryManager->get('Cocktailcocktailsubcategories');

			// Add or update meal category if there is
			$idMealCategory = (int) $data["mealCategoryId"];
			if (!Adapter\StringAdapter::isNullOrEmpty($data["mealCategoryName"]) && !Adapter\StringAdapter::isNullOrEmpty($data["mealCategoryPrice"])) {
				$mealCategory = array(
					"name" => $data["mealCategoryName"],
					"price" => $data["mealCategoryPrice"],
				);

				if (!Adapter\StringAdapter::isNullOrEmpty($data["mealCategoryId"]))
					$mealCategoryRepository->update((int) $data["mealCategoryId"], $mealCategory);
				else
					$idMealCategory = $mealCategoryRepository->add($mealCategory);
			}

			// Then update the meal itself
			$data["id_MealCategory"] = (int) $idMealCategory;

			$data["creationDate"] = (new \DateTime())->format('Y-m-d H:i:s');
			$data["id_Subcategory"] = (int) $data["id_Subcategory"];
			$data["category"] = $subcategoryRepository->getById($data["id_Subcategory"])->getName();

			$mealRepository->update((int) $data["id"], $data);

			$m = $mealRepository->getById((int) $data["id"]);
			$data['active'] = $m->getActive();
			
			$Model->result = $data;
		}

		$Model->result = json_encode($Model->result);

		$this->setLayout('json');
		$this->setController('webservice');
		$this->setAction('index');
		$this->_view->view($Model, 'json');
	}

	public function UpdateLesTerrassesMeal()
	{
		$Model = new Model\WebserviceModel($this->_repositoryManager);

		if (Core\Request::isPost() || Core\Request::isPost()) {
			$data = Core\Request::cleanRequest();

			$mealRepository = $this->_repositoryManager->get('Lesterrassesmeal');

			$data["creationDate"] = (new \DateTime())->format('Y-m-d H:i:s');
			$data["id_Category"] = (int) $data["id_Category"];

			$mealRepository->update((int) $data["id"], $data);

			$Model->result = $data;
		}

		$Model->result = json_encode($Model->result);

		$this->setLayout('json');
		$this->setController('webservice');
		$this->setAction('index');
		$this->_view->view($Model, 'json');
	}

	public function Activate(){
		if (Core\Request::isPost() || Core\Request::isPost()) {
			$data = Core\Request::cleanRequest();
			
			$menuRepository = $this->_repositoryManager->get('cocktailcocktailmenu');
			$menu = $menuRepository->getById($data["id"]);
			$isActive = $data["isActive"] == "false" ? 0 : 1;

			$menuRepository->activate($data["id"], $isActive);

			$Model = new Model\WebserviceModel($this->_repositoryManager);
			$Model->result = "{}";
			$this->setLayout('json');
			$this->setController('webservice');
			$this->setAction('index');
			$this->_view->view($Model, 'json');
		}
	}

	public function MealActivate(){
		if (Core\Request::isPost() || Core\Request::isPost()) {
			$data = Core\Request::cleanRequest();
			
			$mealRepository = $this->_repositoryManager->get('cocktailcocktailmeal');
			$meal = $mealRepository->getById($data["id"]);
			$isActive = $data["isActive"] == "false" ? 0 : 1;

			$mealRepository->activate($data["id"], $isActive);

			$Model = new Model\WebserviceModel($this->_repositoryManager);
			$Model->result = "{}";
			$this->setLayout('json');
			$this->setController('webservice');
			$this->setAction('index');
			$this->_view->view($Model, 'json');
		}
	}

	public function CocktailCocktailUpload()
	{
		$name = "";

		if (Core\Request::isFile()) {
			// Initialize the upload helper with the upload directory path
			$Upload = new Helper\Upload("upload_test");
			// Give the file and then upload
			$Upload->file($_FILES["files"]);
			$Upload->upload();

			$name = $_FILES["files"]["name"][0];
		}
		if (Core\Request::isPost() || Core\Request::isPost()) {
			$data = Core\Request::cleanRequest();

			$menuRepository = $this->_repositoryManager->get('Cocktailcocktailmenu');
			$menuRepository->addFile($data['menuId'], "/upload_test/" . $name);
			echo "/upload_test/" . $name;
		}
	}
}
