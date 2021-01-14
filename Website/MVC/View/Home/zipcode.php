<title>Code postaux - Panel d'administration</title>

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
<div class="page" id="zipcodezone-page">
    <h1 class="center-align">Vos zones de livraisons</h1>
    <div class="row">
        <div class="col s12 m3" id="first-column"></div>
        <div class="col s12 m6" id="second-column">
            <div class="card">
                <div class="collection">
                    <?php
                    foreach ($this->Model->_zipcodezone as $zipcodezone) {
                    ?>
                        <a href="#!" class="collection-item avatar zipcodezone valign-wrapper" data-id="<?php echo $zipcodezone->getId(); ?>" style="min-height: auto;">
                            <span class="title">
                                <b>
                                    <?php echo $zipcodezone->getZipcode(); ?>
                                </b>
                            </span>
                            <span class="secondary-content" style="top:10px;right:50px;"><i>Zone <?php echo $zipcodezone->getZone(); ?></i></span>
                            <span class="secondary-content delete-zipcodezone" style="top:10px;"><i class="material-icons">delete</i></span>
                        </a>
                    <?php
                    }
                    ?>
                </div>
            </div>
        </div>
    </div>

    <div class="fixed-action-btn">
        <a class="btn-floating btn-large red pulse modal-trigger zipcodezone-add">
            <i class="large material-icons">add</i>
        </a>
    </div>

    <!-- Modal Structure -->
    <div id="modal-zipcodezone" class="modal">
        <div class="modal-content">
            <h4>Créer un code postal</h4>
            <div class="row" style="margin-bottom: 0;">
                <form action="" method="POST" class="col s12">
                    <div class="row">
                        <div class="input-field col s6">
                            <i class="material-icons prefix teal-text">menu_book</i>
                            <input id="zipcode" name="zipcode" type="number" class="validate">
                            <label for="zipcode">Code postal*</label>
                        </div>
                        <div class="input-field col s6">
                            <i class="material-icons prefix teal-text">attach_money</i>
                            <input id="zone" name="zone" type="text" class="validate">
                            <label for="zone">Zone*</label>
                        </div>
                    </div>

                    <div class="row" style="margin-bottom: 0;">
                        <span class="col s10"></span>
                        <button class="btn waves-effect waves-light col s2" id="addZipcodezoneButton" type="button" name="action">Valider
                            <i class="material-icons right">send</i>
                        </button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>