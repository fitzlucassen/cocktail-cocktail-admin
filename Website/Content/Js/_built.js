class MenuService{constructor(){}getMenu(menuId,successCallback){$.ajax({method:"GET",url:"/menu/cocktailCocktailGetMenu/"+menuId,dataType:"json",success:function(data){successCallback(data)},error:function(data){console.log(data)}})}getMeal(mealId,successCallback){$.ajax({method:"GET",url:"/menu/cocktailCocktailGetMeal/"+mealId,dataType:"json",success:function(data){successCallback(data)},error:function(data){console.log(data)}})}getLesTerrassesMeals(categoryId,successCallback){$.ajax({method:"GET",url:"/menu/lesterrassesGetMeals/"+categoryId,dataType:"json",success:function(data){successCallback(data)},error:function(data){console.log(data)}})}getSubCategories(successCallback){$.ajax({method:"GET",url:"/menu/cocktailCocktailGetSubCategories",dataType:"json",success:function(data){successCallback(data)},error:function(data){console.log(data)}})}getSubCategory(id,successCallback){$.ajax({method:"GET",url:"/menu/cocktailCocktailGetSubCategory/"+id,dataType:"json",success:function(data){successCallback(data[0])},error:function(data){console.log(data)}})}getMealCategories(successCallback){$.ajax({method:"GET",url:"/menu/cocktailCocktailGetMealCategories",dataType:"json",success:function(data){successCallback(data)},error:function(data){console.log(data)}})}addCategory(categoryName,successCallback){$.ajax({method:"POST",url:"/menu/addCategory",dataType:"json",data:{name:categoryName}}).done(function(data){successCallback(data)}).fail(function(){alert("Something wrong happened... try later")}).always(function(){})}addLesTerrassesCategory(categoryName,successCallback){$.ajax({method:"POST",url:"/menu/addLesTerrassesCategory",dataType:"json",data:{name:categoryName}}).done(function(data){successCallback(data)}).fail(function(){alert("Something wrong happened... try later")}).always(function(){})}addMenu(menuName,menuPrice,menuCategory,successCallback){$.ajax({method:"POST",url:"/menu/addMenu",dataType:"json",data:{name:menuName,price:menuPrice,id_Category:menuCategory}}).done(function(data){successCallback(data)}).fail(function(){alert("Something wrong happened... try later")}).always(function(){})}addZipcode(zipcode,zone,successCallback){$.ajax({method:"POST",url:"/home/addZipcode",dataType:"json",data:{zipcode:zipcode,zone:zone}}).done(function(data){successCallback(data)}).fail(function(){alert("Something wrong happened... try later")}).always(function(){})}addMeal(mealName,mealMenu,mealCategory,mealCategoryId,mealCategoryName,mealCategoryPrice,successCallback){$.ajax({method:"POST",url:"/menu/addMeal",dataType:"json",data:{description:mealName,id_Menu:mealMenu,id_Subcategory:mealCategory,mealCategoryId:mealCategoryId,mealCategoryName:mealCategoryName,mealCategoryPrice:mealCategoryPrice}}).done(function(data){successCallback(data)}).fail(function(){alert("Something wrong happened... try later")}).always(function(){})}addLesTerrassesMeal(mealName,mealPrice,mealCategory,successCallback){$.ajax({method:"POST",url:"/menu/addLesTerrassesMeal",dataType:"json",data:{description:mealName,price:mealPrice,id_Category:mealCategory}}).done(function(data){successCallback(data)}).fail(function(){alert("Something wrong happened... try later")}).always(function(){})}deleteCategory(idCategory,successCallback){$.ajax({method:"POST",url:"/menu/deleteCategory",dataType:"json",data:{id_Category:idCategory}}).done(function(data){successCallback(data)}).fail(function(){alert("Something wrong happened... try later")}).always(function(){})}deleteZipcode(idZipcode,successCallback){$.ajax({method:"POST",url:"/home/deleteZipcode",dataType:"json",data:{id:idZipcode}}).done(function(data){successCallback(data)}).fail(function(){alert("Something wrong happened... try later")}).always(function(){})}deleteLesTerrassesCategory(idCategory,successCallback){$.ajax({method:"POST",url:"/menu/deleteLesTerrassesCategory",dataType:"json",data:{id_Category:idCategory}}).done(function(data){successCallback(data)}).fail(function(){alert("Something wrong happened... try later")}).always(function(){})}deleteMenu(idMenu,successCallback){$.ajax({method:"POST",url:"/menu/deleteMenu",dataType:"json",data:{id_Menu:idMenu}}).done(function(data){successCallback(data)}).fail(function(){alert("Something wrong happened... try later")}).always(function(){})}deleteMeal(idMeal,successCallback){$.ajax({method:"POST",url:"/menu/deleteMeal",dataType:"json",data:{id_Meal:idMeal}}).done(function(data){successCallback(data)}).fail(function(){alert("Something wrong happened... try later")}).always(function(){})}deleteLesTerrassesMeal(idMeal,successCallback){$.ajax({method:"POST",url:"/menu/deleteLesTerrassesMeal",dataType:"json",data:{id_Meal:idMeal}}).done(function(data){successCallback(data)}).fail(function(){alert("Something wrong happened... try later")}).always(function(){})}updateMenu(menuId,menuName,menuPrice,menuCategory,successCallback){$.ajax({method:"POST",url:"/menu/updateMenu",dataType:"json",data:{id:menuId,name:menuName,price:menuPrice,id_Category:menuCategory}}).done(function(data){successCallback(data)}).fail(function(){alert("Something wrong happened... try later")}).always(function(){})}updateMeal(mealId,mealName,mealMenu,mealCategory,mealCategoryId,mealCategoryName,mealCategoryPrice,successCallback){$.ajax({method:"POST",url:"/menu/updateMeal",dataType:"json",data:{id:mealId,description:mealName,id_Menu:mealMenu,id_Subcategory:mealCategory,mealCategoryId:mealCategoryId,mealCategoryName:mealCategoryName,mealCategoryPrice:mealCategoryPrice}}).done(function(data){successCallback(data)}).fail(function(){alert("Something wrong happened... try later")}).always(function(){})}updateLesTerrassesMeal(mealId,mealName,mealPrice,mealCategory,successCallback){$.ajax({method:"POST",url:"/menu/updateLesTerrassesMeal",dataType:"json",data:{id:mealId,description:mealName,price:mealPrice,id_Category:mealCategory}}).done(function(data){successCallback(data)}).fail(function(){alert("Something wrong happened... try later")}).always(function(){})}updateCategory(categoryId,categoryName,successCallback){$.ajax({method:"POST",url:"/menu/updateCategory",dataType:"json",data:{name:categoryName,id_Category:categoryId}}).done(function(data){successCallback(data)}).fail(function(){alert("Something wrong happened... try later")}).always(function(){})}updateLesTerrassesCategory(categoryId,categoryName,successCallback){$.ajax({method:"POST",url:"/menu/updateLesTerrassesCategory",dataType:"json",data:{name:categoryName,id_Category:categoryId}}).done(function(data){successCallback(data)}).fail(function(){alert("Something wrong happened... try later")}).always(function(){})}}class MenuView{constructor(){}appendCategories(data,container){var html="";data.forEach(function(element){html+='<a href="#!" class="collection-item avatar category" data-id="'+element.id+'" style="min-height: auto;"><span class="title"><b>'+element.name+'</b></span><span class="secondary-content edit-category" style="top:10px;right:50px;"><i class="material-icons">edit</i></span><span class="secondary-content delete-category" style="top:10px;"><i class="material-icons">delete</i></span></a>'}),container.html(html)}appendMenus(data,container){var html="";data.forEach(function(element){html+='<a href="#!" class="collection-item avatar category-menu" data-id="'+element.id+'" data-price="'+element.price+'" data-image="'+element.image_url+'" style="min-height: auto;"><span class="title"><b>'+element.name+'</b></span><div class="switch"><label>Inactif<input type="checkbox" '+(element.active?"checked":"")+' class="activate"><span class="lever"></span>Actif</label></div><span class="secondary-content edit-menu" style="top:10px;right:50px;"><i class="material-icons">edit</i></span><span class="secondary-content delete-menu" style="top:10px;"><i class="material-icons">delete</i></span></a>'}),container.find(".collection").html(html),container.find(".card").show()}appendLesTerrassesMeals(data,container,append=!1){var html="";Array.isArray(data)||null==data||(data=[data]),data.forEach(function(element){html+='<a href="#!" class="collection-item avatar category-meal" data-id="'+element.id+'" style="min-height: auto;"><span class="title"><b>'+element.description+'</b></span><span class="secondary-content badge" style="top:10px;right:100px;">'+element.price+'€</span><span class="secondary-content edit-meal" style="top:10px;right:50px;"><i class="material-icons">edit</i></span><span class="secondary-content delete-meal" style="top:10px;"><i class="material-icons">delete</i></span></a>'}),append?container.find(".collection").append(html):container.find(".collection").html(html),container.find(".card").show()}appendMeals(data,container,append=!1){var html="";Array.isArray(data)||null==data||(data=[data]),data.forEach(function(element){html+='<a href="#!" class="collection-item avatar meal-menu" data-id="'+element.id+'" data-cat="'+element.id_Category+'" data-cat-name="'+(element.mealCategoryName?element.mealCategoryName:"")+'" data-cat-price="'+(element.mealCategoryPrice?element.mealCategoryPrice:"")+'" data-cat-id="'+(element.mealCategoryId?element.mealCategoryId:"")+'" style="min-height: auto;"><span class="title"><b>'+element.description+'</b></span><div class="switch"><label>Inactif<input type="checkbox" '+(element.active?"checked":"")+' class="activate"><span class="lever"></span>Actif</label></div><span class="secondary-content edit-meal" style="top:10px;right:50px;"><i class="material-icons">edit</i></span><span class="secondary-content delete-meal" style="top:10px;"><i class="material-icons">delete</i></span></a>'}),append?container.find(".collection").append(html):container.find(".collection").html(html),container.find(".card").show()}updateMealCategoriesSelect(data){var html="";data.forEach(function(element){html+='<option value="'+element.id+'">'+element.name+"</option>"}),$("#mealCategory").html(html),$("select").formSelect()}emptyMenuFields(){$("#menuName").val(""),$("#menuPrice").val(""),$("#menuId").val(""),$("#menuImage").attr("src",""),$("#file").val("")}emptyMealFields(){$("#mealId").val(""),$("#mealName").val(""),$("#mealCategoryId").val(""),$("#mealCategoryName").val(""),$("#mealCategoryPrice").val("")}emptyLesTerrassesMealFields(){$("#mealId").val(""),$("#mealName").val(""),$("#mealPrice").val("")}focusOnCategory(id){$("#menuCategory").val(id),$("#mealMenu").val("")}focusOnMenu(id){$("#mealMenu").val(id)}}$(document).ready(function(){}),Array.prototype.lastIndexOf=function(o){for(var index=this.length;index>=0;index--)if(index in this&&this[index]===o)return index;return-1},Array.prototype.insertAt=function(o,index){return index>-1&&index<=this.length&&(this.splice(index,0,o),!0)},Array.prototype.insertBefore=function(o,toInsert){var index=this.indexOf(o);return-1!==index&&(0===index?(this.unshift(toInsert),!0):this.insertAt(toInsert,index-1))},Array.prototype.insertAfter=function(o,toInsert){var index=this.indexOf(o);return-1!=index&&(index==this.length-1?(this.push(toInsert),!0):this.insertAt(toInsert,index+1))},Array.prototype.remove=function(from,to){var rest=this.slice((to||from)+1||this.length);return this.length=from<0?this.length+from:from,this.push.apply(this,rest)},Array.prototype.first=function(attribut,value){for(var i=0;i<this.length;i++)if(this[i][attribut]==value)return this.slice(i,i+1)[0];return null},Array.prototype.last=function(){return this[this.length-1]},Array.prototype.where=function(attribut,value){for(var res=[],i=0;i<this.length;i++)this[i][attribut]==value&&res.push(this.slice(i,i+1));return res},String.prototype.replaceAll=function(replace,value){return this.replace(new RegExp(replace,"g"),value)},String.prototype.isNullOrEmpty=function(){return null===this||""===this||"undefined"===this||void 0===this},$(document).ready(function(){var service=new MenuService,view=new MenuView;function uploadFile(files,menuId){const formData=new FormData;for(let i=0;i<files.length;i++){let file=files[i];formData.append("menuId",menuId),formData.append("files[]",file)}$.ajax({type:"POST",url:"/menu/cocktailcocktailupload",contentType:!1,processData:!1,data:formData}).done(function(data){console.log(data)})}function splitMealCategoryName(element){var tokens=element.split(" - ");$("#mealCategoryId").val(tokens[0]),$("#mealCategoryName").val(tokens[1]),$("#mealCategoryPrice").val(tokens[2]),M.updateTextFields()}service.getSubCategories(function(data){var autoComplete={};data.forEach(function(element){autoComplete[element.id+" - "+element.name]=null}),$("#mealCategory").autocomplete({data:autoComplete})}),service.getMealCategories(function(data){var autoComplete={};data.forEach(function(element){autoComplete[element.id+" - "+element.name+" - "+element.price]=null}),$("#mealCategoryName").autocomplete({data:autoComplete,onAutocomplete:splitMealCategoryName})}),$("#catalog-page #second-column").on("click",".category",function(e){if(!$(e.target).parent().hasClass("edit-category")){var id=$(this).attr("data-id");$("#first-column").html($("#second-column").html()),$("#second-column").html($("#third-column").html()),$("#second-column").find(".btn-floating").removeClass("meal-add").addClass("menu-add"),view.focusOnCategory(id),service.getMenu(id,function(data){view.appendMenus(data,$("#second-column"))})}}),$("#catalog-page #first-column").on("click",".category",function(e){if(!$(e.target).parent().hasClass("edit-category")){var id=$(this).attr("data-id");$("#second-column").html($("#third-column").html()),$("#second-column").removeClass("m3").addClass("m6"),$("#third-column").removeClass("m6").addClass("m3"),$("#third-column .card").hide(),$("#second-column").find(".btn-floating").removeClass("meal-add").addClass("menu-add"),view.focusOnCategory(id),service.getMenu(id,function(data){view.appendMenus(data,$("#second-column"))})}}),$("#catalog-page #second-column").on("click",".category-menu",function(){var parent=$(this).parent().parent().parent();parent.removeClass("m6").addClass("m3"),parent.siblings("#third-column").removeClass("m3").addClass("m6");var id=$(this).attr("data-id");$("#third-column").find(".btn-floating").removeClass("menu-add").addClass("meal-add"),view.focusOnMenu(id),service.getMeal(id,function(data){view.appendMeals(data,$("#third-column"))})}),$("#catalog-page .col").on("click",".category-add",function(){var categoryName=prompt("Nom de la catégorie ?"),container=$(this).siblings(".collection");null!=categoryName&&service.addCategory(categoryName,function(data){view.appendCategories(data,container)})}),$("#catalog-page .col").on("click",".menu-add",function(){modal[0].open(),view.emptyMenuFields()}),$("#catalog-page .col").on("click",".meal-add",function(){modal[1].open(),view.emptyMealFields(),service.getSubCategories(function(data){view.updateMealCategoriesSelect(data)})}),$("#addMenuButton").click(function(){$("#second-column .collection");var menuName=$("#menuName").val(),menuPrice=$("#menuPrice").val(),menuCategory=$("#menuCategory").val(),menuId=$("#menuId").val(),files=$("#file")[0].files;null!=menuId&&""!=menuId?(uploadFile(files,menuId),service.updateMenu(menuId,menuName,menuPrice,menuCategory,function(data){view.appendMenus(data,$("#second-column")),view.emptyMenuFields(),modal[0].close()})):service.addMenu(menuName,menuPrice,menuCategory,function(data){uploadFile(files,data.id),view.appendMenus(data.menus,$("#second-column")),view.emptyMenuFields(),modal[0].close()})}),$("#catalog-page #addMealButton").click(function(){$("#third-column .collection");var mealId=$("#mealId").val(),mealName=$("#mealName").val(),mealMenu=$("#mealMenu").val(),mealCategory=$("#mealCategory").val(),mealCategoryId=$("#mealCategoryId").val(),mealCategoryName=$("#mealCategoryName").val(),mealCategoryPrice=$("#mealCategoryPrice").val();null!=mealId&&""!=mealId?service.updateMeal(mealId,mealName,mealMenu,mealCategory,mealCategoryId,mealCategoryName,mealCategoryPrice,function(data){view.emptyMealFields(),modal[1].close()}):service.addMeal(mealName,mealMenu,mealCategory,mealCategoryId,mealCategoryName,mealCategoryPrice,function(data){view.appendMeals(data,$("#third-column"),!0),view.emptyMealFields(),modal[1].close()})}),$("#catalog-page .col").on("click",".delete-category",function(e){if(e.preventDefault(),e.stopPropagation(),confirm("Êtes-vous sur de vouloir supprimer cette catégorie et tous les menu et plats attâché à celle-ci ?")){var element=$(this).parent(),id=element.attr("data-id");service.deleteCategory(id,function(data){element.remove(),id==$("#menuCategory")&&view.focusOnCategory("")})}}),$(".col").on("click",".delete-menu",function(e){if(e.preventDefault(),e.stopPropagation(),confirm("Êtes-vous sur de vouloir supprimer ce menu et les plats associés ?")){var element=$(this).parent(),id=element.attr("data-id");service.deleteMenu(id,function(data){element.remove(),id==$("#mealMenu")&&view.focusOnMenu("")})}}),$("#catalog-page .col").on("click",".delete-meal",function(e){if(e.preventDefault(),e.stopPropagation(),confirm("Êtes-vous sur de vouloir supprimer ce plat ?")){var element=$(this).parent().parent(),id=element.attr("data-id");service.deleteMeal(id,function(data){element.remove()})}}),$(".col").on("click",".edit-menu",function(e){e.preventDefault(),e.stopPropagation();var element=$(this).parent(),id=element.attr("data-id"),price=element.attr("data-price"),image=element.attr("data-image"),name=element.find(".title b").html();modal[0].open(),$("#menuId").val(id),$("#menuPrice").val(price),$("#menuName").val(name),$("#menuImage").attr("src",image),M.updateTextFields()}),$("#catalog-page .col").on("click",".edit-meal",function(e){e.preventDefault(),e.stopPropagation();var element=$(this).parent(),id=element.attr("data-id"),catPrice=element.attr("data-cat-price"),catName=element.attr("data-cat-name"),dataCatId=element.attr("data-cat-id"),catId=element.attr("data-cat"),name=element.find(".title b").html();modal[1].open(),$("#mealId").val(id),$("#mealName").val(name),$("#mealCategoryPrice").val(catPrice),$("#mealCategoryName").val(catName),$("#mealCategoryId").val(dataCatId),service.getSubCategory(catId,function(data){$("#mealCategory").val(data.id+" - "+data.name),M.updateTextFields()})}),$("#catalog-page .col").on("click",".category-menu .activate",function(e){if(e.preventDefault(),e.stopPropagation(),$(this).prop("checked")&&!confirm("êtes-vous sur de vouloir ré-activer ce menu ?"))return!1;if(!$(this).prop("checked")&&!confirm("êtes-vous sur de vouloir désactiver ce menu ?"))return!1;var element=$(this);$.ajax({method:"POST",url:"/menu/activate",dataType:"json",data:{id:$(this).parent().parent().parent().attr("data-id"),isActive:$(this).prop("checked")}}).done(function(){element.prop("checked",!element.prop("checked"))}).fail(function(){alert("Something wrong happened... try later")}).always(function(){})}),$("#catalog-page").on("click",".edit-category",function(e){e.preventDefault(),e.stopPropagation();var categoryName=prompt("Nouveau nom de la catégorie ?"),container=$(this).parent().parent(),categoryId=$(this).parent().attr("data-id");null!=categoryName&&service.updateCategory(categoryId,categoryName,function(data){view.appendCategories(data,container)})}),$("#catalog-page .col").on("click",".meal-menu .activate",function(e){if(e.preventDefault(),e.stopPropagation(),$(this).prop("checked")&&!confirm("êtes-vous sur de vouloir ré-activer ce plat ?"))return!1;if(!$(this).prop("checked")&&!confirm("êtes-vous sur de vouloir désactiver ce plat ?"))return!1;var element=$(this);$.ajax({method:"POST",url:"/menu/mealactivate",dataType:"json",data:{id:$(this).parent().parent().parent().attr("data-id"),isActive:$(this).prop("checked")}}).done(function(){element.prop("checked",!element.prop("checked"))}).fail(function(){alert("Something wrong happened... try later")}).always(function(){})})}),$(document).ready(function(){var currentDevisId=-1;$("#createUser").click(function(){return $.ajax({method:"POST",url:"/devis/createClient/"+currentDevisId,dataType:"json",success:function(data){alert("Client créé avec succès !")}}),!1}),$("#devis-page .collection-item").click(function(e){currentDevisId=$(this).attr("data-id"),$.ajax({method:"GET",url:"/devis/get/"+$(this).attr("data-id"),dataType:"json",success:function(data){modal[0].open(),$("#creationDate").html(data.devis.creationDateDate+" à "+data.devis.creationTime),$("#isCompany").html(1==data.devis.isCompany?"de l'entreprise":"du particulier"),$("#name").html(1==data.devis.isCompany?data.devis.companyName:data.devis.firstname+" "+data.devis.lastname),$("#email").html('<i class="material-icons" style="vertical-align: middle;">mail</i>&nbsp;&nbsp;'+data.devis.email),$("#phoneNumber").html('<i class="material-icons" style="vertical-align: middle;">phone</i>&nbsp;&nbsp;'+data.devis.phoneNumber),$("#fromCompany").html(data.devis.fromCompany),data.devis.userId&&data.devis.userId>0?$("#createUser").hide():$("#createUser").show(),data.devis.message?$("#message").html("<b>Message : </b>"+data.devis.message):$("#message").html("<i>Ce client n'a pas désiré laisser de message...</i>"),$("#downloadbutton").attr("href","/devis/sendcommand/"+data.devis.id),data.devis.isCommand?$("#downloadbutton").show():$("#downloadbutton").hide(),null!=data.devis.eventDate&&""!=data.devis.eventDate?($("#eventData").show(),$("#eventDate").html('<i class="material-icons" style="vertical-align: middle;">calendar_today</i>&nbsp;&nbsp;'+data.devis.eventDate+" à "+data.devis.eventTime)):($("#eventData").show(),$("#eventDate").html('<i class="material-icons" style="vertical-align: middle;">calendar_today</i>&nbsp;&nbsp;<i>Le client na pas indiqué de date d\'événement</i>')),null!=data.devis.people&&""!=data.devis.people?($("#eventData").show(),$("#people").html('<i class="material-icons" style="vertical-align: middle;">people</i>&nbsp;&nbsp;Pour '+data.devis.people+" personnes")):($("#eventData").show(),$("#people").html('<i class="material-icons" style="vertical-align: middle;">people</i>&nbsp;&nbsp;<i>Le client n\'a pas indiqué de nombre d\'invité</i>')),null!=data.devis.zone&&""!=data.devis.zone?($("#eventData").show(),$("#eventZipcodeZone").html('<i class="material-icons" style="vertical-align: middle;">map</i>&nbsp;&nbsp;<b>Zone</b> '+data.devis.zone+" ; <b>Code postal :</b> "+data.devis.zipcode)):$("#eventData").hide()},error:function(data){console.log(data)}})})}),$(document).ready(function(){$(".company-fields").hide(),$("#openModal").click(function(){$("#itsPersonal").prop("checked",!0),$('input[type="text"], input[type="email"], input[type="tel"], input[type="hidden"]').val(""),$(".company-fields").hide(),$(".modal h4").html("Créer un nouveau client"),$(".modal form").attr("action","/client/add"),M.updateTextFields()}),$("#itsCompany").click(function(){$(".company-fields").show()}),$("#itsPersonal").click(function(){$(".company-fields").hide()}),$("#client-page .collection-item .activate").click(function(e){if(e.preventDefault(),e.stopPropagation(),$(this).prop("checked")&&!confirm("êtes-vous sur de vouloir faire de ce client un client vérifié ? Ces devis deviendront automatiquement des commandes."))return!1;if(!$(this).prop("checked")&&!confirm("êtes-vous sur de vouloir faire de ce client un client normal ? Ces devis deviendront ne seront plus des commandes."))return!1;var element=$(this);$.ajax({method:"POST",url:"/client/activate",dataType:"json",data:{id:$(this).attr("data-id"),isActive:$(this).prop("checked")}}).done(function(){element.prop("checked",!element.prop("checked")),modal[0].close()}).fail(function(){alert("Something wrong happened... try later")}).always(function(){})}),$("#client-page .collection-item").click(function(e){$.ajax({method:"GET",url:"/client/get/"+$(this).attr("data-id"),dataType:"json",success:function(data){modal[0].open(),$("#id").val(data.user.id),$("#isActive").val(data.user.isActive),$("#creationDate").val(data.user.creationDate),$("#email").val(data.user.email),$("#phoneNumber").val(data.user.phoneNumber),$("#firstname").val(data.user.firstname),$("#lastname").val(data.user.lastname),$("#address").val(data.user.address),$("#zipcode").val(data.user.zipcode),$("#city").val(data.user.city),$("#companyName").val(data.user.companyName),$("#companySiret").val(data.user.companySiret),$("#itsCompany").prop("checked",1==data.user.isCompany),$("#itsPersonal").prop("checked",1!=data.user.isCompany),$("#itsMt").prop("checked","Mets-Tendances"==data.user.fromCompany),$("#itsCc").prop("checked","Cocktail-Cocktail"==data.user.fromCompany),$("#itsTc").prop("checked","Les Terrasses de Courbevoie"==data.user.fromCompany),1==data.user.isCompany?$(".company-fields").show():$(".company-fields").hide(),M.updateTextFields(),$(".modal h4").html("Modifier le client"),$(".modal form").attr("action","/client/update")},error:function(data){console.log(data)}})})}),$(document).ready(function(){var service=new MenuService,view=new MenuView;$("#menu-page #second-column").on("click",".category",function(e){if(!$(e.target).parent().hasClass("edit-category")){var id=$(this).attr("data-id");$("#first-column").html($("#second-column").html()),$("#second-column").html($("#third-column").html()),$("#second-column").find(".btn-floating").addClass("meal-add"),$("#mealCategoryId").val(id),service.getLesTerrassesMeals(id,function(data){view.appendLesTerrassesMeals(data,$("#second-column"))})}}),$("#menu-page #first-column").on("click",".category",function(e){if(!$(e.target).parent().hasClass("edit-category")){var id=$(this).attr("data-id");$("#second-column").html($("#third-column").html()),$("#second-column").removeClass("m3").addClass("m6"),$("#third-column").removeClass("m6").addClass("m3"),$("#third-column .card").hide(),$("#second-column").find(".btn-floating").addClass("meal-add"),$("#mealCategoryId").val(id),service.getLesTerrassesMeals(id,function(data){view.appendLesTerrassesMeals(data,$("#second-column"))})}}),$("#menu-page .col").on("click",".category-add",function(){var categoryName=prompt("Nom de la catégorie ?"),container=$(this).siblings(".collection");null!=categoryName&&service.addLesTerrassesCategory(categoryName,function(data){view.appendCategories(data,container)})}),$("#menu-page .col").on("click",".meal-add",function(){modal[0].open(),view.emptyLesTerrassesMealFields()}),$("#menu-page #addMealButton").click(function(){$("#second-column .collection");var mealId=$("#mealId").val(),mealName=$("#mealName").val(),mealPrice=$("#mealPrice").val(),mealCategory=$("#mealCategoryId").val();null!=mealId&&""!=mealId?service.updateLesTerrassesMeal(mealId,mealName,mealPrice,mealCategory,function(data){view.emptyLesTerrassesMealFields(),modal[0].close()}):service.addLesTerrassesMeal(mealName,mealPrice,mealCategory,function(data){view.appendLesTerrassesMeals(data,$("#second-column"),!0),view.emptyLesTerrassesMealFields(),modal[0].close()})}),$("#menu-page .col").on("click",".delete-category",function(e){if(e.preventDefault(),e.stopPropagation(),confirm("Êtes-vous sur de vouloir supprimer cette catégorie et tous les plats attâchés à celle-ci ?")){var element=$(this).parent(),id=element.attr("data-id");service.deleteLesTerrassesCategory(id,function(data){element.remove(),id==$("#mealCategoryId")&&$("#mealCategoryId").val("")})}}),$("#menu-page .col").on("click",".delete-meal",function(e){if(e.preventDefault(),e.stopPropagation(),confirm("Êtes-vous sur de vouloir supprimer ce plat ?")){var element=$(this).parent(),id=element.attr("data-id");service.deleteLesTerrassesMeal(id,function(data){element.remove()})}}),$("#menu-page .col").on("click",".edit-meal",function(e){e.preventDefault(),e.stopPropagation();var element=$(this).parent(),id=element.attr("data-id"),name=element.find(".title b").html(),price=element.find(".badge").html().replace("€","");modal[0].open(),$("#mealId").val(id),$("#mealName").val(name),$("#mealPrice").val(price),M.updateTextFields()}),$("#menu-page").on("click",".edit-category",function(e){e.preventDefault(),e.stopPropagation();var categoryName=prompt("Nouveau nom de la catégorie ?"),container=$(this).parent().parent(),categoryId=$(this).parent().attr("data-id");null!=categoryName&&service.updateLesTerrassesCategory(categoryId,categoryName,function(data){view.appendCategories(data,container)})})}),$(document).ready(function(){$("#openModal").click(function(){$('input[type="text"], input[type="email"], input[type="tel"], input[type="hidden"]').val(""),$("textarea").html(""),$("textarea").val(""),$("#newsImage").attr("src",""),$(".modal h4").html("Créer une actualité"),$(".modal form").attr("action","/news/add"),M.updateTextFields()}),$("#news-page .collection-item").click(function(e){$.ajax({method:"GET",url:"/news/get/"+$(this).attr("data-id"),dataType:"json",success:function(data){modal[0].open(),$("#title").val(data.news.title),$("#description").val(data.news.description),$("#id").val(data.news.id),$("#creationDate").val(data.news.creationDate),$("#itsMt").prop("checked","Mets-Tendances"==data.news.fromCompany),$("#itsCc").prop("checked","Cocktail-Cocktail"==data.news.fromCompany),$("#itsTc").prop("checked","Les Terrasses de Courbevoie"==data.news.fromCompany),$("#newsImage").attr("src",data.news.image_url),M.updateTextFields(),$(".modal h4").html("Modifier l'actualité"),$(".modal form").attr("action","/news/update")},error:function(data){console.log(data)}})})}),$(document).ready(function(){var service=new MenuService;$("#zipcodezone-page .col").on("click",".zipcodezone-add",function(){modal[0].open()}),$("#addZipcodezoneButton").click(function(){var zipcode=$("#zipcode").val(),zone=$("#zone").val();service.addZipcode(zipcode,zone,function(data){document.location.reload()})}),$("#zipcodezone-page .col").on("click",".delete-zipcodezone",function(e){if(e.preventDefault(),e.stopPropagation(),confirm("Êtes-vous sur de vouloir supprimer ce code postal ?")){var element=$(this).parent(),id=element.attr("data-id");service.deleteZipcode(id,function(data){element.remove()})}})});