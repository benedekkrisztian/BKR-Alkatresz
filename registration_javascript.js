function save(event) {
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

    alert("Sikeres regisztráció!");
    console.log({ email, username, password });

    document.getElementById("registration_panel").reset();

    if (clubMember) {
        window.location.href = "club.html";
    } else {
        window.location.href = "fooldal.html";
    }
}
