<?php session_start();
require_once('baseDatos.php');
if (isset($_REQUEST['usuario']) && isset($_REQUEST['clave'])) {

/* Aquí comprobariamos que el usuario y la clave son correctos con la base de datos. En el ejemplo suponemos que siempre es correcto. */

$codigo = validarUsuario($_REQUEST['usuario'],$_REQUEST['clave']);

	if ( $codigo != -1 && esAdmin($codigo)) {
		$_SESSION['userid'] = $codigo;
		
		header('Location: ./index.php');
		exit();
	}
	else {
/* Estaría bien informar que el usuario o la clave son incorrectos y no llamar a la página de acceso sin informar de ello.*/
		
		$_SESSION['error'] = "Usuario o clave incorrectos.";
		header('Location: ../indexAdmin.php');
		exit();
	}
}
else {
/* Si se ha llamado directamente a este PHP se envía al HTML de login.*/
	header('../indexAdmin.php');
	exit();
}
?>