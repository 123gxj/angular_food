app.factory('shop',function($http){
    var API = '../api/admin/shop.php?action='
    var req = './api/admin/shop.php?action='
    
    
    return{
        showAll:function(region_id,limit){
            return $http.get(`${req}shop_region&region_id=${region_id}&limit=${limit}`)
        },
        showOne:function(id){
            return $http.get(`${req}shopOne&id=${id}`)
        },
        get:function(id){
            return $http.get(`${API}shopOne&id=${id}`)
        },
        showCount:function(region_id){
            return $http.get(`${req}shopCount&region_id=${region_id}`)
        },
        showPage:function(limit,offset,region_id){
            return $http.get(`${req}shop&limit=${limit}&offset=${offset}&region_id=${region_id}`)
        },
        delete : function(id){
            return $http.delete(`${API}shopDelete&id=${id}`)
        },
        count:function(){
            return $http.get(`${API}shopCount`)
        },
        page:function(limit,offset){
            return $http.get(`${API}shop&limit=${limit}&offset=${offset}`)
        },
        query: function(){
            return $http.get(`${API}shop`)
        },
        save: function(data){
            console.log(data)
           return $http.post(`${API}shopAdd`,data)
        },
        deleteByIds: function(ids){
            console.log(ids)
            return $http.get(`${API}shopDeleteByIds&ids=${ids}`)
        },
        // deleteByIds: function(ids){
        //     console.log(ids)
        //     return $http.post(`${API}shopDeleteByIds`,ids)
        // }
        update: function(data, id) { // 添加
            // console.log(data);
			return $http.post( `${API}shopAdd&id=${id}`, data )
		}
    }
})