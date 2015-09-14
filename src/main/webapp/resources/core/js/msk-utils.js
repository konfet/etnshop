	function msk_test () {
		alert("TEST_JS");
		}
	
	
	function msk_confirm_test (id, name) {
	if (confirm("Are you sure you want to delete the product: " + id + "=" + name + "?")) {
		location = "/etnshop/product/delete/"+id; 
		return true;
		} 	else 
		{
			return false;
		}
	} 	
	
	function msk_confirm_delete (id, name) {
		if (confirm("Are you sure you want to delete the product: id="+ id + ", " + name + "?")) {
			location = "/etnshop/product/delete/"+id; 
			return true;
			} 	else {
				return false;
			}
		}
	
	
	
		