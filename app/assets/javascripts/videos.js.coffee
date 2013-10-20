# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/


$(document).on "click", "a.video-feature", (event) ->
  event.preventDefault()
  $(this).closest("div.video").find("form").submit()

$(document).on "click", "a.video-sidebar-link", (event) ->
  event.preventDefault()
  embed_url = $(this).data("embed-url")
  document.getElementById("embed_video").src = embed_url
  $("p#embed-description").html($(this).data("description"))

$ ->
  $("a[data-toggle='tooltip']").tooltip()