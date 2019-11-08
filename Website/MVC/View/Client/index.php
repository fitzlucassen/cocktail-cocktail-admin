<title>Clients - Panel d'administration</title>

<?php
// inclure ci-dessus les balises à inclure dans la balise <head> du layout
$this->endSection('head');
?>
<?php
// inclure ci-dessous les balises à inclure à la fin de votre DOM
$this->beginSection();
?>
<script>
    document.addEventListener('DOMContentLoaded', function() {
        <?php if (!empty($this->Model->_message)) { ?>
            M.toast({
                html: "<?php echo $this->Model->_message; ?>"
            });
        <?php } ?>
        <?php if (!empty($this->Model->_message)) { ?>
            modal[0].open();
        <?php } ?>
    });
</script>
<?php
$this->endSection('scripts');
$this->beginSection();

// START CONTENT
// Intégrer ci-dessous la vue
?>
<div class="page" id="client-page">
    <h1 class="center-align">Vos clients</h1>
    <div class="row">
        <div class="col m2"></div>
        <div class="card col m8">
            <div class="collection">
                <?php
                foreach ($this->Model->_clients as $client) {
                    ?>
                    <a href="#!" class="collection-item avatar valign-wrapper" data-id="<?php echo $client->getId(); ?>">
                        <i class="material-icons circle">people</i>
                        <span class="title">
                            <b>
                                <?php echo $client->getIsCompany() ? $client->getCompanyName() : $client->getFirstname() . " " . $client->getLastName(); ?>
                            </b>
                            <span class="new badge" data-badge-caption=""><?php echo $client->getFromCompany(); ?></span>
                        </span>
                        <p style="color:black;">
                            inscrit le
                            <b>
                                <?php echo $client->getCreationDate(); ?>
                            </b><br />
                            <!-- Switch -->
                            <div class="switch">
                                <label>
                                    Client non validé
                                    <input type="checkbox" <?php echo $client->getIsActive() ? "checked" : "" ?> class="activate" data-id="<?php echo $client->getId(); ?>">
                                    <span class="lever"></span>
                                    Client validé
                                </label>
                            </div>
                        </p>
                    </a>
                <?php
                }
                ?>
            </div>
        </div>
        <div class="col m2"></div>
    </div>

    <div class="fixed-action-btn">
        <a class="btn-floating btn-large red pulse modal-trigger" href="#modal1" id="openModal">
            <i class="large material-icons">add</i>
        </a>
    </div>

    <!-- Modal Structure -->
    <div id="modal1" class="modal">
        <div class="modal-content">
            <h4>Créer un nouveau client</h4>
            <div class="row" style="margin-bottom: 0;">
                <form action="/client/add" method="POST" class="col s12">
                    <div class="row">
                        <p class="col s12">
                            <label>
                                <input name="isCompany" id="itsCompany" type="radio" value="1" <?php echo isset($_POST["isCompany"]) && $_POST["isCompany"] == "1" ? "checked" : ""; ?> />
                                <span>Entreprise</span>
                            </label>
                            <label>
                                <input name="isCompany" id="itsPersonal" type="radio" value="0" <?php echo isset($_POST["isCompany"]) && $_POST["isCompany"] == "0" ? "checked" : ""; ?> />
                                <span>Particulier</span>
                            </label>
                        </p>
                        <div class="input-field col s6 company-fields">
                            <i class="material-icons prefix teal-text">business</i>
                            <input id="companyName" name="companyName" type="text" class="validate" value="<?php echo isset($_POST["companyName"]) ? $_POST["companyName"] : ""; ?>">
                            <label for="companyName">Nom de l'entreprise*</label>
                        </div>
                        <div class="input-field col s6 company-fields">
                            <i class="material-icons prefix teal-text">business</i>
                            <input id="companySiret" name="companySiret" type="text" class="validate" value="<?php echo isset($_POST["companySiret"]) ? $_POST["companySiret"] : ""; ?>">
                            <label for="companySiret">Siret*</label>
                        </div>
                        <div class="input-field col s6 personal-fields">
                            <i class="material-icons prefix teal-text">account_circle</i>
                            <input id="firstname" name="firstname" type="text" class="validate" value="<?php echo isset($_POST["firstname"]) ? $_POST["firstname"] : ""; ?>">
                            <label for="firstname">Prénom*</label>
                        </div>
                        <div class="input-field col s6 personal-fields">
                            <i class="material-icons prefix teal-text">account_circle</i>
                            <input id="lastname" name="lastname" type="text" class="validate" value="<?php echo isset($_POST["lastname"]) ? $_POST["lastname"] : ""; ?>">
                            <label for="lastname">Nom*</label>
                        </div>
                    </div>
                    <div class="row">
                        <h5>Coordonnées...</h5>
                        <div class="input-field col s6">
                            <i class="material-icons prefix teal-text">near_me</i>
                            <input id="address" name="address" type="text" class="validate" value="<?php echo isset($_POST["address"]) ? $_POST["address"] : ""; ?>" required>
                            <label for="address">Adresse*</label>
                        </div>
                        <div class="input-field col s6">
                            <i class="material-icons prefix teal-text">near_me</i>
                            <input id="city" name="city" type="text" class="validate" value="<?php echo isset($_POST["city"]) ? $_POST["city"] : ""; ?>" required>
                            <label for="city">Ville*</label>
                        </div>
                        <div class="input-field col s6">
                            <i class="material-icons prefix teal-text">mail</i>
                            <input id="email" name="email" type="email" class="validate" value="<?php echo isset($_POST["email"]) ? $_POST["email"] : ""; ?>" required>
                            <label for="email">E-mail*</label>
                        </div>
                        <div class="input-field col s6">
                            <i class="material-icons prefix teal-text">phone</i>
                            <input id="phoneNumber" name="phoneNumber" type="tel" class="validate" value="<?php echo isset($_POST["phoneNumber"]) ? $_POST["phoneNumber"] : ""; ?>" required>
                            <label for="phoneNumber">Téléphone*</label>
                        </div>
                    </div>
                    <div class="row">
                        <h5>Ce client vient de...*</h5>
                        <p class="col s12">
                            <label>
                                <input name="fromCompany" id="itsMt" value="Mets-Tendances" type="radio" <?php echo isset($_POST["fromCompany"]) && $_POST["fromCompany"] == "Mets-Tendances" ? "checked" : ""; ?> />
                                <span>Mets-Tendances</span>
                            </label>
                            <label>
                                <input name="fromCompany" id="itsCc" value="Cocktail-Cocktail" type="radio" <?php echo isset($_POST["fromCompany"]) && $_POST["fromCompany"] == "Cocktail-Cocktail" ? "checked" : ""; ?> />
                                <span>Cocktail-Cocktail</span>
                            </label>
                            <label>
                                <input name="fromCompany" id="itsTc" value="Les Terrasses de Courbevoie" type="radio" <?php echo isset($_POST["fromCompany"]) && $_POST["fromCompany"] == "Les Terrasses de Courbevoie" ? "checked" : ""; ?> />
                                <span>Les Terrasses de Courbevoie</span>
                            </label>
                        </p>
                    </div>
                    <input type="hidden" name="id" id="id" value="" />
                    <input type="hidden" name="isActive" id="isActive" value="" />
                    <input type="hidden" name="creationDate" id="creationDate" value="" />

                    <div class="row" style="margin-bottom: 0;">
                        <span class="col s10"></span>
                        <button class="btn waves-effect waves-light col s2" type="submit" name="action">Valider
                            <i class="material-icons right">send</i>
                        </button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>