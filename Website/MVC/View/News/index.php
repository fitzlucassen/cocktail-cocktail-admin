<title>Actualités - Panel d'administration</title>

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
<div class="page" id="news-page">
    <h1 class="center-align">Vos Actualités</h1>
    <div class="row">
        <div class="col s12 m3" id="first-column"></div>
        <div class="col s12 m6" id="second-column">
            <div class="card">
                <div class="collection">
                    <?php
                    foreach ($this->Model->_news as $news) {
                    ?>
                        <a href="#!" class="collection-item avatar valign-wrapper" data-id="<?php echo $news->getId(); ?>">
                            <i class="material-icons circle">radio</i>
                            <span class="title">
                                <b>
                                    <?php echo $news->getTitle(); ?>
                                </b>
                                <span class="new badge" style="background:<?php echo $color; ?>" data-badge-caption=""><?php echo $news->getFromCompany(); ?></span>
                            </span>
                            <p style="color:black;">
                                créée le
                                <b>
                                    <?php echo $news->getCreationDate(); ?>
                                </b>
                            </p>
                        </a>
                    <?php } ?>
                </div>
            </div>
        </div>
    </div>

    <div class="fixed-action-btn">
        <a class="btn-floating btn-large red pulse modal-trigger" href="#modal-news" id="openModal">
            <i class="large material-icons">add</i>
        </a>
    </div>


    <!-- Modal Structure -->
    <div id="modal-news" class="modal">
        <div class="modal-content">
            <h4>Créer une actualité</h4>
            <div class="row" style="margin-bottom: 0;">
                <form action="/news/add" method="POST" class="col s12">
                    <div class="row">
                        <div class="input-field col s12">
                            <i class="material-icons prefix teal-text">title</i>
                            <input id="title" name="title" type="text" class="validate">
                            <label for="title">Titre*</label>
                        </div>
                    </div>
                    <div class="row">
                        <div class="input-field col s12">
                            <i class="material-icons prefix teal-text">text_fields</i>
                            <textarea id="description" name="description" class="materialize-textarea validate"></textarea>
                            <label for="description">description*</label>
                        </div>
                    </div>

                    <div class="row">
                        <h5>Cette actualité est pour...*</h5>
                        <p class="col s12">
                            <label>
                                <input name="fromCompany" id="itsMt" value="Mets-Tendances" type="radio" <?php echo isset($_POST["fromCompany"]) && $_POST["fromCompany"] == "Mets-Tendances" ? "checked" : ""; ?> />
                                <span>Mets-Tendances</span>
                            </label>
                            <label>
                                <input name="fromCompany" id="itsCc" value="Cocktail-Cocktail" type="radio" <?php echo isset($_POST["fromCompany"]) && $_POST["fromCompany"] == "Cocktail-Cocktail" ? "checked" : ""; ?> checked/>
                                <span>Cocktail-Cocktail</span>
                            </label>
                            <label>
                                <input name="fromCompany" id="itsTc" value="Les Terrasses de Courbevoie" type="radio" <?php echo isset($_POST["fromCompany"]) && $_POST["fromCompany"] == "Les Terrasses de Courbevoie" ? "checked" : ""; ?> />
                                <span>Les Terrasses de Courbevoie</span>
                            </label>
                        </p>
                    </div>
                    <input type="hidden" name="id" id="id" value="" />
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