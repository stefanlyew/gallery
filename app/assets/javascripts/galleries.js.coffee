# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file
#
jQuery ->
  $('.sortable').sortable(
    update: ->
      $.post($(this).data('update-url'), $(this).sortable('serialize'))
  )
#Lightbox 
((window, PhotoSwipe) ->
  document.addEventListener "DOMContentLoaded", (->
    options =
      captionAndToolbarFlipPosition: true
      captionAndToolbarAutoHideDelay: 0
      slideshowDelay: 1500
      loop: true

    instance = PhotoSwipe.attach(window.document.querySelectorAll(".thumbnails:not(.sortable) a"), options)
    return
  ), false
  return
) window, window.Code.PhotoSwipe

$(document).ready ->
  jQuery ->
    $(".sortable a").click (e) ->
      e.preventDefault()
      return false


