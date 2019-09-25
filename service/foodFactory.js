app.factory('Food',function($http){
    var API = '../api/admin/food.php?action='
    var req = './api/admin/food.php?action='
    
    return{
       foodtop:function(limit){
            return $http.get(`${req}foodtop&limit=${limit}`)
        },
        // getAllNorecom:function(limit){
        //     return $http.get(`${req}foodNorecom&limit=${limit}`)
        // },
        showOne:function(id){
            return $http.get(`${req}foodOne&id=${id}`)
        },
        showCount:function(cate_name){
            return $http.get(`${req}showCount&cate_name=${cate_name}`)
        },
        showPage:function(limit,offset,cate_name){
            return $http.get(`${req}showFood&limit=${limit}&offset=${offset}&cate_name=${cate_name}`)
        },
        get:function(id){
            return $http.get(`${API}foodOne&id=${id}`)
        },
        delete : function(id){
            return $http.delete(`${API}foodDelete&id=${id}`)
        },
        count:function(){
            return $http.get(`${API}count`)
        },
        page:function(limit,offset){
            return $http.get(`${API}food&limit=${limit}&offset=${offset}`)
        },
        query: function(){
            return $http.get(`${API}food`)
        },
        save: function(data){
            console.log(data)
           return $http.post(`${API}foodAdd`,data)
        },
        deleteByIds: function(ids){
            console.log(ids)
            return $http.get(`${API}foodDeleteByIds&ids=${ids}`)
        },
        // deleteByIds: function(ids){
        //     console.log(ids)
        //     return $http.post(`${API}foodDeleteByIds`,ids)
        // }
        update: function(data, id) { // 添加
            // console.log(data);
			return $http.post( `${API}foodAdd&id=${id}`, data )
		}
    }
})
