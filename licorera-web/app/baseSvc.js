'use strict';
angular.module('spBaseSvc', [])
	.factory("spServicebase", spServicebase)
	.factory("spUtility", spUtility)
	.directive("customFileChange", customFileChange)
	.directive("validatextension", validatextension)
	.directive("requiredFile", requiredFile)
	.directive("datepicker", datepicker)
	.directive("checkFileSize", checkFileSize)
	.directive("checkDate", checkDate)
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
	}]);
spServicebase.$inject = ["$q", "$http", "IS_APP_WEB"];
function spServicebase($q, $http, isAppWeb) {

	var _baseUrl = "http://localhost:1337/api/";
	try {
	var _baseUrl = "http://localhost:1337/api/";
	} catch (ex) {
		console.log("Running on localhost");
		_baseUrl = "http://localhost:1337/api/";
	}

	var _objQuery =
	{
		//* Obligatorio
		// Ex: https://www.shpbext + [onlyUrl] Obligatorio
		onlyUrl: "",
		// Tipo de request async o syncr.. por defecto inicia en async
		async: true,
		// Campo usado para referenciar un  subsitio, si esta en blanco se toma el sitio principal
		subSiteUrl: "",
		// Campo para identificar el tipo de proceso que se desea hacer. Ver clase baseEnum.js
		typeprocess: "",
		// La lista se puede obtener por GUID o Por su nombre, primero se valida si tiene valor [getListByguid]
		getListByguid: "",
		//* Obligatorio si se desea adicionar o actualizar registro 
		getListByTitle: "",
		// Objeto adjuntado a la data, usado para Adicionar o actualizar un registro
		data: new Object,
		// Nombre del archivo adjunto 
		fileName: "",
		// Adjunta al archivo al item de una lista con el Id seteado
		// Campo no necesario para subir a una biblioteca de documentos
		attachFileToItemByID: "",
		// Especifica el folder donde se desea guardar el archivo por default es ROOTFOLDER
		uploadFileToUrlFolder: "rootfolder",
		newFolder: null,
		// Sobreescribir archivo existente
		overwrite: true,
		//Necesario para adicionar o actualizar elementos, por default setea el nombre de la lista
		metadataTypeItem: "",
		// Este campo permite consultar por Id un registro, ya sea para Update o Delete 
		getItemById: "",
		// Campos que se requieren en una consulta.  Ex: ID,Title,Direccion,Ciudad,SpPerson/Name,SpCiudad/Title
		selectFields: "",
		// Junto con  selectFields, es necesario especificar cuando se requiere campos de tipo lookUp Ex: SpCiudad,SpPerson
		extendFieldsLookUp: "",
		// Permite especificar cuales Items returnar Ex: "Company eq 'Bextsa'"
		filter: "",
		// Permite especificar por cuales Items ordenar Ex: ID desc'
		orderBy: "",
		// Permite especificar cuantos registros retornar, util para paginacion o romper umbral de Rest de shp
		top: "",
		// Informacion que se adicionara al final de la url de consulta, a medida que se complementa estas clases
		afterUrl: "",
		// Parametro para guardar en otro sitio diferente al principal
		FormDigestValue: null,
		//Parametro para enviar informacion adicional
		datosAdicionales: null,
		EnviarAdicional: false,
		//Url del record Center
		recordCenter: null,
		//Parametro para actualizar metadata de documento
		UpdateMetadata: false

	}

	return {
		objQuery: _objQuery,
		processRequest: _processRequest,
		baseUrl: _baseUrl,
	};

	function _processRequest(obj) {
		if (!String.isNullOrEmpty(obj.onlyUrl)) {
			return _processRequestDao(obj.typeprocess, null,_baseUrl+ obj.onlyUrl, obj.data, obj.async, obj);
		}
		return null;
	}

	function _processRequestDao(TypeProcessRequest, query, endPoint, data, isAsync, obj) {
		var deferred = $q.defer();
		var objRequest = {
			url: endPoint || (obj.recordCenter || _baseUrl) + query,
			async: isAsync,
			method: TypeProcessRequest.method,
			headers: {
				"accept": "application/json;odata=verbose",
				"content-Type": "application/json;odata=verbose"
			}
		}

		var process = TypeProcessRequest.id !== undefined ? TypeProcessRequest.id : 1;
		// switch (process) {
		// 	case 3:
		// 		objRequest.type= TypeProcessRequest.method;
		// 		objRequest.method= TypeProcessRequest.method;
		// 		break;
		// 	default:
		// 		objRequest.method= TypeProcessRequest.method;
		// 		break;
		// }
		// Por Default las solicitudes inician como un GET
		switch (process) {
			case 1:
				objRequest.method = "GET";
				break;
			// POST - Guardar un nuevo registro
			case 2:
				if (obj.UpdateMetadata) {
					objRequest.headers["X-HTTP-Method"] = "MERGE";
					objRequest.headers["If-Match"] = "*"
				}
				if (data)
					objRequest.data = JSON.stringify(data);
				break;
			// UPDATE - Actualizar un registro
			case 3:
				objRequest.method = "POST";
				objRequest.headers = {
					"accept": "application/json;odata=verbose",
					"content-Type": "application/json;odata=verbose",
					"X-Http-Method": "MERGE",
					"If-Match": "*"
				}
				objRequest.data = JSON.stringify(data);
				break;
			// DELETE - Eliminar un registro
			case 4:
				objRequest.method = "POST";
				objRequest.headers = {
					"Accept": "application/json;odata=verbose",
					"Content-Type": "application/json;odata=verbose",
					"X-HTTP-Method": "DELETE",
					"If-Match": "*"
				}
				break;
			// FILE UPLOAD - Almacenar un archivo
			case 5:
				objRequest.processData = false;
				objRequest.transformRequest = angular.identity;
				objRequest.headers = {
					Accept: "application/json;odata=verbose",
					"Content-Length": data.byteLength
				}
				objRequest.headers["Content-Type"] = undefined;
				objRequest.headers["If-Match"] = "*";
				objRequest.headers["Content-Length"] = data.byteLength;
				objRequest.data = data;
				break;
			case 6:
				objRequest.binaryStringRequestBody = true;
				objRequest.data = JSON.stringify({ 'properties': data });

				break;
			case 7:
				objRequest.method = "POST";
				objRequest.headers = {
					"accept": "application/json;odata=verbose",
					"content-Type": "application/json;odata=verbose",
					"X-Http-Method": "PATCH",
					"If-Match": "*"
				}
				break;
		}

		$http(objRequest)
			.then(function (result) {
				deferred.resolve(result);
			}, function (result) {
				deferred.reject({
					error: result
				});
			});
		return deferred.promise;
	}
}

spUtility.$inject = ['$rootScope', '$q', 'spServicebase',  '$timeout']
function spUtility($rootScope, $q, spServicebase,  $timeout) {
	var _showLoading = function (template) {

		// if ($rootScope.countLoading === undefined)
		// 	$rootScope.countLoading = 0;

		// if ($rootScope.countLoading <= 0 || $rootScope.IdngDialog.length == 0) {
		// 	$rootScope.IdngDialog = undefined;
		// 	$rootScope.countLoading = 0;
		// }
		// if ($rootScope.IdngDialog === undefined) {
		// 	$rootScope.IdngDialog = [];
		// 	template = (template) ? template : baseEnum.Messages.LoadingModal;
		// 	var rutagif = '<br><img src="' + baseEnum.ResourcerBase.UrlImageLoading + '" /></p>'

		// 	var IdngDialog = ngDialog.open({
		// 		template: '<p style="text-align:center">' + template + rutagif,
		// 		plain: true,
		// 		closeByEscape: false,
		// 		closeByNavigation: false,
		// 		closeByDocument: false,
		// 		showClose: false
		// 	});
		// 	$rootScope.IdngDialog.push(IdngDialog);
		// }
		// $rootScope.countLoading++;
	};
	var _hideLoading = function () {
		$timeout(function () {
			// if ($rootScope.countLoading === undefined) {
			// 	$rootScope.countLoading = 0;
			// }

			// $rootScope.countLoading--;
			// if ($rootScope.countLoading <= 0) {
			// 	if ($rootScope.IdngDialog && $rootScope.IdngDialog.length > 0) {
			// 		if ($rootScope.IdngDialog[0] !== undefined) {
			// 			ngDialog.close($rootScope.IdngDialog[0].id);
			// 			$rootScope.IdngDialog.splice(0, 1);
			// 		}
			// 	} else {
			// 		ngDialog.close();
			// 		ngDialog.closeAll();
			// 	}
			// }
		}, 200);
	};
	var _showAlert = function (title, template) {
		if ((template && template.Procesando)) {
			template = template.Procesando;

		} else {
			if ((typeof template === "string")) {
				//console.log
			} else {
				template = baseEnum.Messages.LoadingModal;

			}

		}
		//"template = (template && template.Procesando) ? template.Procesando : (typeof template === "string") ? template : baseEnum.Messages.LoadingModal;
		// ngDialog.close();
		// ngDialog.open({
		// 	template: '<h1>' + title + '</h1><p>' + template + '</p>',
		// 	plain: true
		// });
	};

	var _then = function (respuesta, obj, fnSucces, fnError, info, hideProcessing) {
		var data = null;
		if (respuesta != null && respuesta != '') {
			if (respuesta.data === undefined || respuesta.data == '')
				data = (respuesta.d === undefined) ? respuesta : respuesta.d;
			else
				data = (respuesta.data.d === undefined) ? respuesta.data : respuesta.data.d;
		}
		try {
			if (typeof data === 'string' || data instanceof String)
				data = JSON.parse(data);
		}
		catch (_error) {
			console.log('Error JSON.parse(data): ', _error);
			console.log('Error JSON.parse(data): ', data);
			_hideLoading();
		}

		if (Array.isArray(respuesta) || respuesta.xhrStatus == 'complete') {
			if (obj.EnviarAdicional) {
				data = {
					resultado: data,
					obj: obj.datosAdicionales
				}
			} else if (obj.length) {
				angular.forEach(data, function (value, key) {
					value.obj = obj[key];
				});
			}
			if (fnSucces) {
				if (!hideProcessing)
					_hideLoading();
				fnSucces(data);
			} else {
				var tituloPopUp = (info && info.TituloPopUp) ? info.TituloPopUp : baseEnum.Messages.Information;
				var mensajePopUp = (info && info.MensajePopUp) ? info.MensajePopUp : baseEnum.Messages.SuccessProcess;
				_showAlert(tituloPopUp, mensajePopUp);
				_hideLoading();
			}
		} else {
			_hideLoading();
			console.log(baseEnum.Messages.ErrorServer, data, obj, info);
			if (fnError) {
				fnError(data);
			} else {
				_showAlert(baseEnum.Messages.Warning, baseEnum.Messages.ErrorProcess);
			}
		}
	};
	var _catch = function (err, obj, cath, info) {

		_hideLoading();
		console.log(baseEnum.Messages.ErrorService, err, obj, info);
		if (cath)
			cath(err);
		else
			_showAlert(baseEnum.Messages.Error, baseEnum.Messages.ErrorProcess);
	};

	return {
		BaseUrl: function () { return spServicebase.baseUrl },
		objQuery: function () { return Object.cloneObj(spServicebase.objQuery); },
		ExecuteAsync: function (obj, form, info, hideProcessing, onlyOneResponse) {
			var instance = this;
			return new Promise((resolve, reject) => instance.Execute(
				obj,
				response => resolve(response),
				response => reject(response),
				error => {
					console.error(error);
					reject(error);
				},
				form,
				error => {
					console.error(error);
					return reject(error);
				},
				info,
				hideProcessing,
				onlyOneResponse
			));
		},
		Execute: function (obj, fnSucces, fnError, cath, form, cathend, info, hideProcessing, onlyOneResponse) {
			var data = null;
			if (form !== undefined && form != null) {
				if (!form.$valid) {
					_showAlert(baseEnum.Messages.Warning, baseEnum.Messages.FormInvalidate);
					return;
				}
			}
			try {
				if (!hideProcessing) { _showLoading(info); }
				var promises = [];
				if (Array.isArray(obj)) {
					angular.forEach(obj, function (value, key) {
						promises.push(spServicebase.processRequest(value));
					});
				}
				else { promises.push(spServicebase.processRequest(obj)); }

				var index = 0;
				$q.all(promises).then(function (respuesta) {
					if (!onlyOneResponse) {
						angular.forEach(respuesta, function (data2, key) {
							_then(data2,
								Array.isArray(obj) ? obj[key] : obj,
								Array.isArray(fnSucces) ? fnSucces[key] : fnSucces,
								Array.isArray(fnError) ? fnError[key] : fnError,
								info, hideProcessing);
							index++;
						});
					}
					else {
						_then(respuesta, obj, fnSucces, fnError, info, hideProcessing);
					}

				}).catch(function (err) {
					_catch(err, obj, Array.isArray(fnError) ? fnError[index] : fnError, info);
				});
			}
			catch (err) {
				_hideLoading();
				console.log(baseEnum.Messages.Error, err, obj, info);
				if (cathend)
					cathend(err);
				else
					_showAlert(baseEnum.Messages.Error, baseEnum.Messages.Error + err);
			}
			return data;
		},
		showLoading: function () {
			_showLoading();
		},
		hideLoading: function () {
			_hideLoading();
		},
		FindItem: function (items, key, compareValue) {
			var result = null;
			key = key.split(".");
			$.each(items, function (item) {
				var value = item;
				$.each(key, function (item2) {
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
			$.each(items, function (item) {
				if (item[key] == compareValue) {
					result.push(item);
				}
			});
			return result;
		},
		GetBase64Image: function (img) {
			img.setAttribute('crossOrigin', 'anonymous');
			var canvas = document.createElement("canvas");
			canvas.width = img.width;
			canvas.height = img.height;
			var ctx = canvas.getContext("2d");
			ctx.drawImage(img, 0, 0);
			return canvas.toDataURL("image/jpeg");
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
		GetDtOptions2: function ($scope, DTOptionsBuilder, settingskeyQueryExportar, item) {
			var dtOptions = DTOptionsBuilder.newOptions().withOption("sort", [[0, "desc"]]).withOption("className", 'compact');

			if (settingskeyQueryExportar) {
				dtOptions = dtOptions.withButtons([
					{
						extend: 'csv',
						title: 'Reporte',
						text: 'Exportar Todo a Csv',
						className: 'btn btn-default btn-xs',
						action: function (e, dt, button, config) {
							_Exportar(false, settingskeyQueryExportar, item);
						}
					},
					{
						extend: 'excel',
						title: 'Reporte',
						text: 'Exportar Todo a Excel',
						className: 'btn btn-default btn-xs',
						action: function (e, dt, button, config) {
							_Exportar(true, settingskeyQueryExportar, item);
						}
					}
				])
			}
			dtOptions = dtOptions.withLanguage(this.GetLanguage());
			$scope.dtOptions = dtOptions;
			return $scope.dtOptions;
		},
		GetLanguage: function () {
			return {
				"sEmptyTable": "No Hay datos",
				"sInfo": "Registros _START_ de _END_ de un total de _TOTAL_ registros",
				"sInfoEmpty": "Registros 0 de 0 de un total de 0 registros",
				"sInfoFiltered": "(filtered from _MAX_ total entries)",
				"sInfoPostFix": "",
				"sInfoThousands": ",",
				"sLengthMenu": "Mostrando _MENU_ registros",
				"sLoadingRecords": "Cargando...",
				"sProcessing": "Procesando...",
				"sSearch": "Búsqueda Rápida:",
				"sZeroRecords": "No se encontraron registros",
				"oPaginate": {
					"sFirst": "Primera",
					"sLast": "Ultima",
					"sNext": "Siguiente",
					"sPrevious": "Anterior"
				},
				"oAria": {
					"sSortAscending": ": activate to sort column ascending",
					"sSortDescending": ": activate to sort column descending"
				}
			};
		},
		RemoveData: function (data) {
			var obj = {};
			$.each(data, function (index, value) {
				if (typeof (value) == "string" || typeof (value) == "number")
					obj[index] = value;
			});
			return obj;
		},
		FormatDate: function (dateString, formatoSalida) {
			var stringDate = "";
			if (dateString !== null && dateString !== "") {

				if (dateString.length > 10) {
					dateString = dateString.substr(0, 10);
				}

				var arrDate = dateString.split("-");
				var year = arrDate[0];
				var month = arrDate[1];
				var day = arrDate[2];

				switch (formatoSalida) {
					case "yy/mm/dd":
						stringDate = year + "/" + month + "/" + day;
						break;
					case "mm/dd/yy":
						stringDate = month + '/' + day + '/' + year;
						break;
					case "dd/mm/yy":
						stringDate = day + '/' + month + '/' + year;
						break;
					case "yy-mm-dd":
						stringDate = year + "-" + month + "-" + day;
						break;
					case "mm-dd-yy":
						stringDate = month + "-" + day + "-" + year;
						break;
					case "dd-mm-yy":
						stringDate = day + '-' + month + '-' + year;
						break;
				}

				return stringDate;
			}
			else
				return "";
		},
		inicializarDataTable: function(idTabla) {
			// Verifica si la tabla ya tiene DataTable
			var dataTableInstance = $('#' + idTabla).DataTable();
		
			if (dataTableInstance) {
				// Si ya tiene DataTable, destrúyelo
				dataTableInstance.destroy();
			}
		
			// Inicializa DataTable en la tabla
			$('#' + idTabla).DataTable({
				"language": {
					"decimal": ",",
					"thousands": ".",
					"info": "Mostrando registros del _START_ al _END_ de un total de _TOTAL_ registros",
					"infoEmpty": "Mostrando registros del 0 al 0 de un total de 0 registros",
					"infoPostFix": "",
					"infoFiltered": "(filtrado de un total de _MAX_ registros)",
					"loadingRecords": "Cargando...",
					"lengthMenu": "Mostrar _MENU_ registros",
					"paginate": {
						"first": "Primero",
						"last": "Último",
						"next": "Siguiente",
						"previous": "Anterior"
					},
					"processing": "Procesando...",
					"search": "Buscar:",
					"searchPlaceholder": "Término de búsqueda",
					"zeroRecords": "No se encontraron resultados",
					"emptyTable": "Ningún dato disponible en esta tabla",
					"aria": {
						"sortAscending":  ": Activar para ordenar la columna de manera ascendente",
						"sortDescending": ": Activar para ordenar la columna de manera descendente"
					},
					//only works for built-in buttons, not for custom buttons
					"buttons": {
						"create": "Nuevo",
						"edit": "Cambiar",
						"remove": "Borrar",
						"copy": "Copiar",
						"csv": "fichero CSV",
						"excel": "tabla Excel",
						"pdf": "documento PDF",
						"print": "Imprimir",
						"colvis": "Visibilidad columnas",
						"collection": "Colección",
						"upload": "Seleccione fichero...."
					},
					"select": {
						"rows": {
							_: '%d filas seleccionadas',
							0: 'clic fila para seleccionar',
							1: 'una fila seleccionada'
						}
					}
				},
				"paging": true,
				"ordering": true,
				"info": true,
				// Agrega más opciones según tus necesidades
			});
		}
	};
}
//Directiva para subir archivos 
customFileChange.$inject = ["$parse"];
function customFileChange($parse) {
	return {
		restrict: "A",
		link: function (scope, element, attrs) {
			var model = $parse(attrs.customFileChange);
			var modelSetter = model.assign;
			element.bind("change", function () {
				if (element[0].files.length) scope.$apply(function () {
					var reader = new FileReader();
					reader.onload = function (e) {
						var fileModel = {
							fileName: element[0].files[0].name,
							fileAsBuffer: e.target.result
						};
						modelSetter(scope, fileModel);
					}
					reader.onerror = function (e) {
						alert(e.target.error);
					}
					reader.readAsArrayBuffer(element[0].files[0]);
				});
			});
		}
	};
}

function validatextension() {
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
}

requiredFile.$inject = ["$parse"];
function requiredFile($parse) {
	return {
		require: 'ngModel',
		restrict: "A",
		scope: {
			pepe: '@',
		},
		link: function (scope, el, attrs, ngModel) {
			var bool = scope.pepe;
			ngModel.$setValidity('requiredFile', bool);

			//	(el.val() != '' && bool) ? true : false 
			scope.$watch('pepe', function (val) {
				alert('max changed to ' + val);
				bool = val;
			});
			el.bind('change', function () {
				console.log("bool.assign");
				console.log(bool);
				validateRequired(bool)

			});
			function validateRequired(value) {
				ngModel.$setValidity('requiredFile', (value == "True" ? true : false));
				console.log(ngModel)
				scope.$apply(function () {
					ngModel.$setViewValue(el.val());
					ngModel.$render();
				});
			}
		}
	}
}

function RenderAfffterChange() {
	return {
		require: 'ngModel',
		link: function (scope, el, attrs, ngModel) {
			el.bind('change', function () {
				scope.$apply(function () {
					ngModel.$setViewValue(el.val());
					ngModel.$render();
				});
			});
		}
	}
}

function datepicker() {
	return {
		restrict: 'A',
		require: 'ngModel',
		link: function (scope, element, attrs, ngModelCtrl) {
			$(function () {
				element.datepicker({
					dateFormat: 'dd/mm/yy',
					dayNamesMin: ["Do", "Lu", "Ma", "Mi", "Ju", "Vi", "Sa"],
					dayNamesShort: ["Dom", "Lun", "Mar", "Mie", "Jue", "Vie", "Sab"],
					monthNames:
						["Enero", "Febrero", "Marzo", "Abril", "Mayo", "Junio", "Julio",
							"Agosto", "Septiembre", "Octubre", "Noviembre", "Diciembre"],
					monthNamesShort:
						["Ene", "Feb", "Mar", "Abr", "May", "Jun",
							"Jul", "Ago", "Sep", "Oct", "Nov", "Dic"],
					onSelect: function (date) {
						scope.$apply(function () {
							ngModelCtrl.$setViewValue(date);
						});
					}
				});
			});
		}
	}
}

function checkFileSize() {
	return {
		require: 'ngModel',
		link: function (scope, elem, attr, ngModel) {

			var allowedFileSize = parseInt(attr.checkFileSize) * 1E6;

			elem.bind('change', function () {
				if (!elem.val()) {
					ngModel.$setValidity('invalidSize', true);
				} else if (elem[0].files[0].size < allowedFileSize) {
					ngModel.$setValidity('invalidSize', true);
				} else {
					ngModel.$setValidity('invalidSize', false);
				}
				scope.$apply(function () {
					ngModel.$setViewValue(elem.val());
					ngModel.$render();
				});
			})
		}
	}
}

checkDate.$inject = ['$timeout']
function checkDate($timeout) {
	return {
		require: 'ngModel',
		link: function (scope, elem, attr, ngModel) {

			var comparison = true
			elem.bind('change', function () {

				$timeout(function () {
					var dateToValidate = elem[0].value
					if (dateToValidate != "" && dateToValidate != undefined) {
						var toGenerate = new Date()
						var todayDate = new Date(toGenerate.getFullYear(), parseInt(toGenerate.getMonth()), toGenerate.getDate())
						var parsingDate = new Date(dateToValidate.split('-')[2], (parseInt(dateToValidate.split('-')[0]) - 1), dateToValidate.split('-')[1])
						comparison = parsingDate <= todayDate
					}

					ngModel.$setValidity('invalidDate', comparison);
					$timeout(function () {
						scope.$apply(function () {
							ngModel.$render();
						})
					}, 1)
				}, 1)
			})
		}
	}
}
