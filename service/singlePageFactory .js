app.factory('singlePage',function($http){
    var API = '../api/admin/singlePage.php?action='
    var req = './api/admin/singlePage.php?action='
    
    return{
       showOne:function(id){
            return $http.get(`${req}singlePageOne&id=${id}`)
        },
        get:function(id){
            return $http.get(`${API}singlePageOne&id=${id}`)
        },
        delete : function(id){
            return $http.delete(`${API}singlePageDelete&id=${id}`)
        },
        count:function(){
            return $http.get(`${API}singlePageCount`)
        },
        page:function(limit,offset){
            return $http.get(`${API}singlePage&limit=${limit}&offset=${offset}`)
        },
        query: function(){
            return $http.get(`${API}singlePage`)
        },
        save: function(data){
            console.log(data)
           return $http.post(`${API}singlePageAdd`,data)
        },
        deleteByIds: function(ids){
            console.log(ids)
            return $http.get(`${API}singlePageDeleteByIds&ids=${ids}`)
        },
        // deleteByIds: function(ids){
        //     console.log(ids)
        //     return $http.post(`${API}singlePageDeleteByIds`,ids)
        // }
        update: function(data, id) { // 添加
            // console.log(data);
			return $http.post( `${API}singlePageAdd&id=${id}`, data )
		}
    }
})