# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).ready ->
  spinner = new Spinner
      color:'#7f7f7f'
      left: '20%'

  # prevent user ability of going to next tab
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
  cached_company_data = {}
  $('#company-type-selection').on 'change', (e) ->
    companyDetailsContainer = $ '#company-details-fields'

    cached_company_data = companyDetailsContainer.find('input').serializeArray()
                                                        .reduce ((company_data, field)->
                                                          company_data[field.name] = field.value if field.name != 'customer[company_attributes][type]'
                                                          company_data
                                                        ), cached_company_data

    if (selected = e.target.value)
      $.ajax
        url: "/customers/template/company"
        data:
          type: selected
      .done (data)->
        companyDetailsContainer.empty().html data

        $.each cached_company_data, (name, value)->
          companyDetailsContainer.find("input").filter(-> this.name == name ).val(value)
      .fail -> companyDetailsContainer.empty().html '<div class="alert alert-danger">Request error</div>'
      .always ->
        spinner.stop()

      spinner.spin(companyDetailsContainer.get(0))

  # add more
  $('#company-details-fields').on 'click', ".btn-add-more", ->
    count = $(this).parent('fieldset').find('input[type=text]').size()
    template = "##{$(this).data('template')}"
    $(evaluateTemplate($(template), index: count)).insertBefore $(this)
                                                                .find('input')
                                                                  .focus()
    preventMoreIfMaximum $(this), count + 1

  evaluateTemplate = (template, data)->
    t = Handlebars.compile template.html().trim()
    t data

  preventMoreIfMaximum = (button, count)->
    if count == button.data 'max'
      button.addClass 'disabled'
            .prop 'disabled', true

  $('#company-details-fields').on 'click', ".btn-remove-item", ->
    $(this).parent('.form-group').remove()

  $('#company_type .next_step').on 'click', (e) ->
    invalid = $('#company-details-fields input').filter (index) ->
      !this.checkValidity()

    # clear errors
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
