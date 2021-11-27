toastr.options = {
  closeButton: true,
  debug: false,
  newestOnTop: true,
  progressBar: true,
  positionClass: "toast-top-center",
  preventDuplicates: false,
  onclick: null,
  showDuration: "300",
  hideDuration: "1000",
  timeOut: "5000",
  extendedTimeOut: "1000",
  showEasing: "swing",
  hideEasing: "linear",
  showMethod: "fadeIn",
  hideMethod: "fadeOut",
};

async function validateUsername() {
  const reg = /^(?![_.])(?!.*[_.]{2})[a-zA-Z0-9._]+(?<![_.])$/;

  const username = document.getElementById("username");
  const classList = username.classList;

  if (!username.value) {
    classList.add("is-invalid");
    return toastr["error"]("username is required", "Error");
  } else {
    classList.remove("is-invalid");
    classList.add("is-valid");
  }

  if (!reg.test(username.value)) {
    classList.add("is-invalid");
    return toastr["error"]("username may only contain [A-Z, a-z, 0-9, _, .], the ending may not be [_ or .]", "Error");
  } else {
    classList.remove("is-invalid");
    classList.add("is-valid");
  }

  if (username.value.length < 3 || username.value.length > 32) {
    classList.add("is-invalid");
    return toastr["error"]("username characters length must be between 3-32", "Error");
  } else {
    classList.remove("is-invalid");
    classList.add("is-valid");
  }

  const check = await fetch("/auth/checkUsername", {
    method: "POST",
    headers: {
      "Content-Type": "application/json",
    },
    body: JSON.stringify({ username: username.value }),
  }).then((res) => res.json());

  if (check.message) {
    classList.classList.add("is-invalid");
    return toastr["error"]("username already exists", "Error");
  } else {
    classList.classList.remove("is-invalid");
    classList.classList.add("is-valid");
  }
}

async function onSubmit(captcha) {
  const username = document.getElementById("username").value;
  const email = document.getElementById("email").value;
  const password = document.getElementById("password").value;

  const result = await fetch("/auth/register", {
    method: "POST",
    headers: {
      "Content-Type": "application/json",
    },
    body: JSON.stringify({
      username,
      email,
      password,
      captcha,
    }),
  }).then((res) => res.json());
  console.log(result);

  if (result.status === 200) {
    // everythign went fine
    alert("Success");
  } else {
    alert(result.message);
  }
}
