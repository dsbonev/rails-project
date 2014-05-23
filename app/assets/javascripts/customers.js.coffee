# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).ready ->
  $('.form_tabs a').on 'click', (e) ->
    e.preventDefault();
    e.stopPropagation();

  # Step 1
  brokerCountMessageEl = $('<div class="alert alert-danger">Select between 1 and 3 brokers</div>').prependTo($('.customer_brokers'))
  $('.customer_brokers').on 'change', 'input[type=checkbox]', ->
    if (valid = 0 < $('.customer_brokers input:checked').length < 4)
      brokerCountMessageEl.removeClass 'alert-danger'
                          .addClass 'alert-success'
    else
      brokerCountMessageEl.removeClass 'alert-success'
                          .addClass 'alert-danger'

  $('#broker_selection .next_step').on 'click', (e) ->
    if (valid = 0 < $('.customer_brokers input:checked').length < 4)
      $('.form_tabs li:eq(1) a').tab 'show'
      $('.progress-bar-success').css(width: '33%')


  # Step 2
  company_data = {}
  $('#company-type-selection').on 'change', (e) ->
    companyDetailsContainer = $ '#company-details-fields'
    spinner = new Spinner
      color:'#fff'
      left: '20%'

    company_data = companyDetailsContainer.find('input').serializeArray()
                                                        .reduce ((company_data, field)->
                                                          company_data[field.name] = field.value
                                                          company_data
                                                        ), company_data

    if (selected = e.target.value)
      $.ajax
        url: "/customers/template/company"
        data:
          type: selected
      .done (data)->
        companyDetailsContainer.empty().html data
        $.each company_data, (name, value)->
          companyDetailsContainer.find("input").filter(-> this.name == name ).val(value)
      .fail -> companyDetailsContainer.empty().html '<div class="alert alert-danger">Request error</div>'
      .always ->
        spinner.stop()

      spinner.spin(companyDetailsContainer.get(0))

  $('#company_type .next_step').on 'click', (e) ->
    invalid = $('#company-details-fields input').filter (index) ->
      !this.checkValidity()

    #clear errors
    $('#company-details-fields .has-error .help-block').empty()
    $('#company-details-fields .has-error').removeClass 'has-error'

    if invalid.length == 0
      loadUploadFileTemplate $('#company-type-selection').val()
      $('.form_tabs li:eq(2) a').tab 'show'
      $('.progress-bar-success').css(width: '67%')
    else
      invalid.each ->
        $(this).parent('.form-group')
          .addClass('has-error')
          .find('.help-block')
            .text(this.validationMessage)

  # Step 3
  loadUploadFileTemplate = (companyType)->
    $('#supporting-document-fields').load '/customers/template/supporting_document', "type=#{companyType}"
