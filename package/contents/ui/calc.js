function _getSecondsBeetweenDates(firstDate, secondDate) {
    return Math.abs(firstDate.getTime() - secondDate.getTime()) / 1000;
}

function _formatTimeBetweenDates(firstDate, secondDate, eventName) {
    var seconds = _getSecondsBeetweenDates(firstDate, secondDate);

    var days = Math.floor(seconds / (24 * 3600));
    seconds -= days * 24 * 3600;

    var hours = Math.floor(seconds / 3600);

    var formattedString = "";
    if (days > 0) {
        formattedString += i18ncp("Days until event", "one day", "%1 days", days) + " ";
    } if (hours > 0) {
        formattedString += i18ncp("Hours until event", "one hour", "%1 hours", hours) + " ";
    } else {
        formattedString += i18ncp("Happy New Year!");
    }
    formattedString += i18nc("%1 - Event (New Year, Christmas)", "until %1", eventName);
   
    return formattedString;
}

function formatTimeToNewYear() {
    var now = new Date();
    var new_year = new Date(now.getFullYear(), 11, 31, 23, 59, 59);
    return _formatTimeBetweenDates(new_year, now, i18n("New Year"));
}

function formatTimeToCatolicChristmas() {
    var now = new Date();
    var christmas = new Date(now.getFullYear(), 11, 24, 23, 59, 59);
    if (christmas < now)
        christmas.setFullYear(now.getFullYear()+1)
    return _formatTimeBetweenDates(christmas, now, i18n("Catolic Christmas"));
}

function formatTimeToOrthodoxChristmas() {
    var now = new Date();
    var christmas = new Date(now.getFullYear(), 0, 6, 23, 59, 59);
    if (christmas < now)
        christmas.setFullYear(now.getFullYear()+1)
    return _formatTimeBetweenDates(christmas, now, i18n("Orthodox Christmas"));
}
