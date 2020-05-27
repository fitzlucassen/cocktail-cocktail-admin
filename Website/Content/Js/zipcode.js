$(document).ready(function () {
    var service = new MenuService();

    $('#zipcodezone-page .col').on('click', '.zipcodezone-add', function () {
        modal[0].open();
    });


    $('#addZipcodezoneButton').click(function () {
        var zipcode = $('#zipcode').val();
        var zone = $('#zone').val();

        service.addZipcode(zipcode, zone, function (data) {
            document.location.reload();
        });
    });

    $('#zipcodezone-page .col').on('click', '.delete-zipcodezone', function (e) {
        e.preventDefault();
        e.stopPropagation();

        if (confirm("Êtes-vous sur de vouloir supprimer ce code postal ?")) {
            var element = $(this).parent();
            var id = element.attr('data-id');

            service.deleteZipcode(id, function (data) {
                element.remove();
            });
        }
    });
});