async function getDashboardData(session, semester, section, subject) {

    const code = getCode(session, semester, section, subject);

    const data = await fetch('/dashboardController.php', {
        method: 'POST',
        body: JSON.stringify({ code })
    });

    return await data.json();

}
function getCode(session, semester, section, subject) {

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

    if (subject === 'SE') {
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
    }

    return code;

}