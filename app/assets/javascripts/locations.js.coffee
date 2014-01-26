$ ->
  apartmentFields = $(".address_apartment_number")
  typeInput       = $("#address-type")
  typeLinks       = $(".address-type-link")

  type = ->
    typeInput.val()

  displayTypeFields = ->
    if type() is "apartment"
      apartmentFields.show()
    else
      apartmentFields.hide()

    typeLinks.removeClass("active")
      .siblings("[data-type='#{type()}']")
      .addClass('active')

  typeLinks.click (event) ->
    event.preventDefault()
    typeInput.val $(this).data("type")
    displayTypeFields()

  displayTypeFields()

  unless type()
    typeLinks.siblings("[data-type='house']").click()
