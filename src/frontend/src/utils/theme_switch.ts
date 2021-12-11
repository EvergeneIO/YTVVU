export default function themeSwitcher(this: JQuery<Document>) {
  if ($(this).attr("id") === "sun") {
    $(this).hide();
    $("svg#moon").show();
    $("body").toggleClass("theme-dark");
  } else {
    $(this).hide();
    $("svg#sun").show();
    $("body").toggleClass("theme-dark");
  }
}
