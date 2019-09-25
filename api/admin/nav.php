<?php
include_once('../lib/config.php');
$action = isset($_GET['action']) && !empty($_GET['action']) ? $_GET['action'] : '';
$id = isset($_GET['id']) && !empty($_GET['id']) ? $_GET['id'] : '';
$limit = isset($_GET['limit']) && !empty($_GET['limit']) ? $_GET['limit'] : 2;
$offset = isset($_GET['offset']) && !empty($_GET['offset']) ? $_GET['offset'] : 0;
$ids = isset($_GET['ids']) && !empty($_GET['ids']) ? $_GET['ids'] : 0;

if($action == 'navCount'){
	$sql = "select count(*)as c from {$pre}nav";
	// echo $sql;die;
	$data = getOne($sql);
	// var_dump($data);
	echo json_encode($data);die;
}

// echo $_POST['data'];die;
if($action == 'nav') {
	$sql = "select * from {$pre}nav order by nav_id desc limit ${offset}, ${limit}";
	$data = getAll($sql);
	// var_dump($data);
	echo json_encode($data);die;
}

if($action == 'navDelete' && $id){
   $sql = "delete from {$pre}nav where nav_id = {$id}";
   $result = delete($sql);
   if($result){
	echo_json(1,'删除成功');
}else{
	echo_json(0,'删除失败');
}
}

if($action == 'navDeleteByIds' && $ids){
	
	$ids = json_decode($ids, true);
	$idsArr = explode(",", $ids['ids']);
	 $sql = "delete from {$pre}nav where nav_id in (${ids['ids']})";
	// echo $sql;die;
	 $result= delete($sql);
	 if($result){
		echo_json(1,'删除成功');
	}else{
		echo_json(0,'删除失败');
	}
}

if($action == 'navAdd') {
	// var_dump($_POST);die;
	if($_POST) {
		
		$title = isset($_POST['title']) && !empty($_POST['title']) ? trim($_POST['title']) : '';
		$link = isset($_POST['link']) && !empty($_POST['link']) ? trim($_POST['link']) : '';
		$order_num = isset($_POST['order_num']) && !empty($_POST['order_num']) ? trim($_POST['order_num']) : '';
		
		$data = array(
			'title' => $title,
			'link' => $link,
            'order_num' => $order_num,
		);
		// var_dump($data);
		// echo $id;die;
		if(!$id) {
			$result = add("nav", $data);

			if($result) {
				echo_json(1, '添加成功');
			}else{
				echo_json(0, '添加失败');
			}
		}else{
			
			$result = update("nav", $data, "where nav_id=${id}");
			// echo $result;die;
			if($result) {
				echo_json(1, '更新成功');
			}else{
				echo_json(0, '更新失败');
			}
		}
	}
}


if($action == 'navOne') {
	$sql = "select * from {$pre}nav where nav_id={$id}";
	$data = getOne($sql);
	// var_dump($data);
	echo json_encode($data);die;
}
if($action == 'navAll') {
	$sql = "select * from {$pre}nav order by order_num desc";
	$data = getAll($sql);
	// var_dump($data);
	echo json_encode($data);die;
}
