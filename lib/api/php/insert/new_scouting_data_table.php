<?php
include_once 'conn.php';
include_once 'constants.php';


$matchId = $_POST['match_id'];
$teamId = $_POST['team_id'];
$didWin = $_POST['did_win'];
$alliance = $_POST['alliance'];
$startingPos = $_POST['starting_position'];
$wasRobotOnField = $_POST['was_robot_on_field'];
$didRobotWorkInAuto = $_POST['did_robot_work_in_auto'];
$didRobotWorkInTP = $_POST['did_robot_work_in_teleop'];
$didDefend = $_POST['did_robot_defend'];
$wasStrategyDifferent = $_POST['was_strategy_different'];
$defenseComments = $_POST['defense_comments'];
$robotComments = $_POST['robot_comments'];
$strategyComments = $_POST['strategy_comments'];
$scouterName = $_POST['scouter_name'];


$sqlinsert = "INSERT INTO $scouting_table(
    `id`,
    `match_id`,
    `team_id`,
    `did_win`,
    `alliance`,
    `starting_position`,
    `was_robot_on_field`,
    `did_robot_work_in_auto`,
    `did_robot_work_in_teleop`,
    `did_robot_defend`,
    `was_strategy_different`,
    `defense_comments`,
    `robot_comments`,
    `strategy_comments`,
    `scouter_name`,
    `created_at`
)
VALUES (
    DEFAULT,
    '$matchId',
    '$teamId',
    '$didWin',
    '$alliance',
    '$startingPos',
    '$wasRobotOnField',
    '$didRobotWorkInAuto',
    '$didRobotWorkInTP',
    '$didDefend',
    '$wasStrategyDifferent',
    '$defenseComments',
    '$robotComments',
    '$strategyComments',
    '$scouterName',
    DEFAULT
)"

if($conn->query($sqlinsert) === TRUE) {
    $response = array('status' => 'success :)', 'data' => null);
    //echo($response);
    sendJsonResponse($response);

}
else {
    $response = array('status' => 'failed :(', 'data' => null);
    echo($response);
    sendJsonResponse($response);
}
?>