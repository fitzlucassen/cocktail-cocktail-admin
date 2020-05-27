<?php    
    $urlsByLang = fitzlucassen\FLFramework\Library\Core\Router::getUrlsByLang($this->_controller, $this->_action, $this->Model->_params);

    $clientRoute = fitzlucassen\FLFramework\Library\Core\Router::GetUrl("client", "index", null, "fr");
    $devisRoute = fitzlucassen\FLFramework\Library\Core\Router::GetUrl("devis", "index", null, "fr");
    $cocktailCocktailRoute = fitzlucassen\FLFramework\Library\Core\Router::GetUrl("menu", "cocktailcocktail", null, "fr");
    $lesTerrassesRoute = fitzlucassen\FLFramework\Library\Core\Router::GetUrl("menu", "lesterrasses", null, "fr");

    $controller = $this->_controller;
    $action = $this->_action;
?>

<nav>
    <div class="nav-wrapper">
        <a href="/" class="brand-logo">Cocktail Cocktail</a>
        <a href="#" data-target="mobile-demo" class="sidenav-trigger"><i class="material-icons">menu</i></a>
        <ul class="right hide-on-med-and-down">
            <li class="<?php echo $action == "zipcode" ? "active" : "" ?>"><a href="/home/zipcode">Zones</a></li>
            <li class="<?php echo $controller == "client" ? "active" : "" ?>"><a href="/client">Clients</a></li>
            <li class="<?php echo $controller == "devis" ? "active" : "" ?>"><a href="/devis">Devis</a></li>
            <li class="<?php echo $action == "cocktailcocktail" ? "active" : "" ?>"><a href="/menu/cocktailcocktail">Catalogue</a></li>
            <li class="<?php echo $action == "lesterrasses" ? "active" : "" ?>"><a href="/menu/lesterrasses">Menu restaurant</a></li>
        </ul>
    </div>
</nav>

<ul class="sidenav" id="mobile-demo">
    <li><a href="/home/zipcode">Zones</a></li>
    <li><a href="/client">Clients</a></li>
    <li><a href="/devis">Devis</a></li>
    <li><a href="/menu/cocktailcocktail">Catalogue</a></li>
    <li><a href="/menu/lesterrasses">Menu restaurant</a></li>
</ul>