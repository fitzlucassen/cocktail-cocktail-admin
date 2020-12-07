$(document).ready(function () {
    var service = new MenuService();
    var view = new MenuView();

    /* **************
     * READ FUNCTIONS
     * **************/
    $('#menu-page #second-column').on('click', '.category', function (e) {
        if($(e.target).parent().hasClass('edit-category'))
            return;
        var id = $(this).attr('data-id');

        $('#first-column').html($('#second-column').html());
        $('#second-column').html($('#third-column').html());
        $('#second-column').find('.btn-floating').addClass('meal-add');

        $('#mealCategoryId').val(id);

        service.getLesTerrassesMeals(id, function (data) {
            view.appendLesTerrassesMeals(data, $('#second-column'));
        });
    });

    $('#menu-page #first-column').on('click', '.category', function (e) {
        if($(e.target).parent().hasClass('edit-category'))
            return;
        var id = $(this).attr('data-id');
        $('#second-column').html($('#third-column').html());
        $('#second-column').removeClass('m3').addClass('m6');
        $('#third-column').removeClass('m6').addClass('m3');
        $('#third-column .card').hide();

        $('#second-column').find('.btn-floating').addClass('meal-add');

        $('#mealCategoryId').val(id);

        service.getLesTerrassesMeals(id, function (data) {
            view.appendLesTerrassesMeals(data, $('#second-column'));
        });
    });

    /* *************
     * ADD FUNCTIONS
     * *************/
    $('#menu-page .col').on('click', '.category-add', function () {
        var categoryName = prompt("Nom de la catégorie ?")
        var container = $(this).siblings('.collection');

        if (categoryName != null) {
            service.addLesTerrassesCategory(categoryName, function (data) {
                view.appendCategories(data, container);
            });
        }
    });

    $('#menu-page .col').on('click', '.meal-add', function () {
        modal[0].open();
        view.emptyLesTerrassesMealFields();
    });

    $('#menu-page #addMealButton').click(function () {
        var container = $('#second-column .collection');
        var mealId = $('#mealId').val();
        var mealName = $('#mealName').val();
        var mealPrice = $('#mealPrice').val();
        var mealCategory = $('#mealCategoryId').val();

        if (mealId != null && mealId != "") {
            service.updateLesTerrassesMeal(mealId, mealName, mealPrice, mealCategory, function (data) {
                view.emptyLesTerrassesMealFields();
    
                modal[0].close();
            });
        }
        else {
            service.addLesTerrassesMeal(mealName, mealPrice, mealCategory, function (data) {
                view.appendLesTerrassesMeals(data, $('#second-column'), true);
                view.emptyLesTerrassesMealFields();
    
                modal[0].close();
            });
        }
    });

    /* ****************
     * DELETE FUNCTIONS
     * ****************/
    $('#menu-page .col').on('click', '.delete-category', function (e) {
        e.preventDefault();
        e.stopPropagation();

        if (confirm("Êtes-vous sur de vouloir supprimer cette catégorie et tous les plats attâchés à celle-ci ?")) {
            var element = $(this).parent();
            var id = element.attr('data-id');

            service.deleteLesTerrassesCategory(id, function (data) {
                element.remove();

                if (id == $('#mealCategoryId'))
                    $('#mealCategoryId').val("");
            });
        }
    });

    $('#menu-page .col').on('click', '.delete-meal', function (e) {
        e.preventDefault();
        e.stopPropagation();

        if (confirm("Êtes-vous sur de vouloir supprimer ce plat ?")) {
            var element = $(this).parent();
            var id = element.attr('data-id');

            service.deleteLesTerrassesMeal(id, function (data) {
                element.remove();
            });
        }
    });

    /* **************
     * EDIT FUNCTIONS
     * **************/
    $('#menu-page .col').on('click', '.edit-meal', function (e) {
        e.preventDefault();
        e.stopPropagation();

        var element = $(this).parent();
        var id = element.attr('data-id');
        var name = element.find(".title b").html();
        var price = element.find(".badge").html().replace('€', '');

        modal[0].open();
        $('#mealId').val(id);
        $('#mealName').val(name);
        $('#mealPrice').val(price);

        M.updateTextFields();
    });
    $('#menu-page').on('click', '.edit-category', function(e) {
        e.preventDefault();
        e.stopPropagation();

        var categoryName = prompt("Nouveau nom de la catégorie ?")
        var container = $(this).parent().parent();
        var categoryId = $(this).parent().attr('data-id');

        if (categoryName != null) {
            service.updateLesTerrassesCategory(categoryId, categoryName, function (data) {
                view.appendCategories(data, container);
            });
        }
    });
});