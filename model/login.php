<?php

//echo !empty($_POST);
/*
if(!empty($_POST)){
	if($utilisateur['mail'] == $_POST['mail']){
		if($utilisateur['password'] == $_POST['pass']){
			$msg = "Bien connecté";
		}
		else {
			$msg = "Mot de passe incorrect";
			$mailTmp = $_POST['mail'];
		}
	}
	else {
		$msg = "Adresse mail inconnue";
	}
}
*/
try
{
    $bdd = new PDO('mysql:host=localhost;dbname=blog_e_commerce;charset=utf8', 'root', 'root');
}
catch(Exception $e)
{
        die('Erreur : '.$e->getMessage());
}

$mailTmp="";
$msg = "";
//var_dump($_SESSION);

if(!empty($_POST)){
    // On récupère le $_POST['mail'] et le $_POST['pass'] envoyés dans le formulaire
    $mail = $_POST['mail'];
    $password = $_POST['pass'];

    // On regarde si $_POST['mail'] est connu dans la table user
    $req = $bdd->prepare('SELECT id FROM user WHERE mail= :mail');
    $req->bindParam(':mail', $mail);
    $req->execute();
    // Un fetch n'affiche qu'une seule ligne de la BDD
    // Un fetchAll affiche toutes les lignes de la BDD
    // On récupère un objet
    $result = $req->fetch();
	// Si oui
    if(!empty($result)){
        // On regarde si $_POST['pass'] correspond au pass de $_POST['mail']
        $req = $bdd->prepare('SELECT id, nom, prenom FROM user WHERE mail= :mail AND password= :password');
        $req->bindParam(':mail', $mail);
        $req->bindParam(':password', $password);
        $req->execute();
        $result2 = $req->fetch();

        // Si oui
        if(!empty($result2)){
			$_SESSION['id']=$result2['id'];	
			$_SESSION['name']=$result2['nom'];	
			$_SESSION['surname']=$result2['prenom'];									
			$_SESSION['mail']=$mail;
			header('location: index.php');
            //$msg = "Bien connecté";
        }
        else {
            // Si non
            $msg = "Mot de passe incorrect";
            $mailTmp = $_POST['mail'];
        }
    }
    else{
        // Si non
        $msg = "Adresse mail inconnue";
    }
}

?>
