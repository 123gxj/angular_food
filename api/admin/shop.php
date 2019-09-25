<?php
include_once('../lib/config.php');
date_default_timezone_set('PRC');
$action = isset($_GET['action']) && !empty($_GET['action']) ? $_GET['action'] : '';
$id = isset($_GET['id']) && !empty($_GET['id']) ? $_GET['id'] : 0;
$limit = isset($_GET['limit']) && !empty($_GET['limit']) ? $_GET['limit'] : 2;
$offset = isset($_GET['offset']) && !empty($_GET['offset']) ? $_GET['offset'] : 0;
$ids = isset($_GET['ids']) && !empty($_GET['ids']) ? $_GET['ids'] : 0;

if($action == 'shop') {
	// echo $_GET['region_id'];die;
	$region_id = isset($_GET['region_id']) && !empty($_GET['region_id']) ? $_GET['region_id'] : 0;
	
	if($region_id != 0){
		$sql = "select * from {$pre}shop where region_id={$region_id} order by shop_id desc limit {$offset}, {$limit}";
		}else{
		$sql ="select * from {$pre}shop order by shop_id desc limit {$offset}, {$limit}";	
		}
	// echo $sql;die;
	$data = getAll($sql);
	// var_dump($data);
	echo json_encode($data);die;
}
if($action == 'shop_region') {
	$region_id = isset($_GET['region_id']) && !empty($_GET['region_id']) ? $_GET['region_id'] : 1;
	$sql = "select * from {$pre}shop where region_id={$region_id} order by shop_id desc limit {$offset}, {$limit}";
	
	$data = getAll($sql);
	// var_dump($data);
	echo json_encode($data);die;
}
if($action == 'shopOne') {
	$sql = "select * from {$pre}shop where shop_id={$id}";
	// echo $sql;die;
	$data = getOne($sql);
	echo json_encode($data);die;
}
if($action == 'shopCount'){
	$region_id = isset($_GET['region_id']) && !empty($_GET['region_id']) ? $_GET['region_id'] : 0;
	// echo $region_id;
	if($region_id  ==  0){
             $sql = "select count(*)as c from {$pre}shop";
    }else{
		$sql = "select count(*)as c from {$pre}shop where region_id={$region_id}";
	}
	$data = getOne($sql);

    echo json_encode($data);die;
}
if($action == 'shopDelete' && $id){
	 $sql ="select pic from {$pre}shop where shop_id = {$id}";
	//  echo $sql;die;
	 $pic = getOne($sql);
	 $pic=$pic['pic'];
	$pic= str_replace(HTTP, ROOT, $pic);
		  	if(file_exists($pic)){
		unlink($pic);
		}
	$sql = "delete from {$pre}shop where shop_id = {$id}";
	// echo $sql;die;
	$result = delete($sql);
	if($result){
		echo_json(1,'删除成功');
	}else{
		echo_json(0,'删除失败');
	}
}
if($action == 'shopDeleteByIds' && $ids){
	
	$ids = json_decode($ids, true);
	
	$idsArr = explode(",", $ids['ids']);
	
	foreach($idsArr as $key => $value){
	  $value=(int)$value;
	  $sql ="select pic from {$pre}shop where shop_id = {$value}";
	  //  echo $sql;die;
	   $pic = getOne($sql);
	   $pic=$pic['pic'];
	  $pic= str_replace(HTTP, ROOT, $pic);
	  	  	if(file_exists($pic)){
		unlink($pic);
		}
	}
	
	 $sql = "delete from {$pre}shop where shop_id in (${ids['ids']})";
	
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
if($action == 'shopAdd') {
	
	if($_POST) {
		
		$title = isset($_POST['title']) && !empty($_POST['title']) ? trim($_POST['title']) : '';
		$dishes = isset($_POST['dishes']) && !empty($_POST['dishes']) ? $_POST['dishes'] : '';
		$business_time = isset($_POST['business_time']) && !empty($_POST['business_time']) ? trim($_POST['business_time']) : '';
		$parking = isset($_POST['parking']) && !empty($_POST['parking']) ? intval($_POST['parking']) : '';
		$address = isset($_POST['address']) && !empty($_POST['address']) ? intval($_POST['address']) : '';
		$tag = isset($_POST['tag']) && !empty($_POST['tag']) ? intval($_POST['tag']) : '';
		$pic = isset($_POST['pic']) && !empty($_POST['pic']) ? trim($_POST['pic']) : '';
		$oldpic = isset($_POST['oldpic']) && !empty($_POST['oldpic']) ? trim($_POST['oldpic']) : '';
		// echo $_POST;die;
		$data = array(
			'pic' => $pic,
			'title' => $title,
			'dishes' => $dishes,
			'business_time' => $business_time,
			'parking' => $parking,
			'address' => $address,
			'tag' => $tag,
		);
		// var_dump($data);
		// echo $id;die;
		if(!$id) {
			$result = add("shop", $data);

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
			$result = update("shop", $data, "where shop_id=${id}");
			// echo $result;die;
			if($result) {
				echo_json(1, '更新成功');
			}else{
				echo_json(0, '更新失败');
			}
		}
	}
}
