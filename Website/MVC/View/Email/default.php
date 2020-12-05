<title> </title>
<style>
	h1 {
		font-family: "latobold";
		color: #F90F80;
		padding: 2% 0;
		font-weight: normal;
		font-size: 18px;
		letter-spacing: 2px;
	}
	p, ul li{
		font-family: "latobold";
		font-size: 12px;
	}
</style>
<?php
// inclure ci-dessus les balises à inclure dans la balise <head> du layout
$this->endSection('head');
?>
<?php
// inclure ci-dessous les balises à inclure à la fin de votre DOM
$this->beginSection();
?>
<div class="page">
	<h1><?php echo $this->Model['company']; ?> vient de vous créer un compte client</h1>
	<p>A partir d'aujourd'hui, vous pourrez passez commande sur le site plus facilement</p>
	<p>Grâce aux identifiants suivant, votre devis sera directement considéré comme une commande :</p>
	<ul>
		<li>Identifiant : <?php echo $this->Model['email']; ?></li>
		<li>Mot de passe : <?php echo $this->Model['password']; ?></li>
	</ul>
	<br />
	<p>Merci pour votre confiance et à très bientôt.</p>
</div>