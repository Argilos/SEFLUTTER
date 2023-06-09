document.addEventListener("DOMContentLoaded", function() {
    fetch('http://127.0.0.1:8000/barcode/users/')
      .then(function(response) {
        if (!response.ok) {
          throw new Error('Network response was not OK');
        }
        return response.json();
      })
      .then(function(data) {
        var userTableBody = document.getElementById('user-table-body');
        var users = data.users; // Access the 'users' array from the response
        
        users.forEach(function(user) {
          var row = document.createElement('tr');
          row.innerHTML = `
            <td>${user.unique_barcode_id}</td>
            <td>${user.first_name}</td>
            <td>${user.last_name}</td>
            <td>${user.email}</td>
            <td>${user.membership_length}</td>
          `;
          userTableBody.appendChild(row);
        });
      })
      .catch(function(error) {
        console.error('Error:', error);
      });
  });