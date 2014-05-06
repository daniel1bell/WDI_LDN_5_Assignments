function numberCheck(input) {
  return !input.value == false && !isNaN(parseFloat(input.value));
}

function roundNumber(number) {
  if (number % 1 > 0) {
    return parseFloat(number.toFixed(2));
  } else {
    return number;
  }
}

function printAnswer(css_id, answer) {
  var answerSpace = document.getElementById(css_id);
  answerSpace.innerHTML = "= " + roundNumber(answer)
}


function basicUpdate() {
  var num1 = document.getElementById('number1');
  var num2 = document.getElementById('number2');
  var operator = document.getElementById('operator').value;

  if (operator == "Square Root") {
    num2.setAttribute('style', 'display: none;');
  } else if (operator != "Square Root") {
    num2.setAttribute('style', 'display: inline;');
  }

  if (numberCheck(num1) && numberCheck(num2) == false) {
    var a = parseFloat(num1.value);
  
    if (operator == "Square Root") {
      var result = Math.sqrt(a);
      printAnswer('answer', result);
    }
  } else if (numberCheck(num1) && numberCheck(num2)) {
    var a = parseFloat(num1.value);
    var b = parseFloat(num2.value);

    if (operator == "+") {
      var result = a + b;
      printAnswer('answer', result);
    } else if (operator == "-") {
      var result = a - b;
      printAnswer('answer', result);
    } else if (operator == "*") {
      var result = a * b;
      printAnswer('answer', result);
    } else if (operator == "/") {
      var result = a / b;
      printAnswer('answer', result);
    }
  }
}

function mortgageUpdate() {
  var principal = document.getElementById('principal');
  var rate = document.getElementById('rate');
  var years = document.getElementById('mortgage_length_years');

  if (numberCheck(principal) && numberCheck(rate) && numberCheck(years)) {
    var p = parseFloat(principal.value);
    var r = parseFloat(rate.value) / 100 / 12;
    var l = parseFloat(years.value) * 12;

    var result = p * (r * (Math.pow((1 + r), l))) / ((Math.pow(1 + r, l)) -1);

    var answerSpace = document.getElementById('monthly_payments');
    answerSpace.innerHTML = "= \u00A3" + roundNumber(result)
  }
}

function bmiUpdate() {
  var weight = document.getElementById('weight');
  var height = document.getElementById('height');
  var weight_measure = document.getElementById('weight_measure');
  var height_measure = document.getElementById('height_measure');

  if (numberCheck(weight) && numberCheck(height)) {
    if (weight_measure.checked) {
      var w = parseFloat(weight.value);
    } else {
      var w = parseFloat(weight.value) * 0.453592;
    }

    if (height_measure.checked) {
      var h = parseFloat(height.value) / 100;
    } else {
      var h = parseFloat(height.value) / 0.393700787 / 100;
    }

    var result = w / Math.pow(h, 2);
    printAnswer('bmi_result', result)
  }
}

function tripUpdate() {
  var distance = document.getElementById('distance');
  var efficiency = document.getElementById('efficiency');
  var cost = document.getElementById('cost');
  var speed = document.getElementById('speed');

  if (numberCheck(distance) && numberCheck(efficiency) && numberCheck(cost) && numberCheck(speed)) {
    var d = parseFloat(distance.value);
    var e = parseFloat(efficiency.value);
    var c = parseFloat(cost.value) / 100;
    var s = parseFloat(speed.value);

    var time = d/s;
    var journeyCost = (d/e) * (c * 4.54609188);

    var answerSpace = document.getElementById('trip_result');
    answerSpace.innerHTML = "= \u00A3" + roundNumber(journeyCost) + " and a time of " + roundNumber(time) + " hours."
  }
}