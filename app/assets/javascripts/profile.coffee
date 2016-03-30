$(document).on 'ready page:change', ->
    readURL = (input) ->

        if (input.files && input.files[0])
            reader = new FileReader()

            reader.onload = (e) ->
                $('#preview').attr('src', e.target.result)

            reader.readAsDataURL(input.files[0]);

    $("#user_profile_attributes_avatar").change ->
        readURL(this)
