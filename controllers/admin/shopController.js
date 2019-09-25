
app.controller('shop', function($scope, shop, Form,$state){//
		
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
		shop.count().then(function(result){
			// console.log(result)
			if(result.status == 200){
				if(result.data['c'] > 0) { // 有数据
					// 总数
					$scope.totalItems = result.data['c'];
					// 下标
					$scope.offset =  ($scope.currentPage - 1) * $scope.limit;
					// 分页查询
					shop.page($scope.limit, $scope.offset).then(function(result){
						// console.log(result.data)
						if(result.status == 200) {

							result.data.forEach(value => {
								var k = value.pic.indexOf("asset")
								value.pic = value.pic.substr(k);
								value.pic= '../'+value.pic
								value.dishes = value.dishes.substring(0,10) + '...'
								value.tag = value.tag.substring(0,20) + '...'
							});
							$scope.data = result.data;
							console.log($scope.data)
							
						}
					})
				}
			}
		})
	}
	$scope.page()

      $scope.del = function(id){
		shop.delete(id).then(function(result){
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
		 shop.deleteByIds(idsJson).then(function(result){
			  console.log(result)
			  $state.reload()
		  })
	  }
})

app.controller('shop_add', function($scope,shop, $state,$stateParams, Upload,$sce){//
	$scope.shop = {}
	$scope.id = $stateParams.id;
	if($stateParams.id) {

		shop.get($stateParams.id).then(function(result){
			// console.log(result)
			if(result.status == 200) {
				// console.log(result.data);
				$scope.shop = result.data
				$scope.shop.oldpic = result.data.pic
				
			}
		})
	}

	// 添加功能
	$scope.save = function() {
		
		var data = {
			title: $scope.shop.title,
			dishes: $scope.shop.dishes,
			business_time: $scope.shop.business_time,
			parking: $scope.shop.parking,
			address: $scope.shop.address,
			tag: $scope.shop.tag,
			pic:$scope.shop.pic,
			oldpic: $scope.shop.oldpic
		}
		if($scope.file){
			Upload.upload({
				url: '../api/admin/shop.php?action=fileUpload',
				data: {file: $scope.file}//
		   }).then(function(resp){
			   console.log(resp);
			   if(resp.data.code){
				$scope.shop.pic = resp.data.msg
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
			shop.save(data).then(function(result){
				// console.log('ADD')
				// console.log(result)
				if(result.status == 200){
					if(result.data.code == 1){
						alert(result.data.msg);
						$state.go('admin.shop')
					}else{
						$state.reload()
					}
				}
			})
			}else{
				// data.pic = 'test.jpg'
			console.log(data);
			shop.update(data,$scope.id).then(function(result){
				if(result.status == 200){
					// result.data.forEach(value => {
					// 	value.content = $sce.trustAsHtml(value.content)
						
					// });
					if(result.data.code == 1){
						alert(result.data.msg);
						$state.go('admin.shop')
					}else{
						$state.reload()
					}
				}
			})
				}
	}

    }
})

