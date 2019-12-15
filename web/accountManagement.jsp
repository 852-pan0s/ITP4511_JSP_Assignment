<%-- 
    Document   : accountManagement
    Created on : 2019年12月15日, 上午10:54:53
    Author     : panos
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">

        <script type="module" src="./js/menu.js"></script>
        <title>Document</title>
        <script>
            $(() = > {
            //Popovers
            $("#menu-img-src").on("mouseenter", () = > {
            $("#menu-img-src").popover('show');
            });
                    $("#menu-img-src").on("mouseleave", () = > {
            $("#menu-img-src").popover('hide');
            });
                    $("#btn-new-menu").on("mouseenter", () = > {
            $("#btn-new-menu").tooltip('show');
            });
                    $("#btn-new-menu").on("mouseleave", () = > {
            $("#btn-new-menu").tooltip('hide');
            });
                    const changeStartEndText = (sText, eText) = > {
            $("#start").text(sText);
                    $("#end").text(eText);
                    $("#menu-special-start_date").attr("placeholder", sText);
                    $("#menu-special-end_date").attr("placeholder", eText);
            }

            showImgPreview = (element) = > {
            $(element).popover('show');
            }

            hideImgPreview = (element) = > {
            $(element).popover('hide');
            }


            if (typeof loadMenu !== "undefined") {
            loadMenu();
            }
            var img_src = "./img/food_drink/";
                    $("#menu-special-type").on("change", (e) = > {
            var selectedOption = $(e.delegateTarget).val();
                    special_option(selectedOption, {
                    sDate: "",
                            eDate: "",
                            season: "Spring"
                    });
                    switch ($("#menu-special-type").val()) {
            case "Special":
                    $("#menu-season").val(null);
                    changeStartEndText("Start Date", "End Date");
                    timePicker.sTime = timePicker.makePicker({
                    picker: timePicker.sTime,
                            element: $("#menu-special-start_date")[0],
                            format: 'DD-MM-YYYY',
                            title: "Start date",
                            headers: true,
                            time: today
                    });
                    timePicker.eTime = timePicker.makePicker({
                    picker: timePicker.eTime,
                            element: $("#menu-special-end_date")[0],
                            format: 'DD-MM-YYYY',
                            title: "End date",
                            headers: true,
                            time: today
                    });
                    break;
                    case "Temporary":
                    $("#menu-season").val(null);
                    changeStartEndText("Start Time", "End Time");
                    timePicker.sTime = timePicker.makePicker({
                    picker: timePicker.sTime,
                            element: $("#menu-special-start_date")[0],
                            format: 'HH:mm',
                            title: "Start Time",
                            headers: true,
                            time: "00:00"
                    });
                    timePicker.eTime = timePicker.makePicker({
                    picker: timePicker.eTime,
                            element: $("#menu-special-end_date")[0],
                            format: 'HH:mm',
                            title: "End Time",
                            headers: true,
                            time: "00:00"
                    });
                    break;
                    case "Season":
                    $("#menu-special-start_date").val(null);
                    $("#menu-special-end_date").val(null);
                    break;
                    default:
                    $("#menu-season").val(null);
                    $("#menu-special-start_date").val(null);
                    $("#menu-special-end_date").val(null);
            }

            });
                    $("#btn-new-set-menu").click(() = > {

            });
                    $("#menu-img-src").on("click", () = > {
            $("#menu-image").click();
            });
                    $("#menu-image").on("change", (e) = > {
            $("#menu-img-src").attr("src", `${img_src}${$(e.delegateTarget).val().substring(12)}`);
                    $("#menu-image").removeClass("is-invalid");
            });
                    const special_option = (type, val) = > {
            switch (type) {
            case "Special":
                    case "Temporary":
                    $(".s-date,.e-date").removeClass("hide");
                    $("#menu-special-start_date").val(val.sDate);
                    $("#menu-special-end_date").val(val.eDate);
                    $(".season").addClass("hide");
                    $("#menu-season").val(null);
                    break;
                    case "Season":
                    $(".s-date,.e-date").addClass("hide");
                    $(".season").removeClass("hide");
                    $("#menu-season").val(val.season);
                    $(".s-date,.e-date").val(null);
                    break;
                    default:
                    $("#menu-special-type").val("none");
                    $(".s-date,.e-date,.season").addClass("hide");
                    $(".s-date,.e-date,.season").val(null)
            }
            }


            $("#btn-new-menu").on("click", () = > {
            $("#menuForm input").val("");
                    $("#menu-special-type>option").removeAttr("selected");
                    $("#menu-show").prop("checked", true);
                    $("#btn-new").text("New");
                    $("#menu-id").val(`m${Object.keys(menu).length + 1}`);
                    $("#new-menu").text("New Menu");
                    $("#btn-new").attr("class", "btn btn-outline-warning");
                    $(".is-invalid").removeClass("is-invalid");
                    $("#menu-special-type").val("none");
                    $(".s-date,.e-date , .season").addClass("hide");
                    $("#menu-img-src").attr('src', './img/upload.png');
                    $("#is-set").prop("checked", false);
                    $("#foodSet").html("");
            });
                    var checkAllData = () = > {
            var input = $("#menuForm input");
                    var special = $("#menu-special-type").val();
                    var isValid = true;
                    $.each(input, (idx, val) = > {
                    switch (special) {
                    case "Special":
                            case "Temporary":
                            if ($(val).attr("id") === "menu-special-season") {
                    return;
                    }
                    break;
                            case "Season":
                            if ($(val).attr("id") === "menu-special-start_date" || $(val).attr(
                                    "id") === "menu-special-end_date") {
                    return;
                    }
                    break;
                            default:
                            if ($(val).attr("id") === "menu-special-start_date" || $(val).attr(
                                    "id") === "menu-special-end_date" || $(val).attr("id") ===
                                    "menu-special-season") {
                    return;
                    }
                    }
                    if (($(val).attr("id") === "menu-image") && $("#btn-new").text() === "Save") {
                    return
                    }
                    if (!(isValid = checkData(val))) {
                    return false;
                    }
                    });
                    return isValid;
            };
                    var checkData = (element) = > {
            var isValid = true
                    if ($(element).attr("type") === "checkbox") {
            return isValid;
            }
            if ($(element).val() === "") {
            $(element).addClass("is-invalid");
                    // console.log(element)
                    isValid = false;
            } else {
            $(element).removeClass("is-invalid");
                    isValid = true;
            }
            return isValid;
            }
            window.selectedRow = null;
                    window.editMenu = (element) = > {
            var i = 0;
                    var column = $(element).parent().siblings();
                    selectedRow = $(element).parent().parent();
                    var type = $(column[4]).text();
                    var special = type.substring(0, type.indexOf(" ("));
                    var special_opt = {};
                    switch (special) {
            case "Special":
                    $("#menu-season").val(null);
                    changeStartEndText("Start Date", "End Date");
                    special_opt = {
                    sDate: type.substring(type.indexOf("(") + 1, type.indexOf(" -")),
                            eDate: type.substring(type.indexOf("- ") + 2, type.indexOf(")")),
                            season: null
                    }
            var sDate = special_opt.sDate === null ? today : special_opt.sDate.replace(/-/g,
                    ' ');
                    var eDate = special_opt.sDate === null ? today : special_opt.eDate.replace(/-/g,
                            ' ');
                    timePicker.sTime = timePicker.makePicker({
                    picker: timePicker.sTime,
                            element: $("#menu-special-start_date")[0],
                            format: 'DD-MM-YYYY',
                            title: "Start date",
                            headers: true,
                            time: sDate
                    });
                    timePicker.eTime = timePicker.makePicker({
                    picker: timePicker.eTime,
                            element: $("#menu-special-end_date")[0],
                            format: 'DD-MM-YYYY',
                            title: "End date",
                            headers: true,
                            time: eDate
                    });
                    break;
                    case "Temporary":
                    changeStartEndText("Start Time", "End Time");
                    $("#menu-season").val(null);
                    special_opt = {
                    sDate: type.substring(type.indexOf("(") + 1, type.indexOf(" -")),
                            eDate: type.substring(type.indexOf("- ") + 2, type.indexOf(")")),
                            season: null
                    }
            var sDate = special_opt.sDate === null ? today : special_opt.sDate.replace(/-/g,
                    ' ');
                    var eDate = special_opt.sDate === null ? today : special_opt.eDate.replace(/-/g,
                            ' ');
                    timePicker.sTime = timePicker.makePicker({
                    picker: timePicker.sTime,
                            element: $("#menu-special-start_date")[0],
                            format: 'HH:mm',
                            title: "Start Time",
                            headers: true,
                            time: sDate
                    });
                    timePicker.eTime = timePicker.makePicker({
                    picker: timePicker.eTime,
                            element: $("#menu-special-end_date")[0],
                            format: 'HH:mm',
                            title: "End Time",
                            headers: true,
                            time: eDate
                    });
                    break;
                    case "Season":
                    $("#menu-special-start_date").val(null);
                    $("#menu-special-end_date").val(null);
                    special_opt = {
                    sDate: null,
                            eDate: null,
                            season: type.substring(type.indexOf("(") + 1, type.indexOf(")")),
                    }
            break;
                    default:
                    $("#menu-season").val(null);
                    $("#menu-special-start_date").val(null);
                    $("#menu-special-end_date").val(null);
                    special_opt = {
                    sDate: null,
                            eDate: null,
                            season: null,
                    }

            }
            special_option(special, special_opt);
                    $.each($("#menu-special-type>option"), (key, values) = > {
                    if ($(values).val() === special) {
                    $("#menu-special-type").val(special)
                            $(values).attr("selected", "");
                    } else {
                    $(values).removeAttr("selected");
                    }
                    });
                    $("#menu-id").val($(column[0]).text());
                    $("#menu-name").val($(column[1]).text());
                    $("#menu-price").val($(column[2]).text().substring(1));
                    $("#menu-img-src").attr("src", `${img_src}${$(column[3]).text()}`);
                    $("#menu-show").prop("checked", $(column[5]).children().prop("checked"));
                    $("#btn-new").text("Save");
                    $("#btn-new").attr("class", "btn btn-outline-success");
                    $("#new-menu").text("Edit Menu");
                    $("#menu-image").removeClass("is-invalid");
                    $("#is-set").prop("checked", false);
                    $("#foodSet").html("");
            }

            window.updateRow = (name, price, img, special, show) = > {
            var id = $($(selectedRow).children()[0]).text();
                    $($(selectedRow).children()[1]).text(name);
                    $($(selectedRow).children()[2]).text(`$${price}`);
                    $($(selectedRow).children()[3]).attr("data-content",
                ` < h6 > Preview: < /h6><hr> <img src='./img / food_drink /${img}' class='preview' >"`)
                    $($(selectedRow).children()[3]).text(img);
                    var special_period = "";
                    switch (special.type) {
            case "Special":
                    case "Temporary":
                    special_period =
                    `${special.type} (${special.start_date} - ${special.end_date})`;
                    break;
                    case "Season":
                    special_period = `${special.type} (${special.season})`;
                    break;
                    default:
                    special_period = `--None--`;
            }
            $($(selectedRow).children()[4]).text(special_period);
                    $($(selectedRow).children()[5]).children().prop("checked", show);
                    showToast(
                            `The information of < span class = "text-danger" > #${id} < /span> menu <span class="text-success">has been updated</span > !`
                            );
                    $("#menu-image").val("");
            }

            window.deleteMenu = (element) = > {
            selectedRow = $(element).parent().parent();
                    var id = $($(selectedRow).children()[0]).text();
                    var column = $(element).parent().siblings();
                    var id = $(column[0]).text();
                    var text = `Are you sure to delete the < span class = "text-danger" > #${id} < /span> menu?`
                    yesNoModal(text, (confirm) = > {
                    if (confirm) {
                    menu[id] = null;
                            saveToMenusSession();
                            $(selectedRow).remove();
                            showToast(
                                    `The < span class = "text-danger" > #${id} < /span> menu <span class="text-success">has been deleted</span > !`
                                    );
                    }
                    });
            }

            //add New Menu
            $("#btn-new").on("click", (e) = > {
            var image = $("#menu-image").val().substring(12);
                    if ($("#menu-image").val() === "" && $(e.delegateTarget).text() === "Save") {
            image = $($(selectedRow).children()[3]).text();
            }
            if (checkAllData()) {
            var id = $("#menu-id").val();
                    var name = $("#menu-name").val();
                    var price = $("#menu-price").val();
                    var show = $("#menu-show").val();
                    var special = {
                    type: $("#menu-special-type").val(),
                            season: $("#menu-season").val(),
                            start_date: $("#menu-special-start_date").val(),
                            end_date: $("#menu-special-end_date").val(),
                    }

            var show = $("#menu-show").prop("checked");
                    menu[id] = {
            id,
                    name,
                    price,
                    image,
                    show,
                    special
            };
                    saveToMenusSession();
                    $("#menuModal").modal("hide");
                    if ($(e.delegateTarget).text() === "Save" && selectedRow !== null) {
            updateRow(name, price, image, special, show);
            } else {
            appendToMenuTable(menu[id]);
                    showToast(
                        `The < span class = "text-danger" > $${id} < /span> menu <span class="text-success">has been added</span > !`
                            );
            }
            }

            });
                    //on key down event
                    $("#menu-name,#menu-price").on("keyup", (e) = > {
            checkData(e.delegateTarget);
            });
                    $("#menu-special-start_date,#menu-special-end_date").on("change", (e) = > {
            checkData(e.delegateTarget);
            });
                    //food set


                    $("#is-set").change(function () {
            if ($(this).prop("checked")) {
            $("#foodSet").html(`
                    < div class = "form-group row" >
                    < div class = "col-sm-1" >
                    < /div>
                    < div class = "col-sm-6" >
                    < select class = "form-control" name = "" id = "" >
                    < option value = "Burger" > Burger < /option>
                    < option value = "Pineapple Burger" > Pineapple Burger < /option>
                    < /select>
                    < /div>
                    < div class = "col-sm-1" >
                    < button class = "btn btn-success" type = "button" onclick = "addOpt();" > < span aria - hidden = "true" > + < /span></button >
                    < /div>
                    < /div>`);
            } else {
            $("#foodSet").html("");
            }
            });
            });
                    var foodOpt = `
                    < div class = "form-group row" >
                    < div class = "col-sm-1" >
                    < button class = "close" type = "button" onclick = "removeOpt(this)" > < span aria - hidden = "true" > & times; < /span></button >
                    < /div>
                    < div class = "col-sm-6" >
                    < select class = "form-control" name = "" id = "" >
                    < option value = "Burger" > Burger < /option>
                    < option value = "Pineapple Burger" > Pineapple Burger < /option>
                    < /select>
                    < /div>
                    < div class = "col-sm-1" >
                    < button class = "btn btn-success" type = "button" onclick = "addOpt();" > < span aria - hidden = "true" > + < /span></button >
                    < /div>
                    < /div>`;
                    var addOpt = () = > {
            $("#foodSet").append(foodOpt);
            };
                    var removeOpt = (element) = > {
            $(element).parent().parent().remove();
            };    </script>
        <style>
            .tr-hover {
                background-color: #ffffff;
                transition: background-color 0.5s;
            }

            .tr-hover:hover {
                background-color: #d8d8d8;
            }

            input::-webkit-outer-spin-button,
            input::-webkit-inner-spin-button {
                /* display: none; <- Crashes Chrome on hover */
                -webkit-appearance: none;
                margin: 0;
                /* <-- Apparently some margin are still there even though it's hidden */
            }

            input[type=number] {
                -moz-appearance: textfield;
                /* Firefox */
            }


            div.jumbotron.jumbotron-fluid {
                background-color: rgb(255, 255, 255);
                box-shadow: none;
                transition: box-shadow 0.25s;
            }

            div.jumbotron.jumbotron-fluid:hover {
                box-shadow: 0px 0px 10px 5px rgb(216, 216, 216);
            }

            #menu-img-src:hover,
            #menu-special-start_date:hover,
            #menu-special-end_date:hover,
            select {
                cursor: pointer;

            }

            #menu-img-src:hover,
            #menu-special-start_date:hover,
            #menu-special-end_date:hover {
                box-shadow: 0px 0px 10px 5px rgb(216, 216, 216);
                transition: box-shadow 0.5s;
            }

            .preview {
                max-height: 200px;
                max-width: 200px;
            }
        </style>
    </head>

    <body onload="">
        <div class="jumbotron jumbotron-fluid">
            <div class="container">
                <h1 class="display-4">Menu Management</h1>
                <p class="lead">You can edit the menu of the restaurant here.</p>
                <hr class="my-4">
                <!-- <form>
                    <div class="form-group row">
                        <label for="res-name" class="col-sm-2 col-form-label">Restaurant Name:</label>
                        <div class="col-sm-6">
                            <input type="text" class="form-control" id="res-name" value="">
                        </div>
                        <button type="button" id="btn-menu-save" class="btn btn-outline-success ">Save</button>
                        <button type="button" id="btn-menu-cancel" class="btn btn-outline-danger ">Cancel</button>
    
                    </div>
                </form> -->
                <!-- <hr class="my-4"> -->
                <a class="btn btn-primary btn-lg" id="btn-new-menu" href="#" role="button" data-toggle="modal"
                   data-target="#menuModal" data-toggle="tooltip" data-placement="right"
                   title="Click to add a new menu.">New Menu</a>
                <!-- <hr class="my-4">
                <a class="btn btn-primary btn-lg" id="btn-new-set-menu" href="#" role="button" data-toggle="modal"
                    data-target="#menuModal" data-toggle="tooltip" data-placement="right"
                    title="Click to add a new food set menu.">New Food Set Menu</a> -->
                <hr class="my-4">
                <table class="table table-hover" id="menu-list">
                    <thead class="thead-dark">
                        <tr>
                            <th scope="col">#</th>
                            <th scope="col">Food/Drink Name</th>
                            <th scope="col">Price</th>
                            <th scope="col">Image</th>
                            <th scope="col">Special Period</th>
                            <th scope="col">Show?</th>
                            <th scope="col">Action</th>
                        </tr>
                    </thead>
                    <tbody id="menu-list">
                    </tbody>
                </table>
            </div>
        </div>

        <!-- New Menu Modal -->
        <div class="modal fade" id="menuModal" tabindex="-1" role="dialog" aria-labelledby="new-menu" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered  " role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="new-menu">New Menu</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <form action="#" method="get" id="menuForm">

                            <!-- image preview -->
                            <div class="form-group row">
                                <div class="col-sm-12 text-center">
                                    <img src="" id="menu-img-src" title="Food/Drink Icon"
                                         style="max-height: 200px;max-width: 200px;" data-placement="bottom"
                                         data-content="Click for upload the food image.">
                                </div>
                            </div>

                            <!-- image -->
                            <div class="form-group row ">
                                <div class="col-sm-12 text-center">
                                    <input type="file" class="form-control hide" name="menu-image" id="menu-image"
                                           placeholder="Name of image(example.jpg)">
                                    <div class="invalid-feedback " id="invalid-image" style="font-size: 16px;">
                                        You need to upload an image for the food/drink.
                                    </div>
                                </div>
                            </div>

                            <div class="form-group row">
                                <label for="menu-id" class="col-sm-4 col-form-label">ID#:</label>
                                <div class="col-sm-2">
                                    <input type="text" class="form-control-plaintext" name="menu-id" id="menu-id"
                                           placeholder="Enter your username" readonly>
                                </div>
                            </div>


                            <!-- Name -->
                            <div class="form-group row">
                                <label for="menu-name" class="col-sm-4 col-form-label">Name:</label>
                                <div class="col-sm-8">
                                    <input type="text" class="form-control" name="menu-name" id="menu-name"
                                           placeholder="Food / drink name">
                                    <div class="invalid-feedback " id="invalid-name">
                                        The name can't be empty.
                                    </div>
                                </div>

                            </div>
                            <!-- price -->
                            <div class="form-group row">
                                <label for="menu-price" class="col-sm-4 col-form-label">Price:</label>
                                <div class="col-sm-8">
                                    <input type="number" class="form-control col-sm-5" name="menu-price" id="menu-price"
                                           placeholder="Food price" min="0">
                                    <div class="invalid-feedback" id="invalid-price">
                                        Price must be entered.
                                    </div>
                                </div>

                            </div>


                            <!-- Special -->
                            <div class="form-group row">
                                <label for="menu-special-type" class="col-sm-4 col-form-label">Special Period:</label>
                                <div class="col-sm-4">
                                    <select class="custom-select" name="menu-special-type" id="menu-special-type">
                                        <option value="none">--None--</option>
                                        <option value="Special">Special</option>
                                        <option value="Temporary">Temporary</option>
                                        <option value="Season">Season</option>
                                    </select>
                                </div>
                            </div>

                            <!-- Season -->
                            <div class="form-group row season ">
                                <label for="menu-special-type" class="col-sm-4 col-form-label">Season:</label>
                                <div class="col-sm-4">
                                    <select class="custom-select" name="menu-season" id="menu-season">
                                        <option value="Spring">Spring</option>
                                        <option value="Summer">Summer</option>
                                        <option value="Autumn">Autumn</option>
                                        <option value="Winter">Winter</option>
                                    </select>
                                </div>
                            </div>

                            <!-- Special start date -->
                            <div class="form-group row s-date hide">
                                <label for="menu-special-start_date" class="col-sm-4 col-form-label" id="start">Start
                                    date:</label>
                                <div class="col-sm-4">
                                    <div class="input-group flex-nowrap">
                                        <input type="text" id="menu-special-start_date" class="form-control"
                                               placeholder="Start date" aria-describedby="addon-wrapping">

                                    </div>
                                </div>
                            </div>

                            <!-- Special end date -->
                            <div class="form-group row e-date hide">
                                <label for="menu-special-end_date" class="col-sm-4 col-form-label" id="end">End
                                    date:</label>
                                <div class="col-sm-4">
                                    <div class="input-group flex-nowrap">
                                        <input type="text" id="menu-special-end_date" class="form-control"
                                               placeholder="End date" aria-describedby="addon-wrapping">
                                    </div>
                                </div>
                            </div>

                            <!-- Show -->
                            <div class="form-group row">
                                <div class="hide" id="editMenuError" style="color: red"></div>
                                <label for="menu-show" class="col-sm-4 col-form-label">Show?</label>
                                <div class="col-sm-1">
                                    <input type="checkbox" class="form-control" name="menu-show" id="menu-show">
                                </div>
                            </div>

                            <!-- Set -->
                            <div class="form-group row">
                                <div class="hide" id="editMenuError" style="color: red"></div>
                                <label for="is-set" class="col-sm-4 col-form-label">Set menu?</label>
                                <div class="col-sm-1">
                                    <input type="checkbox" class="form-control" name="menu-show" id="is-set">
                                </div>
                            </div>


                            <!-- Food set form -->

                            <div id="foodSet">

                            </div>

                            <!-- <button type="button" class="btn btn-outline-primary" id="btn-login">Login</button> -->
                            <div class="modal-footer">
                                <button class="btn btn-primary hide" id="new-loading" type="button" disabled>
                                    <span class="spinner-grow spinner-grow-sm" role="status" aria-hidden="true"></span>
                                    Loading...
                                </button>
                                <button type="button" class="btn btn-outline-warning" id="btn-new">New</button>
                            </div>
                    </div>
                    </form>

                </div>

            </div>
        </div>
        <!-- New Menu Modal -->
    </body>
</html>
