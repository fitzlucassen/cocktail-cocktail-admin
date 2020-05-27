$(document).ready(function () {
    $('#devis-page .collection-item').click(function (e) {
        $.ajax({
            method: "GET",
            url: "/devis/get/" + $(this).attr('data-id'),
            dataType: 'json',
            success: function (data) {
                modal[0].open();
                $('#creationDate').html(data.devis.creationDate);
                $('#isCompany').html(data.devis.isCompany == 1 ? "de l'entreprise" : "du particulier");
                $('#name').html(data.devis.isCompany == 1 ? data.devis.companyName : data.devis.firstname + ' ' + data.devis.lastname);

                $('#email').html('<i class="material-icons" style="vertical-align: middle;">mail</i>&nbsp;&nbsp;' + data.devis.email);
                $('#phoneNumber').html('<i class="material-icons" style="vertical-align: middle;">phone</i>&nbsp;&nbsp;' + data.devis.phoneNumber);
                $('#fromCompany').html(data.devis.fromCompany);
                
                if(data.devis.message)
                    $('#message').html("<b>Message : </b>" + data.devis.message);
                else 
                    $('#message').html("")

                $('#downloadbutton').attr('href', "/devis/sendcommand/" + data.devis.id);

                if(!data.devis.isCommand)
                    $('#downloadbutton').hide();
                else
                    $('#downloadbutton').show();

                if(data.devis.eventDate != null && data.devis.eventDate != "") {
                    $('#eventData').show();
                    $('#eventDate').html('<i class="material-icons" style="vertical-align: middle;">calendar_today</i>&nbsp;&nbsp;' + data.devis.eventDate + " à " + data.devis.eventTime);
                } else {
                    $('#eventData').hide();
                }
                if(data.devis.people != null && data.devis.people != "") {
                    $('#eventData').show();
                    $('#people').html('<i class="material-icons" style="vertical-align: middle;">people</i>&nbsp;&nbsp;Pour ' + data.devis.people + " personnes");
                } else {
                    $('#eventData').hide();
                }
                if(data.devis.zone != null && data.devis.zone != "") {
                    $('#eventData').show();
                    $('#eventZipcodeZone').html('<i class="material-icons" style="vertical-align: middle;">map</i>&nbsp;&nbsp;<b>Zone</b> ' + data.devis.zone + " ; <b>Code postal :</b> " + data.devis.zipcode);
                } else {
                    $('#eventData').hide();
                }
            },
            error: function (data) { console.log(data); }
        });
    });
});
