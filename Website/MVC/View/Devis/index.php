<title>Demandes de devis</title>

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
<div class="page" id="devis-page">
    <h1 class="center-align">Vos devis</h1>
    <div class="row">
        <div class="col m2"></div>
        <div class="card col m8">
            <div class="collection">
                <?php
                foreach ($this->Model->_devis as $devis) {
                    $message = $devis["message"];
                    $length = strlen($message);
                    ?>
                    <a href="#!" class="collection-item avatar valign-wrapper" data-id="<?php echo $devis["id"]; ?>">
                        <i class="material-icons circle">folder</i>
                        <span class="title">
                            <b>
                                <?php echo $devis["isCompany"] ? $devis["companyName"] : $devis["firstname"] . " " . $devis["lastname"]; ?>
                            </b>
                            <span class="new badge" data-badge-caption=""><?php echo $devis["fromCompany"]; ?></span>
                        </span>
                        <p style="color:black;">
                            reçu le
                            <b>
                                <?php echo $devis["creationDate"]; ?>
                            </b><br />
                            <span><?php echo ($length > 100 ? substr($message, 0, 100) . '...' : $message); ?></span>
                        </p>
                    </a>
                <?php
                }
                ?>
            </div>
        </div>
        <div class="col m2"></div>
    </div>

    <!-- Modal Structure -->
    <div id="modal1" class="modal">
        <div class="modal-content">
            <h4>Gérer une demande de devis</h4>
            <div class="row">
                <p class="col s8">
                    Demande <b id="isCompany"></b>&nbsp;<b id="name"></b> reçu le <b id="creationDate"></b>
                </p>
                <p class="col s4">Client du site <b id="fromCompany"></b></p>
            </div>
            <div class="row">
                <p class="col s12" id="message">
                </p>
            </div>
            
            <div class="row" id="eventData">
                <p class="s12"><b>Données de l'évenement :</b></p>
                <p class="col s4 center-align" id="eventDate"></p>
                <p class="col s4 center-align" id="people"></p>
                <p class="col s4 center-align" id="eventZipcodeZone"></p>
            </div>
            <div class="row" style="margin-bottom: 0;">
                <p class="s12"><b>Pour contacter ce client :</b></p>
                <p class="col s6 center-align" id="phoneNumber"></p>
                <p class="col s6 center-align" id="email"></p>
            </div>
            <br/>
            <br/>
            <p style="text-align: center">
                <a class="waves-effect waves-light btn-large" target="_blank" href="" id="downloadbutton"><i class="material-icons left">arrow_downward</i>Voir le bon de commande</a>
            </p>
        </div>
    </div>
</div>