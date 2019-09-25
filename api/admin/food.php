<?php
include_once('../lib/config.php');
$action = isset($_GET['action']) && !empty($_GET['action']) ? $_GET['action'] : '';
$id = isset($_GET['id']) && !empty($_GET['id']) ? $_GET['id'] : 0;
$limit = isset($_GET['limit']) && !empty($_GET['limit']) ? $_GET['limit'] : 2;
$offset = isset($_GET['offset']) && !empty($_GET['offset']) ? $_GET['offset'] : 0;
$ids = isset($_GET['ids']) && !empty($_GET['ids']) ? $_GET['ids'] : 0;

if($action == 'foodtop') {
	$sql = "select * from {$pre}food as f left join {$pre}food_cate as c on c.cate_id = f.cate_id where is_recommend=1 order by food_id desc limit ${limit}";
	
	$data = getAll($sql);
	// var_dump($data);
	echo json_encode($data);die;
}
// if($action == 'foodNorecom') {
// 	$sql = "select * from {$pre}food as f left join {$pre}food_cate as c on c.cate_id = f.cate_id where is_recommend=0 order by food_id  limit ${limit}";
	
// 	$data = getAll($sql);
// 	// var_dump($data);
// 	echo json_encode($data);die;
// }
if($action == 'showFood') {
	// echo $_GET['cate_name'];die;
	$cate_name = isset($_GET['cate_name']) && !empty($_GET['cate_name']) ? $_GET['cate_name'] : 'none';
	if($cate_name=="all") $cate_name ='none';
	if($cate_name == 'none'){
		$sql = "select * from {$pre}food as f left join {$pre}food_cate as c on c.cate_id = f.cate_id where f.is_recommend=0 order by food_id desc limit {$offset}, {$limit}";
		}else{
		$cate_name = $_GET['cate_name'];
		$sql ="select * from {$pre}food as f left join {$pre}food_cate as c on c.cate_id = f.cate_id  where c.cate_name='{$cate_name}' and f.is_recommend=0 order by food_id desc limit {$offset}, {$limit}";	
		}
	// echo $sql;die;
	$data = getAll($sql);
	// var_dump($data);
	echo json_encode($data);die;
}
if($action == 'showCount'){
	
	$cate_name = isset($_GET['cate_name']) && !empty($_GET['cate_name']) ? $_GET['cate_name'] : 'none';
	if($cate_name=="all"){
		$cate_name ='none';
	} 
	// echo $cate_name;die;
	if($cate_name  ==  'none'){
		// echo $cate_name . '----';
		$sql = "select count(*)as c from {$pre}food as f where f.is_recommend=0";
	}else{
		// echo $cate_name.'----';
		$cate_name = $_GET['cate_name'];
		$sql = "select count(*)as c from {$pre}food as f left join {$pre}food_cate as fc on fc.cate_id = f.cate_id where fc.cate_name='{$cate_name}' and f.is_recommend=0";
	}
	// echo $sql;die;
	$data = getOne($sql);
	// var_dump($data);
	echo json_encode($data);die;
}
if($action == 'food') {
	// echo $_GET['cate_name'];die;
	$sql = "select * from {$pre}food as f left join {$pre}food_cate as c on c.cate_id = f.cate_id  order by food_id desc limit {$offset}, {$limit}";
	// echo $sql;die;
	$data = getAll($sql);
	// var_dump($data);
	echo json_encode($data);die;
}
if($action == 'foodOne') {
	$sql = "select * from {$pre}food as f left join {$pre}food_cate as c on c.cate_id = f.cate_id where food_id={$id}";
	// echo $sql;die;
	$data = getOne($sql);
	echo json_encode($data);die;
}
if($action == 'count'){
	
	$sql = "select count(*)as c from {$pre}food";
	$data = getOne($sql);
	// var_dump($data);
	echo json_encode($data);die;
}
if($action == 'foodDelete' && $id){
	 $sql ="select pic from {$pre}food where food_id = {$id}";
	//  echo $sql;die;
	 $pic = getOne($sql);
	 $pic=$pic['pic'];
	$pic= str_replace(HTTP, ROOT, $pic);
		if(file_exists($pic)){
		unlink($pic);
		}
	$sql = "delete from {$pre}food where food_id = {$id}";
	// echo $sql;die;
	$result = delete($sql);
	if($result){
		echo_json(1,'删除成功');
	}else{
		echo_json(0,'删除失败');
	}
}
if($action == 'foodDeleteByIds' && $ids){
	
	$ids = json_decode($ids, true);
	
	$idsArr = explode(",", $ids['ids']);
	
	foreach($idsArr as $key => $value){
	  $value=(int)$value;
	  $sql ="select pic from {$pre}food where food_id = {$value}";
	  //  echo $sql;die;
	   $pic = getOne($sql);
	   $pic=$pic['pic'];
	  $pic= str_replace(HTTP, ROOT, $pic);
	  	if(file_exists($pic)){
		unlink($pic);
		}
	}
	
	 $sql = "delete from {$pre}food where food_id in (${ids['ids']})";
	
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
if($action == 'foodAdd') {
	
	if($_POST) {
		
		$title = isset($_POST['title']) && !empty($_POST['title']) ? trim($_POST['title']) : '';
		$price = isset($_POST['price']) && !empty($_POST['price']) ? $_POST['price'] : '';
		$content = isset($_POST['content']) && !empty($_POST['content']) ? trim($_POST['content']) : '';
		$cate_id = isset($_POST['cate_id']) && !empty($_POST['cate_id']) ? intval($_POST['cate_id']) : '';
		$is_recommend = isset($_POST['is_recommend']) && !empty($_POST['is_recommend']) ? intval($_POST['is_recommend']) : 0;
		$pic = isset($_POST['pic']) && !empty($_POST['pic']) ? trim($_POST['pic']) : '';
		$oldpic = isset($_POST['oldpic']) && !empty($_POST['oldpic']) ? trim($_POST['oldpic']) : '';
		// echo $_POST;die;
		$data = array(
			'pic' => $pic,
			'title' => $title,
			'price' => $price,
			'content' => $content,
			'cate_id' => $cate_id,
			'is_recommend' => $is_recommend
		);
		// var_dump($data);
		// echo $id;die;
		if(!$id) {
			$result = add("food", $data);

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
			$result = update("food", $data, "where food_id=${id}");
			// echo $result;die;
			if($result) {
				echo_json(1, '更新成功');
			}else{
				echo_json(0, '更新失败');
			}
		}
	}
}
