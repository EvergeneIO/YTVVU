if (!getCookie("_vr_agree")) {
  Swal.fire({
    backdrop: true,
    title: "I will shake when you click outside!",
    showCancelButton: true,
    confirmButtonText: `Save All`,
    cancelButtonText: `Esential only`,
    allowOutsideClick: () => {
      const popup = Swal.getPopup();
      popup.classList.remove("swal2-show");
      setTimeout(() => {
        popup.classList.add("animate__animated", "animate__headShake");
      });
      setTimeout(() => {
        popup.classList.remove("animate__animated", "animate__headShake");
      }, 500);
      return false;
    },
  }).then((result) => {
    if (result.isConfirmed) {
      setCookie("_vr_agree", "all", 1000 * 60 * 60 * 24 * 365, true);
    } else {
      setCookie("_vr_agree", "essential", 1000 * 60 * 60 * 24 * 365, true);
    }
  });
}

function setCookie(cname, cvalue, ex, first) {
  if (!first) {
    if (getCookie("_vr_agree") === "all") {
      const d = new Date();
      d.setTime(d.getTime() + ex);
      const expires = "expires=" + d.toString();
      document.cookie = cname + "=" + cvalue + ";" + expires + ";path=/";
    }
  } else {
    const d = new Date();
    d.setTime(d.getTime() + ex);
    const expires = "expires=" + d.toString();
    document.cookie = cname + "=" + cvalue + ";" + expires + ";path=/";
  }
}

function getCookie(cname) {
  var name = cname + "=";
  var decodedCookie = decodeURIComponent(document.cookie);
  var ca = decodedCookie.split(";");
  for (var i = 0; i < ca.length; i++) {
    var c = ca[i];
    while (c.charAt(0) == " ") {
      c = c.substring(1);
    }
    if (c.indexOf(name) == 0) {
      return c.substring(name.length, c.length);
    }
  }
  return;
}

function deleteCookie(cname) {
  var d = new Date();
  d.setTime(d.getTime() + 1); // 1/1000 second
  var expires = "expires=" + d.toString();
  //document.cookie = cname + "=1;" + expires + ";path=/";
  document.cookie = cname + "=;expires=Thu, 01 Jan 1970 00:00:00 GMT" + ";path=/";
}

function deleteAllCookie(reload = true) {
  jQuery.each(themeOptionArr, function (optionKey, optionValue) {
    if (optionKey === "token") return;
    deleteCookie(optionKey);
  });
  if (reload) {
    location.reload();
  }
}
