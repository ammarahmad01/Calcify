function clearScreen() {
    document.getElementById('result').value = '';
}

function deleteChar() {
    let result = document.getElementById('result').value;
    document.getElementById('result').value = result.substring(0, result.length - 1);
}

function append(char) {
    document.getElementById('result').value += char;
}

function calculate() {
    try {
        document.getElementById('result').value = eval(document.getElementById('result').value);
    } catch {
        document.getElementById('result').value = 'Error';
    }
}
