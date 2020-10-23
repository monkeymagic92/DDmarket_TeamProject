/**
 * 
 */

/* TAP */
var tabList = document.querySelectorAll('.tab_list_wrap .tab_list')

Array.prototype.forEach.call(tabList, function(list) {
    list.children[0].addEventListener('click', function(e) {
            e.preventDefault()
            var tabContent = document.querySelectorAll('.tab_container .tab_content')
            var tabNum = this.parentElement.getAttribute('data-tabnum')

            Array.prototype.forEach.call(tabContent, function(cont, i) {
            cont.style.display = 'none'
            tabList[i].className = 'tab_list'
            })
            
            tabContent[tabNum].style.display = 'flex'
            
            if(list.className.indexOf('tab_active') == -1) {
                list.className = 'tab_list tab_active'
            }
        })
    })

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


function moveToInfo() {
	location.href="/user/info";
}