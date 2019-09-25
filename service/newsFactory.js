app.factory('news',function($http){
    var API = '../api/admin/news.php?action='
    var req = './api/admin/news.php?action='
    
    return{
        getAll:function(limit){
            return $http.get(`${req}news&limit=${limit}`)
        },
        showCount:function(){
            return $http.get(`${req}newsCount`)
        },
       showOne:function(id){
            return $http.get(`${req}newsShowOne&id=${id}`)
        },
        showPage:function(limit,offset){
            return $http.get(`${req}news&limit=${limit}&offset=${offset}`)
        },
        get:function(id){
            return $http.get(`${API}newsOne&id=${id}`)
        },
        delete : function(id){
            return $http.delete(`${API}newsDelete&id=${id}`)
        },
        count:function(){
            return $http.get(`${API}newsCount`)
        },
        page:function(limit,offset){
            return $http.get(`${API}news&limit=${limit}&offset=${offset}`)
        },
        query: function(){
            return $http.get(`${API}news`)
        },
        save: function(data){
            console.log(data)
           return $http.post(`${API}newsAdd`,data)
        },
        deleteByIds: function(ids){
            console.log(ids)
            return $http.get(`${API}newsDeleteByIds&ids=${ids}`)
        },
        // deleteByIds: function(ids){
        //     console.log(ids)
        //     return $http.post(`${API}newsDeleteByIds`,ids)
        // }
        update: function(data, id) { // 添加
            // console.log(data);
			return $http.post( `${API}newsAdd&id=${id}`, data )
		}
    }
})