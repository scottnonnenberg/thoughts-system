
var path = require('path');
var moment = require('moment');

exports.defaultDate = function defaultDate() {
  var date = new Date();
  var year = date.getFullYear();

  year -= 1;

  return exports.setYear(date, year);
};

exports.dayOfWeek = function dayOfWeek(date) {
  return moment(date).format('dddd');
};

exports.timePadded = function timePadded(date) {
  return moment(date).format('hh:mma');
};

exports.shortDate = function shortDate(date) {
  var now = new Date();

  if (date.getFullYear() === now.getFullYear()) {
    return moment(date).format('MMM D');
  }
  else {
    return moment(date).format('MMM D YYYY');
  }
};

exports.longTime = function longTime(date) {
  var now = new Date();

  if (date.getFullYear() === now.getFullYear()) {
    return moment(date).format('dddd MMM D [at] h:mma');
  }
  else {
    return moment(date).format('dddd MMM D YYYY [at] h:mma');
  }
};

exports.dayOfWeek = function dayOfWeek(date) {
  return moment(date).format('dddd');
};

exports.addPadding = function addPadding(number, digits) {
  var result = parseInt(number, 10).toString();
  if (result.length >= digits) {
    return result;
  }
  for (var i = result.length + 1; i <= digits; i += 1) {
    result = '0' + result;
  }
  return result;
};

exports.DAY_IN_MIL = 1000 * 60 * 60 * 24;
exports.DAYS_LOOKUP = {
  sunday: 0,
  monday: 1,
  tuesday: 2,
  wednesday: 3,
  thursday: 4,
  friday: 5,
  saturday: 6
};

exports.searchDay = function searchDay(direction, day, timezone, date) {
  var targetIndex = exports.DAYS_LOOKUP[day.toLowerCase()];
  if (!targetIndex && targetIndex !== 0) {
    return null;
  }

  while (date.getDay() !== targetIndex) {
    date = new Date(direction * exports.DAY_IN_MIL + date.getTime());
  }

  return date;
};

exports.monthNames = [
 'January',
 'February',
 'March',
 'April',
 'May',
 'June',
 'July',
 'August',
 'September',
 'October',
 'November',
 'December'
];

exports.getDateComponents = function getDateComponents(date) {
  var year = date.getFullYear();
  var monthNumber = date.getMonth();
  var month = exports.monthNames[monthNumber++];

  var monthPadded = exports.addPadding(monthNumber, 2);
  var day = date.getDate();
  var dayPadded = exports.addPadding(day, 2);

  return {
    year: year,
    month: month,
    monthNumber: monthNumber,
    monthPadded: monthPadded,
    day: day,
    dayPadded: dayPadded
  };
};

exports.getPath = function getPath(date) {
  var c = exports.getDateComponents(date);
  var month = c.monthPadded + '_' + c.month;
  var file = c.year + c.monthPadded + c.dayPadded + '.txt';

  return path.join(c.year.toString(), month, file);
};

exports.getLogPath = function getLogPath(date) {
  var c = exports.getDateComponents(date);
  var month = c.monthPadded + '_' + c.month;
  var file = c.year + c.monthPadded + c.dayPadded + 'log.txt';

  return path.join(c.year.toString(), month, file);
};

exports.getWeekPath = function getWeekPath(date) {
  date = exports.searchDay(-1, 'Monday', null, date);

  var c = exports.getDateComponents(date);
  var month = c.monthPadded + '_' + c.month;
  var file = c.year + c.monthPadded + c.dayPadded + 'week.txt';

  return path.join(c.year.toString(), month, file);
};

exports.getMonthPath = function getMonthPath(date) {
  var c = exports.getDateComponents(date);
  var month = c.monthPadded + '_' + c.month;
  var file = c.year + c.monthPadded + 'review.txt';

  return path.join(c.year.toString(), month, file);
};

exports.setYear = function setYear(date, year) {
  return new Date(year, date.getMonth(), date.getDate());
};

exports.incrementDay = function incrementDay(date, days) {
  return new Date(days * exports.DAY_IN_MIL + date.getTime());
};
