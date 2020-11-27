function SoloNumeros(e) {
    var keynum = window.event ? window.event.keyCode : e.which;
    if ((keynum == 8 || keynum == 48))
        return true;
    if (keynum <= 47 || keynum >= 58) return false;
    return /\d/.test(String.fromCharCode(keynum));
}

function soloLetras(evt) {
    var charCode = (evt.which) ? evt.which : event.keyCode
    if (charCode > 31 && (charCode < 48 || charCode > 64))
        return true;

    return false;
}


function disableEnterKey(e) {
    var key;
    if (window.event) {
        key = window.event.keyCode;
    } else {
        key = e.which;
    }
    if (key == 13) {
        return false;
    } else {
        return true;
    }
}

