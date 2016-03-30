# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on "page:change", ->
  $('.choose-user').on "change", (e) ->
      id = $(e.target).attr('id')
      if ($(this).is ':checked')
        $.post($(e.target).attr('data-add-path')).done (data) ->
          alert "Student added to grade"
      else
        $.post($(e.target).attr('data-delete-path')).done (data) ->
          alert "Student deleted from grade"