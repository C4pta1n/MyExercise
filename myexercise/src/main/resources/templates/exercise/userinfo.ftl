<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport"
          content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no"/>
    <title>个人信息</title>
    <link rel="stylesheet" type="text/css" href="layui/css/layui.css"/>
    <link rel="stylesheet" type="text/css" href="css/index.css"/>
    <link href="https://cdn.bootcss.com/flatpickr/4.5.7/flatpickr.min.css" rel="stylesheet">
    <link rel="stylesheet" href="ImgCropping/css/cropper.min.css">
    <link rel="stylesheet" href="ImgCropping/css/ImgCropping.css">
    <script src="https://cdn.bootcss.com/jquery/3.4.0/jquery.min.js"></script>
    <script src="https://cdn.bootcss.com/flatpickr/4.5.7/flatpickr.min.js"></script>
</head>
<body>
<div class="layui-tab layui-tab-brief">
    <ul class="layui-tab-title">
        <li class="layui-this">修改个人信息</li>
        <li>头像设置</li>
    </ul>
    <div class="layui-tab-content">
        <div class="layui-tab-item layui-show">
            <form class="layui-form" lay-filter="info" style="width: 90%;padding-top: 20px;">
                <div class="layui-form-item">
                    <label class="layui-form-label">用户名：</label>
                    <div class="layui-input-block">
                        <input type="text" name="username" disabled autocomplete="off"
                               class="layui-input layui-disabled"
                               value="${user.baseInfo.account.username!}">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">手机：</label>
                    <div class="layui-input-block">
                        <input type="text" name="tel" disabled autocomplete="off" class="layui-input layui-disabled"
                               value="${user.baseInfo.account.tel!}">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">邮箱：</label>
                    <div class="layui-input-block">
                        <input type="text" name="email" disabled autocomplete="off" class="layui-input layui-disabled"
                               value="${user.baseInfo.account.email!}">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">姓名：</label>
                    <div class="layui-input-block">
                        <input type="text" name="name" required lay-verify="required|name" placeholder="请输入您的姓名"
                               autocomplete="off" class="layui-input" value="${user.baseInfo.name!}">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">性别：</label>
                    <div class="layui-input-block">
                        <input type="radio" name="sex" value="1" title="男" checked="checked">
                        <input type="radio" name="sex" value="2" title="女">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">生日：</label>
                    <div class="layui-input-block">
                        <input type="text" name="birth" lay-verify="required" class="layui-input" id="birth"
                               placeholder="请选择出生日期">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">身高：</label>
                    <div class="layui-input-block">
                        <input type="text" name="height" required lay-verify="required|double" placeholder="CM"
                               autocomplete="off" class="layui-input" value="${user.height!}">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">体重：</label>
                    <div class="layui-input-block">
                        <input type="text" name="weight" required lay-verify="required|double" placeholder="KG"
                               autocomplete="off" class="layui-input" value="${user.weight!}">
                    </div>
                </div>
                <div class="layui-form-item">
                    <div class="layui-input-block">
                        <button class="layui-btn layui-btn-normal" lay-submit lay-filter="adminInfo">确定修改</button>
                    </div>
                </div>
            </form>
        </div>
        <div class="layui-tab-item">
            <div>
                <img id="finalImg" src="${user.baseInfo.icon}" class="layui-nav-img"
                     style="border-radius: 300px 300px;height: 300px;width: 300px;margin: 50px">
                <br>
                <button id="replaceImg" class="l-btn" style="margin-left: 161px;">更换图片</button>
            </div>
            <div style="display: none" class="tailoring-container">
                <div class="black-cloth" onclick="closeTailor(this)"></div>
                <div class="tailoring-content">
                    <div class="tailoring-content-one">
                        <label title="上传图片" for="chooseImg" class="l-btn choose-btn">
                            <input type="file" accept="image/jpg,image/jpeg,image/png" name="file" id="chooseImg"
                                   class="hidden" onchange="selectImg(this)">
                            选择图片
                        </label>
                        <div class="close-tailoring" onclick="closeTailor(this)">×</div>
                    </div>
                    <div class="tailoring-content-two">
                        <div class="tailoring-box-parcel">
                            <img id="tailoringImg">
                        </div>
                        <div class="preview-box-parcel">
                            <p>图片预览：</p>
                            <div class="square previewImg"></div>
                            <div class="circular previewImg"></div>
                        </div>
                    </div>
                    <div class="tailoring-content-three">
                        <button class="l-btn cropper-reset-btn">复位</button>
                        <button class="l-btn cropper-rotate-btn">旋转</button>
                        <button class="l-btn cropper-scaleX-btn">换向</button>
                        <button class="l-btn sureCut" id="sureCut">确定</button>
                    </div>
                </div>
            </div>
        </div>
    </div>

</div>
<script src="layui/layui.js" type="text/javascript" charset="utf-8"></script>
<script src="ImgCropping/js/cropper.min.js"></script>
<script>
    $().ready(function () {
        $("#birth").flatpickr({defaultDate: "${(user.baseInfo.birth?string('yyyy-mm-dd'))!}"});
        if ("" != "${user.baseInfo.sex!}") {
            var sex =${user.baseInfo.sex};
            $("input[name='sex'][value= 1]").prop("checked", sex == 1 ? true : false);
            $("input[name='sex'][value= 2]").prop("checked", sex == 2 ? true : false);
        }
    });
    //Demo
    layui.use(['form', 'element', 'upload'], function () {
        var form = layui.form();
        var element = layui.element();
        form.render();

        form.verify({
            name: function (value, item) {
                if (value.length > 20) {
                    return '姓名长度不能超过20字';
                }
            },
            double: [/^(?=([0-9]{1,10}$|[0-9]{1,7}\.))(0|[1-9][0-9]*)(\.[0-9]{1,2})?$/, '只能输入不超过10位的数字，最多带有2位小数']
        });
        form.on('submit(adminInfo)', function (data) {
            // layer.msg(JSON.stringify(data.field));
            // console.log(data.field);
            $.post("/myexercise/changeInfo",data.field,function (res) {
                if (res == 200) {
                    layer.msg('修改成功',{
                        icon: 1,
                        time: 1500,
                    },function () {
                        window.location.reload();
                    });
                }
            });
            return false;
        });
    });


    //头像上传
    //弹出框水平垂直居中
    (window.onresize = function () {
        var win_height = $(window).height();
        var win_width = $(window).width();
        if (win_width <= 768) {
            $(".tailoring-content").css({
                "top": (win_height - $(".tailoring-content").outerHeight()) / 2,
                "left": 0
            });
        } else {
            $(".tailoring-content").css({
                "top": (win_height - $(".tailoring-content").outerHeight()) / 2,
                "left": (win_width - $(".tailoring-content").outerWidth()) / 2
            });
        }
    })();

    //弹出图片裁剪框
    $("#replaceImg").on("click", function () {
        $(".tailoring-container").toggle();
    });

    //图像上传
    function selectImg(file) {
        if (!file.files || !file.files[0]) {
            return;
        }
        var reader = new FileReader();
        reader.onload = function (evt) {
            var replaceSrc = evt.target.result;
            //更换cropper的图片
            $('#tailoringImg').cropper('replace', replaceSrc, false);//默认false，适应高度，不失真
        }
        reader.readAsDataURL(file.files[0]);
    }

    //cropper图片裁剪
    $('#tailoringImg').cropper({
        aspectRatio: 1 / 1,//默认比例
        preview: '.previewImg',//预览视图
        guides: false,  //裁剪框的虚线(九宫格)
        autoCropArea: 0.5,  //0-1之间的数值，定义自动剪裁区域的大小，默认0.8
        movable: false, //是否允许移动图片
        dragCrop: true,  //是否允许移除当前的剪裁框，并通过拖动来新建一个剪裁框区域
        movable: true,  //是否允许移动剪裁框
        resizable: true,  //是否允许改变裁剪框的大小
        zoomable: false,  //是否允许缩放图片大小
        mouseWheelZoom: false,  //是否允许通过鼠标滚轮来缩放图片
        touchDragZoom: true,  //是否允许通过触摸移动来缩放图片
        rotatable: true,  //是否允许旋转图片
        crop: function (e) {
            // 输出结果数据裁剪图像。
        }
    });
    //旋转
    $(".cropper-rotate-btn").on("click", function () {
        $('#tailoringImg').cropper("rotate", 45);
    });
    //复位
    $(".cropper-reset-btn").on("click", function () {
        $('#tailoringImg').cropper("reset");
    });
    //换向
    var flagX = true;
    $(".cropper-scaleX-btn").on("click", function () {
        if (flagX) {
            $('#tailoringImg').cropper("scaleX", -1);
            flagX = false;
        } else {
            $('#tailoringImg').cropper("scaleX", 1);
            flagX = true;
        }
        flagX != flagX;
    });

    //裁剪后的处理
    $("#sureCut").on("click", function () {
        if ($("#tailoringImg").attr("src") == null) {
            return false;
        } else {
            var cas = $('#tailoringImg').cropper('getCroppedCanvas');//获取被裁剪后的canvas
            var base64url = cas.toDataURL('image/png'); //转换为base64地址形式
            $("#finalImg").prop("src", base64url);//显示为图片的形式

            //上传图片，
            uploadFile(encodeURIComponent(base64url));

            //关闭裁剪框
            closeTailor();
        }
    });

    //关闭裁剪框
    function closeTailor() {
        $(".tailoring-container").toggle();
    }

    //ajax请求上传
    function uploadFile(file) {
        $.ajax({
            url: '/myexercise/upload/icon',
            type: 'POST',
            data: "file=" + file,
            async: true,
            success: function (data) {
                if (data == 200) {
                    layer.msg('修改成功');
                } else if (data == 500) {
                    layer.msg('系统繁忙');
                } else {
                    layer.msg('服务器异常');
                }
            }
        });
    }
</script>
</body>
</html>