<?php
error_reporting(E_ALL);
ini_set("display_errors", 1);

$_assets="assets/";
// /index.php !== de index.php
//$_url_deconnexion = "index.php?p=deconnexion";
$_url_deconnexion = "index.php?p=deconnexion";
session_start();

/*
echo '<pre>';
print_r($_SESSION);
echo '</pre>';
*/

// $_GET existe toujours

if(!empty($_SESSION)){
    $projectName="LaPiscine";
    $projectNameShort="L-P";
    $name=$_SESSION['surname']." ".$_SESSION['name'];

    //isset = est-ce que la variable existe = est-ce qu'elle est définie ?
    if(!isset($_GET['p'])){
        $pageTitle="Accueil";
        // HTML 
        include('view/head_dashboard.php');         
        include('view/topbar.php');    
        include('view/sidebar.php');                         
        include('view/dashboard.php');
        include('view/footer.php'); 
        include('view/footer_dashboard.php');               
    }
    elseif($_GET['p']=="users"){
        $pageTitle="Liste des utilisateurs";
        // HTML 
        include('view/head_table.php');          
        include('view/topbar.php');    
        include('view/sidebar.php');             
        include('view/table.php');
        include('view/footer.php');        
        include('view/footer_table.php');         
    }   
    elseif($_GET['p']=="deconnexion"){
        unset($_SESSION);
        session_destroy();
        header('location: index.php');
    }       
    else{
        //header($_SERVER["SERVER_PROTOCOL"]." 404 Not Found");
        echo "Cette page n'existe pas";
    }
}
else {
    // Traitement du formulaire de connexion
    // On créé les sessions ici lorsque le formulaire a été envoyé
    include('model/login.php');
    // HTML 
    include('view/login.php');    
}
