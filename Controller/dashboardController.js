var code = '';
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
    code = getCode(session, semester, section);
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
            option.value = response[i].code; 
            option.text = response[i].name; 
            subjectDropdown.appendChild(option);
        }
    });
}
function submitAttendence(absentRollNos, slotDropdownValue, subjectDropdownValue) {
    var subjectTable = code;

    subjectTable += "_" + subjectDropdownValue;
    var dataComplex = JSON.stringify({
        "absentRollNos":    absentRollNos,
        "slot":             slotDropdownValue,
        "subjectTable":     subjectTable,
        "parentTable":      code
    });
    sendAjaxRequest('submitAttendence', dataComplex, function (response) {
        console.log(response);
        alert("Submitted Successfully");
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
