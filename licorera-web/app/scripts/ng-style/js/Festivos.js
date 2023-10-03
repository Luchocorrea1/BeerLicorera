/**
 * Modulo que contiene la lógica para obtener los días festivos
 * @module calendar
 * @author Juan Bermudez <juanbermucele@hotmail.com>
 * @since 1.0
 */
var HOLIDAYS = [
    { date: "01/01", nextMonday: false, name: "Año Nuevo" },
    { date: "01/06", nextMonday: true, name: "Día de los Reyes Magos" },
    { date: "03/19", nextMonday: true, name: "Día de San José" },
    { daysToSum: -3, nextMonday: false, name: "Jueves Santo" },
    { daysToSum: -2, nextMonday: false, name: "Viernes Santo" },
    { date: "05/01", nextMonday: false, name: "Día del Trabajo" },
    { daysToSum: 40, nextMonday: true, name: "Ascensión del Señor" },
    { daysToSum: 60, nextMonday: true, name: "Corphus Christi" },
    { daysToSum: 71, nextMonday: true, name: "Sagrado Corazón de Jesús" },
    { date: "06/29", nextMonday: true, name: "San Pedro y San Pablo" },
    { date: "07/20", nextMonday: false, name: "Día de la Independencia" },
    { date: "08/07", nextMonday: false, name: "Batalla de Boyacá" },
    { date: "08/15", nextMonday: true, name: "La Asunción de la Virgen" },
    { date: "10/12", nextMonday: true, name: "Día de la Raza" },
    { date: "11/01", nextMonday: true, name: "Todos los Santos" },
    { date: "11/11", nextMonday: true, name: "Independencia de Cartagena" },
    { date: "12/08", nextMonday: false, name: "Día de la Inmaculada Concepción" },
    { date: "12/25", nextMonday: false, name: "Día de Navidad" }
];

/**
 * @function applyTwoDigits
 * Aplica el formato de dos dígitos a un número menor que diez
 * @author Juan Bermudez <juanbermucele@hotmail.com>
 * @since 1.0
 * @param {number} number 
 * @returns {string} texto formateado
 */
function applyTwoDigits(number) {
    return number < 10 ? "0" + number : number;
}

/**
 * @function formatDate
 * Aplica el formato DD/MM/YYYY a una fecha
 * @author Juan Bermudez <juanbermucele@hotmail.com>
 * @since 1.0
 * @param {Date} date objeto con la fecha a formatear
 * @returns {string} texto de la fecha formateada
 */
function formatDate(date) {
    return applyTwoDigits(date.getDate()) + "/" + applyTwoDigits(date.getMonth() + 1) + "/" + date.getFullYear();
}

/**
 * @function getEasterSunday
 * Algoritmo propuesto por Ian Stewart en 2001 para calcular la fecha
 * exacta del domingo de resurrección/pascua
 * @author Juan Bermudez <juanbermucele@hotmail.com>
 * @since 1.0
 * @param {number} year número del año
 * @returns {Date} Retorna el domingo de resurrección/pascua
 */
function getEasterSunday(year) {
    let a, b, c, d, e, day;
    a = year % 19;
    b = year % 4;
    c = year % 7;
    d = (19 * a + 24) % 30;
    e = (2 * b + 4 * c + 6 * d + 5) % 7;
    day = 22 + d + e;

    if (day >= 1 && day <= 31) {
        return new Date(`03/${applyTwoDigits(day)}/${year}`);
    } else {
        return new Date(`04/${applyTwoDigits(day - 31)}/${year}`);
    }
}

/**
 * @function getNextMonday
 * Calcula el próximo lunes de una fecha dada
 * @author Juan Bermudez <juanbermucele@hotmail.com>
 * @since 1.0
 * @param {Date} date fecha de partida
 * @returns {Date} retorna el próximo lunes a la fecha
 */
function getNextMonday(date) {
    //"console.log("Fecha recibida: " + date.toDateString());
    while (date.getDay() !== 1) {
        date.setDate(date.getDate() + 1);
        //"console.log("New date: " + date);
    }
    return date;
}

/**
 * @function sumDay
 * Suma una cantidad de días a una fecha dada
 * @author Juan Bermudez <juanbermucele@hotmail.com>
 * @since 1.0
 * @param {string} stringDate objeto de la fecha
 * @param {number} dayToSum cantidad de días a sumar
 * @returns {Date} retorna la nueva fecha con los días sumados
 */
function sumDay(stringDate, dayToSum) {
    let date = new Date(stringDate);
    date.setDate(date.getDate() + dayToSum);
    return date;
}

/**
 * @function getHolidaysByYear
 * Calcula y retorna el listado de festivos de un año dado
 * @author Juan Bermudez <juanbermucele@hotmail.com>
 * @since 1.0
 * @param {number} year número del año
 * @returns {Array} Array con todos los festivos del año
 */
function getHolidaysByYear(year) {
    let holidaysArray = [];
    //Obtiene el domingo de pascua para calcular los días litúrgicos
    let easterSunday = getEasterSunday(year);

    HOLIDAYS.forEach(element => {
        let date;
        if (!element.daysToSum) {
            date = new Date(element.date + "/" + year);
        } else {
            date = sumDay(easterSunday.toDateString(), element.daysToSum);
        }

        if (element.nextMonday) {
            date = getNextMonday(date);
        }
        holidaysArray.push({
            date: date,
            name: element.name,
            static: element.nextMonday
        });
    });
    return holidaysArray;
}

function getSaturdayAndSundayByYear(year) {
    var date = new Date(year, 0, 1);
    while (date.getDay() != 0) {
        date.setDate(date.getDate() + 1);
    }
    var days = [];
    while (date.getFullYear() == year) {
        var SunDay = Object.cloneObj({ d: new Date(date.getTime()) })
        days.push(
            SunDay
        );
        date.setDate(date.getDate() - 1);
        var SaturDay = Object.cloneObj({ d: new Date(date.getTime()) })

        days.push(
            SaturDay
        );
        date.setDate(date.getDate() + 8);
    }
    return days;
}

function isHolidayByDay(date) {
    var retorna = false;
    date = new Date(date.setHours(0,0,0,0));
    //"" var year = date.getFullYear();
    // var _holidays = getHolidaysByYear(year);
    // _holidays.forEach(element => {
    // 	if (element.date.getTime() == date.getTime()) {
    // 		retorna = true;
    // 	}
    // });
    var festivos = Enumerable.From(Enumerable.From(getHolidaysByYear(date.getFullYear()).concat(getHolidaysByYear(date.getFullYear() - 1)).concat(getHolidaysByYear(date.getFullYear() + 1)))
        .Select(function (x) { return { d: new Date(x.date.setMinutes(0, 0, 0)).getTime(), background: 'red' } }).ToArray()
        .concat(Enumerable.From(getSaturdayAndSundayByYear(date.getFullYear()).concat(getSaturdayAndSundayByYear(date.getFullYear() - 1)).concat(getSaturdayAndSundayByYear(date.getFullYear() + 1)))
            .Select(function (x) { return { d: new Date(x.d.setMinutes(0, 0, 0)).getTime(), background: "darkgray" } }).ToArray()))
        .Where(function (x) { return x.d == date.getTime() }).ToArray();
    retorna = festivos.length > 0 ? true : false;
    return retorna;
}

function EsFestivo(date) {
    var retorna = false;
    date = new Date(date.setMinutes(0, 0, 0));
    var festivos = Enumerable.From(Enumerable.From(getHolidaysByYear(date.getFullYear()).concat(getHolidaysByYear(date.getFullYear() - 1)).concat(getHolidaysByYear(date.getFullYear() + 1)))
        .Select(function (x) { return { d: new Date(x.date.setMinutes(0, 0, 0)).getTime(), background: 'red' } }).ToArray())
        .Where(function (x) { return x.d == date.getTime() }).ToArray();
    retorna = festivos.length > 0 ? true : false;
    return retorna;
}

function EsFinSemana(date) {
    var retorna = false;
    date = new Date(date.setMinutes(0, 0, 0));
    var festivos = Enumerable.From(Enumerable.From(getSaturdayAndSundayByYear(date.getFullYear()).concat(getSaturdayAndSundayByYear(date.getFullYear() - 1)).concat(getSaturdayAndSundayByYear(date.getFullYear() + 1)))
        .Select(function (x) { return { d: new Date(x.d.setMinutes(0, 0, 0)).getTime(), background: "darkgray" } }).ToArray())
        .Where(function (x) { return x.d == date.getTime() }).ToArray();
    retorna = festivos.length > 0 ? true : false;
    return retorna;

}

/**
 * @function getHolidaysByYear
 * Calcula todos los días festivos de un rango de años
 * @author Juan Bermudez <juanbermucele@hotmail.com>
 * @since 1.0
 * @param {*} initialYear año de inicio del rango
 * @param {*} finalYear año final del rango
 * @returns {Array} Array con todos los festivos del año
 */
function getHolidaysByYearInterval(initialYear, finalYear) {
    let holidaysArray = [];
    //Obtiene el domingo de pascua para calcular los días litúrgicos
    for (let i = initialYear; i <= finalYear; i++) {
        let year = {
            year: i,
            holidays: []
        };
        let easterSunday = getEasterSunday(i);

        HOLIDAYS.forEach(element => {
            let date;
            if (!element.daysToSum) {
                date = new Date(element.date + "/" + i);
            } else {
                date = sumDay(easterSunday.toDateString(), element.daysToSum);
            }

            if (element.nextMonday) {
                date = getNextMonday(date);
            }
            year.holidays.push({
                date: formatDate(date),
                name: element.name,
                static: element.nextMonday
            });
        });
        holidaysArray.push(year);
    }
    return holidaysArray;
}