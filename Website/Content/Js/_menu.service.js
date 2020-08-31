class MenuService {
    constructor() {
    }
    getMenu(menuId, successCallback) {
        $.ajax({
            method: "GET",
            url: "/menu/cocktailCocktailGetMenu/" + menuId,
            dataType: 'json',
            success: function (data) {
                successCallback(data);
            },
            error: function (data) { console.log(data); }
        });
    }
    getMeal(mealId, successCallback) {
        $.ajax({
            method: "GET",
            url: "/menu/cocktailCocktailGetMeal/" + mealId,
            dataType: 'json',
            success: function (data) {
                successCallback(data);
            },
            error: function (data) { console.log(data); }
        });
    }   
    getLesTerrassesMeals(categoryId, successCallback) {
        $.ajax({
            method: "GET",
            url: "/menu/lesterrassesGetMeals/" + categoryId,
            dataType: 'json',
            success: function (data) {
                successCallback(data);
            },
            error: function (data) { console.log(data); }
        });
    }
    getSubCategories(successCallback) {
        $.ajax({
            method: "GET",
            url: "/menu/cocktailCocktailGetSubCategories",
            dataType: 'json',
            success: function (data) {
                successCallback(data);
            },
            error: function (data) { console.log(data); }
        });
    }
    getSubCategory(id, successCallback){
        $.ajax({
            method: "GET",
            url: "/menu/cocktailCocktailGetSubCategories/" + id,
            dataType: 'json',
            success: function (data) {
                successCallback(data[0]);
            },
            error: function (data) { console.log(data); }
        });
    }
    getMealCategories(successCallback) {
        $.ajax({
            method: "GET",
            url: "/menu/cocktailCocktailGetMealCategories",
            dataType: 'json',
            success: function (data) {
                successCallback(data);
            },
            error: function (data) { console.log(data); }
        });
    }

    addCategory(categoryName, successCallback) {
        $.ajax({
            method: "POST",
            url: "/menu/addCategory",
            dataType: "json",
            data: {
                name: categoryName
            }
        }).done(function (data) {
            successCallback(data);
        }).fail(function () {
            alert('Something wrong happened... try later');
        }).always(function () { });
    }
    addLesTerrassesCategory(categoryName, successCallback) {
        $.ajax({
            method: "POST",
            url: "/menu/addLesTerrassesCategory",
            dataType: "json",
            data: {
                name: categoryName
            }
        }).done(function (data) {
            successCallback(data);
        }).fail(function () {
            alert('Something wrong happened... try later');
        }).always(function () { });
    }
    addMenu(menuName, menuPrice, menuCategory, successCallback) {
        $.ajax({
            method: "POST",
            url: "/menu/addMenu",
            dataType: "json",
            data: {
                name: menuName,
                price: menuPrice,
                id_Category: menuCategory
            }
        }).done(function (data) {
            successCallback(data);
        }).fail(function () {
            alert('Something wrong happened... try later');
        })
            .always(function () { });
    }
    addZipcode(zipcode, zone, successCallback) {
        $.ajax({
            method: "POST",
            url: "/home/addZipcode",
            dataType: "json",
            data: {
                zipcode: zipcode,
                zone: zone
            }
        }).done(function (data) {
            successCallback(data);
        }).fail(function () {
            alert('Something wrong happened... try later');
        })
            .always(function () { });
    }
    addMeal(mealName, mealMenu, mealCategory, mealCategoryId, mealCategoryName, mealCategoryPrice, successCallback) {
        $.ajax({
            method: "POST",
            url: "/menu/addMeal",
            dataType: "json",
            data: {
                description: mealName,
                id_Menu: mealMenu,
                id_Subcategory: mealCategory,
                mealCategoryId: mealCategoryId,
                mealCategoryName: mealCategoryName,
                mealCategoryPrice: mealCategoryPrice
            }
        }).done(function (data) {
            successCallback(data);
        }).fail(function () {
            alert('Something wrong happened... try later');
        })
            .always(function () { });
    }
    addLesTerrassesMeal(mealName, mealPrice, mealCategory, successCallback) {
        $.ajax({
            method: "POST",
            url: "/menu/addLesTerrassesMeal",
            dataType: "json",
            data: {
                description: mealName,
                price: mealPrice,
                id_Category: mealCategory,
            }
        }).done(function (data) {
            successCallback(data);
        }).fail(function () {
            alert('Something wrong happened... try later');
        })
            .always(function () { });
    }

    deleteCategory(idCategory, successCallback) {
        $.ajax({
            method: "POST",
            url: "/menu/deleteCategory",
            dataType: "json",
            data: {
                id_Category: idCategory
            }
        }).done(function (data) {
            successCallback(data);
        }).fail(function () {
            alert('Something wrong happened... try later');
        })
            .always(function () { });
    }  
    deleteZipcode(idZipcode, successCallback) {
        $.ajax({
            method: "POST",
            url: "/home/deleteZipcode",
            dataType: "json",
            data: {
                id: idZipcode
            }
        }).done(function (data) {
            successCallback(data);
        }).fail(function () {
            alert('Something wrong happened... try later');
        })
            .always(function () { });
    }  
    deleteLesTerrassesCategory(idCategory, successCallback) {
        $.ajax({
            method: "POST",
            url: "/menu/deleteLesTerrassesCategory",
            dataType: "json",
            data: {
                id_Category: idCategory
            }
        }).done(function (data) {
            successCallback(data);
        }).fail(function () {
            alert('Something wrong happened... try later');
        })
            .always(function () { });
    }
    deleteMenu(idMenu, successCallback) {
        $.ajax({
            method: "POST",
            url: "/menu/deleteMenu",
            dataType: "json",
            data: {
                id_Menu: idMenu
            }
        }).done(function (data) {
            successCallback(data);
        }).fail(function () {
            alert('Something wrong happened... try later');
        })
            .always(function () { });
    }
    deleteMeal(idMeal, successCallback) {
        $.ajax({
            method: "POST",
            url: "/menu/deleteMeal",
            dataType: "json",
            data: {
                id_Meal: idMeal
            }
        }).done(function (data) {
            successCallback(data);
        }).fail(function () {
            alert('Something wrong happened... try later');
        })
            .always(function () { });
    }
    deleteLesTerrassesMeal(idMeal, successCallback) {
        $.ajax({
            method: "POST",
            url: "/menu/deleteLesTerrassesMeal",
            dataType: "json",
            data: {
                id_Meal: idMeal
            }
        }).done(function (data) {
            successCallback(data);
        }).fail(function () {
            alert('Something wrong happened... try later');
        })
            .always(function () { });
    }

    updateMenu(menuId, menuName, menuPrice, menuCategory, successCallback) {
        $.ajax({
            method: "POST",
            url: "/menu/updateMenu",
            dataType: "json",
            data: {
                id: menuId,
                name: menuName,
                price: menuPrice,
                id_Category: menuCategory
            }
        }).done(function (data) {
            successCallback(data);
        }).fail(function () {
            alert('Something wrong happened... try later');
        })
            .always(function () { });
    }
    updateMeal(mealId, mealName, mealMenu, mealCategory, mealCategoryId, mealCategoryName, mealCategoryPrice, successCallback) {
        $.ajax({
            method: "POST",
            url: "/menu/updateMeal",
            dataType: "json",
            data: {
                id: mealId,
                description: mealName,
                id_Menu: mealMenu,
                id_Subcategory: mealCategory,
                mealCategoryId: mealCategoryId,
                mealCategoryName: mealCategoryName,
                mealCategoryPrice: mealCategoryPrice
            }
        }).done(function (data) {
            successCallback(data);
        }).fail(function () {
            alert('Something wrong happened... try later');
        })
            .always(function () { });
    }
    updateLesTerrassesMeal(mealId, mealName, mealPrice, mealCategory, successCallback) {
        $.ajax({
            method: "POST",
            url: "/menu/updateLesTerrassesMeal",
            dataType: "json",
            data: {
                id: mealId,
                description: mealName,
                price: mealPrice,
                id_Category: mealCategory
            }
        }).done(function (data) {
            successCallback(data);
        }).fail(function () {
            alert('Something wrong happened... try later');
        })
            .always(function () { });
    }
}
