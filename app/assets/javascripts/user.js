var loadFile = function (event) {
    var output = document.getElementById('output_img_avatar');
    output.src = URL.createObjectURL(event.target.files[0]);
};

$(document).on('change', '#img_btn', loadFile);
