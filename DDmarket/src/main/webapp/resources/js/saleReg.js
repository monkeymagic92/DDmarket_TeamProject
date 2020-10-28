
let reader = new FileReader()
reader.onload = function (readerEvent) {
    document.querySelector('.img').setAttribute('src', readerEvent.target.result)
};

document.querySelector('#file').addEventListener('change',  function (changeEvent) {
    let imgFile = changeEvent.target.files[0]
    reader.readAsDataURL(imgFile)
});