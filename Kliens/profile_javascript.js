document.getElementById("update-form").addEventListener("submit", async function (event) {
    event.preventDefault();

    const email = document.getElementById("email").value;
    const password = document.getElementById("password").value;
    const token = localStorage.getItem("token");

    if (!token) {
        alert("Hiba: Hitelesítés szükséges.");
        return;
    }

    try {
        const response = await fetch("http://localhost:3000/felhasznalomodosit", {
            method: "PUT",
            headers: {
                "Content-Type": "application/json",
                "Authorization": `Bearer ${token}`
            },
            body: JSON.stringify({ email, jelszo: password })
        });

        const data = await response.json();

        if (response.ok) {
            alert("A felhasználó adatai sikeresen frissítve.");
        } else {
            alert(`A felhasználói adatok módosításához mindkét adat frissítésére szükség van.`);
        }
    } catch (error) {
        console.error("Hiba történt a kérés során:", error);
        alert("Hiba történt a kérés során.");
    }
});

function logout() {
    localStorage.removeItem("token");
    window.location.href = "homepage.html";
}