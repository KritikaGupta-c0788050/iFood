if (document.readyState == 'loading') {
	document.addEventListener('DOMContentLoaded', ready)
}else{
	ready()
}

function ready() {
//	var removeCartItemButtons = document.getElementsByClassName('removed')
//	console.log(removeCartItemButtons)
//	for (var i = 0; i < removeCartItemButtons.length; i++) {
//	        var button = removeCartItemButtons[i]
//	        button.addEventListener('click', removeCartItem)
//	}
	
	var quantityInputs = document.getElementsByClassName('classQuant')
	for (var i = 0; i < quantityInputs.length; i++) {
		var input = quantityInputs[i]
		input.addEventListener('change', quantityChanged)
	}
	
	document.getElementsByClassName('check')[0].addEventListener('click',purchaseClicked)
}

function purchaseClicked(event) {
	var cartItemContainer = document.getElementsByTagName('TBODY')[0]	
	var cartRows = cartItemContainer.getElementsByClassName('cake-top')
	var nameElement = []
	for (var i = 0; i < cartRows.length; i++) {
		var cartRow = cartRows[i]
		nameElement.push((cartRow.getElementsByClassName('classNAME')[0].innerText)+':'+cartRow.getElementsByClassName('classQuant')[0].value)
	}
	document.forms.form.updatedData.value=nameElement;
	form.submit();
}

//function removeCartItem(event) {
//	var buttonClicked = event.target
//	buttonClicked.closest('tr').remove()
//	updateCartTotal()
//}

function quantityChanged(event){
	var input = event.target
	if (isNaN(input.value) || input.value <=0) {
		input.value = 1
	}
	updateCartTotal()
}

function updateCartTotal(){
	var cartItemContainer = document.getElementsByTagName('TBODY')[0]	
	var cartRows = cartItemContainer.getElementsByClassName('cake-top')
	var total = 0
	for (var i = 0; i < cartRows.length; i++) {
		var cartRow = cartRows[i]
		var priceElement = cartRow.getElementsByClassName('priceELE')[0]
		var quantityElement = cartRow.getElementsByClassName('classQuant')[0]
		var price = parseFloat(priceElement.innerText.replace('$',''))
		var quantity = quantityElement.value
		total = total + (price*quantity)
		
	}
	total = Math.round(total*100) / 100
	document.getElementsByClassName('total')[0].innerText= '$'+total
}
