app.controller('region',function($scope, region, Form,$state){
    $scope.maxSize = 4;
    $scope.limit = 3;
    $scope.currentPage =  1
    $scope.totalItems = 0

$scope.page = function(currentPage){
    $scope.currentPage = currentPage || 1
    region.count().then(function(result){
        if(result.status == 200){
            if(result.data['c'] > 0) { // 有数据
                $scope.totalItems = result.data['c'];
                $scope.offset =  ($scope.currentPage - 1) * $scope.limit;
                region.page($scope.limit, $scope.offset).then(function(result){
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
    region.delete(id).then(function(result){
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
     region.deleteByIds(idsJson).then(function(result){
          console.log(result)
          $state.reload()
      })
  }
})
app.controller('region_add',function($scope,region, $state,$stateParams){
    $scope.id = $stateParams.id;
   
  if($stateParams.id){
      region.get($stateParams.id).then(function(result){
          if(result.status == 200){
              $scope.region = result.data
            //   console.log($scope.region)
          }
      })
  }
$scope.save = function(){
  var data  = {
        region_name : $scope.region.region_name,
        order_num : $scope.region.order_num
    }
   console.log(data);
    if(!$scope.id){
       region.save(data).then(function(result){
           if(result.status == 200){
            if(result.data.code == 1){
                alert(result.data.msg);
                $state.go('admin.region')
            }else{
                $state.reload()
            }
           }
       })
    }else{
        region.update(data,$scope.id).then(function(result){
            if(result.status == 200){
                if(result.data.code == 1){
                    alert(result.data.msg);
                    $state.go('admin.region')
                }else{
                    $state.reload()
                }
            }
        })
    }
}
	

})
