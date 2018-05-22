/**
 * Created by souyouyou on 2018/4/11.
 */

function tab(val) {
    if (val == 1) {
        $("#main-body").load("cisp/members");
    }
    if (val == 2) {
        $("#main-body").load("cisp/qry");
    }
    if (val == 3) {
        $("#main-body").load("cisp/org");
    }
    if (val == 4) {
        $("#main-body").load("info/list");
    }
    if (val == 5) {
        $("#main-body").load("createInformation");
    }
    if (val == 6) {
        $("#main-body").load("createInformation");
    }

    if (val == 7) {
        $("#main-body").load("periodicalList");
    }

    if (val == 8) {
        $("#main-body").load("documentList");
    }

    if (val == 9) {
        $("#main-body").load("driverList");
    }

    if (val == 10) {
        $("#main-body").load("questionList");
    }

}