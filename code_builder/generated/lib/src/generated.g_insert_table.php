<?php

include_once 'conn.php';
include_once 'constants.php';


$shotCounter = $_POST['shotCounter'];
$shotCounter1 = $_POST['shotCounter1'];
$shotCounter2 = $_POST['shotCounter2'];
$dropdownButton = $_POST['dropdownButton'];
$textfield = $_POST['textfield'];
$checkbox = $_POST['checkbox'];
$buttonTimer = $_POST['buttonTimer'];
$checkbox1 = $_POST['checkbox1'];



$sqlinsert = "INSERT INTO scoutingTable(
    `id`,
    `shotCounter`,
    `shotCounter1`,
    `shotCounter2`,
    `dropdownButton`,
    `textfield`,
    `checkbox`,
    `buttonTimer`,
    `checkbox1`,
    `created_at`
) VALUES (
    DEFAULT,
    '$shotCounter',
    '$shotCounter1',
    '$shotCounter2',
    '$dropdownButton',
    '$textfield',
    '$checkbox',
    '$buttonTimer',
    '$checkbox1',
    DEFAULT
)"


if($conn->query($sqlinsert) === TRUE) {
    $response = array('status' => 'success :)', 'data' => null);
    echo($response);
    sendJsonResponse($response);

}
else {
    $response = array('status' => 'failed :(', 'data' => null);
    echo($response);
    sendJsonResponse($response);
}
?>
