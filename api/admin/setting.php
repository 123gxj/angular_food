<?php
include_once('../lib/config.php');
$action = isset($_GET['action']) && !empty($_GET['action']) ? $_GET['action'] : '';
$id = isset($_GET['id']) && !empty($_GET['id']) ? $_GET['id'] : '';
$limit = isset($_GET['limit']) && !empty($_GET['limit']) ? $_GET['limit'] : 2;
$offset = isset($_GET['offset']) && !empty($_GET['offset']) ? $_GET['offset'] : 0;
$ids = isset($_GET['ids']) && !empty($_GET['ids']) ? $_GET['ids'] : 0;

if($action == 'settingCount'){
	$sql = "select count(*)as c from {$pre}setting";
	$data = getOne($sql);
	// var_dump($data);
	echo json_encode($data);die;
}

// echo $_POST['data'];die;
if($action == 'setting') {
	$sql = "select * from {$pre}setting order by setting_id desc limit ${offset}, ${limit}";
	$data = getAll($sql);
	// var_dump($data);
	echo json_encode($data);die;
}

if($action == 'settingDelete' && $id){
   $sql = "delete from {$pre}setting where setting_id = {$id}";
   $result = delete($sql);
   if($result){
	echo_json(1,'删除成功');
}else{
	echo_json(0,'删除失败');
}
}

if($action == 'settingDeleteByIds' && $ids){
	
	$ids = json_decode($ids, true);
	$idsArr = explode(",", $ids['ids']);
	 $sql = "delete from {$pre}setting where setting_id in (${ids['ids']})";
	// echo $sql;die;
	 $result= delete($sql);
	 if($result){
		echo_json(1,'删除成功');
	}else{
		echo_json(0,'删除失败');
	}
}

if($action == 'settingAdd') {
	// var_dump($_POST);die;
	if($_POST) {
		
		$setting_name = isset($_POST['setting_name']) && !empty($_POST['setting_name']) ? trim($_POST['setting_name']) : '';
		$setting_value = isset($_POST['setting_value']) && !empty($_POST['setting_value']) ? trim($_POST['setting_value']) : '';
		
		$data = array(
			'setting_name' => $setting_name,
            'setting_value' => $setting_value,
		);
		// var_dump($data);
		// echo $id;die;
		if(!$id) {
			$result = add("setting", $data);

			if($result) {
				echo_json(1, '添加成功');
			}else{
				echo_json(0, '添加失败');
			}
		}else{
			
			$result = update("setting", $data, "where setting_id=${id}");
			// echo $result;die;
			if($result) {
				echo_json(1, '更新成功');
			}else{
				echo_json(0, '更新失败');
			}
		}
	}
}


if($action == 'settingOne') {
	$sql = "select * from {$pre}setting where setting_id={$id}";
	$data = getOne($sql);
	// var_dump($data);
	echo json_encode($data);die;
}

