var modal = document.getElementById("myModal");
var btn = document.getElementById("loginBtn");
var account = document.getElementById('myaccount');

var span = document.getElementsByClassName("close")[0];

if (document.querySelector('#loginBtn')) {
  if (btn) {
    btn.onclick = function() {
      modal.style.display = "block";
    }
  }

  if (account) {
    account.onclick = function() {
      modal.style.display = "block";
    }
  }

  span.onclick = function() {
    modal.style.display = "none";
  }

  window.onclick = function(event) {
    if (event.target == modal) {
      modal.style.display = "none";
    }
  }
}