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
                    <label class="frm-label">Date Of Journey</label>
                </div>
                <div class="form-group col-md-2">
                </div>
                
            </div>
        

            <div class="row no-gutters">
                <div class="form-group col-md-1 d-flex justify-content-center align-items-center des1 form-control input-wd">
                    <i class="fa fa-location-arrow"></i> 
                </div>
                <div class="form-group col-md-3">
                    <input type="text" class="form-control input-wd form-group des2" id="inputPassword2" placeholder="Select location" autocomplete="off" onkeyup="handleLocation(this.value)">
                </div>
                <div class="form-group col-md-1 d-flex justify-content-center align-items-center des1 form-control input-wd">
                    <i class="fa fa-map-marker-alt"> </i> 
                </div>
                <div class="form-group col-md-3">
                    <input type="text" class="form-control input-wd des2" id="inputPassword2" placeholder="Going To" autocomplete="off">
                </div>
        
                <div class="form-group col-md-2">
                    <div class="jquery-datepicker">
                        <input type="text" class="form-control input-wd in-1 jquery-datepicker__input datepicker1 dt" placeholder="Date" autocomplete="off">
                    </div>
                </div>
                <div class="form-group col-md-2">
                    <a class="form-control input-wd srch-ip a-srch" onclick="handleSearch()"> Search </a>
                </div> 
            </div>

            <div class="row d-flex justify-content-center">
                <div class="form-group col-md-1">
                </div>
                <div class="form-group col-md-3">
                  <span id="loc-list"> </span> 
                </div>
                <div class="form-group col-md-1">
                </div>
                <div class="form-group col-md-3">
                </div>
                <div class="form-group col-md-2">
                </div>
                <div class="form-group col-md-2">
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

<!--- To handle search button click --->
<script>
    function handleSearch() {
    alert();
    }
</script>

<!--- To handle location list --->
<script>
    function handleLocation(id){
    $.ajax({
        type: "GET",
        dataType: "html",
        url: "components/functions.cfc?method=locFunction",
        data: {id:id},
        success:function(res){
            $('#loc-list').html(res);
        }
    });
    }
</script>




