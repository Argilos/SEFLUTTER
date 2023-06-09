document.getElementById('barcode-form').addEventListener('submit', function(event) {
    event.preventDefault();
    
    var barcodeInput = document.getElementById('barcode-input');
    var resultDiv = document.getElementById('result');
    
    fetch('http://127.0.0.1:8000/barcode/check-membership/?unique_barcode_id=' + barcodeInput.value)
        .then(function(response) {
            if (!response.ok) {
                throw new Error('Network response was not OK');
            }
            return response.json();
        })
        .then(function(data) {
            if (data.is_member) {
                resultDiv.innerText = 'Član je validan sa tekućom članarinom!';
            } else {
                resultDiv.innerText = 'Član nije validan/istekla članarina!';
            }
        })
        .catch(function(error) {
            resultDiv.innerText = 'Error: ' + error.message;
        });
});

document.getElementById('extend-membership-form').addEventListener('submit', function(event) {
    event.preventDefault();
    
    var barcodeInput = document.getElementById('barcode-input-extend');
    var resultDiv = document.getElementById('result-extend');
    
    fetch('http://127.0.0.1:8000/barcode/extend-membership/?unique_barcode_id=' + barcodeInput.value)
        .then(function(response) {
            if (!response.ok) {
                throw new Error('Error.');
            }
            return response.json();
        })
        .then(function(data) {
            if (data.message === 'Članarina upješno produžena!') {
                resultDiv.innerText = 'Članarina uspješno produžena!';
            } else {
                resultDiv.innerText = 'Članarina nije produžena!';
            }
        })
        .catch(function(error) {
            resultDiv.innerText = 'Error: ' + error.message;
        });
});



