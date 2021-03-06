<#macro page>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="Content-Type" content="text/html">
    <title>АСТ Тест</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
          integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous"/>
    <link href="css/jquery.circliful.css" rel="stylesheet" type="text/css"/>
    <link href="../css/style.css" rel="stylesheet"/>

    <link rel="icon" type="image/png" href="images/fav.png" />

    <script src="js/jquery-1.12.4.min.js"></script>
    <script src="js/jquery.circliful.min.js"></script>

</head>
<body class="bodyBackground">

    <#nested>
<script>
    $(document).ready(function () {
        $("#test-circle").circliful({
            animationStep: 5,
            foregroundBorderWidth: 5,
            backgroundBorderWidth: 15,
            percent: ${result}
        });
    });


    function printDiv() {
        var printContents = document.getElementById("print-content").innerHTML;
        var originalContents = document.body.innerHTML;
        document.body.innerHTML = printContents;
        window.print();
        document.body.innerHTML = originalContents;
    }

</script>
</body >
</html >
</#macro>