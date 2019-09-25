app.factory('nav',function($http){
    var API = '../api/admin/nav.php?action='
     var req = './api/admin/nav.php?action='
    return{
        get: function(id){
			return $http.get( `${API}navOne&id=${id}` ) // promise
        },
        getAll: function(){
			return $http.get( `${req}navAll` ) // promise
		},
        delete : function(id){
            return $http.delete(`${API}navDelete&id=${id}`)
        },
        deleteByIds: function(ids){
            console.log(ids)
            return $http.get(`${API}navDeleteByIds&ids=${ids}`)
        },
        count:function(){
            return $http.get(`${API}navCount`)
        },
        page:function(limit,offset){
            return $http.get(`${API}nav&limit=${limit}&offset=${offset}`)
        },
        save: function(data){
            console.log(data)
           return $http.post(`${API}navAdd`,data)
        },
        update: function(data, id) { 
            console.log(data);
			return $http.post( `${API}navAdd&id=${id}`, data )
		}
    };
})