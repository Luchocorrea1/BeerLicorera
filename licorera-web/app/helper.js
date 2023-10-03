ngApp.factory("helper", helper)
    .factory('ServicePDF', function ($http) {
        return {
            downloadPdf: function () {
                return $http.get('api/my-pdf', { responseType: 'arraybuffer' }).then(function (response) {
                    return response;
                });
            }
        };
    });
helper.$inject = ["spUtility", "spServicebase", "STR_SUB_SITIO"];

function helper(spUtility, spServicebase, strSubSitio) {
    return {
        ModalForm: function (title, data, strController) {
            var size;

            if (title === null || title === '' || title === undefined)
                title = 'Información';
            if (data === null || data === '' || data === undefined)
                data = '<p>Default content.</p>';


            var Modal = { Title: title, Content: data };
            var parentElem = undefined;
            var modalInstance = $uibModal.open({
                animation: true,
                ariaLabelledBy: 'modal-title',
                ariaDescribedBy: 'modal-body',
                templateUrl: baseEnum.ResourcerBase.UrlModalFormTemplate,
                controller: (strController) ? strController : 'ModalInstanceCtrl',
                controllerAs: '$ctrl',
                size: size,
                appendTo: parentElem,
                resolve: {
                    Modal: function () {
                        return Modal;
                    }
                }
            });

            modalInstance.result.then(function (selectedItem) {
                //
            }, function () {
                //
                console.log('Modal dismissed at: ' + new Date());
            });
        },
        ModalAccept: function (title, data, strController) {
            var size;
            var Modal = { Title: title, Content: data };
            var parentElem = undefined;
            var modalInstance = $uibModal.open({
                animation: true,
                ariaLabelledBy: 'modal-title',
                ariaDescribedBy: 'modal-body',
                templateUrl: baseEnum.ResourcerBase.UrlModalConfirm,
                controller: (strController) ? strController : 'ModalAcceptCtrl',
                controllerAs: '$ctrl',
                size: size,
                appendTo: parentElem,
                resolve: {
                    Modal: function () {
                        return Modal;
                    }
                }
            });

            modalInstance.result.then(function (selectedItem) {
                //
            }, function () {
                //
                console.log('Modal dismissed at: ' + new Date());
            });
        },
        OpenModal: function (scope, message, event, title, size, addclass) {
            scope.modalInstance = $uibModal.open({
                template: '<div class="modal-header headerINGEP">' +
                    '<h3 class="modal-title" id="modal-title">' + (title || 'Informaci\u00F3n') + '</h3>' +
                    '<button type="button" class="close closeButtonModal" ng-click="' + (event || "Close()") + '" data-dismiss="modal">&times;</button>' +
                    '</div><div class="modal-body" id="modal-body">' +
                    '<span>' + message + '</span>' +
                    '</div><div class="modal-footer">' +
                    '<button type="button" class="btnFormINGEPModal" ng-click="' + (event || "Close()") + '">Cerrar</button>' +
                    '</div>',
                scope: scope,
                size: size || 'sm',
                backdrop: 'static',
                keyboard: false,
                windowClass: addclass || 'zindex',
                windowTopClass: "AjustarModal"
            });
            setTimeout(function () {
                if (window.location !== window.parent.location)
                    $('.AjustarModal').css('top', (window.top.scrollY - 500))
            }, 500);
            scope.Close = function () {
                scope.modalInstance.close();
            }
        },
        OpenModalTemplate: function (scope, templateUrl, size, newmodalInstance, Newclass) {
            if (newmodalInstance) {
                scope[newmodalInstance] = $uibModal.open({
                    templateUrl: templateUrl,
                    scope: scope,
                    size: size || 'md',
                    backdrop: 'static',
                    keyboard: false,
                    // windowClass: 'zindexmax',
                    windowTopClass: Newclass || "AjustarModal"
                });

            } else {
                scope.modalInstance = $uibModal.open({
                    templateUrl: templateUrl,
                    scope: scope,
                    size: size || 'md',
                    backdrop: 'static',
                    keyboard: false,
                    windowTopClass: "AjustarModal"
                });
            }
            scope.close = function () {
                if (newmodalInstance)
                    scope[newmodalInstance].close();
                else
                    scope.modalInstance.close();
            }
            scope.closeModal = function () {
                console.log();
                if (newmodalInstance)
                    scope[newmodalInstance].close();
                else
                    scope.modalInstance.close();
            }

            setTimeout(function () {
                if (window.location !== window.parent.location)
                    $('.AjustarModal').css('top', (window.top.scrollY - 500))
            }, 50);
        },
        OpenModalTemplatePlus: function (scope, templateUrl, size) {
            scope.modalInstance = $uibModal.open({
                templateUrl: templateUrl,
                scope: scope,
                size: size || 'md',
                backdrop: 'static',
                keyboard: false,
                windowTopClass: "AjustarModal"
            });
            setTimeout(function () {
                if (window.location !== window.parent.location)
                    $('.AjustarModal').css('top', (window.top.scrollY - 500))
            }, 500);

            scope.Close = function () {
                scope.modalInstance.close();
            }
            $('.modal').remove();
            $('.modal-backdrop').remove();
        },
        ModalAceptCancel: function (scope, message, event, title, eventCancel, size) {
            scope.modalInstance = $uibModal.open({
                template: '<div class="modal-header">' +
                    '<h4 class="modal-title" id="modal-title">' + (title ? title : 'Información') + '</h4>' +
                    '</div><div class="modal-body" id="modal-body">' +
                    '<div  class="row">' +
                    '<div class="col-md-12">' +
                    '  <div class="form-group">' +
                    '<label>' + message + '</label>' +
                    '</div>' +
                    '</div>' +
                    '</div>' +
                    '</div><div class="modal-footer">' +
                    '<button type="button" class="btn btn-green" ng-click="' + (event ? event : "Close()") + '">Aceptar</button>' +
                    '<button type="button" class="btn btn-red" ng-click="' + (eventCancel ? eventCancel : "Close()") + '">Cancelar</button>' +
                    '</div>',
                scope: scope,
                size: size,
                backdrop: 'static',
                keyboard: false
            });
            scope.Close = function () {
                scope.modalInstance.close();
            }
        },
        ModalAceptar: function (scope, message, title, eventCancel, size) {
            scope.modalInstance = $uibModal.open({
                template: '<div class="modal-header" id="ModalAcpet">' +
                    '<h3 class="modal-title" id="modal-title">' + (title ? title : 'Información') + '</h3>' +
                    '</div><div class="modal-body" id="modal-body">' +
                    '<span>' + message + '</span>' +
                    '</div><div class="modal-footer">' +
                    '<button type="button" class="btn btn-green" ng-click="' + (eventCancel ? eventCancel : "Close()") + '">Aceptar</button>' +
                    '</div>',
                scope: scope,
                size: size,
                backdrop: 'static',
                keyboard: false
            });
            scope.Close = function () {
                scope.modalInstance.close();
            }
        },
        GetConsulta: function (NombreLista, filter, fnSucess, fnError, orderby = undefined, limit = "1000") {
            var objQuery = spUtility.objQuery();
            objQuery.getListByTitle = NombreLista;
            objQuery.typeprocess = baseEnum.TypeProcessRequest.getRequest;
            objQuery.filter = filter;
            objQuery.top = limit;
            if (orderby) {
                console.log('ODB ' + orderby);
                objQuery.orderBy = orderby
            }
            objQuery.selectFields = "*,Author/Name,Author/Title";
            objQuery.extendFieldsLookUp = "Author";
            spUtility.Execute(objQuery, fnSucess, fnError, null, null, null, null, true);
        },
        FormatStrDate: function (fechaSHP) {
            var fecha = new Date(fechaSHP);
            return this.getFechaNormal(fechaSHP) + " " + (fecha.getHours() < 10 ? "0" + fecha.getHours() : fecha.getHours()).toString() + ":" + (fecha.getMinutes() < 10 ? "0" + fecha.getMinutes() : fecha.getMinutes()).toString() + ":" + (fecha.getSeconds() < 10 ? "0" + fecha.getSeconds() : fecha.getSeconds()).toString();
        },
        FindItem: function (items, key, compareValue) {
            var result = null;
            key = key.split(".");
            $.each(items, function (index, item) {
                var value = item;
                $.each(key, function (index2, item2) {
                    value = value[item2];
                });
                if (value == compareValue) {
                    result = item;
                }
            });
            return result;
        },
        FindItems: function (items, key, compareValue) {
            var result = [];
            $.each(items, function (index, item) {
                if (item[key] == compareValue) {
                    result.push(item);
                }
            });
            return result;
        },
        getUrlParameter: function (param, dummyPath) {
            var sPageURL = dummyPath || window.location.href.substring(1),
                sURLVariables = sPageURL.split(/[&||?]/),
                res;

            for (const i of sURLVariables) {

                var paramName = sURLVariables[i],
                    sParameterName = (paramName || '').split('=');

                if (sParameterName[0] === param) {
                    res = sParameterName[1];
                }
            }

            return res;
        },
        getFormatComboBox: function (list, TextId, TextName) {
            return Enumerable.From(list)
                .Select(function (x) {
                    return {
                        'Id': x[TextId],
                        'Nombre': x[TextName]
                    }
                }).ToArray();
        },
        getBase64File: function (idFile, functionsucess) {
            var fileInput = document.getElementById(idFile);
            var reader = new FileReader();
            reader.readAsDataURL(fileInput.files[0]);
            reader.onload = function () {
                if (functionsucess)
                    functionsucess(reader.result);
            };
            reader.onerror = function (error) {
                console.log('Error: ', error);
            };
        },
        getBase64Url: function (url, functionsucess) {
            var xhr = new XMLHttpRequest();
            xhr.onload = function () {
                var reader = new FileReader();
                reader.onloadend = function () {
                    functionsucess(reader.result);
                }
                reader.readAsDataURL(xhr.response);
            };
            xhr.open('GET', url);
            xhr.responseType = 'blob';
            xhr.send();
        },
        GetStrJson: function (obj, prefijo) {
            var strjsonDatos = "";
            angular.forEach(obj, function (value, key) {
                if (typeof value !== "object" && !String.isNullOrEmpty(value)) {
                    strjsonDatos += key + (prefijo ? prefijo.toString() : "") + ":" + String.replaceAll(value.toString(), ",", " ") + ",";
                }
            });
            return strjsonDatos;
        },
        GetKeyParValueJson: function (obj, prefijo) {
            var jsonDatos = [];

            angular.forEach(obj, function (value, key) {
                if (typeof value !== "object" && !String.isNullOrEmpty(value)) {
                    jsonDatos.push({
                        name: key + (prefijo ? prefijo.toString() : ""),
                        value: value.toString()
                    });
                }
            });
            return jsonDatos;
        },
        getStrVars: function (str) {
            var vars = [],
                hash;
            var hashes = str.slice(str.indexOf('?') + 1).split('&');
            for (var i = 0; i < hashes.length; i++) {
                hash = hashes[i].split('=');
                vars.push(hash[0]);
                vars[hash[0]] = hash[1];
            }
            return vars;
        },
        getURLref: function ($location) {
            var cadena = "{}";
            if (getUrlVars().ref) {
                cadena = $.base64.decode(getUrlVars().ref.replace(/%3D/g, "="));
            } else if ($location.search().ref) {
                cadena = $.base64.decode($location.search().ref.replace(/%3D/g, "="));
            } else {
                return getUrlVars();
            }
            cadena = cadena.replace(/\\n/g, "\\n")
                .replace(/\\'/g, "\\'")
                .replace(/\\"/g, '\\"')
                .replace(/\\&/g, "\\&")
                .replace(/\\r/g, "\\r")
                .replace(/\\t/g, "\\t")
                .replace(/\\b/g, "\\b")
                .replace(/\\f/g, "\\f");
            return JSON.parse(cadena);
        },
        setURLref: function (obj) {
            return "?ref=" + $.base64.encode(JSON.stringify(obj));
        },
        GetListRequired: function (frm) {
            if (!frm)
                return [];
            return Enumerable.From(frm.$error.required)
                .Where(function (x) { return x.$$attr })
                .Select(function (x) {
                    return { TextError: "El campo " + (!String.isNullOrEmpty(x.$$attr.NewText) ? x.$$attr.NewText : (!String.isNullOrEmpty(x.$$attr.titulo) ? x.$$attr.titulo : x.$$attr.name)) + " es obligatorio." }
                })
                .ToArray();
        },
        GetListFormat: function (frm) {
            if (!frm)
                return [];
            return Enumerable.From(frm.$error.pattern)
                .Where(function (x) { return x.$$attr })
                .Select(function (x) {
                    return { TextError: "El campo " + (!String.isNullOrEmpty(x.$$attr.NewText) ? x.$$attr.NewText : (!String.isNullOrEmpty(x.$$attr.titulo) ? x.$$attr.titulo : x.$$attr.name)) + " Tiene un formato incorrecto." }
                })
                .ToArray();
        },
        GenerateGuidId: function () {
            return 'xxxxxxxx-xxxx-4xxx-yxxx-xxxxxxxxxxxx'.replace(/[xy]/g, function (c) {
                var r = GenerateRandom() * 16 | 0,
                    v = c == 'x' ? r : (r & 0x3 | 0x8);
                return v.toString(16);
            });
        },
        GetFileNameFromUrl: function (fileUrl) {
            return fileUrl.replace(/^.*[\\\/]/, '');
        },
        GenerateRandom: function () {
            var array = new Uint32Array(1);
            return self.crypto.getRandomValues(array)[0];
        },
        IsValidDate: function (d) {
            return d instanceof Date && !isNaN(d);
        },
        ObtenerIpUsuario: function (fncSuccess) {
            var objQuery = spUtility.objQuery();
            objQuery.typeprocess = baseEnum.TypeProcessRequest.getRequest;
            objQuery.onlyUrl = "https://api.ipify.org?format=json"; //https://www.cloudflare.com/cdn-cgi/trace
            spUtility.Execute(objQuery, function (response) {
                if (fncSuccess)
                    fncSuccess(response);
            }, function (errorrResponse) {
                console.log(errorrResponse);
                var response = {};
                if (fncSuccess)
                    fncSuccess(response);
            }, null, null, null, null, null);
        },
        GetListByParams: function (params, fnSucess, fnError) {
            if (params == null || params.length == 0) {
                throw new Error('params is required');
            }
            let list = null;
            let filter = null;
            angular.forEach(params, function (value, key) {
                if (value.key == 'list') {
                    list = value.value;
                }
                if (value.key == 'filter') {
                    filter = value.value;
                }
            });
            if (!list && list != "") {
                throw new Error('param.key [list] is required');
            }
            var objQuery = spUtility.objQuery();
            objQuery.getListByTitle = list;
            objQuery.top = "1000";
            objQuery.typeprocess = baseEnum.TypeProcessRequest.getRequest;
            if (filter) {
                objQuery.filter = filter;
            }
            spUtility.Execute(objQuery, fnSucess, fnError);
        },
        ValidDateAfter: function (date, dateAfter) {
            var x = new Date();
            var fecha = date.format('dd/MM/yyyy').split("/");
            x.setFullYear(fecha[2], fecha[1] - 1, fecha[0]);

            if (x < dateAfter) {
                return true;
            }
            return false;
        },
        GetConsultaAsync: function (NombreLista, filter) {
            return new Promise((resolve, reject) => this.GetConsulta(
                NombreLista,
                filter,
                response => resolve(response),
                error => {
                    console.error(error);
                    return reject(error);
                }
            ));
        },
        ReturnIdNombre: function (x) {
            return {
                Id: x.Title,
                Nombre: x.Title
            }
        },
        clearInputFile: function () {
            angular.forEach($('input[type=file]'), function (ctrl) {
                try {
                    ctrl.value = null;
                    setTimeout(() => {
                        $(ctrl).change();
                    }, 200);
                } catch (ex) { }
                if (ctrl.value) {
                    ctrl.parentNode.replaceChild(ctrl.cloneNode(true), ctrl);
                }
            });
        }
    };
}
