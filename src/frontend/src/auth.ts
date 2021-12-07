import * as $ from 'jquery';
import validator from './utils/validator';

//document ready
$(function () {
    $("input#username,input#email,input#password,input#checkPassword").on("blur", validator)
    $("input#username,input#email,input#password,input#checkPassword").on("blur", () => {
        if ($("input#username").hasClass("is-invalid") || $("input#email").hasClass("is-invalid") || $("input#password").hasClass("is-invalid") || $("input#checkPassword").hasClass("is-invalid")) {
            return $("button#submit").addClass("disabled")
        }
        $("button#submit").removeClass("disabled")
    })

    toastr.options.closeButton = true;
    toastr.options.debug = false;
    toastr.options.newestOnTop = true;
    toastr.options.progressBar = true;
    toastr.options.positionClass = "toast-top-center";
    toastr.options.preventDuplicates = false;
    toastr.options.onclick = null;
    toastr.options.showDuration = 300;
    toastr.options.hideDuration = 1000;
    toastr.options.timeOut = 5000;
    toastr.options.extendedTimeOut = 1000;
    toastr.options.showEasing = "swing";
    toastr.options.hideEasing = "linear";
    toastr.options.showMethod = "fadeIn";
    toastr.options.hideMethod = "fadeOut";
});
