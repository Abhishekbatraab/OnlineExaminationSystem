/**
 *Timer 
 */



function startTimer(duration, display, timedisplay) {
    var timer = duration, minutes, seconds;
    setInterval(function () {
        minutes = parseInt(timer / 60, 10)
        seconds = parseInt(timer % 60, 10);

        minutes = minutes < 10 ? "0" + minutes : minutes;
        seconds = seconds < 10 ? "0" + seconds : seconds;

        display.textContent = minutes + ":" + seconds;

        if (--timer < 0) {
            //timer = ;
            timedisplay.textContent="Time out";
            var button = document.getElementById('submitButton');
            button.form.submit();
        }
    }, 1000);
}

window.onload = function () {
	var fiveMinutes = 60 * 1,
    display = document.querySelector('#time'),
    timedisplay = document.querySelector('#showtime');
    startTimer(fiveMinutes, display,timedisplay);
};