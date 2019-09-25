<?php
include_once('lib/config.php');
$sql="select * from {$pre}food";
$data = getAll($sql);
var_dump($data);
// echo $data;