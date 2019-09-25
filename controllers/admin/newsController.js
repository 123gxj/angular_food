
app.controller('news', function($scope, news, Form,$state){//
		
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
		news.count().then(function(result){
			// console.log(result)
			if(result.status == 200){
				if(result.data['c'] > 0) { // 有数据
					// 总数
					$scope.totalItems = result.data['c'];
					// 下标
					$scope.offset =  ($scope.currentPage - 1) * $scope.limit;
					// 分页查询
					news.page($scope.limit, $scope.offset).then(function(result){
						// console.log(result.data)
						if(result.status == 200) {
							result.data.forEach(value => {
								var k = value.pic.indexOf("asset")
								value.pic = value.pic.substr(k);
								value.pic= '../'+value.pic
							});
							result.data.forEach(value => {
								value.description = value.description.substring(0,10) + '...'
								value.content = value.content.substring(0,20) + '...'
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
		news.delete(id).then(function(result){
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
		 news.deleteByIds(idsJson).then(function(result){
			  console.log(result)
			  $state.reload()
		  })
	  }
})

app.controller('news_add', function($scope,news, $state,$stateParams, Upload,$sce){//
	$scope.news = {}
	$scope.id = $stateParams.id;
	if($stateParams.id) {

		news.get($stateParams.id).then(function(result){
			// console.log(result)
			if(result.status == 200) {
				// console.log(result.data);
				$scope.news = result.data
				$scope.news.oldpic = result.data.pic
				
			}
		})
	}

	// 添加功能
	$scope.save = function() {
		
		var data = {
			title: $scope.news.title,
			description: $scope.news.description,
			create_time: $scope.news.create_time,
			content: $scope.news.content,
			pic:$scope.news.pic,
			oldpic: $scope.news.oldpic
		}
		if($scope.file){
			Upload.upload({
				url: '../api/admin/news.php?action=fileUpload',
				data: {file: $scope.file}//
		   }).then(function(resp){
			   console.log(resp);
			   if(resp.data.code){
				$scope.news.pic = resp.data.msg
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
			news.save(data).then(function(result){
				// console.log('ADD')
				// console.log(result)
				if(result.status == 200){
					if(result.data.code == 1){
						alert(result.data.msg);
						$state.go('admin.news')
					}else{
						$state.reload()
					}
				}
			})
			}else{
				// data.pic = 'test.jpg'
			console.log(data);
			news.update(data,$scope.id).then(function(result){
				if(result.status == 200){
					// result.data.forEach(value => {
					// 	value.content = $sce.trustAsHtml(value.content)
						
					// });
					if(result.data.code == 1){
						alert(result.data.msg);
						$state.go('admin.news')
					}else{
						$state.reload()
					}
				}
			})
				}
	}

    }
})

