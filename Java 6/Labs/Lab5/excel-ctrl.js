var app = angular.module("app", []);
app.controller("ctrl", function ($scope, $http) {
    $scope.import = function (files) {
        var reader = new FileReader();
        reader.onloadend = async () => {
            var workbook = new ExcelJS.Workbook();
            await workbook.xlsx.load(reader.result);
            const worksheet = workbook.getWorksheet("Sheet1")
            worksheet.eachRow((row, index) => {
                if (index > 1) {
                    let student = {
                        email: row.getCell(1).text,
                        fullname: row.getCell(2).text,
                        marks: +row.getCell(3).value,
                        gender: true && row.getCell(4).value,
                        country: row.getCell(5).text,
                    }
                    var url = `http://localhost:8080/rest/student`;
                    $http.post(url, student).then(resp => {
                        console.log("Success", resp);
                    }).catch(Error => {
                        console.log("Error", Error);
                    })
                }
            });
        }

        reader.readAsArrayBuffer(files[0]);
    };

});
