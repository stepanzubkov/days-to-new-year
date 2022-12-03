function _getSecondsBeetweenDates(firstDate, secondDate) {
    return Math.abs(firstDate.getTime() - secondDate.getTime()) / 1000;
}

function _formatTimeBetweenDates(firstDate, secondDate, eventName) {
    var seconds = _getSecondsBeetweenDates(firstDate, secondDate);

    var days = Math.floor(seconds / (24 * 3600));
    seconds -= days * 24 * 3600;

    var hours = Math.floor(seconds / 3600);

    return `${days} ${days == 1 ? "day" : "days"} ${hours} ${hours == 1 ? "hour" : "hours"} until ${eventName}`;
}

function formatTimeToNewYear() {
    var now = new Date();
    var new_year = new Date(now.getFullYear(), 11, 31, 23, 59, 59);
    return _formatTimeBetweenDates(new_year, now, "New Year");
}

function formatTimeToCatolicChristmas() {
    var now = new Date();
    var new_year = new Date(now.getFullYear(), 11, 24, 23, 59, 59);
    return _formatTimeBetweenDates(new_year, now, "Catolic Christmas");
}

function formatTimeToOrthodoxChristmas() {
    var now = new Date();
    var new_year = new Date(now.getFullYear()+1, 0, 6, 23, 59, 59);
    return _formatTimeBetweenDates(new_year, now, "Orthodox Christmas");
}
