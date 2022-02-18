<?php
    //$hostdb = 'localhost'; //localhost as this file will be in the server of database allocation. SLOW, 2 seconds!!!
    $hostdb = '127.0.0.1'; //it is FAST! localhost takes 2 seconds instead
    $userdb = 'root';
    $passdb = 'passDB';
    $namedb = 'iot_database';
    $connectdb = new mysqli($hostdb,$userdb,$passdb,$namedb);//connecting with the database
    //checking connection
    if ($connectdb->connect_error){
        echo $error -> $connectdb->connect_error;
    }
?>