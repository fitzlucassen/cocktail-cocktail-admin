$(document).ready(function () {
    function deleteNews(element, id) {
        if (confirm("Êtes-vous sur de vouloir supprimer cette actualité ?")) {
            $.ajax({
                method: "POST",
                url: "/news/delete",
                dataType: "json",
                data: {
                    id_News: id
                }
            }).done(function (data) {
                element.remove();
            }).fail(function () {
                alert('Something wrong happened... try later');
            }).always(function () { });
        }
    }
    $('#news-page #openModal').click(function () {
        $('input[type="text"], input[type="email"], input[type="tel"], input[type="hidden"]').val('');
        $('textarea').html('');
        $('textarea').val('');
        $('#newsImage').attr('src', '');
        $('.modal h4').html('Créer une actualité');
        $('.modal form').attr('action', '/news/add');

        M.updateTextFields();
    });

    $('#news-page .collection-item').click(function (e) {
        var currentNewsId = $(this).attr('data-id');

        if ($(e.target).closest('.delete-news').length > 0) {
            deleteNews($(this), currentNewsId);
            return false;
        }

        $.ajax({
            method: "GET",
            url: "/news/get/" + currentNewsId,
            dataType: 'json',
            success: function (data) {
                modal[0].open();

                // fill modal
                $('#title').val(data.news.title);
                $('#description').val(data.news.description);
                $('#id').val(data.news.id);
                $('#creationDate').val(data.news.creationDate);

                $('#itsMt').prop('checked', data.news.fromCompany == 'Mets-Tendances');
                $('#itsCc').prop('checked', data.news.fromCompany == 'Cocktail-Cocktail');
                $('#itsTc').prop('checked', data.news.fromCompany == 'Les Terrasses de Courbevoie');
                $('#newsImage').attr('src', data.news.image_url);

                M.updateTextFields();

                $('.modal h4').html('Modifier l\'actualité');
                $('.modal form').attr('action', '/news/update');
            },
            error: function (data) { console.log(data); }
        });
    });
});
