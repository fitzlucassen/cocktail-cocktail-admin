$(document).ready(function () {
    $('.company-fields').hide();

    $('#openModal').click(function () {
        $('#itsPersonal').prop('checked', true);
        $('input').val('');
        $('.company-fields').hide();

        M.updateTextFields();
    });
    $('#itsCompany').click(function () {
        $('.company-fields').show();
    });
    $('#itsPersonal').click(function () {
        $('.company-fields').hide();
    });

    $('#client-page .collection-item .activate').click(function (e) {
        e.preventDefault();
        e.stopPropagation();

        var element = $(this);
        $.ajax({
            method: "POST",
            url: "/client/activate",
            dataType: "json",
            data: {
                id: $(this).attr('data-id'),
                isActive: $(this).prop('checked')
            }
        }).done(function () {
            element.prop('checked', !element.prop('checked'));
            modal[0].close();

        })
            .fail(function () {
                alert('Something wrong happened... try later');
            })
            .always(function () { });
    });

    $('#client-page .collection-item').click(function (e) {
        $.ajax({
            method: "GET",
            url: "/client/get/" + $(this).attr('data-id'),
            dataType: 'json',
            success: function (data) {
                modal[0].open();
                $('#id').val(data.user.id);
                $('#isActive').val(data.user.isActive);
                $('#creationDate').val(data.user.creationDate);

                $('#email').val(data.user.email);
                $('#phoneNumber').val(data.user.phoneNumber);
                $('#firstname').val(data.user.firstname);
                $('#lastname').val(data.user.lastname);
                $('#address').val(data.user.address);
                $('#city').val(data.user.city);
                $('#companyName').val(data.user.companyName);
                $('#companySiret').val(data.user.companySiret);
                $('#itsCompany').prop('checked', data.user.isCompany == 1);
                $('#itsPersonal').prop('checked', data.user.isCompany != 1);
                $('#itsMt').prop('checked', data.user.fromCompany == 'Mets-Tendances');
                $('#itsCc').prop('checked', data.user.fromCompany == 'Cocktail-Cocktail');
                $('#itsTc').prop('checked', data.user.fromCompany == 'Les Terrasses de Courbevoie');

                if (data.user.isCompany == 1)
                    $('.company-fields').show();
                else
                    $('.company-fields').hide();

                M.updateTextFields();

                $('.modal h4').html('Modifier le client');
                $('.modal form').attr('action', '/client/update');
            },
            error: function (data) { console.log(data); }
        });
    });
});