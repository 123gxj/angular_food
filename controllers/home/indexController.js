app.controller('nav', function($scope,nav){
    nav.getAll().then(function(result){
          if(result.status == 200){
     $scope.nav = result.data
    }
   }) 

})
app.controller('banner', function($scope,banner){
    banner.getAll().then(function(result){
     if(result.status == 200){
        $scope.banner = result.data
    } 
     })

})

app.controller('footer', function($scope,friendLink){
    friendLink.getAll().then(function(result){
        if(result.status == 200){
            result.data.forEach(value => {
                var k = value.pic.indexOf("asset")
                 value.pic = value.pic.substr(k);
              //    $scope.food.pic = value.pic.substr(k);
             });
       $scope.friendLink = result.data
    }   
     })
 

})
app.controller('index', function($scope,$sce,Food,singlePage,news){
    
   Food.foodtop(8).then(function(result){
     if(result.status == 200){
        result.data.forEach(value => {
          var k = value.pic.indexOf("asset")
           value.pic = value.pic.substr(k);
        //    $scope.food.pic = value.pic.substr(k);
       });
        $scope.food = result.data
        // console.log( $scope.food)
    }  
     })

     singlePage.showOne(1).then(function(result){
         if(result.status == 200){
         result.data.content = $sce.trustAsHtml(result.data.content);
            var k = result.data.pic.indexOf("asset")
            result.data.pic =  result.data.pic.substr(k);
       
          $scope.singlePage = result.data;
          console.log($scope.singlePage)
         }
     })

     news.getAll(8).then(function(result){
         if(result.status == 200){
             $scope.news = result.data
         }
     })

})