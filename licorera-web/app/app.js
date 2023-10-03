// 'use strict';

// // Declare app level module which depends on views, and core components
// angular.module('myApp', [
//   'ngRoute',
//   'myApp.view1',
//   'myApp.view2',
//   'myApp.version'
// ]).
// config(['$locationProvider', '$routeProvider', function($locationProvider, $routeProvider) {
//   $locationProvider.hashPrefix('!');

//   $routeProvider.otherwise({redirectTo: '/view1'});
// }]);

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
              .otherwise('/Productos');
      });

