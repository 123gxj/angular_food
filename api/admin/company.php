<?php
include_once('../lib/config.php');
$action = isset($_GET['action']) && !empty($_GET['action']) ? $_GET['action'] : '';
$id = isset($_GET['id']) && !empty($_GET['id']) ? $_GET['id'] : 0;
$limit = isset($_GET['limit']) && !empty($_GET['limit']) ? $_GET['limit'] : 2;
$offset = isset($_GET['offset']) && !empty($_GET['offset']) ? $_GET['offset'] : 0;
$ids = isset($_GET['ids']) && !empty($_GET['ids']) ? $_GET['ids'] : 0;

if($action == 'company') {
	$sql = "select * from {$pre}company order by company_id desc limit ${offset}, ${limit}";
	
	$data = getAll($sql);
	// var_dump($data);
	echo json_encode($data);die;
}
if($action == 'companyAll') {
	$sql = "select * from {$pre}company order by company_id desc";
	
	$data = getAll($sql);
	// var_dump($data);
	echo json_encode($data);die;
}
if($action == 'companyOne') {
	$sql = "select * from {$pre}company where company_id={$id}";
	// echo $sql;die;
	$data = getOne($sql);
	echo json_encode($data);die;
}
if($action == 'companyCount'){
	$sql = "select count(*)as c from {$pre}company";
	$data = getOne($sql);
	// var_dump($data);
	echo json_encode($data);die;
}
if($action == 'companyDelete' && $id){
	 $sql ="select pic from {$pre}company where company_id = {$id}";
	//  echo $sql;die;
	 $pic = getOne($sql);
	 $pic=$pic['pic'];
	$pic= str_replace(HTTP, ROOT, $pic);
		if(file_exists($pic)){
					unlink($pic);
		}
	$sql = "delete from {$pre}company where company_id = {$id}";
	// echo $sql;die;
	$result = delete($sql);
	if($result){
		echo_json(1,'删除成功');
	}else{
		echo_json(0,'删除失败');
	}
}
if($action == 'companyDeleteByIds' && $ids){
	
	$ids = json_decode($ids, true);
	
	$idsArr = explode(",", $ids['ids']);
	
	foreach($idsArr as $key => $value){
	  $value=(int)$value;
	  $sql ="select pic from {$pre}company where company_id = {$value}";
	  //  echo $sql;die;
	   $pic = getOne($sql);
	   $pic=$pic['pic'];
	  $pic= str_replace(HTTP, ROOT, $pic);
	  	if(file_exists($pic)){
					unlink($pic);
		}
	}
	
	 $sql = "delete from {$pre}company where company_id in (${ids['ids']})";
	
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
if($action == 'companyAdd') {
	
	if($_POST) {
		
		$title = isset($_POST['title']) && !empty($_POST['title']) ? trim($_POST['title']) : '';
		$phone = isset($_POST['phone']) && !empty($_POST['phone']) ? $_POST['phone'] : '';
		$tel = isset($_POST['tel']) && !empty($_POST['tel']) ? trim($_POST['tel']) : '';
		$postal_code = isset($_POST['postal_code']) && !empty($_POST['postal_code']) ? intval($_POST['postal_code']) : '';
		$address = isset($_POST['address']) && !empty($_POST['address']) ? intval($_POST['address']) : 0;
		$pic = isset($_POST['pic']) && !empty($_POST['pic']) ? trim($_POST['pic']) : '';
		$oldpic = isset($_POST['oldpic']) && !empty($_POST['oldpic']) ? trim($_POST['oldpic']) : '';
		// echo $_POST;die;
		$data = array(
			'pic' => $pic,
			'title' => $title,
			'phone' => $phone,
			'tel' => $tel,
			'postal_code' => $postal_code,
			'address' => $address
		);
		// var_dump($data);
		// echo $id;die;
		if(!$id) {
			$result = add("company", $data);

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
			$result = update("company", $data, "where company_id=${id}");
			// echo $result;die;
			if($result) {
				echo_json(1, '更新成功');
			}else{
				echo_json(0, '更新失败');
			}
		}
	}
}
