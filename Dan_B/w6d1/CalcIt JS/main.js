function update() {
  var num1 = document.getElementById('number1');
  var num2 = document.getElementById('number2');
  var operator = document.getElementById('operator').value;

  if (operator == "Square Root") {
    num2.setAttribute('style', 'display: none;')
  } else if (operator != "Square Root") {
    num2.setAttribute('style', 'display: inline;')
  }

    var answerSpace = document.getElementById('answer')

    var a = parseFloat(num1.value)
    var b = parseFloat(num2.value)

    if (operator == "+") {
      var answer = a + b;
    } else if (operator == "-") {
      var answer = a - b;
    } else if (operator == "*") {
      var answer = a * b;
    } else if (operator == "/") {
      var answer = a / b;
    } else if (operator == "Square Root") {
      var answer = Math.sqrt(a);
    }

    answerSpace.innerHTML = "= " + answer
}