<title>Panel d'administration</title>

<?php
// inclure ci-dessus les balises à inclure dans la balise <head> du layout
$this->endSection('head');
?>
<?php
// inclure ci-dessous les balises à inclure à la fin de votre DOM
$this->beginSection();
?>
<?php
$this->endSection('scripts');
$this->beginSection();

// START CONTENT
// Intégrer ci-dessous la vue
?>
<div class="page" id="home-page">
	<h1 class="center-align">Bienvenue sur votre panel d'administration.</h1>
	<div class="row">
		<div class="col s12 m6">
			<div class="card">
				<div class="card-image center-align">
					<i class="material-icons" style="font-size:140px;">people</i>
					<a class="btn-floating btn-large halfway-fab waves-effect waves-light red" href="/client"><i class="material-icons">add</i></a>
				</div>
				<div class="card-content">
					<span class="card-title">Gérer les clients</span>
					<p>Inscrire de nouveaux clients, consultez votre base de données, contacter un client, approuver ou non les nouveaux clients...etc.</p>
				</div>
			</div>
		</div>
		
		<div class="col s12 m6">
			<div class="card">
				<div class="card-image center-align">
					<i class="material-icons" style="font-size:140px;">business</i>
					<a class="btn-floating btn-large halfway-fab waves-effect waves-light red" href="/devis"><i class="material-icons">add</i></a>
				</div>
				<div class="card-content">
					<span class="card-title">Gérer les devis</span>
					<p>Revisez toutes vos demandes de devis, approuvez les ou rejettez les, consultez les détails des devis, générez...etc.</p>
				</div>
			</div>
		</div>

		<div class="col s12 m6">
			<div class="card">
				<div class="card-image center-align">
					<i class="material-icons" style="font-size:140px;">menu_book</i>
					<a class="btn-floating btn-large halfway-fab waves-effect waves-light red" href="/menu/cocktailcocktail"><i class="material-icons">add</i></a>
				</div>
				<div class="card-content">
					<span class="card-title">Gérer le catalogue Cocktail Cocktail</span>
					<p>Gérer et compléter l'offre de Cocktail Cocktail en ajoutant ou supprimant des plats, des menus, des catégories...etc.</p>
				</div>
			</div>
		</div>
		
		<div class="col s12 m6">
			<div class="card">
				<div class="card-image center-align">
					<i class="material-icons" style="font-size:140px;">menu_book</i>
					<a class="btn-floating btn-large halfway-fab waves-effect waves-light red" href="/menu/lesterrasses"><i class="material-icons">add</i></a>
				</div>
				<div class="card-content">
					<span class="card-title">Gérer le menu des Terrasses de Courbevoie</span>
					<p>Gérer et compléter le menu des Terrasses de Courbevoie en ajoutant ou supprimant des plats, des menus, des catégories...etc.</p>
				</div>
			</div>
		</div>
	</div>
</div>