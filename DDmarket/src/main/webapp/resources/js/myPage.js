/**
 * 
 */



/* modal */
/*
var modal = document.querySelector(".myModal");
var btn = document.querySelector(".review");
var closebtn = document.querySelector(".close");

btn.onclick = function() {
    modal.style.display = "block";
    }

closebtn.onclick = function() {
    var txt = document.querySelector('textarea').value
    if(txt.length == '' || txt.length == 0){
        alert('후기를 작성해 주세요.')
        return false
    }
    if(txt.length != '' || txt.length != 0){
        modal.style.display = "none";
    }
}

window.onclick = function(event) {
    if (event.target == modal) {
        modal.style.display = "none";
        }
    }
*/


function moveToInfo() {
	location.href="/user/info";
}