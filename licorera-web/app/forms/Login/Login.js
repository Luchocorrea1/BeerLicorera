ngApp.controller('LoginController', function ($scope, $window, spUtility, helper, $timeout, $interval, AuthService) {

    $scope.Login = function () {
        $scope.contrasenaIncorrecta = false;
        var objQuery = Object.assign(spUtility.objQuery(), {
            onlyUrl: "auth/local",
            typeprocess: baseEnum.TypeProcessRequest.postRequest,
            data: {
                identifier: $scope.Usuario,
                password: $scope.Contrasena,
            }
        });
        spUtility.Execute(objQuery, (data) => {
            AuthService.setToken(data.jwt);
            $window.location.href="/";
        }, (data) => {
            var error = data.error.data.error.message;
            switch (error) {
                case 'Your account has been blocked by an administrator':
                    $scope.UsuarioBloqueado = true;
                    break;
                default:
                    $scope.contrasenaIncorrecta = true;
                    break;
            }
        });
    }

    $scope.showForgotPass = () => {
        $scope.olvidoContrasena = true;
    }

    $scope.hideForgotPass = function () {
        $scope.olvidoContrasena = false;
    };
});