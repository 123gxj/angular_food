app.factory('setting',function($http){
    var API = '../api/admin/setting.php?action='
//    var  setting='../api/admin/setting.php?action='
    return{
        get: function(id){
			return $http.get( `${API}settingOne&id=${id}` ) // promise
		},
        delete : function(id){
            return $http.delete(`${API}settingDelete&id=${id}`)
        },
        deleteByIds: function(ids){
            console.log(ids)
            return $http.get(`${API}settingDeleteByIds&ids=${ids}`)
        },
        count:function(){
            return $http.get(`${API}settingCount`)
        },
        page:function(limit,offset){
            return $http.get(`${API}setting&limit=${limit}&offset=${offset}`)
        },
        save: function(data){
            console.log(data)
           return $http.post(`${API}settingAdd`,data)
        },
        update: function(data, id) { 
            console.log(data);
			return $http.post( `${API}settingAdd&id=${id}`, data )
		}
    };
})