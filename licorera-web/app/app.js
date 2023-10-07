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
              .otherwise('/Home');
      });

