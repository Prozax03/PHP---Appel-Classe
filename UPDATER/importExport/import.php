<?php
    if(isset($_FILES['formFile'])){ 
        $dossier = 'import/';
        $fichier = "appelclasse.sql";
        move_uploaded_file($_FILES['formFile']['tmp_name'], $dossier . $fichier);
    }

    system("cmd /c ".getcwd()."\\import.bat");

    header('Location: ../../index.php');
?>