# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready ->
	$.ajax {
    type: "get",
    url: "list",
    data: '',
    success: (data) ->
	    $.each(data, (i, field) ->
		    $.ajax {
	        type: "get",
	        url: "note",
	        data: 'path=' + field.path,
	        success: (data) ->
	        	noteElement = document.createElement "div"
	        	noteElement.innerText = data
	        	$('#notes').append noteElement
	      }
	      )
    }