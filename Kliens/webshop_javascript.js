document.addEventListener("DOMContentLoaded", () => {
    fetchDataAndPopulateSelect("/tipus", "select1");
    document.getElementById("select1").addEventListener("change", handleTipusChange);
    document.getElementById("search-button").addEventListener("click", handleSearch);
});

async function fetchDataAndPopulateSelect(endpoint, selectId) {
    try {
        const response = await fetch(`http://localhost:3000${endpoint}`);
        const data = await response.json();
        const selectElement = document.getElementById(selectId);

        data.forEach(item => {
            const option = document.createElement("option");
            option.value = item.id || item.name;
            option.textContent = item.name;
            selectElement.appendChild(option);
        });
    } catch (error) {
        console.error(`Error fetching data from ${endpoint}:`, error);
    }
}

async function handleTipusChange() {
    const tipus = document.getElementById("select1").value;
    const selectKivitel = document.getElementById("select2");
    const selectModel = document.getElementById("select3");
    selectKivitel.innerHTML = "";
    selectModel.innerHTML = "";

    try {
        const responseKivitel = await fetch(`http://localhost:3000/kivitel?tipus=${tipus}`);
        const dataKivitel = await responseKivitel.json();

        dataKivitel.forEach(item => {
            const option = document.createElement("option");
            option.value = item.name;
            option.textContent = item.name;
            selectKivitel.appendChild(option);
        });

        const responseModel = await fetch(`http://localhost:3000/model?tipus=${tipus}`);
        const dataModel = await responseModel.json();

        dataModel.forEach(item => {
            const option = document.createElement("option");
            option.value = item.name;
            option.textContent = item.name;
            selectModel.appendChild(option);
        });
    } catch (error) {
        console.error("Error fetching data for kivitel or model:", error);
    }
}
async function handleSearch() {
    const cikkszam = document.getElementById("search").value.trim();
    if (!cikkszam) {
        alert("Kérjük, adja meg a cikkszámot.");
        return;
    }

    try {
        const response = await fetch(`http://localhost:3000/termekek/cikkszam/${cikkszam}`);
        if (!response.ok) {
            throw new Error("Nem található alkatrész a megadott cikkszámmal.");
        }
        const termek = await response.json();
        if (termek.length === 0) {
            alert("Nem található alkatrész a megadott cikkszámmal.");
            return;
        }

        // Átirányítás a partnumber.html oldalra a cikkszámmal
        window.location.href = `partnumber.html?cikkszam=${encodeURIComponent(cikkszam)}`;
    } catch (error) {
        console.error("Error fetching part details:", error);
        alert("Hiba történt az alkatrész keresése során.");
    }
}
