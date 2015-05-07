
<script language="JavaScript">
	function validateNewItem(){
		  if(document.newItemForm.title.value == ""){
			alert("Please enter title");
			document.newItemForm.title.focus();
			return;
		  }
		  if(document.newItemForm.description.value == ""){
			alert("Please enter description");
			document.newItemForm.description.focus();
			return;
		  }
		  if(document.newItemForm.quantity.value == ""){
			alert("Please enter quantity");
			document.newItemForm.quantity.focus();
			return;
		  }
		  var quantity = document.newItemForm.quantity.value;
		  if(isNaN(quantity) || parseInt(quantity) != quantity || isNaN(parseInt(quantity, 10)) || quantity < 1) {
			alert("Quantity should be a positive integer");
			document.newItemForm.quantity.focus();
			return;
		  }
		  document.newItemForm.submit();
		}
	</script>


<form name="newItemForm" action="newitem.jsp" method="post" class="form-4">
					<h1>ADD NEW ITEM</h1>
    				<p>
       					<label for="login">Title</label>
						<input type="text" name="title" placeholder="Title" required>
    				</p>
    				<p>
       					<label for="login">Description</label>
						<input type="text" name="description" placeholder="Description" required>
    				</p>
					<p>
					    <label for="login">Quantity</label>
					    <input type="text" name='quantity' placeholder="Quantity" required> 
					</p>
					<p>
        				<input type="button" value="Continue" onClick="JavaScript:validateNewItem()">
					</p>
				</form>