
app.controller('friendLink', function($scope, friendLink, Form,$state){//
		
		// 可选择的页数范围
		$scope.maxSize = 4;
		// 每页显示的数量
		$scope.limit = 8;
		// 设置page默认值
		$scope.currentPage =  1
		// 设置总条数
		$scope.totalItems = 0

	$scope.page = function(currentPage){
		// 当前页数
		$scope.currentPage = currentPage || 1
		friendLink.count().then(function(result){
			// console.log(result)
			if(result.status == 200){
				if(result.data['c'] > 0) { // 有数据
					// 总数
					$scope.totalItems = result.data['c'];
					// 下标
					$scope.offset =  ($scope.currentPage - 1) * $scope.limit;
					// 分页查询
					friendLink.page($scope.limit, $scope.offset).then(function(result){
						// console.log(result.data)
						if(result.status == 200) {
							result.data.forEach(value => {
									var k = value.pic.indexOf("asset")
									value.pic = value.pic.substr(k);
									value.pic= '../'+value.pic
								});
						    $scope.data = result.data;
							// console.log($scope.data)
							
						}
					})
				}
			}
		})
	}
	$scope.page()

      $scope.del = function(id){
		friendLink.delete(id).then(function(result){
			  if(result.status == 200){
				//   console.log(result);
				alert(result.data.msg)
				$state.reload()
			  }
		  })
	  }
	  
	  Form.checkedAction($scope, '.ids')
	
	  $scope.delAll = function(){
		  var idsJson = Form.checkedValToJson('.ids')
		 friendLink.deleteByIds(idsJson).then(function(result){
			  console.log(result)
			  $state.reload()
		  })
	  }
})

app.controller('friendLink_add', function($scope,friendLink, $state,$stateParams, Upload){//
	$scope.friendLink = {}
	$scope.id = $stateParams.id;
	if($stateParams.id) {

		friendLink.get($stateParams.id).then(function(result){
			// console.log(result)
			if(result.status == 200) {
				// console.log(result.data);
				$scope.friendLink = result.data
				$scope.friendLink.oldpic = result.data.pic
				
			}
		})
	}

	// 添加功能
	$scope.save = function() {
		
		var data = {
			title: $scope.friendLink.title,
			order_num: $scope.friendLink.order_num,
			pic:$scope.friendLink.pic,
			oldpic: $scope.friendLink.oldpic
		}
		if($scope.file){
			Upload.upload({
				url: '../api/admin/friendLink.php?action=fileUpload',
				data: {file: $scope.file}//
		   }).then(function(resp){
			   console.log(resp);
			   if(resp.data.code){
				$scope.friendLink.pic = resp.data.msg
				data.pic = resp.data.msg
			   }
			   deal();
		   })
		}else{
			deal();
		}
	function deal()	{
		if(!$scope.id){
			console.log(data);
			friendLink.save(data).then(function(result){
				// console.log('ADD')
				// console.log(result)
				if(result.status == 200){
					if(result.data.code == 1){
						alert(result.data.msg);
						$state.go('admin.friendLink')
					}else{
						$state.reload()
					}
				}
			})
			}else{
				// data.pic = 'test.jpg'
			console.log(data);
			friendLink.update(data,$scope.id).then(function(result){
				if(result.status == 200){
					if(result.data.code == 1){
						alert(result.data.msg);
						$state.go('admin.friendLink')
					}else{
						$state.reload()
					}
				}
			})
				}
	}

    }
})

