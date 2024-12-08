let host = "https://poly-java-6-5c0b4-default-rtdb.firebaseio.com";

const app = angular.module('app',[]);
app.controller('ctrl', function($scope, $http){
    $scope.form = {};
    $scope.items = {};
    $scope.Reset  = function(){
        $scope.form = {gender : true, country : "USA"};
        $scope.key = null;
    }
    $scope.load_all = function(){
        var url = `${host}/student.json`;
        $http.get(url).then(resp => {
            $scope.items = resp.data;
            console.log("Success", resp);
        }).catch(Error =>{
            console.log("Error", Error);
        })
    }
    $scope.Edit = function(key){
        var url = `${host}/student/${key}.json`;
        $http.get(url).then(resp => {
            $scope.form = resp.data;
            $scope.key = key;
            console.log("Success", resp);
        }).catch(Error =>{
            console.log("Error", Error);
        })
    }
    $scope.Update = function(){
        var item = angular.copy($scope.form);
        var url = `${host}/student/${$scope.key}.json`;
        $http.put(url, item).then(resp => {
           $scope.items[$scope.key] = resp.data;
            console.log("Success", resp);
        }).catch(Error =>{
            console.log("Error", Error);
        })
    }
    $scope.Create = function(){
        var item = angular.copy($scope.form);
        var url = `${host}/student.json`;
        $http.post(url, item).then(resp => {
            $scope.key = resp.data.name;
            $scope.items[$scope.key] = item
            console.log("Success", resp);
            $scope.load_all();
        }).catch(Error =>{
            console.log("Error", Error);
        })
    }
    $scope.Delete = function(key){
        var url = `${host}/student/${key}.json`;
        $http.delete(url).then(resp => {
            delete $scope.items[key];
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