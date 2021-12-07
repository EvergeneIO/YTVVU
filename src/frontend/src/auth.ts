import * as $ from "jquery";
import showPassword from "./utils/show_password";
import validator from "./utils/validator";

//document ready
$(function () {
  $("input#username,input#email,input#password,input#checkPassword").on("blur", validator);
  $("input#username,input#email,input#password,input#checkPassword").on("blur", () => {
    if (
      $("input#username").hasClass("is-invalid") ||
      $("input#email").hasClass("is-invalid") ||
      $("input#password").hasClass("is-invalid") ||
      $("input#checkPassword").hasClass("is-invalid")
    ) {
      return $("button#submit").addClass("disabled");
    }
    $("button#submit").removeClass("disabled");
  });

  $("svg#on,svg#off").on("click", showPassword);
});
