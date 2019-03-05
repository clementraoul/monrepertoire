<?php

error_reporting(E_ALL);
	ini_set("display_errors", 1);

$_assets="assets/";
session_start();

if(!empty($_SESSION)){
    // Traitement du formulaire de connexion
    include('model/dashboard.php');

    // HTML
    include('view/dashboard.php');
}
else{
    // Traitement du formulaire de connexion
    include('model/login.php');

    // HTML
    include('view/login.php');
}
?>