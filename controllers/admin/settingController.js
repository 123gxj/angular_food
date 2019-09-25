app.controller('setting',function($scope, setting, Form,$state){
    $scope.maxSize = 4;
    $scope.limit = 3;
    $scope.currentPage =  1
    $scope.totalItems = 0

$scope.page = function(currentPage){
    $scope.currentPage = currentPage || 1
    setting.count().then(function(result){
        if(result.status == 200){
            if(result.data['c'] > 0) { // 有数据
                $scope.totalItems = result.data['c'];
                $scope.offset =  ($scope.currentPage - 1) * $scope.limit;
                setting.page($scope.limit, $scope.offset).then(function(result){
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
    setting.delete(id).then(function(result){
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
     setting.deleteByIds(idsJson).then(function(result){
          console.log(result)
          $state.reload()
      })
  }
})
app.controller('setting_add',function($scope,setting, $state,$stateParams){
    $scope.id = $stateParams.id;
   
  if($stateParams.id){
      setting.get($stateParams.id).then(function(result){
          if(result.status == 200){
              $scope.setting = result.data
            //   console.log($scope.setting)
          }
      })
  }
$scope.save = function(){
  var data  = {
        setting_name : $scope.setting.setting_name,
        setting_value : $scope.setting.setting_value,
    }
   console.log(data);
    if(!$scope.id){
       setting.save(data).then(function(result){
           if(result.status == 200){
            if(result.data.code == 1){
                alert(result.data.msg);
                $state.go('admin.setting')
            }else{
                $state.reload()
            }
           }
       })
    }else{
        setting.update(data,$scope.id).then(function(result){
            if(result.status == 200){
                if(result.data.code == 1){
                    alert(result.data.msg);
                    $state.go('admin.setting')
                }else{
                    $state.reload()
                }
            }
        })
    }
}
	

})
