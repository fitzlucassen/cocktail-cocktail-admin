$(document).ready(function () {
    var service = new MenuService();
    var view = new MenuView();

    service.getMealCategories(function (data) {
        autoComplete = {};
        data.forEach(function(element){
            autoComplete[element.id + " - " + element.name + " - " + element.price] = null;
        });
        $('.autocomplete').autocomplete({
            data: autoComplete,
            onAutocomplete: splitMealCategoryName
        });
    });

    /* **************
     * READ FUNCTIONS
     * **************/
    $('#catalog-page #second-column').on('click', '.category', function () {
        var id = $(this).attr('data-id');

        $('#first-column').html($('#second-column').html());
        $('#second-column').html($('#third-column').html());
        $('#second-column').find('.btn-floating').removeClass('meal-add').addClass('menu-add');

        view.focusOnCategory(id);

        service.getMenu(id, function (data) {
            view.appendMenus(data, $('#second-column'));
        });
    });

    $('#catalog-page #first-column').on('click', '.category', function () {
        var id = $(this).attr('data-id');
        $('#second-column').html($('#third-column').html());
        $('#second-column').removeClass('m3').addClass('m6');
        $('#third-column').removeClass('m6').addClass('m3');
        $('#third-column .card').hide();

        $('#second-column').find('.btn-floating').removeClass('meal-add').addClass('menu-add');

        view.focusOnCategory(id);

        service.getMenu(id, function (data) {
            view.appendMenus(data, $('#second-column'));
        });
    });

    $('#catalog-page #second-column').on('click', '.category-menu', function () {
        var parent = $(this).parent().parent().parent();
        parent.removeClass("m6").addClass("m3");
        parent.siblings('#third-column').removeClass('m3').addClass('m6');
        var id = $(this).attr('data-id');

        $('#third-column').find('.btn-floating').removeClass('menu-add').addClass('meal-add');

        view.focusOnMenu(id);

        service.getMeal(id, function (data) {
            view.appendMeals(data, $('#third-column'));
        });
    });

    /* *************
     * ADD FUNCTIONS
     * *************/
    $('#catalog-page .col').on('click', '.category-add', function () {
        var categoryName = prompt("Nom de la catégorie ?")
        var container = $(this).siblings('.collection');

        if (categoryName != null) {
            service.addCategory(categoryName, function (data) {
                view.appendCategories(data, container);
            });
        }
    });

    $('#catalog-page .col').on('click', '.menu-add', function () {
        modal[0].open();

        view.emptyMenuFields();
    });

    $('#catalog-page .col').on('click', '.meal-add', function () {
        modal[1].open();
        view.emptyMealFields();

        service.getSubCategories(function (data) {
            view.updateMealCategoriesSelect(data);
        });
    });

    $('#addMenuButton').click(function () {
        var container = $('#second-column .collection');
        var menuName = $('#menuName').val();
        var menuPrice = $('#menuPrice').val();
        var menuCategory = $('#menuCategory').val();
        var menuId = $('#menuId').val();

        if (menuId != null && menuId != "") {
            service.updateMenu(menuId, menuName, menuPrice, menuCategory, function (data) {
                view.appendMenus(data, $('#second-column'));
                view.emptyMenuFields();

                modal[0].close();
            });
        } else {
            service.addMenu(menuName, menuPrice, menuCategory, function (data) {
                view.appendMenus(data, $('#second-column'));
                view.emptyMenuFields();

                modal[0].close();
            });
        }
    });

    $('#catalog-page #addMealButton').click(function () {
        var container = $('#third-column .collection');
        var mealId = $('#mealId').val();
        var mealName = $('#mealName').val();
        var mealMenu = $('#mealMenu').val();
        var mealCategory = $('#mealCategory').val();
        var mealCategoryId = $('#mealCategoryId').val();
        var mealCategoryName = $('#mealCategoryName').val();
        var mealCategoryPrice = $('#mealCategoryPrice').val();

        if (mealId != null && mealId != "") {
            service.updateMeal(mealId, mealName, mealMenu, mealCategory, mealCategoryId, mealCategoryName, mealCategoryPrice, function (data) {
                view.emptyMealFields();
    
                modal[1].close();
            });
        }
        else {
            service.addMeal(mealName, mealMenu, mealCategory, mealCategoryId, mealCategoryName, mealCategoryPrice, function (data) {
                view.appendMeals(data, $('#third-column'), true);
                view.emptyMealFields();
    
                modal[1].close();
            });
        }
    });

    /* ****************
     * DELETE FUNCTIONS
     * ****************/
    $('#catalog-page .col').on('click', '.delete-category', function (e) {
        e.preventDefault();
        e.stopPropagation();

        if (confirm("Êtes-vous sur de vouloir supprimer cette catégorie et tous les menu et plats attâché à celle-ci ?")) {
            var element = $(this).parent();
            var id = element.attr('data-id');

            service.deleteCategory(id, function (data) {
                element.remove();

                if (id == $('#menuCategory'))
                    view.focusOnCategory("");
            });
        }
    });

    $('.col').on('click', '.delete-menu', function (e) {
        e.preventDefault();
        e.stopPropagation();

        if (confirm("Êtes-vous sur de vouloir supprimer ce menu et les plats associés ?")) {
            var element = $(this).parent();
            var id = element.attr('data-id');

            service.deleteMenu(id, function (data) {
                element.remove();

                if (id == $('#mealMenu'))
                    view.focusOnMenu("");
            });
        }
    });

    $('#catalog-page .col').on('click', '.delete-meal', function (e) {
        e.preventDefault();
        e.stopPropagation();

        if (confirm("Êtes-vous sur de vouloir supprimer ce plat ?")) {
            var element = $(this).parent().parent();
            var id = element.attr('data-id');

            service.deleteMeal(id, function (data) {
                element.remove();
            });
        }
    });

    /* **************
     * EDIT FUNCTIONS
     * **************/
    $('.col').on('click', '.edit-menu', function (e) {
        e.preventDefault();
        e.stopPropagation();

        var element = $(this).parent();
        var id = element.attr('data-id');
        var price = element.attr('data-price');
        var name = element.find(".title b").html();

        modal[0].open();
        $('#menuId').val(id)
        $('#menuPrice').val(price)
        $('#menuName').val(name);

        M.updateTextFields();
    });

    $('#catalog-page .col').on('click', '.edit-meal', function (e) {
        e.preventDefault();
        e.stopPropagation();

        var element = $(this).parent();
        var id = element.attr('data-id');
        var catPrice = element.attr('data-cat-price');
        var catName = element.attr('data-cat-name');
        var dataCatId = element.attr('data-cat-id');
        var catId = element.attr('data-cat');
        var name = element.find(".title b").html();

        modal[1].open();
        $('#mealId').val(id);
        $('#mealName').val(name);
        $('#mealCategoryPrice').val(catPrice);
        $('#mealCategoryName').val(catName);
        $('#mealCategoryId').val(dataCatId);

        service.getSubCategories(function (data) {
            view.updateMealCategoriesSelect(data);

            $('select').val(catId);
            $('select').formSelect();
        });

        M.updateTextFields();
    });

    function splitMealCategoryName(element) {
        var tokens = element.split(' - ');

        $('#mealCategoryId').val(tokens[0]);
        $('#mealCategoryName').val(tokens[1]);
        $('#mealCategoryPrice').val(tokens[2]);

        M.updateTextFields();
    }
});