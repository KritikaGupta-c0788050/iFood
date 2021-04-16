<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
    
   		 
    	$(document).ready(function(){
    		$.ajax({
    			url: "/FoodOrderController.java",
    			method: "GET",
    			data: {operation: 'food_item'},
    			success: function(data, textStatus, jqXHR) {
    				console.log(data);
    				let obj = $.parseJSON(data);
    				$.each(obj, function(key,value){
    					$('#food_item').append('<option value="'+value.id+'">'+value.food+'</option>')
    				});
    				$('select').formSelect();
    			},
    			error: function(jqXHR, textStatus, errorThrown) {
    				$('#food_item').append('<option>Not Available</option>');
    			},
    			cache: false
    		
    		});
    	});
</script>
</head>
<body>
<form action="/iFoodProject/foodOrder" method="get">
 <select class="form-control" id="food_item" onchange="finalCost()">
                     <option> Food </option>
                              
                  </select>
	<input type="submit">
</form>
</body>
</html>