"use strict";
var ngApp =
    angular.module('appPrueba', [
      "ngRoute",'ngAnimate',"spBaseSvc", 'components', "AC.directives", "datatables", "datatables.buttons"
    ])
        .constant("IS_APP_WEB", true)
        .constant("STR_SUB_SITIO", "/hr")
        .config(['$compileProvider', function ($compileProvider) {
            $compileProvider.aHrefSanitizationWhitelist(/^\s*(https?|ftp|mailto|javascript):/);
        }])
        .config(function ($routeProvider) {
          $routeProvider
              .when('/Productos', {
                  templateUrl: '/forms/productos/productos.html',
                  controller: 'ProductosController',
                  label: 'Productos'
              })
              .when('/Home', {
                  templateUrl: '/forms/Home/Home.html',
                  controller: 'HomeController',
                  label: 'Home'
              })
              .otherwise('/Productos');
      });



      ngApp.factory('AuthService', ['$window', function ($window) {
        var authService = {};
    
        authService.setToken = function (token) {
            $window.localStorage.setItem('jwtToken', token);
        };
    
        authService.getToken = function () {
            return $window.localStorage.getItem('jwtToken');
        };
    
        authService.isAuthenticated = function () {
            var token = authService.getToken();
    
            // Verificar si el token existe y no ha expirado
            return token && !isTokenExpired(token);
        };
    
        // Función para verificar si el token ha expirado
        function isTokenExpired(token) {
            // Implementa la lógica para verificar la expiración del token
            // Puedes utilizar bibliotecas como 'jwt-decode' para decodificar el token y obtener su información
            // y luego comparar la fecha de expiración con la fecha actual.
            // Aquí hay un ejemplo simple, pero deberías adaptarlo según tus necesidades.
            var decodedToken = jwt_decode(token);
            return decodedToken.exp < Date.now() / 1000;
        }
    
        return authService;
    }]);
    

    // ngApp.run(['$rootScope', '$location', 'AuthService', function ($rootScope, $location, AuthService) {
    //     $rootScope.$on('$routeChangeStart', function () {
    //         // Verificar si el usuario está autenticado al cambiar de ruta
    //         if (!AuthService.isAuthenticated()) {
    //             // Redirigir a la página de inicio de sesión si no está autenticado
    //             window.location.href = '/Auth';

    //         }
    //     });
    // }]);

    ngApp.run(['$rootScope', '$location', 'AuthService', '$q', function ($rootScope, $location, AuthService, $q) {
        $rootScope.$on('$routeChangeStart', function (event, next, current) {
            // Verificar si el usuario está autenticado al cambiar de ruta
            var deferred = $q.defer();
            if (!AuthService.isAuthenticated()) {
                // No está autenticado, redirigir a la página de inicio de sesión
                window.location.href = '/Auth';
                deferred.reject();
            } else {
                // Está autenticado, permitir el cambio de ruta
                deferred.resolve();
            }
            return deferred.promise;
        });
    }]);