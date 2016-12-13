'use strict';

angular.module('myApp').controller('UserController', ['$scope', 'UserService', function($scope, UserService) {
    var self = this;
    self.user={fname:'',username:'',address:'',password:'',email:'',phno:''};
    self.users=[];

    self.submit = submit;
    self.edit = edit;
    self.remove = remove;
    self.reset = reset
    self.tonext=tonext;


    fetchAllUsers();

    function fetchAllUsers(){
        UserService.fetchAllUsers()
            .then(
            function(d) {
                self.users = d;
            },
            function(errResponse){
                console.error('Error while fetching Users');
            }
        );
    }

    function createUser(user){
    	//UserService.saveUser(user)
        UserService.createUser(user)
            .then(fetchAllUsers,
            function(errResponse){
                console.error('Error while creating User');
            }
        );
    }

    function updateUser(user, fname){
        UserService.updateUser(user, fname)
            .then(
            fetchAllUsers,
            function(errResponse){
                console.error('Error while updating User');
            }
        );
    }

    function deleteUser(username){
        UserService.deleteUserById(username)
            .then(
            fetchAllUsers,
            function(errResponse){
                console.error('Error while deleting User');
            }
        );
    }

    function submit() {
        if(self.user.fname != 0){
            console.log('Saving New User', self.user);
            createUser(self.user);
        }else{
            updateUser(self.user, self.user.fname);
            console.log('User updated with id ', self.user.name);
        }
        reset();
    }

    function edit(fname){
        console.log('name to be edited', name);
        for(var i = 0; i < self.users.length; i++){
            if(self.users[i].name === name) {
                self.user = angular.copy(self.users[i]);
                break;
            }
        }
    }

    function remove(username){
        console.log('name to be deleted', username);
        if(self.user.username === username) {//clean form if the user to be deleted is shown there.
            reset();
        }
        deleteUser(username);
    }

    function tonext(){
    	
    	  self.user={fname:'',username:'',address:'',password:'',email:'',phno:''};
          $scope.myForm.$setPristine(); //reset only Form
    }
    function reset(){
        self.user={fname:'',username:'',address:'',password:'',email:'',phno:''};
        $scope.myForm.$setPristine(); //reset only Form
    }

}]);
