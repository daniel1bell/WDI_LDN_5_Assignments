var myApp = myApp || {};

myApp.toggleNew = function() {
  var $newTodo = $('#new_todo');
  $newTodo.slideToggle("slow")
}

myApp.saveToDo = function(ev) {
  ev.preventDefault();

  var $name = $('#itemName').val();
  var $due = $('#dueDate').val();
  var $description = $('#description').val();

  var $table = $('#todo_table');

  $table.append('<tr><td>'+$name+'</td><td>'+$due+'</td><td>'+$description+'</td><td><input type="checkbox" name="complete" value="complete"></td></tr>');

  $('#itemName').val("");
  $('#dueDate').val("");
  $('#description').val("");

  myApp.toggleNew()
}

myApp.setup = function() {
  var $newButton = $('#new');
  $newButton.on('click', myApp.toggleNew);
  var $saveButton = $('#save_button');
  $saveButton.on('click', myApp.saveToDo);
}

$(myApp.setup);