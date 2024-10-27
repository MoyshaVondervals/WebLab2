let tableSize = 0;
const possibleR = [1, 1.5, 2, 2.5, 3];

function validateX(Xvalue) {
    return (!Number.isNaN(+Xvalue) && -4<=+Xvalue && +Xvalue<=4 && Xvalue !== '');
}
function validateY(Yvalue) {
    return (!Number.isNaN(+Yvalue) && +Yvalue > -5 && +Yvalue < 3 && Yvalue !== '');
}
function validateR(Rvalue) {
    return (!Number.isNaN(+Rvalue) && possibleR.includes(+Rvalue) && Rvalue !== '')
}

function validateXYR(Xvalue, Yvalue, Rvalue) {
    if (validateX(Xvalue)&&validateY(Yvalue)&&validateR(Rvalue)) {
        console.log('Data valid: ', Xvalue, Yvalue, Rvalue);
        sendRequest(Xvalue, Yvalue, Rvalue).then(() => { dialog('blue', `Данные валидны X:${Xvalue} Y:${Yvalue} R: ${Rvalue}`)});
    } else {
        dialog('red', 'Исправьте значения!');
    }
}

function formHandler() {
    const Xvalue = document.getElementById('Xvalue').value;
    const Yvalue = document.getElementById('Yvalue').value;
    const Rvalue = document.querySelector('input[name="Rvalue"]:checked').value;
    validateXYR(Xvalue, Yvalue, Rvalue);

}

function dialog(color, text) {
    document.getElementById('dialogWindow').innerHTML = text;
    document.getElementById('dialogWindow').style.color = color;
}


async function sendRequest(Xvalue, Yvalue, Rvalue) {
    let data = {
        x: Xvalue,
        y: Yvalue,
        r: Rvalue
    }
    const form = document.createElement("form");
    form.method = "POST";
    form.action = "/web2t-1.0-SNAPSHOT/ControllerServlet"; // Укажите URL вашего сервлета

    Object.entries(data).forEach(([key, value]) => {
        const input = document.createElement("input");
        input.name = key;
        input.value = value;
        form.appendChild(input);
    });
    document.body.appendChild(form);
    form.submit();



    // const url = `/web2t-1.0-SNAPSHOT/ControllerServlet`;
    // console.log(url)


    // fetch(url, {
    //     method: 'POST',
    //     headers: { 'Content-Type': 'application/json' },
    //     body:JSON.stringify({
    //         x: Xvalue,
    //         y: Yvalue,
    //         r: Rvalue
    //     })
    // })
    //
    //     .then((response) => response.json())
    //     .then((data) => {
    //         console.log(data.Etime);
    //         resultTable(data, Xvalue, Yvalue, Rvalue);
    //     })
    //     .catch(() => dialog('red', 'Ошибка на сервере'));
}

// function resultTable(data, Xvalue, Yvalue, Rvalue) {
//     const tableBody = document.getElementById('resultTableBody');
//     const row = tableBody.insertRow(tableSize);
//
//     if (tableSize < 10) {
//         tableSize += 1;
//     } else {
//         document.getElementById('resultTableBody').deleteRow(tableSize - 10);
//     }
//
//     row.insertCell().innerHTML = Xvalue;
//     row.insertCell().innerHTML = Yvalue;
//     row.insertCell().innerHTML = Rvalue;
//     row.insertCell().innerHTML = data.Status;
//     row.insertCell().innerHTML = data.Etime;
//     row.insertCell().innerHTML = data.Ctime;
// }

function svgMousePosition(){

    document.getElementById("ImgBox").addEventListener("click", function (event) {
        let x = event.clientX-this.offsetLeft-12;
        let y = event.clientY-this.offsetTop-218;
        pointTranslator(x, y)
    });
}
function pointTranslator(x, y){
    const Rvalue = document.querySelector('input[name="Rvalue"]:checked').value;
    kx = (x-150)/100*Rvalue
    ky = -(y-150)/100*Rvalue
    console.log(`x: ${kx}  y: ${ky}`);
    validateXYR(kx, ky, Rvalue);
}
