
app.controller('company', function($scope, company, Form,$state){//
		
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
		company.count().then(function(result){
			// console.log(result)
			if(result.status == 200){
				if(result.data['c'] > 0) { // 有数据
					// 总数
					$scope.totalItems = result.data['c'];
					// 下标
					$scope.offset =  ($scope.currentPage - 1) * $scope.limit;
					// 分页查询
					company.page($scope.limit, $scope.offset).then(function(result){
						// console.log(result.data)
						if(result.status == 200) {
							result.data.forEach(value => {
								var k = value.pic.indexOf("asset")
								value.pic = value.pic.substr(k);
								value.pic= '../'+value.pic
								value.address = value.address.substring(0,15) + '...'
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
		company.delete(id).then(function(result){
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
		 company.deleteByIds(idsJson).then(function(result){
			  console.log(result)
			  $state.reload()
		  })
	  }
})

app.controller('company_add', function($scope,company, $state,$stateParams, Upload){//
	$scope.company = {}
	$scope.id = $stateParams.id;
	if($stateParams.id) {

		company.get($stateParams.id).then(function(result){
			// console.log(result)
			if(result.status == 200) {
				// console.log(result.data);
				$scope.company = result.data
				$scope.company.oldpic = result.data.pic
				
			}
		})
	}

	// 添加功能
	$scope.save = function() {
		
		var data = {
			title: $scope.company.title,
			address: $scope.company.address,
			phone: $scope.company.phone,
			tel: $scope.company.tel,
			postal_code: $scope.company.postal_code,
			pic:$scope.company.pic,
			oldpic: $scope.company.oldpic
		}
		if($scope.file){
			Upload.upload({
				url: '../api/admin/company.php?action=fileUpload',
				data: {file: $scope.file}//
		   }).then(function(resp){
			   console.log(resp);
			   if(resp.data.code){
				$scope.company.pic = resp.data.msg
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
			company.save(data).then(function(result){
				// console.log('ADD')
				// console.log(result)
				if(result.status == 200){
					if(result.data.code == 1){
						alert(result.data.msg);
						$state.go('admin.company')
					}else{
						$state.reload()
					}
				}
			})
			}else{
				// data.pic = 'test.jpg'
			console.log(data);
			company.update(data,$scope.id).then(function(result){
				if(result.status == 200){
					if(result.data.code == 1){
						alert(result.data.msg);
						$state.go('admin.company')
					}else{
						$state.reload()
					}
				}
			})
				}
	}

    }
})

