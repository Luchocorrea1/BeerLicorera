ngApp.controller('HomeController', function ($scope, $window, spUtility, helper, $timeout, $interval) {
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

     // Configura el cambio automático cada 5000 milisegundos (5 segundos)
     var autoChange = $interval(function () {
        $scope.nextSlide();
    }, 4000);

    $scope.$on('$destroy', function () {
        $interval.cancel(autoChange);
    });

    $scope.products = [
        {
            name: 'Litro Whisky Jack Daniel’s 750 ml',
            category: 'Whisky',
            price: 135000,
            image: 'https://www.tulicorera.online/wp-content/uploads/2019/09/34.LT-JACK-DANIEL-300x300.jpg',
            link: 'https://www.tulicorera.online/producto/lt-jack-daniels/'
        },
        {
            name: 'Botella de Ron Barceló Imperial 750 ml',
            category: 'Ron',
            price: 110000,
            image: 'https://www.tulicorera.online/wp-content/uploads/2019/08/10.barcelo-imperial-300x300.jpg',
            link: 'https://www.tulicorera.online/producto/barcelo-imperial/'
        },
        {
            name: 'Botella de Vodka Absolut 750 ml',
            category: 'Vodka',
            price: 95000,
            image: 'https://www.tulicorera.online/wp-content/uploads/2019/09/29.absolut-vodka-300x300.jpg',
            link: 'https://www.tulicorera.online/producto/absolut-vodka/'
        },
        {
            name: 'Botella de Tequila José Cuervo Especial 750 ml',
            category: 'Tequila',
            price: 85000,
            image: 'https://www.tulicorera.online/wp-content/uploads/2019/08/11.jose-cuervo-especial-300x300.jpg',
            link: 'https://www.tulicorera.online/producto/jose-cuervo-especial/'
        },
        {
            name: 'Botella de Champagne Moët & Chandon Brut Impérial 750 ml',
            category: 'Champagne',
            price: 300000,
            image: 'https://www.tulicorera.online/wp-content/uploads/2019/08/19.moet-chandon-300x300.jpg',
            link: 'https://www.tulicorera.online/producto/moet-chandon-brut-imperial/'
        },
        {
            name: 'Botella de Whisky Chivas Regal 12 años 750 ml',
            category: 'Whisky',
            price: 155000,
            image: 'https://www.tulicorera.online/wp-content/uploads/2019/09/22.chivas-regal-12-anos-300x300.jpg',
            link: 'https://www.tulicorera.online/producto/chivas-regal-12-anos/'
        },
        {
            name: 'Botella de Gin Bombay Sapphire 750 ml',
            category: 'Gin',
            price: 100000,
            image: 'https://www.tulicorera.online/wp-content/uploads/2019/08/27.bombay-sapphire-300x300.jpg',
            link: 'https://www.tulicorera.online/producto/bombay-sapphire/'
        },
        {
            name: 'Botella de Whisky Johnnie Walker Black Label 750 ml',
            category: 'Whisky',
            price: 135000,
            image: 'https://www.tulicorera.online/wp-content/uploads/2019/08/18.johnnie-walker-black-300x300.jpg',
            link: 'https://www.tulicorera.online/producto/johnnie-walker-black-label/'
        },
        // Puedes seguir añadiendo más productos según sea necesario
    ];
});