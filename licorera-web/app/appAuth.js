"use strict";
var ngApp =
    angular.module('appPrueba', [
      "ngRoute","spBaseSvc", 'components', "AC.directives"
    ])
        .constant("IS_APP_WEB", true)
        .constant("STR_SUB_SITIO", "/hr")
        .config(['$compileProvider', function ($compileProvider) {
            $compileProvider.aHrefSanitizationWhitelist(/^\s*(https?|ftp|mailto|javascript):/);
        }])
        .config(function ($routeProvider) {
          $routeProvider
              .when('/Login', {
                  templateUrl: '/forms/Login/Login.html',
                  controller: 'LoginController',
                  label: 'Home'
              })
              .otherwise('/Login');
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