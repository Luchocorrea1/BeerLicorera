ngApp.controller('ProductosController', function ($scope, $window, spUtility, helper, $timeout, $location, DTOptionsBuilder) {
    $scope.Lists = {
        Productos: []
    }
    $scope.init = function () {
        $scope.GetData();
    }
    $scope.GetData = function () {
        var objQuery = spUtility.objQuery();
        objQuery.typeprocess = baseEnum.TypeProcessRequest.getRequest;
        objQuery.onlyUrl = "productos";
        spUtility.Execute(objQuery, function (response) {
            $scope.Lists.Productos = response.data;
        }, function (errorrResponse) {
            console.log(errorrResponse);
        }, null, null, null, null);
    }

    $scope.init();

    $scope.isActive = function (viewLocation) {
        return viewLocation === $location.path();
    };

    $scope.setActive = function (viewLocation) {
        $location.path(viewLocation);
    };

    $scope.productos = [
        { codigo: '001', nombre: 'Producto 1', codigoBarras: '123456789', precioVenta: 19.99, precioCosto: 14.99, stockTotal: 100, categoria: 'Categoría A' },
        // Agrega más productos según tus necesidades
    ];

    $scope.vm = {};
    $scope.GetDataTable = function () {
        $scope.vm.dtInstance = {};
        $scope.vm.dtOptions = DTOptionsBuilder.newOptions().withPaginationType('full_numbers')
            .withOption("sort", [[1, "desc"]])
            .withOption("sort", [[6, "desc"]])
            .withOption('paging', true)
            .withOption('searching', true)
            .withOption('retrieve', true)
            .withOption('info', true)
            .withLanguage(spUtility.GetLanguage()).withButtons([
                {
                    extend: "excelHtml5",
                    filename: "consultaTareas",
                    title: "Tareas Pendientes",
                    exportOptions: {
                        columns: "thead th:not(.noExport)"

                    },
                    //CharSet: "utf8",
                    exportData: { decodeEntities: true }
                },
                {
                    extend: "pdfHtml5",
                    filename: "consultaTareas",
                    title: "Tareas Pendientes",
                    exportOptions: {
                        columns: "thead th:not(.noExport)"
                    },
                    exportData: { decodeEntities: true }
                }

            ]);
    }
    // $scope.GetDataTable();

    $scope.resultado = '';
    var scannerActivo = false;
    var cameraStream;
    $scope.VerVideo = false;
    $scope.isMobile = /iPhone|iPad|iPod|Android/i.test(navigator.userAgent);

    $scope.iniciarEscaneo = function () {
        if (!scannerActivo) {
            navigator.mediaDevices.getUserMedia({ video: true })
                .then(function (stream) {
                    $scope.VerVideo = true;
                    $timeout(function () {
                        var video = document.getElementById('video');
                        video.srcObject = stream;
                        video.play();
                        cameraStream = stream;
                    }, 200);
                })
                .catch(function (error) {
                    console.error('Error accessing camera: ', error);
                });

            Quagga.init({
                inputStream: {
                    name: "Live",
                    type: "LiveStream",
                    target: document.querySelector('#video'),
                    constraints: {
                        width: 640,
                        height: 480,
                        facingMode: "environment" // Puedes ajustar esto según tu dispositivo
                    },
                },
                decoder: {
                    readers: ["ean_reader", "code_128_reader"]
                }
            }, function (err) {
                if (err) {
                    console.error(err);
                    return;
                }

                Quagga.start();
                scannerActivo = true;
            });

            Quagga.onDetected(function (data) {
                $scope.$apply(function () {
                    $scope.resultado = data.codeResult.code;
                    detenerEscaneo();
                });
            });
        } else {
            detenerEscaneo();
        }
    };

    $scope.toggleCamera = function () {
        if (cameraStream) {
            var tracks = cameraStream.getTracks();
            tracks.forEach(function (track) {
                track.stop();
            });
            detenerEscaneo();
            $scope.iniciarEscaneo();
        }
    };

    function detenerEscaneo() {
        $scope.VerVideo = false;
        Quagga.stop();
        scannerActivo = false;

        if (cameraStream) {
            var tracks = cameraStream.getTracks();
            tracks.forEach(function (track) {
                track.stop();
            });
        }
    }
    //     debugger;
    // navigator.mediaDevices.getUserMedia({video: true, audio: false}).
    //             then(function(stream){
    //             var v=document.getElementById("video");

    //                 v.srcObject = stream;
    //                 v.play();

    //                 // gUM=true;
    //                 // setTimeout(captureToCanvas, 500);
    //             }).catch(function(error){
    //                console.error(error);
    //             });
});