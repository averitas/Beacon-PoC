/**
 * 
 */

    $(document).ready(function(){
        // click on button submit
    	
    	
    	
        $("#submit").on('click', function(e){
        	var turl = 'http://localhost:8080/api/delete/patient/';
        	turl=turl.concat(document.getElementById("form1").elements["uname"].value);
        	e.preventDefault(); //cancel form submit
        	
            // send ajax
            $.ajax({
                url: turl, // url where to submit the request
                type : "DELETE", // type of action POST || GET
                success : function(result) {
                    document.getElementById("result").innerHTML="successfully deleted "+
                    					document.forms[0].elements[0].value;
                    console.log(result);
                },
                error: function(xhr, resp, text) {
                	document.getElementById("result").innerHTML=document.getElementById("result").innerHTML+
                					JSON.stringify(xhr)+JSON.stringify(resp)+text;
                    console.log(xhr, resp, text);
                },
                beforeSend: function (xhr){ 
                	document.getElementById("result").innerHTML=csrf_token+"<br/>"+turl+"<br/>";
                    xhr.setRequestHeader('X-CSRF-Token', csrf_token); 
                }
            })
        });
    });