import showPassword from "./utils/show_password";
import validator from "./utils/validator";

toastr.options.closeButton = true;
toastr.options.debug = false;
toastr.options.newestOnTop = true;
toastr.options.progressBar = true;
toastr.options.positionClass = "toast-top-right";
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
//console.log(hcaptcha);

$(window).on("load", function () {
  console.log("AAAAAAA", this.hcaptcha);
  const signupCaptcha = document.getElementById("signupCaptcha");

  console.log(signupCaptcha);

  console.log("Document Content Loaded");
  $("#signupCaptcha").on("opened", (e) => {
    console.log("HCAPTCHA", e);
  });

  $("#signupCaptcha").on("executed", (e) => {
    console.log("HCAPTCHA", e);
  });

  $("input#username,input#email,input#password,input#checkPassword").on("blur", validator);
  $("input#username,input#email,input#password,input#checkPassword").on("blur", () => {
    console.log("BBBBBB", this.hcaptcha);
    console.log(this);
    if (
      $("input#username").hasClass("is-invalid") ||
      $("input#email").hasClass("is-invalid") ||
      $("input#password").hasClass("is-invalid") ||
      $("input#checkPassword").hasClass("is-invalid")
    ) {
      return $("button#submit").addClass("disabled, cursor-not-allowed");
    }
    $("button#submit").removeClass("disabled, cursor-not-allowed");
  });

  $("svg#on,svg#off").on("click", showPassword);
  $("form#form").submit(async (event) => {
    event.preventDefault();
    //so hier überlasse ich dir
    // willst du beim grossen test dabei sein?ig

    return;
    /*     const result = await fetch("/auth/register", {
        method: "POST",
        headers: {
          "Content-Type": "application/json",
        },
        body: JSON.stringify({
          username: $("input#username").val(),
          email: $("input#email").val(),
          password: $("input#password").val(),
        }),
      }).then((res) => res.json());
  
      console.log(result.message);
  
      if (result.status === 200) {
        return window.location.replace("/");
      } else {
        return toastr["error"](result.message, "Error");
      } */
  });
});

//document ready
/* $("document").on("DOMContentLoaded", () => {
  console.log("Document DOM Content Loaded");
}); */
