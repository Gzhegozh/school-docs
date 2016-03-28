$(document).on('ready page:change', function (){
    $('#search').keyup(function(){
        $.ajax({
            type: 'GET',
            dataType: 'json',
            url: '/school_groups',
            data: {
                query: $(this).val()
            }
        }).success(function(data){
            //alert("df");
        });
    });
});