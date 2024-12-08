let host = "http://localhost:8080/rest";

const app = angular.module('app',[]);
app.controller('ctrl', function($scope, $http){
    $scope.form = {};
    $scope.items = {};
    $scope.Reset  = function(){
        $scope.form = {gender : true, country : "USA"};
        $scope.email = null;
    }
    $scope.load_all = function(){
        var url = `${host}/students`;
        $http.get(url).then(resp => {
            $scope.items = resp.data;
            console.log("Success", resp);
        }).catch(Error =>{
            console.log("Error", Error);
        })
    }
    $scope.Edit = function(email){
        var url = `${host}/student/${email}`;
        $http.get(url).then(resp => {
            $scope.form = resp.data;
            $scope.email = email;
            console.log("Success", resp);
        }).catch(Error =>{
            console.log("Error", Error);
        })
    }
    $scope.Update = function(){
        var item = angular.copy($scope.form);
        var url = `${host}/student/${$scope.form.email}`;
        $http.put(url, item).then(resp => {
            var index = $scope.items.findIndex(item => item.email == $scope.form.email);
           $scope.items[index] = resp.data;
            console.log("Success", resp);
        })
        .catch(Error =>{
            console.log("Error", Error);
        })
    }
    $scope.Create = function(){
        var item = angular.copy($scope.form);
        var url = `${host}/student`;
        $http.post(url, item).then(resp => {
            $scope.key = resp.data.name;
            $scope.items[$scope.key] = item
            console.log("Success", resp);
            $scope.load_all();
        }).catch(Error =>{
            console.log("Error", Error);
        })
    }
    $scope.Delete = function(email){
        var url = `${host}/student/${email}`;
        $http.delete(url).then(resp => {
            delete $scope.items[email];
            $scope.Reset();
            $scope.load_all();
            console.log("Success", resp);
        }).catch(Error =>{
            console.log("Error", Error);
        })
    }
    $scope.load_all();
    $scope.Reset();
})