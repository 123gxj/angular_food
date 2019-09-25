
app.controller('foodListCtrl', function($scope, Food, Form,$state){//
		
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
		Food.count().then(function(result){
			// console.log(result)
			if(result.status == 200){
				if(result.data['c'] > 0) { // 有数据
					// 总数
					$scope.totalItems = result.data['c'];
					// 下标
					$scope.offset =  ($scope.currentPage - 1) * $scope.limit;
					// 分页查询
					Food.page($scope.limit, $scope.offset).then(function(result){
						// console.log(result)
						if(result.status == 200) {
							result.data.forEach(value => {
								var k = value.pic.indexOf("asset")
								value.pic = value.pic.substr(k);
								value.pic= '../'+value.pic
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
		Food.delete(id).then(function(result){
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
		 Food.deleteByIds(idsJson).then(function(result){
			  console.log(result)
			  $state.reload()
		  })
	  }
})

app.controller('foodAddCtrl', function($scope,Food, FoodCate, $state,$stateParams, Upload){//
	$scope.food = {}
	// 设置是否推荐数组
	$scope.recommendArr = [
		{
			id: 0,
			name: '不推荐'
		},
		{
			id: 1,
			name: '推荐'
		}
	]
	// 设置是否推荐默认值
	$scope.food.is_recommend = $scope.recommendArr[0]
	$scope.id = $stateParams.id;
	// 展示功能
	// 获取分类
	FoodCate.query().then(function(result){
		if(result.status == 200) {
			$scope.food.cate = result.data[0]
			$scope.cates = result.data;
			// 查一条美食
			}
	})
	if($stateParams.id) {

		Food.get($stateParams.id).then(function(result){
			// console.log(result)
			if(result.status == 200) {
				// console.log(result.data);
				$scope.food = result.data
				$scope.food.oldpic = result.data.pic
				
				// 重置推荐值
				$scope.food.is_recommend = $scope.recommendArr[$scope.food.is_recommend]
				
				// 重置分类值
				
				FoodCate.get($scope.food.cate_id).then(function(res){
					$scope.food.cate = res.data
				})
			}
		})
	}

	// 添加功能
	$scope.save = function() {
		
		var data = {
			title: $scope.food.title,
			price: $scope.food.price,
			content: $scope.food.content,
			cate_id: $scope.food.cate.cate_id,
			is_recommend: $scope.food.is_recommend.id,
			pic:$scope.food.pic,
			oldpic: $scope.food.oldpic
		}
		if($scope.file){
			Upload.upload({
				url: '../api/admin/food.php?action=fileUpload',
				data: {file: $scope.file}//
		   }).then(function(resp){
			   console.log(resp);
			   if(resp.data.code){
				$scope.food.pic = resp.data.msg
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
			// data.pic = 'test.jpg'
			console.log(data);
			
			Food.save(data).then(function(result){
				// console.log('ADD')
				// console.log(result)
				if(result.status == 200){
					if(result.data.code == 1){
						alert(result.data.msg);
						$state.go('admin.food')
					}else{
						$state.reload()
					}
				}
			})
			}else{
				// data.pic = 'test.jpg'
			console.log(data);
			Food.update(data,$scope.id).then(function(result){
				console.log('EDIT')
				console.log(result)
				if(result.status == 200){
					if(result.data.code == 1){
						alert(result.data.msg);
						$state.go('admin.food')
					}else{
						$state.reload()
					}
				}
			})
				}
	}

    }
})

