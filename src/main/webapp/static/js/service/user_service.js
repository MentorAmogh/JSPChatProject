'use strict';

angular.module('myApp').factory('UserService', ['$http', '$q', function($http, $q){

   
    var REST_SERVICE_URI = 'http://localhost:8080/collaboration/user';

    var factory = {
        fetchAllUsers: fetchAllUsers,
        createUser: createUser,
        updateUser:updateUser,
        deleteUser:deleteUser
    };

    return factory;

    function fetchAllUsers() {
        var deferred = $q.defer();
        $http.get(REST_SERVICE_URI)
            .then(
            function (response) {
                deferred.resolve(response.data);
            },
            function(errResponse){
                console.error('Error while fetching Users');
                deferred.reject(errResponse);
            }
        );
        return deferred.promise;
    }

    function createUser(user) {
        var deferred = $q.defer();
        $http.post(REST_SERVICE_URI, user)
            .then(
            function (response) {
                deferred.resolve(response.data);
            },
            function(errResponse){
                console.error('Error while creating User');
                deferred.reject(errResponse);
            }
        );
        return deferred.promise;
    }


    function updateUser(user, fname) {
        var deferred = $q.defer();
        $http.put(REST_SERVICE_URI+fname, user)
            .then(
            function (response) {
                deferred.resolve(response.data);
            },
            function(errResponse){
                console.error('Error while updating User');
                deferred.reject(errResponse);
            }
        );
        return deferred.promise;
    }

    
    function deleteUser(username) {
        var deferred = $q.defer();
        $http.delete(REST_SERVICE_URI+"/"+username)
        .then(
            function(response){
            	deferred.resolve(response.data);
            }, 
            function(errResponse){
            	 console.error('Error while deleting User');
                 deferred.reject(errResponse);
            }
         );
        return deferred.promise;
    }
  
    var promise = asyncGreet('Vinay Congo..!!');
    promise.then(function(greeting) {
      alert('Success: ' + greeting);
    }, function(reason) {
      alert('Failed: ' + reason);
    }, function(update) {
      alert('Got notification: ' + update);
    });
    
    
}]);
