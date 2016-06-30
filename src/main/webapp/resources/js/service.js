/**
 * 
 */

'use strict';
 
app.factory('UserService', ['$http', '$q', function($http, $q){
 
    return {
         
            fetchAllPatients: function() {
                    return $http({
                    	 method: 'GET',
                    	 url: 'http://localhost:8080/api/patients',
                    	 headers: {
                    	   'Content-Type': undefined,
                    	   'X-CSRF-Token': csrf_token,
                    	 }
                    	})
                            .then(
                                    function(response){
                                        return response.data;
                                    }, 
                                    function(errResponse){
                                        console.error('Error while fetching users');
                                        return $q.reject(errResponse);
                                    }
                            );
            },
             
            createPatient: function(patient){
                    return $http({
                   	 method: 'POST',
                	 url: 'http://localhost:8080/api/add/patient',
                	 headers: {
                	   'Content-Type': "application/json",
                	   'X-CSRF-Token': csrf_token,
                	 },
                	 data: patient
                	})
                            .then(
                                    function(response){
                                        return response.data;
                                    }, 
                                    function(errResponse){
                                        console.error('Error while creating user');
                                        return $q.reject(errResponse);
                                    }
                            );
            },
             
            updatePatient: function(patient){
                    return $http({
                      	 method: 'PUT',
                    	 url: 'http://localhost:8080/api/edit/patient',
                    	 headers: {
                    	   'Content-Type': "application/json",
                    	   'X-CSRF-Token': csrf_token,
                    	 },
                    	 data: patient
                    	})
                            .then(
                                    function(response){
                                        return response.data;
                                    }, 
                                    function(errResponse){
                                        console.error('Error while updating user');
                                        return $q.reject(errResponse);
                                    }
                            );
            },
             
            deletePatient: function(id){
                    return $http({
                      	 method: 'DELETE',
                    	 url: 'http://localhost:8080/api/delete/patient/'+id,
                    	 headers: {
                    	   'Content-Type': undefined,
                    	   'X-CSRF-Token': csrf_token,
                    	 }
                    	})
                            .then(
                                    function(response){
                                        return response.data;
                                    }, 
                                    function(errResponse){
                                        console.error('Error while deleting user');
                                        return $q.reject(errResponse);
                                    }
                            );
            }
         
    };
 
}]);