﻿
function sendAjaxRequest(action,data, callback) {
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
        xhr.send('action=' + action + '&data=' + data);
    }
function getDashboardData(session, semester, section) {
    var code = getCode(session, semester, section);
    code = "student_" + String(code); 

    sendAjaxRequest('getStudentData',code, function (response) {
        var parsedResponse = JSON.parse(response);
        createTable(parsedResponse);
    });
}
function getSubjectData(semester) {
    sendAjaxRequest('getSubjectData', semester, function (response) {
        response = JSON.parse(response);
        var subjectDropdown = document.getElementById("subjectDropdown");

        subjectDropdown.innerHTML = '';

        var defaultOption = document.createElement("option");
        defaultOption.value = "";
        defaultOption.text = "Select Subject";
        defaultOption.disabled = true;
        defaultOption.selected = true;
        subjectDropdown.appendChild(defaultOption);

        for (var i = 0; i < response.length; i++) {
            var option = document.createElement("option");
            option.value = response[i].code; // Assuming the array items have a 'code' property
            option.text = response[i].name; // Assuming the array items have a 'name' property
            subjectDropdown.appendChild(option);
        }
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