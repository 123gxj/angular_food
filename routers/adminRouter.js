app.config(function($httpProvider, $stateProvider, $urlRouterProvider){

	// post 请求参数转为字符串
	$httpProvider.defaults.transformRequest = function(obj) {
			// console.log(obj)
			var arr = []
			for(var i in obj) {
				arr.push(i + "=" +obj[i])
			}
			// console.log(arr.join("&"))
			return arr.join("&") // id=1&fromid=2
	}
	$httpProvider.defaults.headers.post['Content-Type'] = 'application/x-www-form-urlencoded';

	$urlRouterProvider.when('', '/admin')
	$stateProvider
	.state({
		name: 'admin',
		url: '/admin',
		views: {
			'header': {
				templateUrl: '../views/admin/public/header.html'
			},
			'sidebar': {
				templateUrl: '../views/admin/public/sidebar.html',
				// controller: 'adminCtrl'
			},
			'content': {
				templateUrl: '../views/admin/admin-index.html',
				// controller: 'adminCtrl'
			},
			'footer': {
				templateUrl: '../views/admin/public/footer.html'
			}
		}
	})
	.state({
		name: 'admin.food',
		url: '/food',
		views: { 
			'content@': {
				templateUrl: '../views/admin/food.html',
				controller: 'foodListCtrl'
			} 
		}
	})
	.state({
		name: 'admin.food.add',
		url: '/add',
		views: { 
			'content@': {
				templateUrl: '../views/admin/food_add_edit.html',
				controller: 'foodAddCtrl'
			}
		}
	})
	.state({
		name: 'admin.food.edit',
		url: '/edit/:id',
		views: { 
			'content@': {
				templateUrl: '../views/admin/food_add_edit.html',
				controller: 'foodAddCtrl'
			} 
		}
	})
	.state({
		name:'admin.foodCate',
		url:'/foodCate',
		views:{
			'content@':{
				templateUrl:'../views/admin/foodCate.html',
				controller:'foodCate'
			}
		}
	})
	.state({
		name:'admin.foodCate.add',
		url:'/add',
		views:{
			'content@':{
				templateUrl:'../views/admin/foodCate_add_edit.html',
				controller:'foodCate_add',
			}
		}
	})
	.state({
		name:'admin.foodCate.edit',
		url:'/edit/:id',
		views:{
			'content@':{
				templateUrl:'../views/admin/foodCate_add_edit.html',
				controller:'foodCate_add',
			}
		}
	})
	.state({
		name:'admin.region',
		url:'/region',
		views:{
			'content@':{
				templateUrl:'../views/admin/region.html',
				controller:'region',
			}
		}
	})
	.state({
		name:'admin.region.add',
		url:'/add',
		views:{
			'content@':{
				templateUrl:'../views/admin/region_add_edit.html',
				controller:'region_add',
			}
		}
	})
	.state({
		name:'admin.region.edit',
		url:'/edit/:id',
		views:{
			'content@':{
				templateUrl:'../views/admin/region_add_edit.html',
				controller:'region_add',
			}
		}
	})
	.state({
		name:'admin.nav',
		url:'/nav',
		views:{
			'content@':{
				templateUrl:'../views/admin/nav.html',
				controller:'nav',
			}
		}
	})
	.state({
		name:'admin.nav.add',
		url:'/add',
		views:{
			'content@':{
				templateUrl:'../views/admin/nav_add_edit.html',
				controller:'nav_add',
			}
		}
	})
	.state({
		name:'admin.nav.edit',
		url:'/edit/:id',
		views:{
			'content@':{
				templateUrl:'../views/admin/nav_add_edit.html',
				controller:'nav_add',
			}
		}
	})
	.state({
		name:'admin.setting',
		url:'/setting',
		views:{
			'content@':{
				templateUrl:'../views/admin/setting.html',
				controller:'setting',
			}
		}
	})
	.state({
		name:'admin.setting.add',
		url:'/add',
		views:{
			'content@':{
				templateUrl:'../views/admin/setting_add_edit.html',
				controller:'setting_add',
			}
		}
	})
	.state({
		name:'admin.setting.edit',
		url:'/edit/:id',
		views:{
			'content@':{
				templateUrl:'../views/admin/setting_add_edit.html',
				controller:'setting_add',
			}
		}
	})
	.state({
		name:'admin.company',
		url:'/company',
		views:{
			'content@':{
				templateUrl:'../views/admin/company.html',
				controller:'company',
			}
		}
	})
	.state({
		name:'admin.company.add',
		url:'/add',
		views:{
			'content@':{
				templateUrl:'../views/admin/company_add_edit.html',
				controller:'company_add',
			}
		}
	})
	.state({
		name:'admin.company.edit',
		url:'/edit/:id',
		views:{
			'content@':{
				templateUrl:'../views/admin/company_add_edit.html',
				controller:'company_add',
			}
		}
	})
	.state({
		name:'admin.news',
		url:'/news',
		views:{
			'content@':{
				templateUrl:'../views/admin/news.html',
				controller:'news',
			}
		}
	})
	.state({
		name:'admin.news.add',
		url:'/add',
		views:{
			'content@':{
				templateUrl:'../views/admin/news_add_edit.html',
				controller:'news_add',
			}
		}
	})
	.state({
		name:'admin.news.edit',
		url:'/edit/:id',
		views:{
			'content@':{
				templateUrl:'../views/admin/news_add_edit.html',
				controller:'news_add',
			}
		}
	})
	.state({
		name:'admin.shop',
		url:'/shop',
		views:{
			'content@':{
				templateUrl:'../views/admin/shop.html',
				controller:'shop',
			}
		}
	})
	.state({
		name:'admin.shop.add',
		url:'/add',
		views:{
			'content@':{
				templateUrl:'../views/admin/shop_add_edit.html',
				controller:'shop_add',
			}
		}
	})
	.state({
		name:'admin.shop.edit',
		url:'/edit/:id',
		views:{
			'content@':{
				templateUrl:'../views/admin/shop_add_edit.html',
				controller:'shop_add',
			}
		}
	})
	.state({
		name:'admin.friendLink',
		url:'/friendLink',
		views:{
			'content@':{
				templateUrl:'../views/admin/friendLink.html',
				controller:'friendLink',
			}
		}
	})
	.state({
		name:'admin.friendLink.add',
		url:'/add',
		views:{
			'content@':{
				templateUrl:'../views/admin/friendLink_add_edit.html',
				controller:'friendLink_add',
			}
		}
	})
	.state({
		name:'admin.friendLink.edit',
		url:'/edit/:id',
		views:{
			'content@':{
				templateUrl:'../views/admin/friendLink_add_edit.html',
				controller:'friendLink_add',
			}
		}
	})
	.state({
		name:'admin.singlePage',
		url:'/singlePage',
		views:{
			'content@':{
				templateUrl:'../views/admin/singlePage.html',
				controller:'singlePage',
			}
		}
	})
	.state({
		name:'admin.singlePage.add',
		url:'/add',
		views:{
			'content@':{
				templateUrl:'../views/admin/singlePage_add_edit.html',
				controller:'singlePage_add',
			}
		}
	})
	.state({
		name:'admin.singlePage.edit',
		url:'/edit/:id',
		views:{
			'content@':{
				templateUrl:'../views/admin/singlePage_add_edit.html',
				controller:'singlePage_add',
			}
		}
	})
	.state({
		name:'admin.banner',
		url:'/banner',
		views:{
			'content@':{
				templateUrl:'../views/admin/banner.html',
				controller:'banner',
			}
		}
	})
	.state({
		name:'admin.banner.add',
		url:'/add',
		views:{
			'content@':{
				templateUrl:'../views/admin/banner_add_edit.html',
				controller:'banner_add',
			}
		}
	})
	.state({
		name:'admin.banner.edit',
		url:'/edit/:id',
		views:{
			'content@':{
				templateUrl:'../views/admin/banner_add_edit.html',
				controller:'banner_add',
			}
		}
	})
}).run()