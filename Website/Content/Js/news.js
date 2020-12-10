$(document).ready(function () {
    $('#openModal').click(function () {
        $('input[type="text"], input[type="email"], input[type="tel"], input[type="hidden"]').val('');
        $('textarea').html('');
        $('textarea').val('');
        $('#newsImage').attr('src', '');
        $('.modal h4').html('Créer une actualité');
        $('.modal form').attr('action', '/news/add');

        M.updateTextFields();
    });

    $('#news-page .collection-item').click(function (e) {
        $.ajax({
            method: "GET",
            url: "/news/get/" + $(this).attr('data-id'),
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
