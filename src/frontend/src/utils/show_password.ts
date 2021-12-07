export default function showPassword(this: JQuery<HTMLElement>) {
  if ($(this).attr("id") === "on") {
    $(this).hide();
    $("svg#off").show();
  } else {
    $(this).hide();
    $("svg#on").show();
  }
  $("input#password").attr("type", $("input#password").attr("type") === "password" ? "text" : "password");
}
