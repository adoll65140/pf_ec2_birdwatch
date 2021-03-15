# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->
  $("#postcode").jpostal({
    postcode : [ "#postcode" ],
    address  : {
                  "#prefecture_code" : "%3",
                  "#address_city" : "%4",
                  "#address_street" : "%5%6%7"
                }
  });
