var calcIt = calcIt || {};

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


calcIt.basicUpdate = function() {
  var num1 = document.getElementById('number1');
  var num2 = document.getElementById('number2');
  var operator = document.getElementById('operator');
  var method = operator.value

  // if (method == "Square Root") {
  //   num2.setAttribute('style', 'display: none;');
  // } else if (method != "Square Root") {
  //   num2.setAttribute('style', 'display: inline;');
  // }

  if (method != "Square Root") {
    num2.setAttribute('style', 'display: inline;');
  } else {
    num2.setAttribute('style', 'display: none;');
  }

  if (numberCheck(num1) && method == "Square Root") {
    var a = parseFloat(num1.value);
  
    var result = Math.sqrt(a);
    printAnswer('answer', result);
    
  } else if (numberCheck(num1) && numberCheck(num2) && method != "Square Root") {
    var a = parseFloat(num1.value);
    var b = parseFloat(num2.value);

    if (method == "+") {
      var result = a + b;
      printAnswer('answer', result);
    } else if (method == "-") {
      var result = a - b;
      printAnswer('answer', result);
    } else if (method == "*") {
      var result = a * b;
      printAnswer('answer', result);
    } else if (method == "/") {
      var result = a / b;
      printAnswer('answer', result);
    }
  }
}

calcIt.mortgageUpdate = function() {
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

calcIt.bmiUpdate = function() {
  var weight = document.getElementById('weight');
  var height = document.getElementById('height');
  var weight_measure = document.getElementById('weight_metric');
  var height_measure = document.getElementById('height_metric');

  if (weight_measure.checked) {
    weight.setAttribute('placeholder', 'Your Weight (kg)');
  } else {
    weight.setAttribute('placeholder', 'Your Weight (lb)');
  }

  if (height_measure.checked) {
    height.setAttribute('placeholder', 'Your Height (cm)');
  } else {
    height.setAttribute('placeholder', 'Your Height (inches)');
  }

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

calcIt.tripUpdate = function() {
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

calcIt.setup = function() {
  var num1 = document.getElementById('number1');
  var num2 = document.getElementById('number2');
  var operator = document.getElementById('operator');

  num1.addEventListener('keyup', calcIt.basicUpdate);
  num1.addEventListener('change', calcIt.basicUpdate);
  num2.addEventListener('keyup', calcIt.basicUpdate);
  num2.addEventListener('change', calcIt.basicUpdate);
  operator.addEventListener('change', calcIt.basicUpdate);

  var principal = document.getElementById('principal');
  var rate = document.getElementById('rate');
  var years = document.getElementById('mortgage_length_years');

  principal.addEventListener('keyup', calcIt.mortgageUpdate);
  principal.addEventListener('change', calcIt.mortgageUpdate);
  rate.addEventListener('keyup', calcIt.mortgageUpdate);
  rate.addEventListener('change', calcIt.mortgageUpdate);
  years.addEventListener('keyup', calcIt.mortgageUpdate);
  years.addEventListener('change', calcIt.mortgageUpdate);

  var weight = document.getElementById('weight');
  var height = document.getElementById('height');
  var weight_metric = document.getElementById('weight_metric');
  var height_metric = document.getElementById('height_metric');
  var weight_imperial = document.getElementById('weight_imperial');
  var height_imperial = document.getElementById('height_imperial');

  weight.addEventListener('keyup', calcIt.bmiUpdate);
  weight.addEventListener('change', calcIt.bmiUpdate);
  height.addEventListener('keyup', calcIt.bmiUpdate);
  height.addEventListener('change', calcIt.bmiUpdate);
  weight_metric.addEventListener('change', calcIt.bmiUpdate);
  height_metric.addEventListener('change', calcIt.bmiUpdate);
  weight_imperial.addEventListener('change', calcIt.bmiUpdate);
  height_imperial.addEventListener('change', calcIt.bmiUpdate);  

  var distance = document.getElementById('distance');
  var efficiency = document.getElementById('efficiency');
  var cost = document.getElementById('cost');
  var speed = document.getElementById('speed');

  distance.addEventListener('keyup', calcIt.tripUpdate);
  distance.addEventListener('change', calcIt.tripUpdate);
  efficiency.addEventListener('keyup', calcIt.tripUpdate);
  efficiency.addEventListener('change', calcIt.tripUpdate);
  cost.addEventListener('keyup', calcIt.tripUpdate);
  cost.addEventListener('change', calcIt.tripUpdate);
  speed.addEventListener('keyup', calcIt.tripUpdate);
  speed.addEventListener('change', calcIt.tripUpdate);

}

document.addEventListener('DOMContentLoaded', calcIt.setup);