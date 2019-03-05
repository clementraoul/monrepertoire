<?php
//MODE DEBUG

//print_r($_POST);

//CONNEXION BASE DE DONNEES MYSQL
try
{
	$db = new PDO('mysql:host=localhost; dbname=e_blog_commerce; charset=utf8', 'root', 'root');
}
catch(Exception $e)
{
	die('Erreur : '.$e->getMessage());
}

$usertmp = "";
$msg_error = "";

//Si les champs ont été rempli, $_POST n'est donc pas vide
if(!empty($_POST)) {
	//On injecte les variables de $_POST dans d'autres variables (Par sécurité)
	$mail = $_POST['mail'];
	$pass = $_POST['pass'];

	//On consulte la $db (base de donnée) avec une $req (requête sql)
	$req = $db->prepare('SELECT id, nom, prenom, mail FROM user WHERE mail= :mail');
	$req->bindParam(':mail', $mail);
	$req->execute();
	$checkmail = $req->fetch();

	//Si $mail existe dans la $db, $checkmail récupère une id et n'est donc pas "Empty"
	if (!empty($checkmail)) {

		//On consulte la $db avec une $req (requête sql)
		$req = $db->prepare('SELECT id, nom, prenom, mail FROM user WHERE mail= :mail AND password= :pass');
		$req->bindParam(':mail', $mail);
		$req->bindParam(':pass', $pass);
		$req->execute();
		$checkAll = $req->fetch();

		//Si le $mail et le $pass corresponde à l'utilisateur, $checkAll ne sera donc pas vide
		if (!empty($checkAll)) {

			$_SESSION['id']=$checkAll['id'];
			$_SESSION['nom']=$checkAll['nom'];
			$_SESSION['prenom']=$checkAll['prenom'];
			$_SESSION['mail']=$checkAll['mail'];
			header('location: index.php');
			$msg_error = "Bien connecté";
			//si le mot de passe ne correspond pas :
		} else {
			$msg_error = "Mot de passe incorrect";
			$usertmp = $_POST['mail'];
		}
		//Si $mail n'est pas dans la base de donnée :
	} else {
		$msg_error = "Email utilisateur inconnu";
	}
}
?>