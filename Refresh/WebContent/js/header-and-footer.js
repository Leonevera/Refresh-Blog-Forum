function footer_searcher() {
    $.post("www.baidu.com", $('#search').serialize(), function (data) {
        //data中是服务端返回的数据
        //这里进行成功后的渲染。。。。。。
    });
    return false;//在这里返回false
}

function footer_change_img() {
    var a = document.getElementById('footer-wechat');
    a.src = "../image/wechat_2.png";
}
function footer_change_back_img() {
    var a = document.getElementById('footer-wechat');
    a.src = "../image/wechat_1.png";
}