'use strict';
 
app.controller('patientController', ['$scope', 'UserService', function($scope, UserService) {
          var self = this;
          self.user={uname:'',password:'',role:'',fname:'',lname:'',email:'',address:''};
          self.users=[];
               
          self.fetchAllPatients = function(){
              UserService.fetchAllPatients()
                  .then(
                               function(d) {
                                    self.users = d;
                               },
                                function(errResponse){
                                    console.error('Error while fetching Currencies');
                                }
                       );
          };
            
          self.createPatient = function(user){
              UserService.createPatient(user)
                      .then(
                      self.fetchAllPatients, 
                              function(errResponse){
                                   console.error('Error while creating User.');
                              } 
                  );
          };
 
         self.updatePatient = function(patient){
              UserService.updatePatient(patient)
                      .then(
                              self.fetchAllPatients, 
                              function(errResponse){
                                   console.error('Error while updating User.');
                              } 
                  );
          };
 
         self.deletePatient = function(name){
              UserService.deletePatient(name)
                      .then(
                              self.fetchAllPatients, 
                              function(errResponse){
                                   console.error('Error while deleting User.');
                              } 
                  );
          };
 
          self.fetchAllPatients();
 
          self.submit = function() {
        	  var index=-1;
        	  for(var i = 0, len = self.users.length; i < len; i++){
        		  if(self.users[i].uname == self.user.uname){
        			  index = i;
        			  break;
        		  }
        	  }
        	  if(index>-1){
        		  self.updatePatient(self.user);
        		  console.log('User updated with name ', self.user.uname);
        	  }else{
        		  self.createPatient(self.user);
        		  console.log('User create with name ', self.user.uname)
        	  }
              self.reset();
          };
               
          self.edit = function(uname){
              console.log('id to be edited', uname);
              for(var i = 0; i < self.users.length; i++){
                  if(self.users[i].uname === uname) {
                     self.user = angular.copy(self.users[i]);
                     break;
                  }
              }
          };
               
          self.remove = function(id){
              console.log('username to be deleted', id);
              if(self.user.uname === id) {//clean form if the user to be deleted is shown there.
                 self.reset();
              }
              self.deletePatient(id);
          };
 
           
          self.reset = function(){
              self.user={uname:'',password:'',role:'',fname:'',lname:'',email:'',address:''};
              $scope.myForm.$setPristine(); //reset Form
          };
          
          self.check = function(){
        	  var index=-1;
        	  for(var i = 0, len = self.users.length; i < len; i++){
        		  if(self.users[i].uname == self.user.uname){
        			  index = i;
        			  break;
        		  }
        	  }
        	  if(index > -1){
        		  return "Update";
        	  }else{
        		  return "Add";
        	  }
          }
 
      	$scope.currentPage = 0;
    	$scope.rowLimit=6;
    	$scope.numberOfPages=function(){
            return Math.ceil(self.users.length/$scope.rowLimit);
        };
      }]);

app.filter('startFrom', function() {
    return function(input, start) {
        start = +start; //parse to int
        return input.slice(start);
    }
});