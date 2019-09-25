app.controller('pinpai', function($scope,$sce,singlePage){
    singlePage.showOne(1).then(function(result){
        if(result.status == 200){
        result.data.content = $sce.trustAsHtml(result.data.content);
             var k = result.data.pic.indexOf("asset")
           result.data.pic =  result.data.pic.substr(k);
            
         $scope.singlePage = result.data;
        //  console.log($scope.singlePage)
        }
    })
})

  
app.controller('meishi',function($scope,Food){

//分页查询
var cate_name = 'all'
$scope.get_foodCate= function(cate_name){
   
    showFood(cate_name)
}
showFood(cate_name)

 function showFood(cate_name){
    $scope.maxSize = 4;
    // 每页显示的数量
    $scope.limit =3;
    // 设置page默认值
    $scope.currentPage =  1
    // 设置总条数
    $scope.totalItems = 0
    
	$scope.page = function(currentPage){
		// 当前页数
		$scope.currentPage = currentPage || 1
		Food.showCount(cate_name).then(function(result){
			// console.log(result)
			if(result.status == 200){
				if(result.data['c'] > 0) { // 有数据
					// 总数
                    $scope.totalItems = result.data['c'];
                    // console.log( $scope.totalItems)
					// 下标
					$scope.offset =  ($scope.currentPage - 1) * $scope.limit;
					// 分页查询
					Food.showPage($scope.limit, $scope.offset,cate_name).then(function(result){
						// console.log(result.data)
						if(result.status == 200) {
                            result.data.forEach(value => {
                                var k = value.pic.indexOf("asset")
                                 value.pic = value.pic.substr(k);
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
 }
  })
app.controller('meishiCon',function($scope,Food, $stateParams,$sce){
    $scope.id = $stateParams.id;
    Food.showOne($scope.id).then(function(result){
        if(result.status == 200){
            // console.log(result.data)
            //
            result.data.content = $sce.trustAsHtml(result.data.content);
            var k = result.data.pic.indexOf("asset")
            result.data.pic = result.data.pic.substr(k);
            $scope.food = result.data;
        }
    })
})
app.controller('shop',function($scope,shop){
    region_id=1;
     showShop( region_id);
  $scope.get_region=function(region_id){
    showShop( region_id);
  }
    // console.log( $scope.region_id);return false;
   
    function showShop(region_id){
        $scope.maxSize = 4;
        // 每页显示的数量
        $scope.limit = 6;
        // 设置page默认值
        $scope.currentPage =  1
        // 设置总条数
        $scope.totalItems = 0
        
        $scope.page = function(currentPage){
            // 当前页数
            $scope.currentPage = currentPage || 1
            shop.showCount(region_id).then(function(result){
                // console.log(result)
                if(result.status == 200){
                    if(result.data['c'] > 0) { // 有数据
                        // 总数
                        $scope.totalItems = result.data['c'];
                        // console.log( $scope.totalItems)
                        // 下标
                        $scope.offset =  ($scope.currentPage - 1) * $scope.limit;
                        // 分页查询
                        shop.showPage($scope.limit, $scope.offset,region_id).then(function(result){
                            // console.log(result.data)
                            if(result.status == 200) {
                                result.data.forEach(value => {
                                    var k = value.pic.indexOf("asset")
                                     value.pic = value.pic.substr(k);
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
    }

})
app.controller('shopCon',function($scope,shop, $stateParams){
    $scope.id = $stateParams.id;
    shop.showOne($scope.id).then(function(result){
        if(result.status == 200){
           
             var k = result.data.pic.indexOf("asset")
                 result.data.pic = result.data.pic.substr(k);
          
            $scope.shop = result.data;
             console.log($scope.shop)
        }
    })
})
app.controller('news',function($scope,news){
    $scope.maxSize = 4;
    // 每页显示的数量
    $scope.limit = 4;
    // 设置page默认值
    $scope.currentPage =  1
    // 设置总条数
    $scope.totalItems = 0
    $scope.page = function(currentPage){
        // 当前页数
        $scope.currentPage = currentPage || 1
        news.showCount().then(function(result){
            // console.log(result)
            if(result.status == 200){
                if(result.data['c'] > 0) { // 有数据
                    // 总数
                    $scope.totalItems = result.data['c'];
                    // console.log( $scope.totalItems)
                    // 下标
                    $scope.offset =  ($scope.currentPage - 1) * $scope.limit;
                    // 分页查询
                    news.showPage($scope.limit, $scope.offset).then(function(result){
                        // console.log(result.data)
                        if(result.status == 200) {
                            result.data.forEach(value => {
                                var k = value.pic.indexOf("asset")
                                 value.pic = value.pic.substr(k);
                             });
                            $scope.news = result.data;
                            // console.log($scope.data)
                            
                        }
                    })
                }
            }
        })
    }
    $scope.page()

})
app.controller('newsCon',function($scope,news, $stateParams,$sce){
    $scope.id = $stateParams.id;
    news.showOne($scope.id).then(function(result){
        if(result.status == 200){
            result.data.content = $sce.trustAsHtml(result.data.content);
            $scope.news = result.data;
            //  console.log($scope.news)
        }
    })
})
app.controller('about',function($scope,company){
    company.showAll(6).then(function(result){
        if(result.status == 200){
            // result.data.content = $sce.trustAsHtml(result.data.content);
            result.data.forEach(value => {
                var k = value.pic.indexOf("asset")
                 value.pic = value.pic.substr(k);
             });
            $scope.company = result.data;
            
            // console.log(result.data)
        }
    })
})