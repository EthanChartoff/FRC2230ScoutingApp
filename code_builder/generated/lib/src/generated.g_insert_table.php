<?php

include_once 'conn.php';
include_once 'constants.php';

function sendJsonResponse($response)
{
    header('Content-Type: application/json');
    echo json_encode($response);
}


$id = $_POST['id'];
$lastChangedAt = $_POST['lastChangedAt'];
$matchId = $_POST['matchId'];
$teamId = $_POST['teamId'];
$didRobotWin = $_POST['didRobotWin'];
$alliance = $_POST['alliance'];
$startingPosition = $_POST['startingPosition'];
$wasRobotOnField = $_POST['wasRobotOnField'];
$didRobotWorkInAuto = $_POST['didRobotWorkInAuto'];
$didRobotWorkInTeleOp = $_POST['didRobotWorkInTeleOp'];
$didRobotDefend = $_POST['didRobotDefend'];
$wasStrategyDifferent = $_POST['wasStrategyDifferent'];
$defenseComments = $_POST['defenseComments'];
$robotComments = $_POST['robotComments'];
$strategyComments = $_POST['strategyComments'];
$scouterName = $_POST['scouterName'];
$shotCounter1 = $_POST['shotCounter1'];
$shotCounter2 = $_POST['shotCounter2'];
$dropdownButton = $_POST['dropdownButton'];
$textfield = $_POST['textfield'];
$checkbox = $_POST['checkbox'];
$buttonTimer = $_POST['buttonTimer'];



$sqlinsert = "INSERT INTO $scouting_table(
    `id`,
    `lastChangedAt`,
    `matchId`,
    `teamId`,
    `didRobotWin`,
    `alliance`,
    `startingPosition`,
    `wasRobotOnField`,
    `didRobotWorkInAuto`,
    `didRobotWorkInTeleOp`,
    `didRobotDefend`,
    `wasStrategyDifferent`,
    `defenseComments`,
    `robotComments`,
    `strategyComments`,
    `scouterName`,
    `shotCounter1`,
    `shotCounter2`,
    `dropdownButton`,
    `textfield`,
    `checkbox`,
    `buttonTimer`
) VALUES (
    DEFAULT,
    DEFAULT,
    '$matchId',
    '$teamId',
    '$didRobotWin',
    '$alliance',
    '$startingPosition',
    '$wasRobotOnField',
    '$didRobotWorkInAuto',
    '$didRobotWorkInTeleOp',
    '$didRobotDefend',
    '$wasStrategyDifferent',
    '$defenseComments',
    '$robotComments',
    '$strategyComments',
    '$scouterName',
    '$shotCounter1',
    '$shotCounter2',
    '$dropdownButton',
    '$textfield',
    '$checkbox',
    '$buttonTimer'
)";


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
