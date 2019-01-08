<#macro page>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="Content-Type" content="text/html">
    <title>Animated Circle Stats - Template Monster Demo</title>
    <meta name="author" content="Jake Rocheleau">

    <link href="css/jquery.circliful.css" rel="stylesheet" type="text/css" />
    <script src="http://code.jquery.com/jquery-1.12.4.min.js"></script>
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
</script>
</body>
</html>
</#macro>