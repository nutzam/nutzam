var ioc = {

	conf : {
		type : 'com.nutzam.web.NutzamConfig',
		args : [ 'web.properties' ]
	},
	
	dataSource : {
		type :"org.apache.commons.dbcp.BasicDataSource",
        events : {
            depose :"close"
        },
        fields : {
            driverClassName : {java:"$conf.get('db-driver')"},
            url             : {java:"$conf.get('db-url')"},
            username        : {java:"$conf.get('db-username')"},
            password        : {java:"$conf.get('db-password')"},
            initialSize     : 10,
            maxActive       : 100,
            testOnReturn    : true,
            validationQuery : "select 1"
        }
	},
	
	dao : {
		type : 'org.nutz.dao.impl.NutDao',
		args : [{refer:'dataSource'}]
	}

};