# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).ready ->
  $('.form_tabs a').on 'click', (e) ->
    e.preventDefault();
    e.stopPropagation();

  $('#broker_selection .next_step').on 'click', (e) ->
    $('.form_tabs li:eq(1) a').tab 'show'

  $('#company_type .next_step').on 'click', (e) ->
    $('.form_tabs li:eq(2) a').tab 'show'
