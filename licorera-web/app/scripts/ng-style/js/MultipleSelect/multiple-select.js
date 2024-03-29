angular.module("templates", []).run(["$templateCache", function ($templateCache) { $templateCache.put("multiple-autocomplete-tpl.html", "<div class=\"ng-ms form-item-container\">\n    <ul class=\"list-inline\">\n        <li ng-repeat=\"item in modelArr\">\n			<span ng-if=\"objectProperty == undefined || objectProperty == \'\'\">\n				{{item}} <span class=\"remove\" ng-click=\"removeAddedValues(item)\">\n                <i class=\"glyphicon glyphicon-remove\"></i></span>&nbsp;\n			</span>\n            <span ng-if=\"objectProperty != undefined && objectProperty != \'\'\">\n				{{item[objectProperty]}} <span class=\"remove\" ng-click=\"removeAddedValues(item)\">\n                <i class=\"glyphicon glyphicon-remove\"></i></span>&nbsp;\n			</span>\n        </li>\n        <li>\n            <input name=\"{{name}}\" ng-model=\"inputValue\" placeholder=\"{{placeholder}}\" ng-keydown=\"keyParser($event)\"\n                   err-msg-required=\"{{errMsgRequired}}\"\n                   ng-focus=\"onFocus()\" ng-blur=\"onBlur()\" ng-required=\"!modelArr.length && isRequired\"\n                    ng-change=\"onChange()\">\n        </li>\n    </ul>\n    \n    <div class=\"autocomplete-list\" ng-show=\"isFocused || isHover\" ng-mouseenter=\"onMouseEnter()\" ng-mouseleave=\"onMouseLeave()\">\n        <ul ng-if=\"objectProperty == undefined || objectProperty == \'\'\">\n            <li ng-class=\"{\'autocomplete-active\' : selectedItemIndex == $index}\"\n                ng-repeat=\"suggestion in suggestionsArr | filter : inputValue | filter : alreadyAddedValues\"\n                ng-click=\"onSuggestedItemsClick(suggestion)\" ng-mouseenter=\"mouseEnterOnItem($index)\">\n                {{suggestion}}\n            </li>\n        </ul>\n        <ul ng-if=\"objectProperty != undefined && objectProperty != \'\'\">\n            <li ng-class=\"{\'autocomplete-active\' : selectedItemIndex == $index}\"\n                ng-repeat=\"suggestion in suggestionsArr | filter : inputValue | filter : alreadyAddedValues\"\n                ng-click=\"onSuggestedItemsClick(suggestion)\" ng-mouseenter=\"mouseEnterOnItem($index)\">\n                {{suggestion[objectProperty]}}\n            </li>\n        </ul>\n    </div>\n\n</div>\n"); }]);
(function () {
    //declare all modules and their dependencies.
    angular.module('multipleSelect', [
        'templates'
    ]).config(function () {

    });
}
)();
(function () {

    angular.module('multipleSelect').directive('multipleAutocomplete', [
        '$filter',
        '$http',
        function ($filter, $http) {
            return {
                restrict: 'EA',
                scope: {
                    suggestionsArr: '=?',
                    modelArr: '=ngModel',
                    apiUrl: '@',
                    apiUrlOption: '=?',
                    beforeSelectItem: '=?',
                    afterSelectItem: '=?',
                    beforeRemoveItem: '=?',
                    afterRemoveItem: '=?',
                    closeAfterSelected: '=?',
                    placeholder: '@'
                },
                templateUrl: 'multiple-autocomplete-tpl.html',
                link: function (scope, element, attr) {
                    scope.objectProperty = attr.objectProperty;
                    scope.selectedItemIndex = 0;
                    scope.name = attr.name;
                    scope.isRequired = attr.required;
                    scope.errMsgRequired = attr.errMsgRequired;
                    scope.isHover = false;
                    scope.isFocused = false;
                    scope.placeholder = attr.placeholder;
                    var getSuggestionsList = function () {
                        var url = scope.apiUrl;
                        var method = (scope.apiUrlOption && scope.apiUrlOption.method) || "GET";
                        var responseInterceptor = (scope.apiUrlOption && scope.apiUrlOption.responseInterceptor);
                        $http({
                            method: method,
                            url: url
                        }).then(function (response) {
                            if (responseInterceptor && typeof responseInterceptor == "function") {
                                responseInterceptor(response);
                            }
                            scope.suggestionsArr = response.data;
                        }, function (response) {
                            console.log("*****Angular-multiple-select **** ----- Unable to fetch list");
                        });
                    };

                    if (scope.suggestionsArr == null || scope.suggestionsArr == "") {
                        if (scope.apiUrl != null && scope.apiUrl != "")
                            getSuggestionsList();
                        else {
                            console.log("*****Angular-multiple-select **** ----- Please provide suggestion array list or url");
                        }
                    }

                    if (scope.modelArr == null || scope.modelArr == "") {
                        scope.modelArr = [];
                    }
                    scope.onFocus = function () {
                        scope.isFocused = true
                    };

                    scope.onMouseEnter = function () {
                        scope.isHover = true
                    };

                    scope.onMouseLeave = function () {
                        scope.isHover = false;
                    };

                    scope.onBlur = function () {
                        scope.isFocused = false;
                    };

                    scope.onChange = function () {
                        scope.selectedItemIndex = 0;
                    };

                    scope.keyParser = function ($event) {
                        var keys = {
                            38: 'up',
                            40: 'down',
                            8: 'backspace',
                            13: 'enter',
                            9: 'tab',
                            27: 'esc'
                        };
                        var key = keys[$event.keyCode];
                        var filteredSuggestionArr = [];
                        if (key == 'backspace' && scope.inputValue == "") {
                            if (scope.modelArr.length != 0) {
                                scope.removeAddedValues(scope.modelArr[scope.modelArr.length - 1]);
                            }
                        }
                        else if (key == 'down') {
                            filteredSuggestionArr = $filter('filter')(scope.suggestionsArr, scope.inputValue);
                            filteredSuggestionArr = $filter('filter')(filteredSuggestionArr, scope.alreadyAddedValues);
                            if (scope.selectedItemIndex < filteredSuggestionArr.length - 1)
                                scope.selectedItemIndex++;
                        }
                        else if (key == 'up' && scope.selectedItemIndex > 0) {
                            scope.selectedItemIndex--;
                        }
                        else if (key == 'esc') {
                            scope.isHover = false;
                            scope.isFocused = false;
                        }
                        else if (key == 'enter') {
                            filteredSuggestionArr = $filter('filter')(scope.suggestionsArr, scope.inputValue);
                            filteredSuggestionArr = $filter('filter')(filteredSuggestionArr, scope.alreadyAddedValues);
                            if (scope.selectedItemIndex < filteredSuggestionArr.length)
                                scope.onSuggestedItemsClick(filteredSuggestionArr[scope.selectedItemIndex]);
                        }
                    };

                    scope.onSuggestedItemsClick = function (selectedValue) {
                        if (scope.beforeSelectItem && typeof (scope.beforeSelectItem) == 'function')
                            scope.beforeSelectItem(selectedValue);

                        scope.modelArr.push(selectedValue);

                        if (scope.afterSelectItem && typeof (scope.afterSelectItem) == 'function')
                            scope.afterSelectItem(selectedValue);
                        scope.inputValue = "";

                        if (scope.suggestionsArr.length == scope.modelArr.length || scope.closeAfterSelected === true) {
                            scope.isHover = false;
                        }
                    };

                    var isDuplicate = function (arr, item) {
                        var duplicate = false;
                        if (arr == null || arr == "")
                            return duplicate;

                        for (const i of arr) {
                            duplicate = angular.equals(arr[i] ? arr[i] : i, item);
                            if (duplicate)
                                break;
                        }
                        return duplicate;
                    };

                    scope.alreadyAddedValues = function (item) {
                        var isAdded = true;
                        isAdded = !isDuplicate(scope.modelArr, item);
                        return isAdded;
                    };

                    scope.removeAddedValues = function (item) {
                        if (scope.modelArr != null && scope.modelArr != "") {
                            var itemIndex = scope.modelArr.indexOf(item);
                            if (itemIndex != -1) {
                                if (scope.beforeRemoveItem && typeof (scope.beforeRemoveItem) == 'function')
                                    scope.beforeRemoveItem(item);

                                scope.modelArr.splice(itemIndex, 1);

                                if (scope.afterRemoveItem && typeof (scope.afterRemoveItem) == 'function')
                                    scope.afterRemoveItem(item);
                            }
                        }
                    };

                    scope.mouseEnterOnItem = function (index) {
                        scope.selectedItemIndex = index;
                    };
                }
            };
        }
    ]);
})();