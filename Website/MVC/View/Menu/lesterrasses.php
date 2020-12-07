<title>Menu - Panel d'administration</title>

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
<div class="page" id="menu-page">
    <h1 class="center-align">Menu Les Terrasses de Courbevoie</h1>

    <div class="row">
        <div class="col s12 m3" id="first-column"></div>
        <div class="col s12 m6" id="second-column">
            <div class="card">
                <div class="collection">
                    <?php
                    foreach ($this->Model->_categories as $category) {
                        ?>
                        <a href="#!" class="collection-item avatar category valign-wrapper" data-id="<?php echo $category->getId(); ?>" style="min-height: auto;">
                            <span class="title">
                                <b>
                                    <?php echo $category->getName(); ?>
                                </b>
                            </span>
                            <span class="secondary-content edit-category" style="top:10px;right:50px;"><i class="material-icons">edit</i></span>
                            <span class="secondary-content delete-category" style="top:10px;"><i class="material-icons">delete</i></span>
                        </a>
                    <?php
                    }
                    ?>
                </div>
                <a class="btn-floating halfway-fab waves-effect waves-light red category-add"><i class="material-icons">add</i></a>
            </div>
        </div>
        <div class="col s12 m3" id="third-column">
            <div class="card" style="display:none;">
                <div class="collection">
                </div>
                <a class="btn-floating halfway-fab waves-effect waves-light red"><i class="material-icons">add</i></a>
            </div>
        </div>
    </div>


    <!-- Modal Structure -->
    <div id="modal-meal" class="modal">
        <div class="modal-content">
            <h4>Gérer un plat</h4>
            <div class="row" style="margin-bottom: 0;">
                <form action="" method="POST" class="col s12">
                    <div class="row">
                        <div class="input-field col s6">
                            <i class="material-icons prefix teal-text">menu_book</i>
                            <input id="mealName" name="mealName" type="text" class="validate">
                            <label for="mealName">Nom du plat*</label>
                        </div>
                        <div class="input-field col s6">
                            <i class="material-icons prefix teal-text">attach_money</i>
                            <input id="mealPrice" name="mealPrice" type="text" class="validate">
                            <label for="mealPrice">Prix du plat HT</label>
                        </div>
                    </div>

                    <input type="hidden" name="mealId" id="mealId" value="" />
                    <input type="hidden" name="mealCategoryId" id="mealCategoryId" value="" />
                    <div class="row" style="margin-bottom: 0;">
                        <span class="col s10"></span>
                        <button class="btn waves-effect waves-light col s2" id="addMealButton" type="button" name="action">Valider
                            <i class="material-icons right">send</i>
                        </button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>