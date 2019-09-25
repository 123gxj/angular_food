 app.config(function($stateProvider, $urlRouterProvider){
	// $urlRouterProvider.otherwise('') // 地址
	$urlRouterProvider.when('','/index') // 地址
    
    $stateProvider
    .state({
		name:'index',
		url:'/index',
        views:{
			"nav":{
				templateUrl:"./views/public/nav.html",
				controller:"nav"
			},
			"banner":{
				templateUrl:"./views/public/banner.html",
				controller:"banner"
			},
			"content":{
				// templateUrl:"./views/index.html",
				// controller:"index"
			},
			"footer":{
				templateUrl:"./views/public/footer.html",
				controller:'footer'
			}
		}
	})
	.state({
		name:'index.index',
		url:'/index',
		views:{
			"content@":{
				templateUrl:"./views/index.html",
				controller:'index'
			}
		}
	})
	.state({
		name:'index.pinpai',
		url:'/pinpai',
		views:{
			"content@":{
				templateUrl:"./views/pinpai.html",
				controller:'pinpai'
			}
		}
	})
	.state({
		name:'index.meishi',
		url:'/meishi',
		views:{
			"content@":{
				templateUrl:"views/meishi.html",
				controller:'meishi'
			}
		}
		
	})
	.state({
		name:'index.shop',
		url:'/shop',
		views:{
			"content@":{
				templateUrl:"views/shop.html",
				controller:'shop'
			}
		}
		
	})
	.state({
		name:'index.news',
		url:'/news',
		views:{
			"content@":{
				templateUrl:"views/news.html",
				controller:'news'
			}
		}
		
	})
	.state({
		name:'index.about',
		url:'/about',
		views:{
			"content@":{
				templateUrl:"views/about-us.html",
				controller:'about'
			}
		}
		
	})
	.state({
		name:'index.meishi.con',
		url:'/meishi.con/:id',
		views:{
			"content@":{
				templateUrl:"views/meishi-con.html",
				controller:'meishiCon'
			}
		}
	})
	.state({
		name:'index.news.con',
		url:'/news.con/:id',
		views:{
			"content@":{
				templateUrl:"views/news-con.html",
				controller:'newsCon'
			}
		}
	})
	.state({
		name:'index.shop.con',
		url:'/shop.con/:id',
		views:{
			"content@":{
				templateUrl:"views/shop-con.html",
				controller:'shopCon'
			}
		}
	})
 }).run()

