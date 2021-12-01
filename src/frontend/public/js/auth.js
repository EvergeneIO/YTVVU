var __awaiter = (this && this.__awaiter) || function (thisArg, _arguments, P, generator) {
    function adopt(value) { return value instanceof P ? value : new P(function (resolve) { resolve(value); }); }
    return new (P || (P = Promise))(function (resolve, reject) {
        function fulfilled(value) { try { step(generator.next(value)); } catch (e) { reject(e); } }
        function rejected(value) { try { step(generator["throw"](value)); } catch (e) { reject(e); } }
        function step(result) { result.done ? resolve(result.value) : adopt(result.value).then(fulfilled, rejected); }
        step((generator = generator.apply(thisArg, _arguments || [])).next());
    });
};
var __generator = (this && this.__generator) || function (thisArg, body) {
    var _ = { label: 0, sent: function () { if (t[0] & 1) throw t[1]; return t[1]; }, trys: [], ops: [] }, f, y, t, g;
    return g = { next: verb(0), "throw": verb(1), "return": verb(2) }, typeof Symbol === "function" && (g[Symbol.iterator] = function () { return this; }), g;
    function verb(n) { return function (v) { return step([n, v]); }; }
    function step(op) {
        if (f) throw new TypeError("Generator is already executing.");
        while (_) try {
            if (f = 1, y && (t = op[0] & 2 ? y["return"] : op[0] ? y["throw"] || ((t = y["return"]) && t.call(y), 0) : y.next) && !(t = t.call(y, op[1])).done) return t;
            if (y = 0, t) op = [op[0] & 2, t.value];
            switch (op[0]) {
                case 0: case 1: t = op; break;
                case 4: _.label++; return { value: op[1], done: false };
                case 5: _.label++; y = op[1]; op = [0]; continue;
                case 7: op = _.ops.pop(); _.trys.pop(); continue;
                default:
                    if (!(t = _.trys, t = t.length > 0 && t[t.length - 1]) && (op[0] === 6 || op[0] === 2)) { _ = 0; continue; }
                    if (op[0] === 3 && (!t || (op[1] > t[0] && op[1] < t[3]))) { _.label = op[1]; break; }
                    if (op[0] === 6 && _.label < t[1]) { _.label = t[1]; t = op; break; }
                    if (t && _.label < t[2]) { _.label = t[2]; _.ops.push(op); break; }
                    if (t[2]) _.ops.pop();
                    _.trys.pop(); continue;
            }
            op = body.call(thisArg, _);
        } catch (e) { op = [6, e]; y = 0; } finally { f = t = 0; }
        if (op[0] & 5) throw op[1]; return { value: op[0] ? op[1] : void 0, done: true };
    }
};
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
    hideMethod: "fadeOut"
};
function validateUsername() {
    var regex = /^(?![_.])(?!.*[_.]{2})[a-zA-Z0-9._]+(?<![_.])$/;
    var username = document.getElementById("username");
    var button = document.getElementById("button").classList;
    var classList = username.classList;
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
    return;
}
function validateEmail() {
    var regex = /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
    var email = document.getElementById("email");
    var button = document.getElementById("button").classList;
    var classList = email.classList;
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
    var password = document.getElementById("password");
    var button = document.getElementById("button").classList;
    var classList = password.classList;
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
    var password = document.getElementById("password");
    var checkPassword = document.getElementById("checkPassword");
    var button = document.getElementById("button").classList;
    var classList = checkPassword.classList;
    var pClassList = password.classList;
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
    var showPassword = document.getElementById("showPassword");
    var password = document.getElementById("password");
    var checkPassword = document.getElementById("checkPassword");
    var classList = showPassword.classList;
    var eyeOn = document.getElementById("eyeOn").classList;
    var eyeOff = document.getElementById("eyeOff").classList;
    var eyeOnP = document.getElementById("eyeOnP").classList;
    var eyeOffP = document.getElementById("eyeOffP").classList;
    if (classList.contains("off")) {
        eyeOn.add("hidden");
        eyeOff.remove("hidden");
        eyeOnP.add("hidden");
        eyeOffP.remove("hidden");
        classList.remove("off");
        password.type = "text";
        checkPassword.type = "text";
    }
    else {
        eyeOff.add("hidden");
        eyeOn.remove("hidden");
        eyeOffP.add("hidden");
        eyeOnP.remove("hidden");
        classList.add("off");
        password.type = "password";
        checkPassword.type = "password";
    }
}
function onSubmit(captcha) {
    return __awaiter(this, void 0, void 0, function () {
        var username, email, password, result;
        return __generator(this, function (_a) {
            switch (_a.label) {
                case 0:
                    console.log("submit");
                    username = document.getElementById("username").value;
                    email = document.getElementById("email").value;
                    password = document.getElementById("password").value;
                    return [4 /*yield*/, fetch("/auth/register", {
                        method: "POST",
                        headers: {
                            "Content-Type": "application/json"
                        },
                        body: JSON.stringify({
                            username: username,
                            email: email,
                            password: password,
                            captcha: captcha
                        })
                    }).then(function (res) { return res.json(); })];
                case 1:
                    result = _a.sent();
                    console.log(result.staus === 200);
                    if (result.status === 200) {
                        return [2 /*return*/, window.location.replace("/")];
                    }
                    else {
                        return [2 /*return*/, toastr["error"](result.message, "Error")];
                    }
                    return [2 /*return*/];
            }
        });
    });
}
