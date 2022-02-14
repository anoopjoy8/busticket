<!doctype html>
<html lang="en">
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <cfinclude template = "includes/header-script.cfm">
</head>
<cfinclude template = "includes/header.cfm">
<!--- datepicker --->
<link href="public/css/datepicker/datepicker3.css" rel="stylesheet" />
<body>

<!--- from section starts here --->
<div class="container">
    <div class="frm-sec">
            <!---
            <div class="row d-flex justify-content-center">
                <div class="form-group col-md-1">
                </div>
                <div class="form-group col-md-3">
                    <label class="frm-label">Location From</label>
                </div>
                <div class="form-group col-md-1">
                </div>
                <div class="form-group col-md-3">
                    <label class="frm-label">Location To</label>
                </div>
                
                <div class="form-group col-md-2">
                    <label class="frm-label">Date of Journey</label>
                </div>
                <div class="form-group col-md-2">
                </div>
                
            </div>
            --->
        

            <div class="row no-gutters">
                <div class="form-group col-md-1 d-flex justify-content-center align-items-center des1 form-control input-wd rnd-cr">
                    <i class="fa fa-location-arrow"></i> 
                </div>
                <div class="form-group col-md-3 col-sm">
                    <input type="text" class="form-control input-wd form-group des2" id="inputPassword2fr" value="" placeholder="Select location" autocomplete="off" onkeyup="handleLocation(this.value,'from')">
                </div>
                <div id="togglebtn-n" class="des1 form-control input-wd">
                    <span id="togglebtn"><i class="fas fa-exchange-alt"></i></span>
                </div>
                <div class="form-group col-md-1 d-flex justify-content-center align-items-center des1 form-control input-wd no-br">
                    <i class="fa fa-map-marker-alt"> </i> 
                </div>
                <div class="form-group col-md-3">
                    <input type="text" class="form-control input-wd des2" id="inputPassword2to" placeholder="Going To" autocomplete="off" onkeyup="handleLocation(this.value,'to')">
                </div>
        
                <div class="form-group col-md-2">
                    <div class="jquery-datepicker">
                        <input type="text" class="form-control input-wd in-1 jquery-datepicker__input datepicker1 dt no-br" id="j-date" placeholder="Date" autocomplete="off">
                    </div>
                </div>
                <div class="form-group col-md-1">
                    <a class="form-control input-wd srch-ip a-srch" onclick="handleSearch(event)"> Search </a>
                </div> 
            </div>

            <div class="row no-gutters">
                <div class="form-group col-md-4 span-dv">
                  <input type="hidden" name="loc_id_from" id="loc_id_from" value=""/>
                  <span id="loc-list"> </span> 
                </div>
                <div style="width:40px;">
                </div>
                <div class="form-group col-md-4 span-dv span-to">
                  <input type="hidden" name="loc_id_to" id="loc_id_to" value=""/>
                  <span id="loc-list-to"> </span> 
                </div>
                <div class="form-group col-md-4">
                  <span id="jrn-date"> </span> 
                </div>    
            </div>
    </div>
</div>


</body>
</html>
<script src="public/js/jquery.min.js"/></script>
<script src="public/css/datepicker/bootstrap-datepicker.js"/></script>

<script type="text/javascript">
    $('.datepicker1').datepicker
    ({

        autoclose: true,
        todayHighlight: true,
        format: 'dd-mm-yyyy'
    });

</script>

<!--- To handle location list--->
<script>
    function handleLocation(loc,sec){
    $.ajax({
        type: "GET",
        dataType: "html",
        url: "components/functions.cfc?method=locFunction",
        data: {loc:loc,sec:sec},
            success:function(res){
                if(sec === "from"){
                    $('#loc-list').html(res);
                }
                else{
                    $('#loc-list-to').html(res);
                }
            
        }
    });
    }
</script>

<!--- To handle select location--->
<script>
function listHandle(id,name,sec) {

  if(sec ==="from"){
    document.getElementById("inputPassword2fr").value = name;
    document.getElementById("loc_id_from").value = id;
    document.getElementById("loc-list").innerHTML = "";
  }
  else{
    document.getElementById("inputPassword2to").value = name;
    document.getElementById("loc_id_to").value = id;
    document.getElementById("loc-list-to").innerHTML = "";
  }

}
</script>

<!--- To handle search button click --->
<script>
    function handleSearch(event) {
        <!--- for validation --->
        var locfrom = document.getElementById("inputPassword2fr").value;
        var locto   = document.getElementById("inputPassword2to").value;
        var jdate   = document.getElementById("j-date").value;
        if(locfrom ==""){
            document.getElementById('loc-list').innerHTML = "please select origin location"; 
        }
        if(locto ==""){
            document.getElementById('loc-list-to').innerHTML = "please select destination location"; 
        }
        if(jdate ===""){
            document.getElementById('jrn-date').innerHTML = "please select date"; 
        }
        else{
            document.getElementById('jrn-date').innerHTML = "";
        }
        if((locfrom !=="") && (!locto !=="")){
            if(locfrom == locto){
                document.getElementById('loc-list-to').innerHTML = "Origin and Destination location cannot be the same"; 
            }
        }
    }
</script>





