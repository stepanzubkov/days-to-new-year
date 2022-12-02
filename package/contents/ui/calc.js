function getSecondsToNewYear() {
    var now = new Date();
    var new_year = new Date(now.getFullYear(), 11, 31, 23, 59, 59);
    return (new_year.getTime() - now.getTime()) / 1000;
}

function formatTimeToNewYear() {
    var seconds = getSecondsToNewYear();

    var days = Math.floor(seconds / (24 * 3600));
    seconds -= days * 24 * 3600;

    var hours = Math.floor(seconds / 3600);

    return `${days} days ${hours} hours until New Year`;
}
