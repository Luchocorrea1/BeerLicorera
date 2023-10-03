ngApp.controller('ProductosController', function ($scope, $window, spUtility, helper, $timeout) {
    $scope.Lists = {
        Productos: []
    }
    $scope.init = function(){
        $scope.GetData();
    }
    $scope.GetData = function () {
        var objQuery = spUtility.objQuery();
        objQuery.typeprocess = baseEnum.TypeProcessRequest.getRequest;
        objQuery.onlyUrl = "/api/productos";
        spUtility.Execute(objQuery, function (response) {
            $scope.Lists.Productos = response.data;
        }, function (errorrResponse) {
            console.log(errorrResponse);
        }, null, null, null, null);
    }

    $scope.init();
});