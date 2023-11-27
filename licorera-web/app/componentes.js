angular.module('components', [])
    .component('boton', {
        templateUrl: 'components/boton.html',
        controller: function ($scope) {
            var vm = this;

            $scope.click = function () {
                if (vm.click) {
                    vm.click();
                }
            };

        },
        bindings: {
            clase: '@',
            titulo: '@',
            click: '&',
            isDisabled: '<',
            isNewrow: '<',
            formReference: '<'

        }
    })
    .component('comboBox', {
        templateUrl: 'components/comboBox.html',
        controller: function ($scope, $timeout) {
            var vm = this;

            vm.error = function () {
                return vm.formReference && vm.formReference[vm.controlName] ? vm.formReference[vm.controlName].$error : "";
            }

            $scope.onSelect = function () {
                if (vm.onSelect) {
                    return vm.onSelect({ data: vm.fieldModel });
                }
            };
        },
        bindings: {
            controlName: '@',
            titulo: '@',
            opciones: '<',
            fieldModel: '=',
            onSelect: '&',
            isDisabled: '<',
            isRequired: '<',
            colSpan: '@',
            formReference: '<',
            showIcon: '<',
            titleIcon: '@',
            showHistory: '<',
            fieldModelHistory: '=',
            isRevision: '<',
            fieldModelRequerimiento: '=',
            isDisabledRequerimiento: '<',
            isDisabledHistory: '<',
            isRespuestaRequerimiento: '<',
            isDisabledRespuesta: '<',
            historyName: '@',
            showError: '<'
        }
    })
    .component('fileBox', {
        templateUrl: 'components/fileBox.html',
        controller: function () {
            var vm = this;
            vm.contenidoCorrecto = true;

            vm.error = function () {
                return vm.formReference && vm.formReference[vm.controlName + 'NombreArchivo'] ? vm.formReference[vm.controlName + 'NombreArchivo'].$error : '';
            }
        },
        bindings: {
            controlName: '@',
            titulo: '@',
            fileName: '=',
            base64: '=',
            isDisabled: '<',
            isRequired: '<',
            consideraciones: '@',
            ancho: '<',
            alto: '<',
            formReference: '<'
        }
    })
    .component('textBox', {
        templateUrl: 'components/textBox.html',
        controller: function ($scope, $timeout) {
            var vm = this;
            vm.error = function () {
                return vm.formReference && vm.formReference[vm.controlName] ? vm.formReference[vm.controlName].$error : '';
            }

            $scope.onSelectCheck = function () {
                if (vm.onSelectCheck) {
                    vm.onSelectCheck({ data: vm.fieldModelCheck });
                }
            };
            $scope.onBlur = function () {
                if (vm.onBlur) {
                    vm.onBlur({ data: vm.fieldModelCheck });
                }
            };
            $scope.onKeydown = function () {
                if (vm.onKeydown) {
                    vm.onKeydown({ data: vm.fieldModelCheck });
                }
            };
        },
        bindings: {
            colSpan: '@',
            controlName: '@',
            titulo: '@',
            fieldModel: '=',
            isDisabled: '<',
            isRequired: '<',
            tipo: '@',
            formReference: '<',
            onSelectCheck: '&',
            onBlur: '&',
            onKeydown: '&',
            showIcon: '<',
            titleIcon: '@',
            showHistory: '<',
            fieldModelHistory: '=',
            isRevision: '<',
            fieldModelRequerimiento: '=',
            isDisabledRequerimiento: '<',
            isDisabledHistory: '<',
            isRespuestaRequerimiento: '<',
            isDisabledRespuesta: '<',
            historyName: '@',
            maxLength: '<?',
            showError: '<'
        }
    })
    .component('emailBox', {
        templateUrl: 'components/emailBox.html',
        controller: function ($scope, $timeout) {
            var vm = this;
            vm.error = function () {
                if (/<[a-z/][\s\S]*>/i.test(vm.fieldModel)) {
                    vm.fieldModel = $(vm.fieldModel).html();
                }
                return vm.formReference && vm.formReference[vm.controlName] ? vm.formReference[vm.controlName].$error : '';
            }
            const selectTypes = {
                Check: x => ({
                    data: vm.fieldModelCheck
                })
            }
            $scope.onSelectCheck = function () {
                if (vm.onSelectCheck) {
                    vm.onSelectCheck(selectTypes.Check);
                }
            };
            $scope.onBlur = function () {
                if (vm.onBlur) {
                    vm.onBlur(selectTypes.Check);
                }
            };
            $scope.onKeydown = function () {
                if (vm.onKeydown) {
                    vm.onKeydown(selectTypes.Check);
                }
            };
        },
        bindings: {
            colSpan: '@',
            controlName: '@',
            titulo: '@',
            fieldModel: '=',
            isDisabled: '<',
            isRequired: '<',
            tipo: '@',
            formReference: '<',
            onSelectCheck: '&',
            onBlur: '&',
            onKeydown: '&',
            showIcon: '<',
            titleIcon: '@',
            showHistory: '<',
            fieldModelHistory: '=',
            isRevision: '<',
            fieldModelRequerimiento: '=',
            isDisabledRequerimiento: '<',
            isDisabledHistory: '<',
            isRespuestaRequerimiento: '<',
            isDisabledRespuesta: '<',
            historyName: '@',
            maxLength: '<?',
            showError: '<'
        }
    })
    .component('autoComplete', {
        templateUrl: 'components/autoComplete.html',
        controller: function () {
            var vm = this;

            vm.error = function () {
                return vm.formReference && vm.formReference[vm.controlName] ? vm.formReference[vm.controlName].$error : '';
            }
        },
        bindings: {
            colSpan: '@',
            controlName: '@',
            titulo: '@',
            fieldModel: '=',
            lista: '=',
            isDisabled: '<',
            isRequired: '<',
            tipo: '@',
            formReference: '<'
        }
    })
    .component('multiSelect', {
        templateUrl: 'components/user.html',
        controller: function ($scope, $timeout, $multi) {
            var vm = this;

            vm.error = function () {
                return vm.formReference && vm.formReference[vm.controlName] ? vm.formReference[vm.controlName].$error : '';
            }
            $scope.init = function () {
                $timeout(function () {
                    $('#' + vm.controlName).multiselect({
                        includeSelectAllOption: true,
                    });
                }, 300);
            }
            $scope.init();
        },
        bindings: {
            colSpan: '@',
            controlName: '@',
            titulo: '@',
            fieldModel: '=',
            lista: '=',
            isDisabled: '<',
            isRequired: '<',
            tipo: '@',
            formReference: '<'
        }
    })
    .component('multilineBox', {
        templateUrl: 'components/multilineBox.html',
        controller: function ($timeout) {
            var vm = this;

            vm.error = function () {
                return vm.formReference && vm.formReference[vm.controlName] ? vm.formReference[vm.controlName].$error : '';
            }

        },
        bindings: {
            controlName: '@',
            rows: '@',
            titulo: '@',
            subtitulo: '@',
            fieldModel: '=',
            isDisabled: '<',
            isRequired: '<',
            formReference: '<',
            showHistory: '<',
            fieldModelHistory: '=',
            isRevision: '<',
            fieldModelRequerimiento: '=',
            isDisabledRequerimiento: '<',
            isDisabledHistory: '<',
            isRespuestaRequerimiento: '<',
            isDisabledRespuesta: '<',
            historyName: '@',
            maxLength: '<?',
            showError: '<',
            showIcon: '<',
            titleIcon: '@',
        }
    })
    .component('timeBox', {
        templateUrl: 'components/timeBox.html',
        controller: function ($scope, $timeout) {
            var vm = this;

            vm.hora = '00';
            vm.minutos = '00';
            var primeraHora = true;
            var primerMinuto = true;

            $scope.$watch('$ctrl.hora', function (hora) {
                if (primeraHora) {
                    primeraHora = false;
                } else {
                    vm.fieldModel = hora + ':' + (vm.fieldModel && vm.fieldModel.indexOf(':') != -1 ? vm.fieldModel.split(':')[1] : '00') + ':00';
                }
            }, true);

            $scope.$watch('$ctrl.minutos', function (minutos) {
                if (primerMinuto) {
                    primerMinuto = false;
                } else {
                    vm.fieldModel = (vm.fieldModel && vm.fieldModel.indexOf(':') != -1 ? vm.fieldModel.split(':')[0] : '00') + ':' + minutos + ':00';
                }
            }, true);

            function validarHora() {
                if (vm.fieldModel) {
                    vm.hora = vm.fieldModel.split(':')[0];
                    vm.minutos = vm.fieldModel.split(':')[1];
                }
            }

            $timeout(validarHora, 500);
        },
        bindings: {
            controlName: '@',
            titulo: '@',
            fieldModel: '=',
            isDisabled: '<',
            isRequired: '<',
            formReference: '<'
        }
    })
    .component('dateBox', {
        templateUrl: 'components/dateBox.html',
        controller: function ($scope) {
            var vm = this;

            $scope.setToday = function () {
                let today = new Date();
                let dd = today.getDate();
                let mm = today.getMonth() + 1;
                const yyyy = today.getFullYear();
                if (dd < 10) {
                    dd = '0' + dd
                }
                if (mm < 10) {
                    mm = '0' + mm
                }

                today = yyyy + '-' + mm + '-' + dd;
                return today;
            }

            $scope.fechaActual = $scope.setToday();

            vm.error = function () {
                return vm.formReference && vm.formReference[vm.controlName] ? vm.formReference[vm.controlName].$error : '';
            }
        },
        bindings: {
            controlName: '@',
            titulo: '@',
            fieldModel: '=',
            isDisabled: '<',
            isRequired: '<',
            formReference: '<',
            showHistory: '<',
            fieldModelHistory: '=',
            isRevision: '<',
            fieldModelRequerimiento: '=',
            isDisabledRequerimiento: '<',
            isDisabledHistory: '<',
            isRespuestaRequerimiento: '<',
            isDisabledRespuesta: '<',
            maxToday: '<',
            minToday: '<',
            historyName: '@',
            showError: '<',
            showIcon: '<',
            titleIcon: '@',
        }
    })
    .component('numberBox', {
        templateUrl: 'components/numberBox.html',
        controller: function ($scope) {
            var vm = this;

            $scope.onBlur = function () {
                if (vm.onBlur) {
                    const selectTypes = {
                        Check: x => ({
                            data: vm.fieldModelCheck
                        })
                    }
                    vm.onBlur(selectTypes.Check);
                }
            };

            vm.error = function () {
                return vm.formReference && vm.formReference[vm.controlName] ? vm.formReference[vm.controlName].$error : '';
            }

        },
        bindings: {
            controlName: '@',
            titulo: '@',
            fieldModel: '=',
            isDisabled: '<',
            isRequired: '<',
            formReference: '<',
            maxLength: '<?',
            action: '&',
            showHistory: '<',
            fieldModelHistory: '=',
            isRevision: '<',
            fieldModelRequerimiento: '=',
            isDisabledRequerimiento: '<',
            isDisabledHistory: '<',
            isRespuestaRequerimiento: '<',
            onBlur: '&',
            isDisabledRespuesta: '<',
            historyName: '@',
            showError: '<',
            showIcon: '<',
            titleIcon: '@',
        }
    })
    .component('checkBox', {
        templateUrl: 'components/checkBox.html',
        controller: function ($scope, $timeout) {
            var vm = this;
            $scope.names = {};

            vm.error = function () {
                return vm.formReference && vm.formReference[vm.controlName] ? vm.formReference[vm.controlName].$error : '';
            }

            $scope.onSelect = function () {
                if (vm.onSelect) {
                    const selectTypes = {
                        Model: x => ({
                            data: vm.fieldModel
                        })
                    }
                    return vm.onSelect(selectTypes.Model);
                }
            };

            $scope.updateVal = function (option, i) {
                if (vm.fieldModel[i]) {
                    vm.fieldModel[i].Checkbox = true;
                    if (vm.fieldModel[i].Checked) {
                        vm.fieldModel[i].Checked = false;
                    } else {
                        vm.fieldModel[i].Checked = true;
                    }


                } else {
                    vm.fieldModel[i].Checkbox = false;
                    vm.fieldModel[i].Checked = false;

                }
            };

            $scope.selectAll = function () {
                $.each(vm.fieldModel, function (index, value) {
                    vm.fieldModel[index].Checked = vm.AprobarTodos;
                });
            }

        },
        bindings: {
            controlName: '@',
            titulo: '@',
            fieldModel: '=',
            onSelect: '&',
            deletedItems: '=',
            options: '<',
            isDisabled: '<',
            isRequired: '<',
            selectAll: '<',
            formReference: '<'
        }
    })
    .component('radioBox', {
        templateUrl: 'components/radioBox.html',
        controller: function ($scope) {
            var vm = this;
            $scope.onSelect = function () {
                if (vm.onSelect) {
                    const selectTypes = {
                        Model: x => ({
                            data: vm.fieldModel
                        })
                    }
                    return vm.onSelect(selectTypes.Model);
                }
            };

            vm.error = function () {
                return vm.formReference && vm.formReference[vm.controlName] ? vm.formReference[vm.controlName].$error : '';
            }
        },
        bindings: {
            controlClass: '@',
            controlName: '@',
            titulo: '@',
            fieldModel: '=',
            options: '<',
            isDisabled: '<',
            isRequired: '<',
            formReference: '<',
            showIcon: '<',
            titleIcon: '@',
            onSelect: '&',
            showError: '<',
            showHistory: '<',
            historyName: '@',
            isDisabledHistory: '<'
        }
    })
    .component('menuItems', {
        templateUrl: 'components/menu.html',
        controller: function ($scope, $routeParams, $window, $location, spUtility, $timeout) {
            $scope.Persona = "";
            $scope.UrlLogo = baseEnum.UrlHR.Logo;
            $scope.EmployeNum = 0;

            $scope.Lists = { Menu: [] }

            $scope.CargarMenu = function () {
                var objQuery = spUtility.objQuery();
                objQuery.typeprocess = baseEnum.TypeProcessRequest.getRequest;
                objQuery.onlyUrl = "/api/menus";
                spUtility.Execute(objQuery, function (response) {
                    var data = Enumerable.From(response.data)
                        .Select(function (x) {
                            x.attributes.Id = x.id;
                            return x.attributes;
                        }).ToArray();
                    $scope.Lists.Menu = Enumerable.From(data)
                        .Where(function (x) { return x.PadreId == null })
                        .OrderBy(function (x) { return x.Orden })
                        .ToArray();

                    $scope.Lists.Menu = GetChildrenMenu($scope.Lists.Menu, data);
                    //                 $('.NavLateral-DropDown').on('click', function(e){
                    //                     e.preventDefault();
                    //                     var DropMenu=$(this).next('ul');
                    //                     var CaretDown=$(this).children('i.NavLateral-CaretDown');
                    //                     DropMenu.slideToggle('fast');
                    //                     if(CaretDown.hasClass('NavLateral-CaretDownRotate')){
                    //                         CaretDown.removeClass('NavLateral-CaretDownRotate');    
                    //                     }else{
                    //                         CaretDown.addClass('NavLateral-CaretDownRotate');    
                    //                     }

                    //                 });
                    //                 $('.ShowHideMenu').on('click', function(){
                    //                     var MobileMenu=$('.NavLateral');
                    //                     if(MobileMenu.css('opacity')==="0"){
                    //                         MobileMenu.addClass('Show-menu');   
                    //                     }else{
                    //                         MobileMenu.removeClass('Show-menu'); 
                    //                     }   
                    //                 }); 
                    //                 $(".NavLateral-content").mCustomScrollbar({
                    //                     theme:"light-thin",
                    //                     scrollbarPosition: "inside",
                    //                     autoHideScrollbar: true,
                    //                     scrollButtons:{ enable: true }
                    //                 });

                    //                 $(".ContentPage, .NotificationArea").mCustomScrollbar({
                    //                     theme:"dark-thin",
                    //                     scrollbarPosition: "inside",
                    //                     autoHideScrollbar: true,
                    //                     scrollButtons:{ enable: true }
                    //                 });


                    // $('.btn-ExitSystem').on('click', function(e){
                    //     e.preventDefault();
                    //     swal({ 
                    //         title: "You want out of the system?",   
                    //         text: "The current session will be closed and will leave the system",   
                    //         type: "warning",   
                    //         showCancelButton: true,   
                    //         confirmButtonColor: "#DD6B55",   
                    //         confirmButtonText: "Yes",
                    //         animation: "slide-from-top",   
                    //         closeOnConfirm: false,
                    //         cancelButtonText: "Cancel"
                    //     }, function(){   
                    //         window.location='index.html'; 
                    //     });
                    // }); 
                    // $('.btn-Search').on('click', function(e){
                    //     e.preventDefault();
                    //     swal({   
                    //         title: "What are you looking for?",   
                    //         text: "Write what you want",   
                    //         type: "input",   
                    //         showCancelButton: true,   
                    //         closeOnConfirm: false,   
                    //         animation: "slide-from-top",   
                    //         inputPlaceholder: "Write here",
                    //         confirmButtonText: "Search",
                    //         cancelButtonText: "Cancel" 
                    //     }, function(inputValue){   
                    //         if (inputValue === false) return false;      
                    //         if (inputValue === "") {     swal.showInputError("You must write something");     
                    //         return false   
                    //         }      
                    //         swal("Nice!", "You wrote: " + inputValue, "success"); 
                    //     });    
                    // });
                    // $('.btn-Notification').on('click', function(){
                    //     var NotificationArea=$('.NotificationArea');
                    //     if(NotificationArea.hasClass('NotificationArea-show')){
                    //         NotificationArea.removeClass('NotificationArea-show');
                    //     }else{
                    //         NotificationArea.addClass('NotificationArea-show');
                    //     }
                    // });
                    // $timeout(function(){
                    //     var submenuItems = document.querySelectorAll('.submenu > a');
                    //     submenuItems.forEach(function(item) {
                    //       item.addEventListener('click', function(e) {
                    //         e.preventDefault();
                    //         var submenu = this.nextElementSibling;
                    //         if (submenu.style.display === 'block') {
                    //           submenu.style.display = 'none';
                    //         } else {
                    //           submenu.style.display = 'block';
                    //         }
                    //       });
                    //     });
                    // },200);
                }, function (errorrResponse) {
                    console.log(errorrResponse);
                }, null, null, null, null);
            }

            function GetChildrenMenu(Menu, results) {
                for (var i = 0; i < Menu.length; i++) {
                    Menu[i].children = GetChildren(Menu[i], results)
                }
                return Menu;
            }

            function GetChildren(Padre, results) {
                var IdPadre = Padre ? Padre.Id : 0;
                var children = Enumerable.From(results)
                    .Where(function (x) { return x.PadreId == IdPadre })
                    .OrderBy(function (x) { return x.Orden })
                    .ToArray();
                if (children.length > 0) {
                    children.children = GetChildrenMenu(children, results);
                }
                return children;
            }
            $scope.CargarMenu();

            $scope.enviarABandeja = function (Bandeja) {

                //Limpia las variables de session existentes cuando se elige la opcion desde la barra de menï¿½
                sessionStorage.clear();

                //Envï¿½a al usuario a la bandeja correspondiente
                $window.location.href = "/mis-servicios/gestion-talento/SitePages/Bandeja.aspx#!/" + Bandeja;

                //Recarga la pagina
                document.location.reload(true);
            }
        },
        bindings: {
            options: '<',
            isDisabled: '<'
        }
    })
    .component('decimalBox', {
        templateUrl: 'components/decimalBox.html',
        controller: function ($scope) {
            var vm = this;

            vm.error = function () {
                return vm.formReference && vm.formReference[vm.controlName] ? vm.formReference[vm.controlName].$error : '';
            }
        },
        bindings: {
            controlName: '@',
            titulo: '@',
            fieldModel: '=',
            isDisabled: '<',
            isRequired: '<',
            formReference: '<',
            maxLength: '<?',
            action: '&',
            showHistory: '<',
            fieldModelHistory: '=',
            isRevision: '<',
            fieldModelRequerimiento: '=',
            isDisabledRequerimiento: '<',
            isDisabledHistory: '<',
            isRespuestaRequerimiento: '<',
            isDisabledRespuesta: '<',
            historyName: '@',
            showError: '<'
        }
    });
