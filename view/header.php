<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>TEST</title>


    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="addons/bootstrap/css/bootstrap.min.css">

    <!-- Google Font: Source Sans Pro -->
    <link rel="stylesheet" href="addons/GoogleFont/fonts.css">
    <!-- Font Awesome Icons -->
    <!--<link rel="stylesheet" href="addons/fontawesome-pro-6.4.0/css/pro.css">-->
    <link rel="stylesheet" href="addons/fontawesome-free-6.4.0/css/all.min.css">

    <!-- Datatables -->
    <link rel="stylesheet" href="addons/datatables/datatables.min.css" rel="stylesheet"/>

    <!-- Custom style -->
    <link rel="stylesheet" href="public/css/style.css">

    <?php
        if($state == "404"){
                echo "<!-- 404 style -->
                <link rel='stylesheet' href='public/css/404.css'>";
        }
    ?>
</head>
<!--
`body` tag options:

  Apply one or more of the following classes to to the body tag
  to get the desired effect

  * sidebar-collapse
  * sidebar-mini
-->
<body>
    <?php require_once "menu.php"; ?>