var app = angular.module("app", []);
app.controller("ctrl", function ($scope, $http) {
    var url = "http://localhost:8080/rest/files/images";
    $scope.url = function (filename) {
        return `${url}/${filename}`;
    }

    $scope.list = function () {
        $http.get(url).then(resp => {
            $scope.filenames = resp.data
        }).catch(Error => {
            console.log(Error);
        })
    }

    $scope.upload = function(files){
        var form = new FormData();
        for (let i = 0; i < files.length; i++) {
            form.append("files",files[i]);
        }

        $http.post(url, form, {
            TransformRequest : angular.identity,
            headers : {'Content-Type' : undefined}
        }).then(resp => {
            $scope.filenames.push(...resp.data);
            console.log(resp.data);
        }).catch(Error => {
            console.log(Error);
        })
    }

    $scope.delete = function (filename) {
        $http.delete(`${url}/${filename}`).then(resp => {
            let i = $scope.filenames.findIndex(name => name == filename);
            $scope.filenames.splice(i, 1);
        }).catch(Error => {
            console.log(Error);
        })
    }

    $scope.list();
})