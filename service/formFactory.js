app.factory('Form',function(){
     return{
        checkedAction : function($scope,cl){
            $scope.sltAll = function(){
                // console('slt')
                $(cl).prop('checked',true)
            }
            $scope.cancel = function(){
                // console('cansel')
                $(cl).prop('checked',false)
            }
            $scope.reverse = function(){
                console.log('rev')
                $(cl).prop('checked',function(k,v){
                    return !v;
                })
            }
        },
        checkedValToJson: function(cl){
         // 数组好操作
			var idsArr = []
			$.each($(cl),function(i,v){
                if($(v).prop('checked')){
                    
                    idsArr.push($(v).val())
                }
            })
            
            idsStr = idsArr.join(',') 
           
            var idsObj = { ids: idsStr }
            // idsJson = angular.toJson(idsObj)
            // 转为json传参请求后台API
            
            idsJson = JSON.stringify(idsObj)
            return idsJson;
            // console.log(idsJson)//{"ids":"17,16"}json
        }
     }
})