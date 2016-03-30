$(document).on('ready page:change', function (){
    $('#search').keyup(function(){
        $.ajax({
            type: 'GET',
            dataType: 'json',
            url: window.location.pathname + '/schools',
            data: {
                query: $(this).val()
            }
        }).success(function(data){
            var content = '';
            if (data.length > 0) {
                $('#warning').html('');
                data.forEach(function (item, i, arr) {
                    content += '<tr>' +
                        '<td align="center"><a class="btn btn-default" href="'+window.location.pathname+'/schools/' + item["id"] + '/edit"><em class="fa fa-pencil"></em></a>' + ' ' +
                        '<a data-confirm="Are you sure?" class="btn btn-danger" rel="nofollow" data-method="delete" href="'+window.location.pathname+'/schools/' + item["id"] + '"><em class="fa fa-trash"></em></a></td>' +
                        '<td class="hidden-xs">' + item["id"] + '</td>' +
                        '<td>' + item["name"] + '<a class="col col-lg-1" style="float: right" href="'+window.location.pathname+'/schools/' + item["id"] + '">More...</a></td>' +
                        '</tr>';
                });
                $('#schools tbody').html(content);
            }
            else{
                $('#schools tbody').html('');
                content = '</br><div class="col-lg-12"><div class="alert alert-warning">No results were found</div></div>';
                $('#warning').html(content);
            }
        });
    });
});
