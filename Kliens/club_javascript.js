document.getElementById("joinbutton_club").addEventListener("click", function () {
    const token = localStorage.getItem("token");
    if (!token) {
        alert("Bejelentkezés szükséges.");
        window.location.href = "login.html";
        return;
    }
    document.getElementById("popupbutton_club").style.display = "block";
});

document.getElementById("close_club").addEventListener("click", function () {
    document.getElementById("popupbutton_club").style.display = "none";
});

document.getElementById("club_videos").style.display = "none";

const joinButton = document.getElementById("joinbutton_club");
const popupWindow = document.getElementById("popupwindow_club");
const closeButton = document.getElementById("close_club");
const payButton = document.getElementById("pay_club");

payButton.addEventListener("click", async function () {
    const cardName = document.getElementById("payment_details_1_club").value.trim();
    const cardNumber = document.getElementById("payment_details_2_club").value.trim();
    const expiryDate = document.getElementById("payment_details_3_club").value.trim();
    const cvv = document.getElementById("payment_details_4_club").value.trim();
    const club_videos = document.getElementById('club_videos');

    const namePattern = /^[a-zA-ZáéíóöőúüűÁÉÍÓÖŐÚÜŰ\s]+$/;
    const numberPattern = /^\d{16}$/;
    const datePattern = /^(0[1-9]|1[0-2])\/\d{2}$/;
    const cvvPattern = /^\d{3}$/;

    if (!cardName.match(namePattern)) {
        alert("A kártyatulajdonos neve csak szöveget tartalmazhat!");
        return;
    }

    if (!cardNumber.match(numberPattern)) {
        alert("A kártyaszámnak 16 számjegyűnek kell lennie!");
        return;
    }

    if (!expiryDate.match(datePattern)) {
        alert("A lejárati dátumnak MM/YY formátumban kell lennie!");
        return;
    }

    if (!cvv.match(cvvPattern)) {
        alert("A CVV-nek 3 számjegyűnek kell lennie!");
        return;
    }

    try {
        const token = localStorage.getItem("token");
        if (!token) {
            alert("Hiba: Hitelesítés szükséges.");
            return;
        }

        const response = await fetch("http://localhost:3000/clubtagsag", {
            method: "PUT",
            headers: {
                "Content-Type": "application/json",
                "Authorization": `Bearer ${token}`
            }
        });

        const data = await response.json();

        if (response.ok) {
            alert("Sikeres fizetés!");
            document.getElementById("popupbutton_club").style.display = "none";
            club_videos.style.display = 'block';
        } else {
            alert(`Hiba: ${data.error}`);
        }
    } catch (error) {
        console.error("Hiba történt a kérés során:", error);
        alert("Hiba történt a kérés során.");
    }
});

async function checkClubStatus() {
    try {
        const token = localStorage.getItem("token");
        if (!token) {
            return;
        }

        const response = await fetch("http://localhost:3000/profile", {
            method: "GET",
            headers: {
                "Authorization": `Bearer ${token}`
            }
        });

        const data = await response.json();

        if (response.ok && data.club) {
            document.getElementById("club_videos").style.display = "block";
            document.getElementById("join_club").style.display = "none";
        }
    } catch (error) {
        console.error("Hiba történt a kérés során:", error);
    }
}

document.addEventListener("DOMContentLoaded", checkClubStatus);