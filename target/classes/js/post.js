

    $(document).ready(function(){
        // click on button submit
        $("#submit").on('click', function(){
            // send ajax
            $.ajax({
                url: 'add/patient', // url where to submit the request
                type : "POST", // type of action POST || GET
                dataType : 'json', // data type
                data : $("#form1").serialize(), // post data || get data
                success : function(result) {
                    document.getElementById("result").innerHTML="successfully created"+
                    					document.forms[0].elements[0].value;
                    console.log(result);
                },
                error: function(xhr, resp, text) {
                    console.log(xhr, resp, text);
                }
            })
        });
    });
