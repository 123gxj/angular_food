<?php
include_once('../lib/config.php');
date_default_timezone_set('PRC');
$action = isset($_GET['action']) && !empty($_GET['action']) ? $_GET['action'] : '';
$id = isset($_GET['id']) && !empty($_GET['id']) ? $_GET['id'] : 0;
$limit = isset($_GET['limit']) && !empty($_GET['limit']) ? $_GET['limit'] : 2;
$offset = isset($_GET['offset']) && !empty($_GET['offset']) ? $_GET['offset'] : 0;
$ids = isset($_GET['ids']) && !empty($_GET['ids']) ? $_GET['ids'] : 0;

if($action == 'news') {
	$sql = "select * from {$pre}news order by news_id desc limit ${offset}, ${limit}";
	
	$data = getAll($sql);
	// var_dump($data);
	echo json_encode($data);die;
}
if($action == 'newsOne') {
	$sql = "select * from {$pre}news where news_id={$id}";
	// echo $sql;die;
	$data = getOne($sql);
	echo json_encode($data);die;
}
if($action == 'newsShowOne') {
	$sql = "select * from {$pre}news where news_id={$id}";
	// echo $sql;die;
	$data = getOne($sql);
	echo json_encode($data);die;
}
if($action == 'newsCount'){
	$sql = "select count(*)as c from {$pre}news";
	$data = getOne($sql);
	// var_dump($data);
	echo json_encode($data);die;
}
if($action == 'newsDelete' && $id){
	 $sql ="select pic from {$pre}news where news_id = {$id}";
	//  echo $sql;die;
	 $pic = getOne($sql);
	 $pic=$pic['pic'];
	$pic= str_replace(HTTP, ROOT, $pic);
		  	if(file_exists($pic)){
		unlink($pic);
		}
	$sql = "delete from {$pre}news where news_id = {$id}";
	// echo $sql;die;
	$result = delete($sql);
	if($result){
		echo_json(1,'删除成功');
	}else{
		echo_json(0,'删除失败');
	}
}
if($action == 'newsDeleteByIds' && $ids){
	
	$ids = json_decode($ids, true);
	
	$idsArr = explode(",", $ids['ids']);
	
	foreach($idsArr as $key => $value){
	  $value=(int)$value;
	  $sql ="select pic from {$pre}news where news_id = {$value}";
	  //  echo $sql;die;
	   $pic = getOne($sql);
	   $pic=$pic['pic'];
	  $pic= str_replace(HTTP, ROOT, $pic);
	  	  	if(file_exists($pic)){
		unlink($pic);
		}
	}
	
	 $sql = "delete from {$pre}news where news_id in (${ids['ids']})";
	
	 $result= delete($sql);
	 if($result){
		echo_json(1,'删除成功');
	}else{
		echo_json(0,'删除失败');
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
if($action == 'newsAdd') {
	
	if($_POST) {
		
		$title = isset($_POST['title']) && !empty($_POST['title']) ? trim($_POST['title']) : '';
		$description = isset($_POST['description']) && !empty($_POST['description']) ? $_POST['description'] : '';
		$create_time = isset($_POST['create_time']) && !empty($_POST['create_time']) ? trim($_POST['create_time']) : '';
		$content = isset($_POST['content']) && !empty($_POST['content']) ? intval($_POST['content']) : '';
		$pic = isset($_POST['pic']) && !empty($_POST['pic']) ? trim($_POST['pic']) : '';
		$oldpic = isset($_POST['oldpic']) && !empty($_POST['oldpic']) ? trim($_POST['oldpic']) : '';
		// echo $_POST;die;
		$data = array(
			'pic' => $pic,
			'title' => $title,
			'description' => $description,
			'create_time' => $create_time,
			'content' => $content,
			
		);
		// var_dump($data);
		// echo $id;die;
		if(!$id) {
			$result = add("news", $data);

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
			$result = update("news", $data, "where news_id=${id}");
			// echo $result;die;
			if($result) {
				echo_json(1, '更新成功');
			}else{
				echo_json(0, '更新失败');
			}
		}
	}
}
