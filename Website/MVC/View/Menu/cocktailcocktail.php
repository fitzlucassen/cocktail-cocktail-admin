<title>Catalogue - Panel d'administration</title>

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
<div class="page" id="catalog-page">
    <h1 class="center-align">Catalogue Cocktail Cocktail</h1>

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
    <div id="modal-menu" class="modal">
        <div class="modal-content">
            <h4>Gérer un menu</h4>
            <div class="row" style="margin-bottom: 0;">
                <form action="" method="POST" class="col s12">
                    <div class="row">
                        <div class="input-field col s6">
                            <i class="material-icons prefix teal-text">menu_book</i>
                            <input id="menuName" name="menuName" type="text" class="validate">
                            <label for="menuName">Nom du menu*</label>
                        </div>
                        <div class="input-field col s6">
                            <i class="material-icons prefix teal-text">attach_money</i>
                            <input id="menuPrice" name="menuPrice" type="number" class="validate">
                            <label for="menuPrice">Prix HT</label>
                        </div>
                    </div>
                    <div class="row">
                        <p class="col s12 center"><i>La photo doit être rectangulaire au format paysage. Le site est optimisé pour un <b>format 16:9 (exemple : 3840x2160)</b></i></p>
                        <div class="file-field input-field col s12">
                            <div class="btn">
                                <span>Photo du menu</span>
                                <input type="file" id="file" name="file">
                            </div>
                            <div class="file-path-wrapper">
                                <input class="file-path validate" type="text" placeholder="Illustrez le menu par une photo">
                            </div>
                        </div>
                        <img src="" alt="" id="menuImage" style="display: block; width: 50%;margin:20px auto;" />
                    </div>

                    <input type="hidden" name="menuCategory" id="menuCategory" value="" />
                    <input type="hidden" name="menuId" id="menuId" value="" />
                    <div class="row" style="margin-bottom: 0;">
                        <span class="col s10"></span>
                        <button class="btn waves-effect waves-light col s2" id="addMenuButton" type="button" name="action">Valider
                            <i class="material-icons right">send</i>
                        </button>
                    </div>
                </form>
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
                            <input id="mealCategory" name="mealCategory" type="text" class="validate autocomplete">
                            <label for="mealCategory">Catégorie de plat*</label>
                        </div>
                    </div>

                    <h4>Attacher un prix à ce plat ? (optionnel)</h4>
                    <div class="row">
                        <div class="input-field col s6">
                            <i class="material-icons prefix teal-text">menu_book</i>
                            <input id="mealCategoryName" name="mealCategoryName" type="text" class="validate autocomplete">
                            <label for="mealCategoryName">Nom de l'option plat payante</label>
                        </div>
                        <div class="input-field col s6">
                            <i class="material-icons prefix teal-text">attach_money</i>
                            <input id="mealCategoryPrice" name="mealCategoryPrice" type="text" class="validate">
                            <label for="mealCategoryPrice">Prix du plat HT</label>
                        </div>
                    </div>

                    <input type="hidden" name="category" id="mealMenu" value="" />
                    <input type="hidden" name="category" id="mealId" value="" />
                    <input type="hidden" name="category" id="mealCategoryId" value="" />
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