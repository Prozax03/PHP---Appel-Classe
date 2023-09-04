<?php
    require_once "view/header.php";
?>
    <br>
	<h1 class="center">Base de Données</h1>
	<h5 class="center h5Cursive">Sauvegarde / Import</h5>
	<br>
	<div class="container">
		<div class="row justify-content-md-center">
			<div class="col-md-6 center">
				<img src="public/img/bdd.png" class="imgClasse">
			</div>
			<div class="col-md-6">
				<br>
				<div class="center">
					<a href="Import/script/export.php" class="btn btn-eleve">Telecharger la sauvegarde</a>
				</div>
				<br><br>
				<h5 class="center h5Cursive">Import</h5>
				<form action="Import/import.php" method="post" enctype="multipart/form-data">
					<div class="mb-3">
						<label for="formFile" class="form-label">Fichier BDD à importer (appelclasse.sql)</label>
						<input class="form-control" type="file" id="formFile" name="formFile" required>
					</div>
					<br>
					<div class="center">
						<a href="javascript:history.go(-1)" class='btn btn-danger'>Retour</a>
						<input class='btn btn-classe' type='submit' value='Envoyer'>
					</div>
				</form>
			</div>
		</div>
	</div>
