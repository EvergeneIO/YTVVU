import * as toastr from 'toastr';
import * as $ from 'jquery'

toastr.info("Are you sure")

function test() {
    console.log("TEST FUNCTION OWO")
}

$("#username").on("blur", validateUsername);
$("#email").on("blur", validateEmail);
$("#password").on("blur", validatePassword);
$("#checkPassword").on("blur", validateCheckPassword);
$("#showPassword").on("click", showPassword);



export default function getInput(id: string): HTMLInputElement {
    return document.getElementById(id) as HTMLInputElement
}


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

function validateUsername() {
    const regex = /^(?![_.])(?!.*[_.]{2})[a-zA-Z0-9._]+(?<![_.])$/;

    const username = document.getElementById("username") as HTMLInputElement;
    const button = document.getElementById("button").classList;
    const { classList } = username;

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

    const email = document.getElementById("email") as HTMLInputElement;
    const button = document.getElementById("button").classList;
    const { classList } = email;

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
    const password = document.getElementById("password") as HTMLInputElement;
    const button = document.getElementById("button").classList;
    const { classList } = password;

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
    const password = document.getElementById("password") as HTMLInputElement;
    const checkPassword = document.getElementById("checkPassword") as HTMLInputElement;
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
    const password = document.getElementById("password") as HTMLInputElement;
    const checkPassword = document.getElementById("checkPassword") as HTMLInputElement;
    const classList = showPassword.classList;
    const eyeOn = document.getElementById("eyeOn").classList;
    const eyeOff = document.getElementById("eyeOff").classList;

    if (classList.contains("off")) {
        eyeOn.add("hidden");
        eyeOff.remove("hidden");
        classList.remove("off");
        password.type = "text";
        checkPassword.type = "text";
    } else {
        eyeOff.add("hidden");
        eyeOn.remove("hidden");
        classList.add("off");
        password.type = "password";
        checkPassword.type = "password";
    }
}

async function onSubmit(captcha: string) {
    console.log("submit");

    const username = getInput("username");
    const email = document.getElementById("email") as HTMLInputElement;
    const password = getInput("password");



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
