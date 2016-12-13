<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
  <head>  
    <title>Friends Reunited</title>  
    <style>
      .username.ng-valid {
          background-color: lightgreen;
      }
      .username.ng-dirty.ng-invalid-required {
          background-color: red;
      }
      .username.ng-dirty.ng-invalid-minlength {
          background-color: yellow;
      }

      .email.ng-valid {
          background-color: lightgreen;
      }
      .email.ng-dirty.ng-invalid-required {
          background-color: red;
      }
      .email.ng-dirty.ng-invalid-email {
          background-color: yellow;
      }
    </style>
     <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
     <link href="<c:url value='/static/css/app.css' />" rel="stylesheet"></link>
  </head>
  <body ng-app="myApp" class="ng-cloak">
      <div class="generic-container" ng-controller="UserController as ctrl">
          <div class="panel panel-default">
              <div class="panel-heading"><span class="lead">User Registration Form </span></div>
              <div class="formcontainer">
                  
                  
                  <form ng-submit="ctrl.submit()" name="myForm" class="form-horizontal">
                      
                       <div class="row">
                          <div class="form-group col-md-12">
                              <label class="col-md-2 control-lable" for="file">Id name</label>
                              <!-- id as fname -->
                              <div class="col-md-7">
                                  <input type="text" ng-model="ctrl.user.fname" class="form-control input-sm" placeholder="Enter your login Name."/>
                              </div>
                          </div>
                      </div>
                      
                      
                      <div class="row">
                          <div class="form-group col-md-12">
                              <label class="col-md-2 control-lable" for="file">Name</label>
                              <!-- userName -->
                              <div class="col-md-7">
			                     <input type="text" ng-model="ctrl.user.username" name="uname" class="username form-control input-sm" placeholder="Enter your name" required ng-minlength="3"/>
                                  <div class="has-error" ng-show="myForm.$dirty">
                                      <span ng-show="myForm.uname.$error.required">This is a required field</span>
                                      <span ng-show="myForm.uname.$error.minlength">Minimum length required is 3</span>
                                      <span ng-show="myForm.uname.$invalid">This field is invalid </span>
                                  </div>
                              </div>
                          </div>
                      </div>
                      
                      
                        <div class="row">
                          <div class="form-group col-md-12">
                              <label class="col-md-2 control-lable" for="file">Address</label>
                              <!-- Address -->
                              <div class="col-md-7">
                                  <input type="text" ng-model="ctrl.user.address" class="form-control input-sm" placeholder="Enter your Address."/>
                              </div>
                          </div>
                      </div>
                      
                         <div class="row">
                          <div class="form-group col-md-12">
                              <label class="col-md-2 control-lable" for="file">Password</label>
                              <!-- password -->
                              <div class="col-md-7">
                                  <input type="password" ng-model="ctrl.user.password" class="form-control input-sm" placeholder="Enter your Password"/>
                              </div>
                          </div>
                      </div>

                      <div class="row">
                      <!-- Email -->
                          <div class="form-group col-md-12">
                              <label class="col-md-2 control-lable" for="file">Email</label>
                              <div class="col-md-7">
                                  <input type="email" ng-model="ctrl.user.email" name="email" class="email form-control input-sm" placeholder="Enter your Email" required/>
                                  <div class="has-error" ng-show="myForm.$dirty">
                                      <span ng-show="myForm.email.$error.required">This is a required field</span>
                                      <span ng-show="myForm.email.$invalid">This field is invalid </span>
                                  </div>
                              </div>
                          </div>
                      </div>
                      
                      <div class="row">
                          <div class="form-group col-md-12">
                              <label class="col-md-2 control-lable" for="file">Phone Number</label>
                              <!-- Phone Number -->
                              <div class="col-md-7">
                                  <input type="text" ng-model="ctrl.user.phno" class="form-control input-sm" placeholder="Enter your Address."/>
                              </div>
                          </div>
                      </div>

                      <div class="row">
                      <!-- -->
                          <div class="form-actions floatRight">
                          <!-- if wants to change from add to update 
                          	value="{{!ctrl.user.id ? 'Add' : 'Update'}}"
                           -->
                              <input type="submit"  value="Submit" class="btn btn-primary btn-sm" ng-disabled="myForm.$invalid">
                              <button type="button" ng-click="ctrl.reset()" class="btn btn-warning btn-sm" ng-disabled="myForm.$pristine">Reset Form</button>
                          </div>
                      </div>
                  </form>                  
                    <button type="button" ng-click="ctrl.tonext()" class="btn btn-success custom-width">Next Page</button>
              </div>
          </div>
          <div class="panel panel-default">
                <!-- Default panel contents -->
              <div class="SearchData" >Search User<input type="text" plaeholder="search friend" ng-model="searchText">
              
              </div>
              <br>
              <br>
              
              <div class="panel-heading"><span class="lead">List of Users </span></div>
              <div class="tablecontainer">
              
              
                  <table class="table table-hover">
                      <thead>
                          <tr>
                              <th>UserId.</th>
                              <th>Name</th>
                              <th>Address</th>
                              <th>Password</th>
                              <th>Email</th>
                              <th>Phone Number</th>
                              <th width="20%"></th>
                          </tr>
                      </thead>
                      <tbody>
                          <tr ng-repeat="u in ctrl.users | filter:searchText">
                              <td><span ng-bind="u.fname"></span></td>
                              <td><span ng-bind="u.username"></span></td>
                              <td><span ng-bind="u.address"></span></td>
                              <td><span ng-bind="u.password"></span></td>
                              <td><span ng-bind="u.email"></span></td>
                              <td><span ng-bind="u.phno"></span></td>
                              <td>
                              <button type="button" ng-click="ctrl.edit(u.username)" class="btn btn-success custom-width">Edit</button> 
                               <button type="button" ng-click="ctrl.remove(u.username)" class="btn btn-danger custom-width">Remove</button>
                              </td>
                          </tr>
                      </tbody>
                  </table>
              </div>
          </div>
      </div>
      
      <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.4/angular.js"></script>
      <script src="<c:url value='/static/js/app.js' />"></script>
      <script src="<c:url value='/static/js/service/user_service.js' />"></script>
      <script src="<c:url value='/static/js/controller/user_controller.js' />"></script>
  </body>
</html>