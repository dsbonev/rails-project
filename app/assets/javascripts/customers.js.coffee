# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).ready ->
  $('.form_tabs a').on 'click', (e) ->
    e.preventDefault();
    e.stopPropagation();

  errorMessageEl = $('<div class="alert alert-info">Select between 1 and 3 brokers</div>').appendTo($('.customer_brokers'))
  $('.customer_brokers').on 'change', 'input[type=checkbox]', ->
    if (valid = 0 < $('.customer_brokers input:checked').length < 4)
      errorMessageEl.hide()
    else
      errorMessageEl.show()

  $('#broker_selection .next_step').on 'click', (e) ->
    if (valid = 0 < $('.customer_brokers input:checked').length < 4)
      $('.form_tabs li:eq(1) a').tab 'show'
      $('.progress-bar-success').css(width: '33%')

  $('#company_type .next_step').on 'click', (e) ->
    $('.form_tabs li:eq(2) a').tab 'show'
    $('.progress-bar-success').css(width: '67%')
