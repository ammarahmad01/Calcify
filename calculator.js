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
        let expression = document.getElementById('result').value;
        let answer = eval(expression);
        document.getElementById('result').value = answer;
        
        // Save to history backend
        if (typeof saveCalculation === 'function') {
            saveCalculation(expression + ' = ' + answer);
        }
    } catch {
        document.getElementById('result').value = 'Error';
    }
}
