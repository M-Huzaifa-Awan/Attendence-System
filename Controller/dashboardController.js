
function getDashboardData(session, semester, section) {
    var code = getCode(session, semester, section);
    code = "student_" + String(code); 

    function sendAjaxRequest(action, callback) {
        var xhr = new XMLHttpRequest();

        xhr.onreadystatechange = function () {
            if (xhr.readyState == 4) { 
                if (xhr.status == 200) {
                    callback(xhr.responseText);
                } else {
                    alert("Error in AJAX request");
                }
            }
        }

        xhr.open('POST', '../../Controller/dashboardController.php', true);
        xhr.setRequestHeader('Content-type', 'application/x-www-form-urlencoded'); 
        xhr.send('action=' + action + '&code=' + code);
    }

    sendAjaxRequest('getStudentData', function (response) {
        var parsedResponse = JSON.parse(response);
        createTable(parsedResponse);
    });
}

function getCode(session, semester, section) {

    let code = '';

    if (session === 'Morning') {
        code += '1';
    } else {
        code += '2';
    }

    code += semester;

    if (section === 'A') {
        code += '1';
    } else if (section === 'B') {
        code += '2';
    }

    return code;

}
/*if (subject === 'SE') {
        code += '1';
    } else if (subject === 'WP') {
        code += '2';
    } else if (subject === 'Lab-Web Prog') {
        code += '3';
    } else if (subject === 'DM') {
        code += '4';
    } else if (subject === 'AOOP') {
        code += '5';
    } else if (subject === 'Lab-AOOP') {
        code += '6';
    } else if (subject === 'DE') {
        code += '7';
    } else if (subject === 'DAA') {
        code += '8';
    }*/