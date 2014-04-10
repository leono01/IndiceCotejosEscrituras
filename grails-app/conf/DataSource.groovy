dataSource {
    pooled = true
    username = "indice"
    password = "indice"
    driverClassName = "org.postgresql.Driver"
    dialect="org.hibernate.dialect.PostgreSQLDialect"
    dbCreate = "update"
}
hibernate {
    cache.use_second_level_cache = true
    cache.use_query_cache = false
    cache.region.factory_class = 'net.sf.ehcache.hibernate.EhCacheRegionFactory'
}
// environment specific settings
environments {
    development {
        dataSource {
            // one of 'create', 'create-drop', 'update', 'validate', ''
            dbCreate = "create-drop"
            url = "jdbc:postgresql://192.168.1.114:5432/indice"
        }
    }
    test {
        dataSource {
            dbCreate = "update"
            url = "jdbc:h2:mem:testDb;MVCC=TRUE;LOCK_TIMEOUT=10000"
        }
    }
    production {
        dataSource {
            dbCreate = "update"
            url = "jdbc:postgresql://192.168.1.114:5432/indice" 
            pooled = true
            properties {
               maxActive = -1
               minEvictableIdleTimeMillis=1800000
               timeBetweenEvictionRunsMillis=1800000
               numTestsPerEvictionRun=3
               testOnBorrow=true
               testWhileIdle=true
               testOnReturn=true
               validationQuery="SELECT 1"
            }
        }
    }
}
