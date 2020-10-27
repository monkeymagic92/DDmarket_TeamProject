// 슬라이드
var mySwiper = new Swiper('.swiper-container', {

    direction: 'horizontal',
    loop: true,
  
    pagination: {
      el: '.swiper-pagination',
    },
  
    navigation: {
      nextEl: '.swiper-button-next',
      prevEl: '.swiper-button-prev',
    }
  })

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

    // 카테고리 탭메뉴
    var tabList = document.querySelectorAll('.tab_list_wrap .tab_list')

    Array.prototype.forEach.call(tabList, function(list) { /*forEach 사용이 원활히 작동하지 않아 call을 사용 */
        list.children[0].addEventListener('click', function(e) { 
                e.preventDefault() /* a 태그가 이동되는 걸 막아줌 */
                var tabContent = document.querySelectorAll('.tab_container .tab_content')
                var tabNum = this.parentElement.getAttribute('data-tabnum')

                Array.prototype.forEach.call(tabContent, function(cont, i) {
                cont.style.display = 'none'
                tabList[i].className = 'tab_list'
                })
                
                tabContent[tabNum].style.display = 'block'
                
                if(list.className.indexOf('tab_active') == -1) {
                    list.className = 'tab_list tab_active'
                }
            })
        })