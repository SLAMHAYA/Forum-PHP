<?php
$bdd = new PDO("mysql:host=127.0.0.1;dbname=users;charset=utf8", "root", '');
$display= $bdd->query('SELECT * FROM f_topics ORDER BY date_heure_creation DESC');
?>
<!doctype html>
<html lang=''>
<head>
   <meta charset='utf-8'>
   <meta http-equiv="X-UA-Compatible" content="IE=edge">
   <meta name="viewport" content="width=device-width, initial-scale=1">
   <link rel="stylesheet" href="styles.css">
   <script src="http://code.jquery.com/jquery-latest.min.js" type="text/javascript"></script>
   <link rel="icon" href="logo.jpg" />
   <script src="script.js"></script>
   <title>Accueil</title>
   <link rel="stylesheet" href="css/bootstrap.min.css">
</head>
<body>

<div id='cssmenu'>
<ul>
   <li><a href='Accueil.php'>Accueil</a></li>
   <li class='active'><a href='#'>Parametre</a>
      <ul>
         <li><a href='MonProfil'>Mon Profil</a></li>
         <li><a href='nouveau_topic.php'>Nouveau topic</a></li>
         <li><a href='Deconnexion.php'>Deconnexion</a></li>
      </ul>
   </li>
</ul>
</div>
<ul>

   <?php if($display){ ?>
      
      <?php while ($disp = $display-> fetch()) { ?>
             <li><a href="#"><?= $disp['sujet'] ?></a></li>            
     <?php }} ?>
</ul>
</body>
</html>