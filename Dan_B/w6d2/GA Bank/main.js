var myApp = myApp || {};

myApp.updateColours = function() {
  var currentTotal = $('#current_total');
  var savingsTotal = $('#savings_total');
  var currentPanel = $('#current_panel');
  var savingsPanel = $('#savings_panel');

  if (parseFloat(currentTotal.text()) > 0) {
    currentPanel.removeClass('panel-danger').addClass('panel-success')
  } else {
    currentPanel.removeClass('panel-success').addClass('panel-danger')
  }

  if (parseFloat(savingsTotal.text()) > 0) {
    savingsPanel.removeClass('panel-danger').addClass('panel-success')
  } else {
    savingsPanel.removeClass('panel-success').addClass('panel-danger')
  }
}

myApp.savingDeposit = function() {
  var savingsTotal = $('#savings_total');
  var savingsTransAmount = $('#savings_amount');

  if (parseFloat(savingsTransAmount.val()) > 0) {
    
    var balance = (parseFloat(savingsTotal.text()) + parseFloat(savingsTransAmount.val()));
    savingsTotal.text(balance)
    savingsTransAmount.val("")
  } else {
    savingsTransAmount.val("")
  }
  myApp.updateColours()
}

myApp.savingWithdraw = function() {
  var savingsTotal = $('#savings_total');
  var savingsTransAmount = $('#savings_amount');

  if (parseFloat(savingsTransAmount.val()) <= parseFloat(savingsTotal.text()) && parseFloat(savingsTransAmount.val()) > 0) {

    var balance = (parseFloat(savingsTotal.text()) - parseFloat(savingsTransAmount.val()));
    savingsTotal.text(balance)
    savingsTransAmount.val("")
  } else {
    savingsTransAmount.val("")
  }
  myApp.updateColours()
}

myApp.currentDeposit = function() {
  var currentTotal = $('#current_total');
  var currentTransAmount = $('#current_amount');

  if (parseFloat(currentTransAmount.val()) > 0) {
    
    var balance = (parseFloat(currentTotal.text()) + parseFloat(currentTransAmount.val()));
    currentTotal.text(balance)
    currentTransAmount.val("")
  } else {
    currentTransAmount.val("")
  }
  myApp.updateColours()
}

myApp.currentWithdraw = function() {
  var currentTotal = $('#current_total');
  var savingsTotal = $('#savings_total');
  var currentTransAmount = $('#current_amount');

  var totalBalance = ( parseFloat(currentTotal.text()) + parseFloat(savingsTotal.text()) );

  if ( parseFloat(currentTransAmount.val()) <= totalBalance && parseFloat(currentTransAmount.val()) > 0) {

    if ( parseFloat(currentTransAmount.val()) <= parseFloat(currentTotal.text()) ) {
      var balance = ( parseFloat(currentTotal.text()) - parseFloat(currentTransAmount.val()) );

      currentTotal.text(balance)
      currentTransAmount.val("")
    } else {
      var savingsBalance = parseFloat(savingsTotal.text()) - parseFloat(currentTransAmount.val()) + parseFloat(currentTotal.text());

      currentTotal.text(0)
      savingsTotal.text(savingsBalance)
      currentTransAmount.val("")
    }

  } else {
    currentTransAmount.val("")
  }
  myApp.updateColours()
}

myApp.setup = function() {
  var $savingsDepositBtn = $('#savings_deposit');
  $savingsDepositBtn.on('click', myApp.savingDeposit);
  var $savingsWithdrawBtn = $('#savings_withdraw');
  $savingsWithdrawBtn.on('click', myApp.savingWithdraw);
  var $currentDepositBtn = $('#current_deposit');
  $currentDepositBtn.on('click', myApp.currentDeposit);
  var $currentWithdrawBtn = $('#current_withdraw');
  $currentWithdrawBtn.on('click', myApp.currentWithdraw);

  myApp.updateColours()
}

$(myApp.setup);