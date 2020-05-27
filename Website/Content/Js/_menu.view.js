class MenuView {
    constructor() {
    }

    appendCategories(data, container) {
        var html = '';
        data.forEach(function (element) {
            html += '<a href="#!" class="collection-item avatar category" data-id="' + element.id + '" style="min-height: auto;">' +
                '<span class="title"><b>' + element.name + '</b></span>' +
                '<span class="secondary-content delete-category" style="top:10px;">' +
                '<i class="material-icons">delete</i>' +
                '</span></a>';
        });

        container.html(html);
    }
    appendMenus(data, container) {
        var html = '';
        data.forEach(function (element) {
            html += '<a href="#!" class="collection-item avatar category-menu" data-id="' + element.id + '" data-price="' + element.price + '" data-image="' + element.image_url + '" style="min-height: auto;"><span class="title"><b>' + element.name + '</b></span>' +
                '<div class="switch"><label>Inactif<input type="checkbox" ' + (element.active ? "checked" : "") + ' class="activate"><span class="lever"></span>Actif</label></div>' +
                '<span class="secondary-content edit-menu" style="top:10px;right:50px;"><i class="material-icons">edit</i></span>' +
                '<span class="secondary-content delete-menu" style="top:10px;"><i class="material-icons">delete</i></span>' +
                '</a>';
        });

        container.find('.collection').html(html);
        container.find('.card').show();
    } 
    appendLesTerrassesMeals(data, container, append = false) {
        var html = '';

        if (!Array.isArray(data) && data != null)
            data = [data];

        data.forEach(function (element) {
            html += '<a href="#!" class="collection-item avatar category-meal" data-id="' + element.id + '" style="min-height: auto;"><span class="title"><b>' + element.description + '</b></span>' +
                '<span class="secondary-content badge" style="top:10px;right:100px;">' + element.price + '€</span>' +
                '<span class="secondary-content edit-meal" style="top:10px;right:50px;"><i class="material-icons">edit</i></span>' +
                '<span class="secondary-content delete-meal" style="top:10px;"><i class="material-icons">delete</i></span>' +
                '</a>';
        });

        if (append)
            container.find('.collection').append(html);
        else
            container.find('.collection').html(html);

        container.find('.card').show();
    }
    appendMeals(data, container, append = false) {
        var html = '';

        if (!Array.isArray(data) && data != null)
            data = [data];

        data.forEach(function (element) {
            html += '<a href="#!" class="collection-item avatar meal-menu" data-id="' + element.id + '" data-cat="' + element.id_Category + '" data-cat-name="' + (element.mealCategoryName ? element.mealCategoryName : "") + '" data-cat-price="' + (element.mealCategoryPrice ? element.mealCategoryPrice : "") + '" data-cat-id="' + (element.mealCategoryId ? element.mealCategoryId : "") + '" style="min-height: auto;"><span class="title"><b>' + element.description + '</b></span>' +
                '<div class="switch"><label>Inactif<input type="checkbox" ' + (element.active ? "checked" : "") + ' class="activate"><span class="lever"></span>Actif</label></div>' +
                '<span class="secondary-content edit-meal" style="top:10px;right:50px;"><i class="material-icons">edit</i></span>' +
                '<span class="secondary-content delete-meal" style="top:10px;"><i class="material-icons">delete</i></span>' +
                '</a>';
        });

        if (append)
            container.find('.collection').append(html);
        else
            container.find('.collection').html(html);

        container.find('.card').show();
    }

    updateMealCategoriesSelect(data) {
        var html = '';
        data.forEach(function (element) {
            html += '<option value="' + element.id + '">' + element.name + '</option>';
        });

        $('#mealCategory').html(html);
        $('select').formSelect();
    }

    emptyMenuFields() {
        $('#menuName').val("");
        $('#menuPrice').val("");
        $('#menuId').val("");
        $('#menuImage').attr("src", "");
        $('#file').val("");
    }
    emptyMealFields() {
        $('#mealId').val("");
        $('#mealName').val("");
        $('#mealCategoryId').val("");
        $('#mealCategoryName').val("");
        $('#mealCategoryPrice').val("");
    }
    emptyLesTerrassesMealFields() {
        $('#mealId').val("");
        $('#mealName').val("");
        $('#mealPrice').val("");
    }

    focusOnCategory(id) {
        $('#menuCategory').val(id);
        $('#mealMenu').val("");
    }

    focusOnMenu(id) {
        $('#mealMenu').val(id);
    }
}