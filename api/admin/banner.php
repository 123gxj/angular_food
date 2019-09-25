<?php
include_once('../lib/config.php');
$action = isset($_GET['action']) && !empty($_GET['action']) ? $_GET['action'] : '';
$id = isset($_GET['id']) && !empty($_GET['id']) ? $_GET['id'] : 0;
$limit = isset($_GET['limit']) && !empty($_GET['limit']) ? $_GET['limit'] : 2;
$offset = isset($_GET['offset']) && !empty($_GET['offset']) ? $_GET['offset'] : 0;
$ids = isset($_GET['ids']) && !empty($_GET['ids']) ? $_GET['ids'] : 0;

if($action == 'bannerAll') {
	$sql = "select * from {$pre}banner order by order_num desc";
	// echo $sql;die;
	$data = getAll($sql);
	// var_dump($data);
	echo json_encode($data);die;
}
if($action == 'banner') {
	$sql = "select * from {$pre}banner order by banner_id desc limit ${offset}, ${limit}";
	// echo $sql;die;
	$data = getAll($sql);
	// var_dump($data);
	echo json_encode($data);die;
}
if($action == 'bannerOne') {
	$sql = "select * from {$pre}banner where banner_id={$id}";
	// echo $sql;die;
	$data = getOne($sql);
	echo json_encode($data);die;
}
if($action == 'bannerCount'){
	$sql = "select count(*)as c from {$pre}banner";
	$data = getOne($sql);
	// var_dump($data);
	echo json_encode($data);die;
}
if($action == 'bannerDelete' && $id){
	 $sql ="select pic from {$pre}banner where banner_id = {$id}";
	//  echo $sql;die;
	 $pic = getOne($sql);
	 $pic=$pic['pic'];
	$pic= str_replace(HTTP, ROOT, $pic);
		if(file_exists($pic)){
					unlink($pic);
		}
	$sql = "delete from {$pre}banner where banner_id = {$id}";
	// echo $sql;die;
	$result = delete($sql);
	if($result){
		echo_json(1,'删除成功');
	}else{
		echo_json(0,'删除失败');
	}
}
if($action == 'bannerDeleteByIds' && $ids){
	
	$ids = json_decode($ids, true);
	
	$idsArr = explode(",", $ids['ids']);
	
	foreach($idsArr as $key => $value){
	  $value=(int)$value;
	  $sql ="select pic from {$pre}banner where banner_id = {$value}";
	  //  echo $sql;die;
	   $pic = getOne($sql);
	   $pic=$pic['pic'];
	  $pic= str_replace(HTTP, ROOT, $pic);
	  if(file_exists($pic)){
		unlink($pic);
}
	}
	
	 $sql = "delete from {$pre}banner where banner_id in (${ids['ids']})";
	
	 $result= delete($sql);
	 if($result) {
		echo_json(1, '删除成功');
	}else{
		echo_json(0, '删除失败');
	}
}
if($action == 'fileUpload'){
	$uploadUrl = '../../asset/home/img';
	$pic = upload_file('file',$uploadUrl);
	if($pic) {
		
		$pic = str_replace($uploadUrl, '', $pic);
		$pic = substr($pic,1);
		$pic = UPLOADS . $pic;
		// echo $pic;die;
		echo_json(1,$pic);
	}else{
		echo_json(0,'上传失败');
	}
}
if($action == 'bannerAdd') {
	
	if($_POST) {
		
		$title = isset($_POST['title']) && !empty($_POST['title']) ? trim($_POST['title']) : '';
		$link = isset($_POST['link']) && !empty($_POST['link']) ? $_POST['link'] : '';
		$order_num = isset($_POST['order_num']) && !empty($_POST['order_num']) ? trim($_POST['order_num']) : '';
		$pic = isset($_POST['pic']) && !empty($_POST['pic']) ? trim($_POST['pic']) : '';
		$oldpic = isset($_POST['oldpic']) && !empty($_POST['oldpic']) ? trim($_POST['oldpic']) : '';
		// echo $_POST;die;
		$data = array(
			'pic' => $pic,
			'title' => $title,
			'link' => $link,
			'order_num' => $order_num,
			);
		// var_dump($data);
		// echo $id;die;
		if(!$id) {
			$result = add("banner", $data);

			if($result) {
				echo_json(1, '添加成功');
			}else{
				echo_json(0, '添加失败');
			}
		}else{
			if($oldpic && $pic != $oldpic) {
				// echo $oldpic.'&&&&&&';
				// $oldpic= str_replace(HTTP, ROOT, $oldpic);
				// echo $oldpic;die;
				$key=strrpos($oldpic,'/');
				$oldpic = substr($oldpic,$key);
				$oldpic ='../../asset/home/img'. $oldpic;
				// echo $pic;die;
				if(file_exists($oldpic)){
					unlink($oldpic);
				  }
                
			}
			// var_dump($data);die;
			$result = update("banner", $data, "where banner_id=${id}");
			// echo $result;die;
			if($result) {
				echo_json(1, '更新成功');
			}else{
				echo_json(0, '更新失败');
			}
		}
	}
}
