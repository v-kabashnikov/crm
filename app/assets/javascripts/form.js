function checkmail(value) {
    reg = /[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?/; // 'коммент для отображения цветов в сублайм
    if (!value.match(reg)) {
        return false;
    };
    return true;
};

function checkphone(value) {
    var reg = /^[0-9()\-+ ]+$/;
    if (!value.match(reg)) {
        return false;
    };
    return true;
};


function validate_form() {
    s = document.getElementById("order_worktype_id").value;
    if (s == "") {
        document.getElementById("txt1").innerHTML = "<div class='ghost' >Не выбран тип работы </div>";
        return false;
    };

    s = document.getElementById("order_speciality_id").value;
    if (s == "") {
        document.getElementById("txt2").innerHTML = "<div class='ghost' >Не выбран предмет </div>";
        return false;
    };

    s = document.getElementById("order_theme").value;
    if (s == "") {
        document.getElementById("txt3").innerHTML = "<div class='ghost' >Укажите название</div>";
        return false;
    };
    s = document.getElementById("order_client_email").value;
    if (!checkmail(s)) {
        document.getElementById("txt4").innerHTML = "<div class='ghost' >Неверный email</div>";
        return false;
    };

    s = document.getElementById("order_client_phone").value;
    if(!checkphone(s)){
        document.getElementById("txt5").innerHTML = "<div class='ghost' >Неверный телефон</div>";
        return false;
    };
    document.forms.insertForm.submit();
};

function win_close() {
    document.getElementById("txt1").innerHTML = "";
    document.getElementById("txt2").innerHTML = "";
    document.getElementById("txt3").innerHTML = "";
    document.getElementById("txt4").innerHTML = "";
    document.getElementById("txt5").innerHTML = "";
};
