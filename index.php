<?php

error_reporting(E_ALL);
	ini_set("display_errors", 1);

$_assets="assets/";

// Traitement du formulaire de connexion 
include('model/login.php');

// HTML
include('view/login.php');

?>