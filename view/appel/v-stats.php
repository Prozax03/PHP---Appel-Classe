<?php
    require_once "view/header.php";
?>
	<br>
	<h1 class="center">Stats <?= $year.'/'.$year+1 ?></h1>
	<br>
	<h3 class="center">Statistiques globales</h3>
	<br>
	<div class="row g-3 justify-content-md-center">
		<div class="card" style="width: 15rem;">
			<div class="card-body center">
				<h5 class="card-title">Total d'absences</h5>
				<h6 class="card-subtitle mb-2 text-muted"><?= $nbTotalAbsence ?></h6>
			</div>
		</div>
	</div>
	<br>
	<div class="row g-3 justify-content-md-center">
        <div class="col-md-8">
			<div class="card">
				<canvas id="statsGlobalMois"></canvas>
			</div>
		</div>
	</div>
	<br>
	<h3 class="center">Statistiques par élève</h3>
	<br>
	<div class="row g-3 justify-content-md-center">
        <div class="col-md-8">
			<table class="table table-bordered table-striped" id="myDatatable">
				<thead>
				<tr>
					<th>NOM Prénom</th>
					<th class='center'>Sep</th>
					<th class='center'>Oct</th>
					<th class='center'>Nov</th>
					<th class='center'>Déc</th>
					<th class='center'>Jan</th>
					<th class='center'>Fèv</th>
					<th class='center'>Mar</th>
					<th class='center'>Avr</th>
					<th class='center'>Mai</th>
					<th class='center'>Jui</th>
					<th class='center'>Juil</th>
					<th class='center'>Total</th>
				</tr>
				</thead>
				<tbody>
					<?php
						/*
						allIDEleves
						nbTotalAbsenceParEleve
						nbTotalAbsenceParMoisParEleve
						*/
						
						foreach ($allIDEleves as $idEleve){
							$absEleve = $monAppel->getStatGlobalParEleveParMoisFromId($dateDebut, $dateFin, $idEleve['idEleve']);
							echo "<tr>";
								echo "<td>".$idEleve['NOMPRENOM']."</td>";
								for ($i=0; $i < 11; $i++) { 
									if ($i == 0) {
										echo (array_search('M09', array_column($absEleve, 'MoisCourt')) !== false)?("<td class='center'>".$absEleve[array_search('M09', array_column($absEleve, 'MoisCourt'))]['Nombre absences']."</td>"):("<td class='center'>0</td>");
									} elseif ($i == 1) {
										echo (array_search('M10', array_column($absEleve, 'MoisCourt')) !== false)?("<td class='center'>".$absEleve[array_search('M10', array_column($absEleve, 'MoisCourt'))]['Nombre absences']."</td>"):("<td class='center'>0</td>");
									} elseif ($i == 2) {
										echo (array_search('M11', array_column($absEleve, 'MoisCourt')) !== false)?("<td class='center'>".$absEleve[array_search('M11', array_column($absEleve, 'MoisCourt'))]['Nombre absences']."</td>"):("<td class='center'>0</td>");
									} elseif ($i == 3) {
										echo (array_search('M12', array_column($absEleve, 'MoisCourt')) !== false)?("<td class='center'>".$absEleve[array_search('M12', array_column($absEleve, 'MoisCourt'))]['Nombre absences']."</td>"):("<td class='center'>0</td>");
									} elseif ($i == 4) {
										echo (array_search('M01', array_column($absEleve, 'MoisCourt')) !== false)?("<td class='center'>".$absEleve[array_search('M01', array_column($absEleve, 'MoisCourt'))]['Nombre absences']."</td>"):("<td class='center'>0</td>");
									} elseif ($i == 5) {
										echo (array_search('M02', array_column($absEleve, 'MoisCourt')) !== false)?("<td class='center'>".$absEleve[array_search('M02', array_column($absEleve, 'MoisCourt'))]['Nombre absences']."</td>"):("<td class='center'>0</td>");
									} elseif ($i == 6) {
										echo (array_search('M03', array_column($absEleve, 'MoisCourt')) !== false)?("<td class='center'>".$absEleve[array_search('M03', array_column($absEleve, 'MoisCourt'))]['Nombre absences']."</td>"):("<td class='center'>0</td>");
									} elseif ($i == 7) {
										echo (array_search('M04', array_column($absEleve, 'MoisCourt')) !== false)?("<td class='center'>".$absEleve[array_search('M04', array_column($absEleve, 'MoisCourt'))]['Nombre absences']."</td>"):("<td class='center'>0</td>");
									} elseif ($i == 8) {
										echo (array_search('M05', array_column($absEleve, 'MoisCourt')) !== false)?("<td class='center'>".$absEleve[array_search('M05', array_column($absEleve, 'MoisCourt'))]['Nombre absences']."</td>"):("<td class='center'>0</td>");
									} elseif ($i == 9) {
										echo (array_search('M06', array_column($absEleve, 'MoisCourt')) !== false)?("<td class='center'>".$absEleve[array_search('M06', array_column($absEleve, 'MoisCourt'))]['Nombre absences']."</td>"):("<td class='center'>0</td>");
									} elseif ($i == 10) {
										echo (array_search('M07', array_column($absEleve, 'MoisCourt')) !== false)?("<td class='center'>".$absEleve[array_search('M07', array_column($absEleve, 'MoisCourt'))]['Nombre absences']."</td>"):("<td class='center'>0</td>");
									}
								}
								$totalAbsEleve = 0;
								foreach ($absEleve as $comp) {
									$totalAbsEleve += $comp['Nombre absences'];
								}
							echo "<td class='center'>".$totalAbsEleve."</td>";
							echo "</tr>";
						}
					?>
				</tbody>
			</table>
		</div>
	</div>
	<?php

	//var_dump($nbTotalAbsenceParMois);

	$sept = (array_search('M09', array_column($nbTotalAbsenceParMois, 'mois')) !== false)?($nbTotalAbsenceParMois[array_search('M09', array_column($nbTotalAbsenceParMois, 'mois'))]['nb']):(0);
	$oct = (array_search('M10', array_column($nbTotalAbsenceParMois, 'mois')) !== false)?($nbTotalAbsenceParMois[array_search('M10', array_column($nbTotalAbsenceParMois, 'mois'))]['nb']):(0);
	$nov = (array_search('M11', array_column($nbTotalAbsenceParMois, 'mois')) !== false)?($nbTotalAbsenceParMois[array_search('M11', array_column($nbTotalAbsenceParMois, 'mois'))]['nb']):(0);
	$dec = (array_search('M12', array_column($nbTotalAbsenceParMois, 'mois')) !== false)?($nbTotalAbsenceParMois[array_search('M12', array_column($nbTotalAbsenceParMois, 'mois'))]['nb']):(0);
	$janv = (array_search('M01', array_column($nbTotalAbsenceParMois, 'mois')) !== false)?($nbTotalAbsenceParMois[array_search('M01', array_column($nbTotalAbsenceParMois, 'mois'))]['nb']):(0);
	$fev = (array_search('M02', array_column($nbTotalAbsenceParMois, 'mois')) !== false)?($nbTotalAbsenceParMois[array_search('M02', array_column($nbTotalAbsenceParMois, 'mois'))]['nb']):(0);
	$mar = (array_search('M03', array_column($nbTotalAbsenceParMois, 'mois')) !== false)?($nbTotalAbsenceParMois[array_search('M03', array_column($nbTotalAbsenceParMois, 'mois'))]['nb']):(0);
	$avr = (array_search('M04', array_column($nbTotalAbsenceParMois, 'mois')) !== false)?($nbTotalAbsenceParMois[array_search('M04', array_column($nbTotalAbsenceParMois, 'mois'))]['nb']):(0);
	$mai = (array_search('M05', array_column($nbTotalAbsenceParMois, 'mois')) !== false)?($nbTotalAbsenceParMois[array_search('M05', array_column($nbTotalAbsenceParMois, 'mois'))]['nb']):(0);
	$juin = (array_search('M06', array_column($nbTotalAbsenceParMois, 'mois')) !== false)?($nbTotalAbsenceParMois[array_search('M06', array_column($nbTotalAbsenceParMois, 'mois'))]['nb']):(0);
	$juil = (array_search('M07', array_column($nbTotalAbsenceParMois, 'mois')) !== false)?($nbTotalAbsenceParMois[array_search('M07', array_column($nbTotalAbsenceParMois, 'mois'))]['nb']):(0);

	$dataPerM = $sept.", ".$oct.", ".$nov.", ".$dec.", ".$janv.", ".$fev.", ".$mar.", ".$avr.", ".$mai.", ".$juin.", ".$juil;
	?>
	<script src="addons/chart/chart.js"></script>

	<script>
		const ctx = document.getElementById('statsGlobalMois');

		new Chart(ctx, {
			type: 'bar',
			data: {
			labels: ['Septembre', 'Octobre', 'Novembre', 'Décembre', 'Janvier', 'Février', 'Mars', 'Avril', 'Mai', 'Juin', 'Juillet'],
			datasets: [{
				label: 'Nb Absences',
				data: [<?= $dataPerM ?>],
				borderWidth: 1
			}]
			},
			options: {
				scales: {
					y: {
						beginAtZero: true
					}
				},
				indexAxis: 'y',
				plugins: {
					title: {
						display: true,
						text: 'Total d\'absences par mois'
					}
				}
			}
		});
	</script>