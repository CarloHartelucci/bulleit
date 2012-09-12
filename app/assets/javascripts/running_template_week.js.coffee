# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

addWorkoutLeg = (table) ->
  last_row = table.$("tr:last")
  last_row_id = last_row.attr("id")
  last_row_id++
  last_row.insertAfter "<tr id='{0}''></tr>", last_row_id