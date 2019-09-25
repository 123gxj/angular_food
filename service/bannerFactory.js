app.factory('banner',function($http){
    var API = '../api/admin/banner.php?action='
    var req = './api/admin/banner.php?action='
    
    return{
        getAll:function(){
            return $http.get(`${req}bannerAll`)
        },
        get:function(id){
            return $http.get(`${API}bannerOne&id=${id}`)
        },
         delete : function(id){
            return $http.delete(`${API}bannerDelete&id=${id}`)
        },
        count:function(){
            return $http.get(`${API}bannerCount`)
        },
        page:function(limit,offset){
            return $http.get(`${API}banner&limit=${limit}&offset=${offset}`)
        },
        query: function(){
            return $http.get(`${req}banner`)
        },
        save: function(data){
            console.log(data)
           return $http.post(`${API}bannerAdd`,data)
        },
        deleteByIds: function(ids){
            console.log(ids)
            return $http.get(`${API}bannerDeleteByIds&ids=${ids}`)
        },
        // deleteByIds: function(ids){
        //     console.log(ids)
        //     return $http.post(`${API}bannerDeleteByIds`,ids)
        // }
        update: function(data, id) { // 添加
            // console.log(data);
			return $http.post( `${API}bannerAdd&id=${id}`, data )
		}
    }
})