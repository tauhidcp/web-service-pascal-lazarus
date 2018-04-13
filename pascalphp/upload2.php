<?php ini_set( "display_errors", 0); 

$target_path = "upload/"; 

$target_path = $target_path . basename( $_FILES['uploadedfile']['name']); 

if(move_uploaded_file($_FILES['uploadedfile']['tmp_name'], $target_path)) { 
    echo "The file ". basename( $_FILES['uploadedfile']['name'])." has been uploaded"; 
} else{ 
    echo "There was an error uploading the file, please try again!"; 
}

?> 