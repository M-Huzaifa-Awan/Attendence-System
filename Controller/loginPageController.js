function login() {
    // Get input values
    var email = document.getElementById('email').value;
    var password = document.getElementById('pwd').value;

    // Function to send AJAX request
    function sendAjaxRequest(action, data, callback) {
        var xhr = new XMLHttpRequest();

        xhr.onreadystatechange = function () {
            if (xhr.readyState == 4 && xhr.status == 200) {
                callback(xhr.responseText);
            }
        }

        xhr.open('POST', '../../Controller/loginPageController.php', true);
        xhr.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');
        xhr.send('action=' + action + '&email=' + encodeURIComponent(data.email) + '&password=' + encodeURIComponent(data.password));
    }

    // Data to be sent in the AJAX request
    var data = {
        email: email,
        password: password
    };

    // Send AJAX request with login action and data
    sendAjaxRequest('login', data, function (response) {
        // Handle the response from the server
        if (response === 'true') {
            // Redirect to dashboard.html on successful login
            window.location.href = 'dashboard.html';
        }
        else {
            document.querySelector('.wrapper').style.boxShadow ="13px 13px 20px #cbced1, -13px -13px 20px red";
        }
    });
}
