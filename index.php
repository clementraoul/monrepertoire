<?php
error_reporting(E_ALL);
ini_set("display_errors", 1);

$_assets="assets/";
session_start();

if(!empty($_SESSION)){
    if(!isset($_GET['p'])){
        // Traitement des données
        include('model/dashboard.php');
        // HTML
        include('view/dashboard.php');
    }
    elseif(isset($_GET['p']) AND $_GET['p']=="users"){
        // Traitement des données
        //include('model/dashboard.php');
        // HTML
        include('view/table.php');
    }
}
else {
    // Traitement du formulaire de connexion
    include('model/login.php');
    // HTML
    include('view/login.php');
}
