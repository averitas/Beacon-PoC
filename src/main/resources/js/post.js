

    $(document).ready(function(){
        // click on button submit
    	
    	var $post_example = $('#form1');
    	
        $("#submit").on('click', function(e){
        	
        	e.preventDefault(); //cancel form submit
    		
    		var jsObj = $post_example.serializeObject();
        	
            // send ajax
            $.ajax({
                url: 'add/patient', // url where to submit the request
                type : "POST", // type of action POST || GET
                contentType: "application/json",
                dataType : 'json', // data type
                data : JSON.stringify(jsObj), // post data || get data
                success : function(result) {
                    document.getElementById("result").innerHTML="successfully created "+
                    					document.forms[0].elements[0].value;
                    console.log(result);
                },
                error: function(xhr, resp, text) {
                	document.getElementById("result").innerHTML=document.getElementById("result").innerHTML+
                					JSON.stringify(xhr)+JSON.stringify(resp)+text;
                    console.log(xhr, resp, text);
                },
                beforeSend: function (xhr){ 
                	document.getElementById("result").innerHTML=csrf_token+"<br/>"+JSON.stringify($("#form1").serialize());
                    xhr.setRequestHeader('X-CSRF-Token', csrf_token); 
                }
            })
        });
    });
