app.controller('nav',function($scope, nav, Form,$state){
    $scope.maxSize = 4;
    $scope.limit = 3;
    $scope.currentPage =  1
    $scope.totalItems = 0

$scope.page = function(currentPage){
    $scope.currentPage = currentPage || 1
    nav.count().then(function(result){
        if(result.status == 200){
            if(result.data['c'] > 0) { // 有数据
                $scope.totalItems = result.data['c'];
                $scope.offset =  ($scope.currentPage - 1) * $scope.limit;
                nav.page($scope.limit, $scope.offset).then(function(result){
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
    nav.delete(id).then(function(result){
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
     nav.deleteByIds(idsJson).then(function(result){
          console.log(result)
          $state.reload()
      })
  }
})
app.controller('nav_add',function($scope,nav, $state,$stateParams){
    $scope.id = $stateParams.id;
   
  if($stateParams.id){
      nav.get($stateParams.id).then(function(result){
          if(result.status == 200){
              $scope.nav = result.data
            //   console.log($scope.nav)
          }
      })
  }
$scope.save = function(){
  var data  = {
        title : $scope.nav.title,
        link : $scope.nav.link,
        order_num : $scope.nav.order_num
    }
   console.log(data);
    if(!$scope.id){
       nav.save(data).then(function(result){
           if(result.status == 200){
            if(result.data.code == 1){
                alert(result.data.msg);
                $state.go('admin.nav')
            }else{
                $state.reload()
            }
           }
       })
    }else{
        nav.update(data,$scope.id).then(function(result){
            if(result.status == 200){
                if(result.data.code == 1){
                    alert(result.data.msg);
                    $state.go('admin.nav')
                }else{
                    $state.reload()
                }
            }
        })
    }
}
	

})
