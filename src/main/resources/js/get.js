/**
 * 
 */

    $(document).ready(function(){
        // click on button submit
    	
    	var $post_example = $('#form1');
    	
        $("#search").on('click', function(e){
        	
        	e.preventDefault(); //cancel form submit
    		
        	var turl = 'http://localhost:8080/api/patient/';
        	turl=turl.concat(document.getElementById("form1").elements["uname"].value);
        	
            // send ajax
            $.ajax({
                url: turl, // url where to submit the request
                type : "GET", // type of action POST || GET
                success : function( result, status, jqXHR ) {
                	if( jqXHR.getResponseHeader('content-type').indexOf('text/html') >= 0 ) {
                		document.getElementById("result").innerHTML=result;
                    }else{
                    document.getElementById("result").innerHTML="get";
                    document.getElementById("uname").value=result.uname;
                    document.getElementById("password").value=result.password;
                    document.getElementById("fname").value=result.fname;
                    document.getElementById("lname").value=result.lname;
                    document.getElementById("email").value=result.email;
                    document.getElementById("address").value=result.address;
                    console.log(result);
                	}
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