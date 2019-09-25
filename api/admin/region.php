<?php
include_once('../lib/config.php');
$action = isset($_GET['action']) && !empty($_GET['action']) ? $_GET['action'] : '';
$id = isset($_GET['id']) && !empty($_GET['id']) ? $_GET['id'] : '';
$limit = isset($_GET['limit']) && !empty($_GET['limit']) ? $_GET['limit'] : 2;
$offset = isset($_GET['offset']) && !empty($_GET['offset']) ? $_GET['offset'] : 0;
$ids = isset($_GET['ids']) && !empty($_GET['ids']) ? $_GET['ids'] : 0;

if($action == 'regionCount'){
	$sql = "select count(*)as c from {$pre}region";
	$data = getOne($sql);
	// var_dump($data);
	echo json_encode($data);die;
}

// echo $_POST['data'];die;
if($action == 'region') {
	$sql = "select * from {$pre}region order by region_id desc limit ${offset}, ${limit}";
	$data = getAll($sql);
	// var_dump($data);
	echo json_encode($data);die;
}

if($action == 'regionDelete' && $id){
   $sql = "delete from {$pre}region where region_id = {$id}";
   $result = delete($sql);
   if($result){
	echo_json(1,'删除成功');
}else{
	echo_json(0,'删除失败');
}
}

if($action == 'regionDeleteByIds' && $ids){
	
	$ids = json_decode($ids, true);
	$idsArr = explode(",", $ids['ids']);
	 $sql = "delete from {$pre}region where region_id in (${ids['ids']})";
	// echo $sql;die;
	 $result= delete($sql);
	 if($result){
		echo_json(1,'删除成功');
	}else{
		echo_json(0,'删除失败');
	}
}

if($action == 'regionAdd') {
	// var_dump($_POST);die;
	if($_POST) {
		
		$region_name = isset($_POST['region_name']) && !empty($_POST['region_name']) ? trim($_POST['region_name']) : '';
		$order_num = isset($_POST['order_num']) && !empty($_POST['order_num']) ? trim($_POST['order_num']) : '';
		
		$data = array(
			'region_name' => $region_name,
            'order_num' => $order_num,
		);
		// var_dump($data);
		// echo $id;die;
		if(!$id) {
			$result = add("region", $data);

			if($result) {
				echo_json(1, '添加成功');
			}else{
				echo_json(0, '添加失败');
			}
		}else{
			
			$result = update("region", $data, "where region_id=${id}");
			// echo $result;die;
			if($result) {
				echo_json(1, '更新成功');
			}else{
				echo_json(0, '更新失败');
			}
		}
	}
}


if($action == 'regionOne') {
	$sql = "select * from {$pre}region where region_id={$id}";
	$data = getOne($sql);
	// var_dump($data);
	echo json_encode($data);die;
}

