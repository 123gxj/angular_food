app.factory('region',function($http){
    var API = '../api/admin/region.php?action='
//    var  region='../api/admin/region.php?action='
    return{
        get: function(id){
			return $http.get( `${API}regionOne&id=${id}` ) // promise
		},
        delete : function(id){
            return $http.delete(`${API}regionDelete&id=${id}`)
        },
        deleteByIds: function(ids){
            console.log(ids)
            return $http.get(`${API}regionDeleteByIds&ids=${ids}`)
        },
        count:function(){
            return $http.get(`${API}regionCount`)
        },
        page:function(limit,offset){
            return $http.get(`${API}region&limit=${limit}&offset=${offset}`)
        },
        save: function(data){
            console.log(data)
           return $http.post(`${API}regionAdd`,data)
        },
        update: function(data, id) { 
            console.log(data);
			return $http.post( `${API}regionAdd&id=${id}`, data )
		}
    };
})