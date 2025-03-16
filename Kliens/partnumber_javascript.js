document.addEventListener("DOMContentLoaded", async function() {
    const urlParams = new URLSearchParams(window.location.search);
    const cikkszam = urlParams.get("cikkszam");

    if (!cikkszam) {
        alert("Nem található cikkszám!");
        window.location.href = "webshop.html";
        return;
    }

    try {
        const response = await fetch(`http://localhost:3000/termekek/cikkszam/${cikkszam}`);
        if (!response.ok) {
            throw new Error("Nem található alkatrész");
        }

        const termek = await response.json();
        if (termek.length === 0) {
            alert("Nem található alkatrész a megadott cikkszámmal!");
            return;
        }

        const partDetailsTable = document.getElementById("part-details");
        termek.forEach(item => {
            const row = document.createElement("tr");
            row.innerHTML = `
                <td>${item.termek_id}</td>
                <td>${item.leiras}</td>
                <td>${item.darab}</td>
                <td>${item.alkatreszszam}</td>
                <td>${item.ar} Ft</td>
         
            `;
            partDetailsTable.appendChild(row);
        });

    } catch (error) {
        console.error("Hiba történt:", error);
        alert("Hiba történt az alkatrész betöltése során!");
    }
});