<#macro page>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="Content-Type" content="text/html">
    <title>Animated Circle Stats - Template Monster Demo</title>
    <meta name="author" content="Jake Rocheleau">
    <link rel="shortcut icon" href="http://static.tmimgcdn.com/img/favicon.ico">
    <link rel="icon" href="http://static.tmimgcdn.com/img/favicon.ico">
    <link rel="stylesheet" type="text/css" media="all" href="css/jquery.circliful.css">
    <link rel="stylesheet" type="text/css" media="all" href="css/dig.css">
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
            integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
            crossorigin="anonymous"></script>
    <script type="text/javascript" src="js/jquery.circliful.min.js"></script>
</head>
<body class="bodyBackground">

    <#nested>
<script>
    $(document).ready(function () {
    $('.circlestat').circliful();});
</script>
</body>
</html>
</#macro>