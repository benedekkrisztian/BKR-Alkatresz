async function save(event) {
    event.preventDefault();

    const email = document.getElementById("email").value.trim();
    const username = document.getElementById("username").value.trim();
    const password = document.getElementById("password").value.trim();
    const confirm_password = document.getElementById("confirm_password").value.trim();
    const clubMember = document.getElementById("club_member").checked;

    if (!email || !username || !password || !confirm_password) {
        alert("Minden mezőt ki kell tölteni!");
        return;
    }

    if (!email.includes("@")) {
        alert("Érvénytelen email cím!");
        return;
    }

    if (password !== confirm_password) {
        alert("A jelszavak nem egyeznek!");
        return;
    }

    try {
        const response = await fetch("http://localhost:3000/regisztracio", {
            method: "POST",
            headers: {
                "Content-Type": "application/json"
            },
            body: JSON.stringify({
                email: email,
                felhasznalonev: username,
                jelszo: password
            })
        });

        const result = await response.json();

        if (response.ok) {
            alert("Sikeres regisztráció!");
            document.getElementById("registration_panel").reset();
            window.location.href = clubMember ? "club.html" : "homepage.html";
        } else {
            alert("Hiba történt: " + result.error);
        }
    } catch (error) {
        console.error("Hálózati hiba:", error);
        alert("Nem sikerült csatlakozni a szerverhez.");
    }
}
