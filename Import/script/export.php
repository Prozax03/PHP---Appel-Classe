<?php

    system("cmd /c ".getcwd()."\\dump.bat");

    header('location: dump/appelclasse.sql');
?>