// 헤더 - 카테고리 드랍다운
  function myFunction() {
    document.getElementById("myDropdown").classList.toggle("show");
}

window.onclick = function(event) {

if (!event.target.matches('.dropbtn')) {
    var dropdowns = document.getElementsByClassName("dropdown-content");
    var i;
    for (i = 0; i < dropdowns.length; i++) {
    var openDropdown = dropdowns[i];
    if (openDropdown.classList.contains('show')) {
        openDropdown.classList.remove('show');
    }
    }
}
}

// 헤더 - 카테고리 드랍다운 (shrimp)
function myFunction2() {
    document.getElementById("myDropdown-shrimp").classList.toggle("show");
}

window.onclick = function(event) {

if (!event.target.matches('.dropbtn')) {
    var dropdowns = document.getElementsByClassName("dropdown-content");
    var i;
    for (i = 0; i < dropdowns.length; i++) {
    var openDropdown = dropdowns[i];
    if (openDropdown.classList.contains('show')) {
        openDropdown.classList.remove('show');
    }
    }
}
}

// TOP버튼
let Top = document.querySelector('#TopBtn')

window.addEventListener('scroll', function(){
    if(this.scrollY > 200){
        Top.classList.add('on')
    }else{
        Top.classList.remove('on')
    }
})

Top.addEventListener('click', function(el){
    el.preventDefault()
    window.scrollTo({
        top: 0,
        behavior: 'smooth'
    })
})

// header 스크롤 내릴 시 변경 
    var window = window;
    var header = document.getElementById("header");
    var headerTitle = document.getElementById("header-title");
    var headerBottom = document.getElementById("header-bottom");
    var headerCdShrimp = document.getElementById("header-cd-shrimp");
    var threshold = header.offsetHeight;
    console.log(threshold);

    window.addEventListener("scroll", function(){
        if (this.pageYOffset > threshold) {
            headerBottom.style.opacity = '0';
            headerBottom.style.transition = '0.2s ease-in-out';
            headerBottom.style.height = '0px';
            headerCdShrimp.style.display = 'block';
            header.style.paddingBottom = '30px';
        }
        else{
            headerBottom.style.opacity = '1';
            headerBottom.style.transition = '0.3s ease-in-out';
            headerCdShrimp.style.display = 'none';
        }
    });
