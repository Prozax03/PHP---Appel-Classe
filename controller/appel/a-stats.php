<?php
    require_once "model/appel.php";
    $monAppel = new appel();

    if(isset($_GET['y']) && is_numeric($_GET['y']) && $_GET['y'] > 2020){
        $year = $_GET['y'];
    } else {
        if (date('m') >= 1 && date('m') <= 8) {
            $year = date('Y') - 1;
        } else {
            $year = date('Y');
        }
    }
    $dateDebut = $year."-09-01";
    $dateFin = ($year+1)."-07-10";
    $allIDEleves = $monAppel->getAllElevesFrom2Date($dateDebut, $dateFin);
    $nbTotalAbsence = $monAppel->getStatGlobal($dateDebut, $dateFin);
    $nbTotalAbsenceParEleve = $monAppel->getStatGlobalParEleve($dateDebut, $dateFin);
    $nbTotalAbsenceParMois = $monAppel->getStatGlobalParMoisNew($dateDebut, $dateFin);
    $nbTotalAbsenceParMoisParEleve = $monAppel->getStatGlobalParEleveParMois($dateDebut, $dateFin);

    $state = "stats";
?>