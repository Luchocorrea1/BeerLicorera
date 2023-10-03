angular.module('AC.directives', [])
    .directive('myEnter', function () {
        return function (scope, element, attrs) {
            element.bind("keydown keypress", function (event) {
                if (event.which === 13) {
                    scope.$apply(function () {
                        scope.$eval(attrs.myEnter);
                    });

                    event.preventDefault();
                }
            });
        };
    })
    .directive('datepicker', function () {
        return {
            restrict: 'A',
            require: 'ngModel',
            link: function (scope, element, attrs, ngModelCtrl) {
                $(function () {
                    element.datepicker({
                        //dateFormat: 'dd/mm/yy',
                        //onSelect: function (date) {
                        //    scope.$apply(function () {
                        //        ngModelCtrl.$setViewValue(date);
                        //    });
                        //}
                        dateFormat: 'dd/mm/yy',
                        dayNamesMin: ["Do", "Lu", "Ma", "Mi", "Ju", "Vi", "Sa"],
                        dayNamesShort: ["Dom", "Lun", "Mar", "Mie", "Jue", "Vie", "Sab"],
                        monthNames: ["Enero", "Febrero", "Marzo", "Abril", "Mayo", "Junio", "Julio", "Agosto", "Septiembre", "Octubre", "Noviembre", "Diciembre"],
                        monthNamesShort: ["Ene", "Feb", "Mar", "Abr", "May", "Jun", "Jul", "Ago", "Sep", "Oct", "Nov", "Dic"],
                        //maxDate: "+0M +0D",
                        onSelect: function (date) {
                            scope.$apply(function () {
                                ngModelCtrl.$setViewValue(date);
                            });
                        }
                    });
                });
            }
        }
    })
    .directive('format', ['$filter', function ($filter) {
        return {
            require: '?ngModel',
            link: function (scope, elem, attrs, ctrl) {
                if (!ctrl) return;

                ctrl.$formatters.unshift(function (a) {
                    return $filter(attrs.format)(ctrl.$modelValue)
                });

                elem.bind('blur', function (event) {
                    var plainNumber = elem.val().replace(/[^\d|\-+|\.+]/g, '');
                    elem.val($filter(attrs.format)(plainNumber));
                });
            }
        };
    }])
    .directive("fileread", [function () {
        return {
            scope: {
                fileread: "="
            },
            link: function (scope, element, attributes) {
                element.bind("change", function (changeEvent) {
                    if (changeEvent.target.files.length) {
                        var reader = new FileReader();
                        reader.onload = function (loadEvent) {
                            if (scope.$parent.$ctrl.ancho || scope.$parent.$ctrl.alto) {
                                var img = new Image();
                                img.onload = function () {
                                    var compatible = true;

                                    if (scope.$parent.$ctrl.ancho && img.naturalWidth != scope.$parent.$ctrl.ancho) {
                                        compatible = false;
                                    }

                                    if (scope.$parent.$ctrl.alto && img.naturalHeight != scope.$parent.$ctrl.alto) {
                                        compatible = false;
                                    }

                                    scope.$apply(function () {
                                        scope.$parent.$ctrl.contenidoCorrecto = compatible;
                                    });

                                    if (compatible) {
                                        scope.$apply(function () {
                                            scope.$parent.$ctrl.fileName = changeEvent.target.files[0].name;
                                            scope.$parent.$ctrl.base64 = loadEvent.target.result.split('base64,')[1];
                                        });
                                    }
                                };
                                img.src = loadEvent.target.result;
                            } else {
                                scope.$apply(function () {
                                    scope.$parent.$ctrl.fileName = changeEvent.target.files[0].name;
                                    scope.$parent.$ctrl.base64 = loadEvent.target.result.split('base64,')[1];
                                });
                            }
                        }
                        reader.readAsDataURL(changeEvent.target.files[0]);
                    } else {
                        scope.$parent.$ctrl.fileName = '';
                        scope.$parent.$ctrl.base64 = '';
                    }
                });
            }
        }
    }])
    .directive("checkfileread", [function () {
        return {
            scope: {
                fileread: "="
            },
            link: function (scope, element, attributes) {
                element.bind("change", function (changeEvent) {
                    var ctrpos = $(this).attr("id").match(/\d+/g).map(Number)[0];
                    if (!scope.$parent.$ctrl.fileName)
                        scope.$parent.$ctrl.fileName = [];
                    if (!scope.$parent.$ctrl.base64)
                        scope.$parent.$ctrl.base64 = [];
                    if (changeEvent.target.files.length) {
                        var reader = new FileReader();
                        reader.onload = function (loadEvent) {
                            if (scope.$parent.$ctrl.ancho || scope.$parent.$ctrl.alto) {
                                var img = new Image();
                                img.onload = function () {
                                    var compatible = true;

                                    if (scope.$parent.$ctrl.ancho && img.naturalWidth != scope.$parent.$ctrl.ancho) {
                                        compatible = false;
                                    }

                                    if (scope.$parent.$ctrl.alto && img.naturalHeight != scope.$parent.$ctrl.alto) {
                                        compatible = false;
                                    }

                                    scope.$apply(function () {
                                        scope.$parent.$ctrl.contenidoCorrecto = compatible;
                                    });

                                    if (compatible) {
                                        scope.$apply(function () {
                                            scope.$parent.$ctrl.fileName[ctrpos] = changeEvent.target.files[0].name;
                                            scope.$parent.$ctrl.base64[ctrpos] = loadEvent.target.result.split('base64,')[1];
                                        });
                                    }
                                };
                                img.src = loadEvent.target.result;
                            } else {
                                scope.$apply(function () {
                                    scope.$parent.$ctrl.fileName[ctrpos] = {
                                        fileName: changeEvent.target.files[0].name,
                                        base64: loadEvent.target.result.split('base64,')[1],
                                        files: changeEvent.target.files,
                                    }
                                });
                            }
                        }
                        reader.readAsDataURL(changeEvent.target.files[0]);
                    } else {
                        scope.$parent.$ctrl.fileName[ctrpos] = '';
                        scope.$parent.$ctrl.base64[ctrpos] = '';
                    }
                });
            }
        }
    }])
    .directive('horaformat', function () {
        return {
            restrict: 'A',
            require: 'ngModel',
            link: function (scope, element, attrs, ngModel) {
                element.bind('focus', function (evt) {
                    this.setSelectionRange(0, this.value.length)
                });

                ngModel.$parsers.push(function (value) {
                    if (!value || value.length == 0) {
                        return value;
                    }

                    value = value.replace(/[^\d]/g, "");

                    if (value.length == 1) {
                        value = '0' + value;
                    } else if (value.length > 2) {
                        if (value.substr(0, 1) == '0') {
                            value = value.substr(1, 3);
                        }

                        value = value.substr(0, 2);
                    }

                    if (parseInt(value) > 23) {
                        value = '0';
                    }

                    element.val(value);
                    return value;
                });

                ngModel.$parsers.push(function (value) {
                    if (!value || value.length == 0) {
                        return value;
                    }

                    value = value.replace(/[^\d]/g, "");

                    if (value.length == 1) {
                        value = '0' + value;
                    } else if (value.length > 2) {
                        if (value.substr(0, 1) == '0') {
                            value = value.substr(1, 3);
                        }

                        value = value.substr(0, 2);
                    }

                    if (parseInt(value) > 23) {
                        value = '0';
                    }
                    ngModel.$setViewValue(value);

                    element.val(value);
                    return value;
                });
            }
        }
    })
    .directive('minutosformat', function () {
        return {
            restrict: 'A',
            require: 'ngModel',
            link: function (scope, element, attrs, ngModel) {
                element.bind('focus', function (evt) {
                    this.setSelectionRange(0, this.value.length)
                });

                ngModel.$parsers.push(function (value) {
                    if (!value || value.length == 0) {
                        return value;
                    }

                    value = value.replace(/[^\d]/g, "");

                    if (value.length == 1) {
                        value = '0' + value;
                    } else if (value.length > 2) {
                        if (value.substr(0, 1) == '0') {
                            value = value.substr(1, 3);
                        }

                        value = value.substr(0, 2);
                    }
                    if (parseInt(value) > 59) {
                        value = '0';
                    }

                    element.val(value);
                    return value;
                });

                ngModel.$parsers.push(function (value) {
                    if (!value || value.length == 0) {
                        return value;
                    }

                    value = value.replace(/[^\d]/g, "");

                    if (value.length == 1) {
                        value = '0' + value;
                    } else if (value.length > 2) {
                        if (value.substr(0, 1) == '0') {
                            value = value.substr(1, 3);
                        }

                        value = value.substr(0, 2);
                    }

                    if (parseInt(value) > 59) {
                        value = '0';
                    }
                    ngModel.$setViewValue(value);

                    element.val(value);
                    return value;
                });
            }
        }
    })
    .directive('numberFormat', function () {
        return {
            restrict: 'A',
            require: 'ngModel',
            link: function (scope, element, attrs, ngModel) {

                ngModel.$parsers.push(function (value) {
                    if (!value || value.length == 0) {
                        return value;
                    }

                    value = value.replace(/[^\d]/g, "");

                    element.val(value);
                    ngModel.$setViewValue(value);
                    return value;
                });
            }
        }
    })
    .directive('decimalsOnly', function () {
        return {
            restrict: 'EA',
            require: 'ngModel',
            link: function (scope, element, attrs, ngModel) {
                scope.$watch(attrs.ngModel, function (newValue, oldValue) {
                    if (newValue) {
                        var spiltArray = String(newValue).split("");

                        newValue = newValue.toString().replace(".", ",");
                        ngModel.$setViewValue(newValue);
                        ngModel.$render();
                        
                        if (spiltArray[0] == '-') {
                            newValue = newValue.replace("-", "").replace(".", ",");
                            ngModel.$setViewValue(newValue);
                            ngModel.$render();
                        }
                        // }

                        if (attrs.allowDecimal == "false") {
                            newValue = parseInt(newValue);
                            ngModel.$setViewValue(newValue);
                            ngModel.$render();
                        }

                        if (attrs.allowDecimal != "false") {
                            if (attrs.decimalUpto) {
                                var n = String(newValue).split(",");
                                if (n[1]) {
                                    var n2 = n[1].slice(0, attrs.decimalUpto);
                                    newValue = [n[0], n2].join(",");
                                    ngModel.$setViewValue(newValue);
                                    ngModel.$render();
                                }
                            }
                        }

                        if (spiltArray.length === 0) return;
                        if (spiltArray.length === 1 && (spiltArray[0] == '-' || spiltArray[0] === ',')) return;
                        if (spiltArray.length === 2 && newValue === '-,') return;

                        /*Check it is number or not.*/
                        if (typeof newValue != "number")
                            if (isNaN(newValue.replace(",", "."))) {
                                ngModel.$setViewValue(oldValue || '');
                                ngModel.$render();
                            }
                    }
                });
            }
        };
    })

    .directive('focusMe', function ($timeout) {
        return {
            link: function (scope, element, attrs) {
                scope.$watch(attrs.focusMe, function (value) {
                    if (value === true) {
                        console.log('value=', value);
                        //$timeout(function() {
                        element[0].focus();
                        scope[attrs.focusMe] = false;
                        //});
                    }
                });
            }
        };
    })
    .directive('validatextension', function () {
        return {
            require: 'ngModel',
            link: function (scope, element, attr, ngModel) {
                ngModel.$setValidity('invalidExtension', element.val() == '');
                var extension = attr.validatextension;
                element.bind('change', function () {
                    var value = element.val();
                    if (!element.val()) {
                        ngModel.$setValidity('invalidExtension', true);
                        //} else if (value.substring(value.lastIndexOf('.') + 1).toLowerCase() == extension.toLowerCase()) {
                    } else if (extension.toLowerCase().indexOf(value.substring(value.lastIndexOf('.') + 1).toLowerCase()) !== -1) {
                        ngModel.$setValidity('invalidExtension', true);
                    } else {
                        ngModel.$setValidity('invalidExtension', false);
                    }
                    scope.$apply(function () {
                        ngModel.$setViewValue(element.val());
                        ngModel.$render();
                    });
                });


            }
        }
    }).directive('carousel', function ($timeout) {
        return {
            restrict: 'E',
            scope: {
                links: '=',
                active: '=',
                nowrapslides: '=',
                myinterval: '='
            },
            templateUrl: '../App/ng-dev/pages/components/carousel.html',
            link: function (scope, element) {
                //console.log
            }
        }
    })
    .directive('ngfooter', function ($timeout) {
        return {
            restrict: 'E',
            scope: {
                links: '='
            },
            templateUrl: '../App/ng-dev/pages/components/Footer.html',
            link: function (scope, element) {
                //console.log
            }
        }
    })
    .directive('autocomplete', function ($timeout) {
        return {
            restrict: 'A',
            scope: {
                Data: '='
            },
            require: 'ngModel',
            link: function (scope, iElement, iAttrs) {
                iElement.autocomplete({
                    source: scope.Data,
                    select: function () {
                        $timeout(function () {
                            iElement.trigger('input');
                        }, 0);
                    }
                });
            }
        };
    })
    .directive('filestyle', function () {
        return {
            restrict: 'AC',
            scope: true,
            link: function (scope, element, attrs) {
                var options = {
                    'buttonText': "Examinar",
                    classButton: "btn"
                };
                element.on("change", () => scope.$apply(() => {
                    if (scope.ngUploadChange) {
                        scope.ngUploadChange(element[0]);
                    } else {
                        console.warn('La función "ngUploadChange" no esta definida en el $scope del controller');
                    }
                }))
                setTimeout(function () {
                    $('#' + attrs.id).filestyle(options);
                }, 50);
            }
        };
    });
