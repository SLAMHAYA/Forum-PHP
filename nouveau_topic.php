<?php
 $bdd = new PDO("mysql:host=127.0.0.1;dbname=users;charset=utf8", "root", '');

/* Traitement du formulaire de création de Topic */
session_start();

if(isset($_SESSION['id'])) {
   if(isset($_POST['tsubmit'])) {
      if(isset($_POST['tsujet'],$_POST['tcontenu'])) {
         $sujet = htmlspecialchars($_POST['tsujet']);
         $contenu = htmlspecialchars($_POST['tcontenu']);
         if(!empty($sujet) AND !empty($contenu)) {
            if(strlen($sujet) <= 70) {
               if(isset($_POST['tmail'])) {
                  $notif_mail = 1;
               } else {
                  $notif_mail = 0;
               }
               $ins = $bdd->prepare('INSERT INTO f_topics (id_createur, sujet, contenu, notif_createur, resolu, date_heure_creation) VALUES(?,?,?,?,0,NOW())');
               $ins->execute(array($_SESSION['id'],$sujet,$contenu,$notif_mail));
            } else {
               $terror = "Votre sujet ne peut pas dépasser 70 caractères";
            }
         } else {
            $terror = "Veuillez compléter tous les champs";
         }
      }
   }
   // var_dump($ins);
} else {
  $terror = "Veuillez vous connecter pour poster un nouveau topic";
}
 
require('views/nouveau_topic.view.php'); /* Appel du fichier "vue" de notre page */
?>

