# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
jQuery ->
  $("#accordion").accordion
    collapsible: true
    active: false

$(document).ready ->
  $("a[href^=http]").each ->
    $(this).attr target: "_blank"  if @href.indexOf(location.hostname) is -1
