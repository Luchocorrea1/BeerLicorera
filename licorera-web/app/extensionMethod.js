String.isNullOrEmpty = function (value) {
    return (!value || value == undefined || value == "" || value.length == 0);
}

String.replaceAll = function (str, find, replace) {
    return str ? str.replace(new RegExp(find, 'g'), replace) : '';
}

String.endWith = function (str, find) {
    return find == str.substring(str.length - find.length, str.length);
}

Object.cloneObj = function (obj) {
    var NewObj = Object.assign({}, obj);
    var key, rtn = Object.create(Object.getPrototypeOf(NewObj));
    for (key in NewObj) {
        if (NewObj.hasOwnProperty(key)) {
            rtn[key] = NewObj[key];
        }
    }
    return rtn;
}

Date.prototype.addDays = function (days) {
    var date = new Date(this.valueOf());
    date.setDate(date.getDate() + days);
    return date;
}
Date.prototype.yyyymmdd = function (spearator) {
    var yyyy = this.getFullYear();
    var mm = this.getMonth() < 9 ? "0" + (this.getMonth() + 1) : (this.getMonth() + 1); // getMonth() is zero-based
    var dd = this.getDate() < 10 ? "0" + this.getDate() : this.getDate();
    return "".concat(yyyy).concat(spearator || "-").concat(mm).concat(spearator || "-").concat(dd);
};

Date.prototype.yyyymmddhhmm = function (spearator) {
    var yyyymmdd = this.yyyymmdd(spearator);
    var hh = this.getHours() < 10 ? "0" + this.getHours() : this.getHours();
    var min = this.getMinutes() < 10 ? "0" + this.getMinutes() : this.getMinutes();
    return "".concat(yyyymmdd).concat(" ").concat(hh).concat(":").concat(min);
};

Date.prototype.yyyymmddhhmmss = function (spearator) {
    var yyyymmddhhmm = this.yyyymmddhhmm(spearator);
    var ss = this.getSeconds() < 10 ? "0" + this.getSeconds() : this.getSeconds();
    return "".concat(yyyymmddhhmm).concat(":").concat(ss);
};

var GenerateRandom = function () {
    var array = new Uint32Array(1);
    return self.crypto.getRandomValues(array)[0];
}