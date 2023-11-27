ngApp.controller('HomeController', function ($scope, $window, spUtility, helper, $timeout) {
    $scope.Lists = {
    }
    $scope.init = function(){
    }
    $scope.init();

    $scope.carouselItems = [
        {
            image: '/scripts/Images/carousel-3.jpg',
            subtitle: 'Los mejores precios y marcas',
            title: '¡Garantizados!',
            logo: null
        },
        {
            image: '/scripts/Images/carousel-4.jpg',
            subtitle: 'Los mejores precios y marcas',
            title: '¡Garantizados!',
            logo: '/scripts/Images/logo-1.svg'
        }
        // Agrega más elementos del carrusel si es necesario
    ];

    $scope.currentIndex = 0;

    $scope.nextSlide = function() {
        $scope.currentIndex = ($scope.currentIndex < $scope.carouselItems.length - 1) ? $scope.currentIndex + 1 : 0;
    };

    $scope.prevSlide = function() {
        $scope.currentIndex = ($scope.currentIndex > 0) ? $scope.currentIndex - 1 : $scope.carouselItems.length - 1;
    };
});