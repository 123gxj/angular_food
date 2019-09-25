app.factory('company',function($http){
    var API = '../api/admin/company.php?action='
    var req = './api/admin/company.php?action='
    
    return{
        get:function(id){
            return $http.get(`${API}companyOne&id=${id}`)
        },
        showOne:function(id){
            return $http.get(`${req}companyOne&id=${id}`)
        },
        showAll:function(){
            return $http.get(`${req}companyAll`)
        },
        delete : function(id){
            return $http.delete(`${API}companyDelete&id=${id}`)
        },
        count:function(){
            return $http.get(`${API}companyCount`)
        },
        page:function(limit,offset){
            return $http.get(`${API}company&limit=${limit}&offset=${offset}`)
        },
        query: function(){
            return $http.get(`${API}company`)
        },
        save: function(data){
            console.log(data)
           return $http.post(`${API}companyAdd`,data)
        },
        deleteByIds: function(ids){
            console.log(ids)
            return $http.get(`${API}companyDeleteByIds&ids=${ids}`)
        },
        // deleteByIds: function(ids){
        //     console.log(ids)
        //     return $http.post(`${API}companyDeleteByIds`,ids)
        // }
        update: function(data, id) { // 添加
            // console.log(data);
			return $http.post( `${API}companyAdd&id=${id}`, data )
		}
    }
})