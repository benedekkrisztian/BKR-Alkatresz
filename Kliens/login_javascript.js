async function login(event) {
    event.preventDefault();

    const email = document.getElementById("email").value.trim();
    const password = document.getElementById("password").value.trim();
    const loginButton = document.getElementById("login_button");

    if (!email || !password) {
        alert("Minden mezőt ki kell tölteni!");
        return;
    }

    if (!email.includes("@")) {
        alert("Érvénytelen e-mail cím!");
        return;
    }

    loginButton.innerHTML = "Kérjük várjon...";
    loginButton.disabled = true;

    try {
        const response = await fetch("http://localhost:3000/bejelentkezes", {
            method: "POST",
            headers: {
                "Content-Type": "application/json"
            },
            body: JSON.stringify({ email, jelszo: password })
        });

        const result = await response.json();

        if (response.ok) {
            localStorage.setItem("token", result.token);
            alert("Sikeres bejelentkezés!");
            window.location.href = "homepage.html";
        } else {
            alert(result.error);
        }
    } catch (error) {
        console.error("Hálózati hiba:", error);
        alert("Nem sikerült csatlakozni a szerverhez.");
    } finally {
        loginButton.innerHTML = "Bejelentkezés";
        loginButton.disabled = false;
    }
}


document.addEventListener("DOMContentLoaded", function () {
    const form = document.getElementById("login_panel");
    if (form) {
        form.addEventListener("submit", login);
    }
});

async function fetchProfile() {
    try {
        const token = localStorage.getItem("token");

        if (!token) {
            throw new Error("Access denied.");
        }

        const response = await fetch("http://localhost:3000/profile", {
            headers: {
                "Content-Type": "application/json",
                "Authorization": `Bearer ${token}`
            }
        });

        if (!response.ok) {
            throw new Error("Failed to get username.");
        }

        const data = await response.json();

        console.log(data);

        alert(data.username);
    } catch (err) {
        console.error(err);
        alert(err.message);
    }
}

document.addEventListener("DOMContentLoaded", async function () {
    const userMenu = document.getElementById("user-menu");
    const token = localStorage.getItem("token");

    if (token) {
        try {
            const response = await fetch("http://localhost:3000/profile", {
                headers: {
                    "Content-Type": "application/json",
                    "Authorization": `Bearer ${token}`
                }
            });

            if (response.ok) {
                const data = await response.json();
                userMenu.innerHTML = `<a class="nav-link active" href="profile.html">${data.username}</a>`;
            } else {
                throw new Error("Felhasználónév betöltése sikertelen.");
            }
        } catch (error) {
            console.error(error);
        }
    }
});

