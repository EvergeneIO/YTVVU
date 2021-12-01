/* toastr.options = {
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

function validateUsername() {
    const regex = /^(?![_.])(?!.*[_.]{2})[a-zA-Z0-9._]+(?<![_.])$/;

    const username: HTMLInputElement = document.getElementById("username");
    const button = document.getElementById("button").classList;
    const classList = username.classList;

    if (!username.value) {
        button.add("disabled");
        classList.add("is-invalid");
        return toastr["error"]("username is required", "Error");
    }

    if ((typeof username.value !== "string") || !regex.test(username.value)) {
        button.add("disabled");
        classList.add("is-invalid");
        return toastr["error"]("username may only contain [A-Z, a-z, 0-9, _, .], the ending may not be [_ or .]", "Error");
    }

    if (username.value.length < 3 || username.value.length > 32) {
        button.add("disabled");
        classList.add("is-invalid");
        return toastr["error"]("username characters length must be between 3-32", "Error");
    }

    button.remove("disabled");
    classList.remove("is-invalid");
    classList.add("is-valid");

}

function validateEmail() {
    const regex =
        /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;

    const email = document.getElementById("email");
    const button = document.getElementById("button").classList;
    const classList = email.classList;

    if (!email.value) {
        button.add("disabled");
        classList.add("is-invalid");
        return toastr["error"]("email is required", "Error");
    }

    if (typeof email.value !== "string" || !regex.test(email.value.toLowerCase())) {
        button.add("disabled");
        classList.add("is-invalid");
        return toastr["error"]("email is not a valid email", "Error");
    }

    button.remove("disabled");
    classList.remove("is-invalid");
    classList.add("is-valid");

    return;
}

function validatePassword() {
    const password = document.getElementById("password");
    const button = document.getElementById("button").classList;
    const classList = password.classList;

    if (!password.value) {
        button.add("disabled");
        classList.add("is-invalid");
        return toastr["error"]("password is required", "Error");
    }

    if (typeof password.value !== "string") {
        button.add("disabled");
        classList.add("is-invalid");
        return toastr["error"]("password must have a type of 'string'", "Error");
    }

    if (password.value.length < 8 || password.value.length > 63) {
        button.add("disabled");
        classList.add("is-invalid");
        return toastr["error"]("password characters length must be between 8-63", "Error");
    }

    button.remove("disabled");
    classList.remove("is-invalid");
    classList.add("is-valid");

    return;
}

function validateCheckPassword() {
    const password = document.getElementById("password");
    const checkPassword = document.getElementById("checkPassword");
    const button = document.getElementById("button").classList;
    const classList = checkPassword.classList;
    const pClassList = password.classList;

    if (!checkPassword.value || typeof checkPassword.value !== "string" || checkPassword.value !== password.value) {
        button.add("disabled");
        classList.add("is-invalid");
        pClassList.add("is-invalid");
        return toastr["error"]("password's doesnt match", "Error");
    }

    button.remove("disabled");
    classList.remove("is-invalid");
    classList.add("is-valid");
    pClassList.remove("is-invalid");
    pClassList.add("is-valid");

    return;
}

function checkAll() {
    validateUsername();
    validateEmail();
    validatePassword();
    validateCheckPassword();
}

function showPassword() {
    const showPassword = document.getElementById("showPassword");
    const password = document.getElementById("password");
    const checkPassword = document.getElementById("checkPassword");
    const classList = showPassword.classList;
    const eyeOn = document.getElementById("eyeOn").classList;
    const eyeOff = document.getElementById("eyeOff").classList;
    const eyeOnP = document.getElementById("eyeOnP").classList;
    const eyeOffP = document.getElementById("eyeOffP").classList;

    if (classList.contains("off")) {
        eyeOn.add("hidden");
        eyeOff.remove("hidden");
        eyeOnP.add("hidden");
        eyeOffP.remove("hidden");
        classList.remove("off");
        password.type = "text";
        checkPassword.type = "text";
    } else {
        eyeOff.add("hidden");
        eyeOn.remove("hidden");
        eyeOffP.add("hidden");
        eyeOnP.remove("hidden");
        classList.add("off");
        password.type = "password";
        checkPassword.type = "password";
    }
}

async function onSubmit(captcha: string) {
    console.log("submit");

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

    console.log(result.staus === 200);

    if (result.status === 200) {
        return window.location.replace("/");
    } else {
        return toastr["error"](result.message, "Error");
    }
}
 */