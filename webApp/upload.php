<?php
/*
 * Single File upload
 */

error_reporting(E_ALL);
ini_set('display_errors', 1);


//Destination folder
$storeFolder = 'uploads'; 

function fail($msg) {
	echo "Error:". $msg;
}


function success() {
	echo 'ok';
}


if( !empty($_FILES) && isset($_POST['name'])) {
	
	$ds = DIRECTORY_SEPARATOR;
	
	if(!file_exists($storeFolder)) {
		mkdir($storeFolder, 0777, true);
	}
	
	$file = $_FILES['file']['name'];
	$tempFile = $_FILES['file']['tmp_name'];
	$ext = pathinfo($file, PATHINFO_EXTENSION);
    
    $targetPath = dirname( __FILE__ ) . $ds. $storeFolder . $ds;
    $targetFile =  $targetPath . $_POST['name'] . '.' . $ext;

    //Saving the file
    if(move_uploaded_file($tempFile,$targetFile) == false) {
    	fail("Can't move the temporary file.");
    }
    else {
    	success();
	}
}
else {
	fail("Missing file or name");
}

?>