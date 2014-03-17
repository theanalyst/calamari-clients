/*global define*/
define(['lodash'], function(_) {
    'use strict';
    var PoolService = function(ClusterService) {
        var Service = function() {
            this.restangular = ClusterService;
        };
        Service.prototype = _.extend(Service.prototype, {
            getList: function() {
                return this.restangular.cluster().all('pool').getList().then(function(pools) {
                    return pools;
                });
            },
            get: function(id) {
                id = _.isString(id) ? parseInt(id, 10) : id;
                return this.restangular.cluster().one('pool', id).get().then(function(pool) {
                    return pool;
                });
            },
            remove: function(id) {
                id = _.isString(id) ? parseInt(id, 10) : id;
                return this.restangular.clusterFull().one('pool', id).remove();
            },
            patch: function(id, update) {
                id = _.isString(id) ? parseInt(id, 10) : id;
                return this.restangular.clusterFull().one('pool', id).patch(update);
            },
            create: function(pool) {
                return this.restangular.clusterFull().all('pool').post(pool);
            },
            defaults: function() {
                return this.restangular.cluster().one('pool').get({
                    defaults: ''
                });
            }
        });
        return new Service();
    };
    return ['ClusterService', PoolService];
});