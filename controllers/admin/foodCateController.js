app.controller('foodCate',function($scope, FoodCate, Form,$state){
    $scope.maxSize = 4;
    $scope.limit = 3;
    $scope.currentPage =  1
    $scope.totalItems = 0

$scope.page = function(currentPage){
    $scope.currentPage = currentPage || 1
    FoodCate.count().then(function(result){
        if(result.status == 200){
            if(result.data['c'] > 0) { // 有数据
                $scope.totalItems = result.data['c'];
                $scope.offset =  ($scope.currentPage - 1) * $scope.limit;
                FoodCate.page($scope.limit, $scope.offset).then(function(result){
                    if(result.status == 200) {
                        $scope.data = result.data;
                    }
                })
            }
        }
    })
}
$scope.page()

$scope.del = function(id){
    FoodCate.delete(id).then(function(result){
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
     FoodCate.deleteByIds(idsJson).then(function(result){
          console.log(result)
          $state.reload()
      })
  }
})
app.controller('foodCate_add',function($scope,FoodCate, $state,$stateParams){
    $scope.id = $stateParams.id;
   
  if($stateParams.id){
      FoodCate.get($stateParams.id).then(function(result){
          if(result.status == 200){
              $scope.foodCate = result.data
            //   console.log($scope.foodCate)
          }
      })
  }
$scope.save = function(){
  var data  = {
        cate_name : $scope.foodCate.cate_name
    }
   console.log(data);
    if(!$scope.id){
       FoodCate.save(data).then(function(result){
           if(result.status == 200){
            if(result.data.code == 1){
                alert(result.data.msg);
                $state.go('admin.foodCate')
            }else{
                $state.reload()
            }
           }
       })
    }else{
        FoodCate.update(data,$scope.id).then(function(result){
            if(result.status == 200){
                if(result.data.code == 1){
                    alert(result.data.msg);
                    $state.go('admin.foodCate')
                }else{
                    $state.reload()
                }
            }
        })
    }
}
	

})
