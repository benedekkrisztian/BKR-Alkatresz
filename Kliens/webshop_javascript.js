document.addEventListener("DOMContentLoaded", () => {
    fetchDataAndPopulateSelect("/tipus", "select1");
    document.getElementById("select1").addEventListener("change", handleTipusChange);
    document.querySelector("button[type='submit']").addEventListener("click", handleSearch);
});

async function fetchDataAndPopulateSelect(endpoint, selectId) {
    try {
        const response = await fetch(`http://localhost:3000${endpoint}`);
        if (!response.ok) {
            throw new Error(`Hiba történt az adatok lekérdezése során: ${endpoint}`);
        }
        const data = await response.json();
        const selectElement = document.getElementById(selectId);

        data.forEach(item => {
            const option = document.createElement("option");
            option.value = item.name;
            option.textContent = item.name;
            selectElement.appendChild(option);
        });
    } catch (error) {
        console.error(`Error fetching data from ${endpoint}:`, error);
        alert(`Hiba történt az adatok lekérdezése során: ${endpoint}`);
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
        if (!responseKivitel.ok) {
            throw new Error("Hiba történt a kivitelek lekérdezése során.");
        }
        const dataKivitel = await responseKivitel.json();

        dataKivitel.forEach(item => {
            const option = document.createElement("option");
            option.value = item.name;
            option.textContent = item.name;
            selectKivitel.appendChild(option);
        });

        const loadModels = async () => {
            const kivitel = selectKivitel.value;
            selectModel.innerHTML = "";

            const responseModel = await fetch(`http://localhost:3000/model?tipus=${tipus}&kivitel=${kivitel}`);
            if (!responseModel.ok) {
                throw new Error("Hiba történt a modellek lekérdezése során.");
            }
            const dataModel = await responseModel.json();

            selectModel.innerHTML = "";
            dataModel.forEach(item => {
                const option = document.createElement("option");
                option.value = item.name;
                option.textContent = item.name;
                selectModel.appendChild(option);
            });
        };

        selectKivitel.addEventListener("change", loadModels);

        if (selectKivitel.options.length > 0) {
            selectKivitel.dispatchEvent(new Event("change"));
        }
    } catch (error) {
        console.error("Error fetching data for kivitel or model:", error);
        alert("Hiba történt a kivitelek vagy modellek lekérdezése során.");
    }
}

async function handleSearch(event) {
    event.preventDefault();
    const tipus = document.getElementById("select1").value;
    const kivitel = document.getElementById("select2").value;
    const model = document.getElementById("select3").value;

    try {
        const response = await fetch(`http://localhost:3000/tipus?tipus=${tipus}&kivitel=${kivitel}&model=${model}`);
        if (!response.ok) {
            throw new Error("Hiba történt a típus azonosító lekérdezése során.");
        }
        const data = await response.json();
        if (data && data.length > 0) {
            if (data[0].hasProducts > 0) {
                window.location.href = `parts.html?tipus_id=${data[0].tipus_id}`;
            } else {
                alert("A kiválasztott típushoz nem található alkatrész!");
            }
        } else {
            alert("A kiválasztott típus nem található!");
        }
    } catch (error) {
        console.error("Error:", error);
        alert("Hiba történt az alkatrészek keresése során.");
    }
}