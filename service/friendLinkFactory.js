app.factory('friendLink',function($http){
    var API = '../api/admin/friendLink.php?action='
    var req = './api/admin/friendLink.php?action='
    
    return{
        getAll:function(){
            return $http.get(`${req}friendLinkAll`)
        },
        get:function(id){
            return $http.get(`${API}friendLinkOne&id=${id}`)
        },
        delete : function(id){
            return $http.delete(`${API}friendLinkDelete&id=${id}`)
        },
        count:function(){
            return $http.get(`${API}friendLinkCount`)
        },
        page:function(limit,offset){
            return $http.get(`${API}friendLink&limit=${limit}&offset=${offset}`)
        },
        query: function(){
            return $http.get(`${API}friendLink`)
        },
        save: function(data){
            console.log(data)
           return $http.post(`${API}friendLinkAdd`,data)
        },
        deleteByIds: function(ids){
            console.log(ids)
            return $http.get(`${API}friendLinkDeleteByIds&ids=${ids}`)
        },
        // deleteByIds: function(ids){
        //     console.log(ids)
        //     return $http.post(`${API}friendLinkDeleteByIds`,ids)
        // }
        update: function(data, id) { // 添加
            // console.log(data);
			return $http.post( `${API}friendLinkAdd&id=${id}`, data )
		}
    }
})