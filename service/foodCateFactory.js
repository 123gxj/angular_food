app.factory('FoodCate',function($http){
    var API = '../api/admin/foodCate.php?action='
//    var  FOODCATE='../api/admin/foodcate.php?action='
    return{
        get: function(id){
			return $http.get( `${API}foodCateOne&id=${id}` ) // promise
		},
        delete : function(id){
            return $http.delete(`${API}foodCateDelete&id=${id}`)
        },
        deleteByIds: function(ids){
            console.log(ids)
            return $http.get(`${API}foodCateDeleteByIds&ids=${ids}`)
        },
        count:function(){
            return $http.get(`${API}foodCateCount`)
        },
        page:function(limit,offset){
            return $http.get(`${API}foodCate&limit=${limit}&offset=${offset}`)
        },
        query: function(){
            return $http.get(`${API}foodQuery`)
        },
        save: function(data){
            console.log(data)
           return $http.post(`${API}foodCateAdd`,data)
        },
        update: function(data, id) { 
            console.log(data);
			return $http.post( `${API}foodCateAdd&id=${id}`, data )
		}
    };
})