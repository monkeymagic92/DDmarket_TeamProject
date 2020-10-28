function setPics(event){
        for (const mfile of event.target.files) {
            let reader = new FileReader()
    
            reader.onload = function(event) {
                let imgs = document.createElement('img')
                let div = document.createElement('div')
                let del = document.createElement('span')
                imgs.setAttribute('src', event.target.result)
                div.setAttribute('class', 'div-pic')
                del.setAttribute('class', 'material-icons')
                del.innerText='close'
                let containter = document.querySelector(".pics")
                div.append(del)
                div.append(imgs)
                containter.append(div)
    
            };
            reader.readAsDataURL(mfile)
        }
    }