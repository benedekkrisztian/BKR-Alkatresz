document.addEventListener("DOMContentLoaded", async function () {
    // Get tipus_id from URL
    const urlParams = new URLSearchParams(window.location.search);
    const tipus_id = urlParams.get('tipus_id');

    if (!tipus_id) {
        alert("Nincs kiválasztva típus!");
        window.location.href = 'webshop.html';
        return;
    }

    // Verify if tipus_id exists
    try {
        const response = await fetch(`http://localhost:3000/tipus/${tipus_id}`);
        const data = await response.json();
        if (!data || data.length === 0) {
            alert("A kiválasztott típus nem található!");
            window.location.href = 'webshop.html';
            return;
        }
    } catch (error) {
        console.error("Error:", error);
        alert("Hiba történt a típus ellenőrzése során!");
        window.location.href = 'webshop.html';
        return;
    }

    const partsGallery = document.getElementById("parts-gallery");
    const selectedPartSection = document.getElementById("selected-part-section");
    const selectedImage = document.getElementById("selected-image");
    let partName = document.getElementById("part-name");
    if (!partName) {
        partName = document.createElement("h2");
        partName.id = "part-name";
        selectedPartSection.insertBefore(partName, selectedPartSection.firstChild);
    }
    const backButton = document.getElementById("back-button");
    const partDetailsBody = document.getElementById("part-details-body");
    const parts = [
        { filename: "316i_1.png", name: "Motorblokk rögzítő alkatrészek" },
        { filename: "316i_2.png", name: "Motorblokk" },
        { filename: "316i_3.png", name: "Vezérlés burkolat" },
        { filename: "316i_4.png", name: "Vezérlés tömítés" },
        { filename: "316i_5.png", name: "Olajteknő" },
        { filename: "316i_6.png", name: "Ház kompenzáló tengelyekkel" },
        { filename: "316i_7.png", name: "Hengerfej" },
        { filename: "316i_8.png", name: "Hengferfejburkolat" },
        { filename: "316i_9.png", name: "Forgattyúház szellőztetés" },
        { filename: "316i_10.png", name: "Hengerfej alkatrészei" },
        { filename: "316i_11.png", name: "Szíjfeszítő" },
        { filename: "316i_12.png", name: "Vízpumpa / generátor" },
        { filename: "316i_13.png", name: "Klímakompresszor" },
        { filename: "316i_14.png", name: "Kettőstömegű lendkerék" },
        { filename: "316i_15.png", name: "Főtengely - duggatyúk" },
        { filename: "316i_16.png", name: "Főtengely - hajtókar" },
        { filename: "316i_17.png", name: "Főtengely" },
        { filename: "316i_18.png", name: "Vezérlés - lánc" },
        { filename: "316i_19.png", name: "Vezérlés - tengely" },
        { filename: "316i_20.png", name: "Kenőrendszer" },
        { filename: "316i_21.png", name: "Kenőrendszer - olajszivattyú" },
        { filename: "316i_22.png", name: "Vízpumpa - termosztát" },
        { filename: "316i_23.png", name: "Hűtésrendszer" },
        { filename: "316i_24.png", name: "Szívósor" },
        { filename: "316i_25.png", name: "Szívósor - cső" },
        { filename: "316i_26.png", name: "Vákum" },
        { filename: "316i_27.png", name: "Vákumszabályzó" },
        { filename: "316i_28.png", name: "Kibocsátásszabályzó" },
        { filename: "316i_29.png", name: "Leömlő" },
        { filename: "316i_30.png", name: "Szervízkészlet II" },
        { filename: "316i_31.png", name: "Szervízkészlet I / Olajcsere" },
    ];

    parts.forEach(part => {
        const col = document.createElement("div");
        col.className = "col-lg-3 col-md-4 col-sm-6";
        const card = document.createElement("div");
        card.className = "card";
        const img = document.createElement("img");
        img.src = `../Szerver/images/316i parts/${part.filename}`;
        img.alt = part.name;
        img.className = "card-img-top";
        img.style.cursor = "pointer";
        img.onclick = async () => {
            try {
                const response = await fetch(`http://localhost:3000/termekek?kep=${part.filename.split('_')[1].split('.')[0]}&tipus_id=${tipus_id}`);
                if (!response.ok) {
                    throw new Error("Hiba történt az alkatrészek lekérdezése során.");
                }
                const partDetails = await response.json();
                
                if (partDetails.length === 0) {
                    alert("Ehhez a típushoz nem található alkatrész!");
                    return;
                }

                partsGallery.style.display = "none";
                selectedPartSection.style.display = "flex";
                selectedImage.src = img.src;
                selectedImage.alt = part.name;
                partName.textContent = part.name;

                partDetailsBody.innerHTML = "";
                partDetails.forEach(detail => {
                    const row = document.createElement("tr");
                    row.innerHTML = `
                        <td>${detail.termek_id}</td>
                        <td>${detail.leiras}</td>
                        <td>${detail.darab}</td>
                        <td>${detail.alkatreszszam}</td>
                        <td>${detail.ar} FT</td>
                        <td>
                            <div class="input-group" style="width: 120px">
                                <button class="btn btn-outline-secondary btn-sm" type="button" onclick="decrementQuantity(this)">-</button>
                                <input type="number" class="form-control form-control-sm text-center quantity-input" 
                                    value="1" min="1" max="99" readonly>
                                <button class="btn btn-outline-secondary btn-sm" type="button" onclick="incrementQuantity(this)">+</button>
                            </div>
                        </td>
                        <td>
                            <button class="btn btn-primary btn-sm" onclick="addToCart(${detail.termek_id}, this)">Kosárba</button>
                        </td>
                    `;
                    partDetailsBody.appendChild(row);
                });
            } catch (error) {
                console.error("Error:", error);
                alert("Hiba történt az alkatrészek betöltése során!");
            }
        };
        const cardBody = document.createElement("div");
        cardBody.className = "card-body";
        const cardTitle = document.createElement("h5");
        cardTitle.className = "card-title";
        cardTitle.textContent = part.name;
        cardBody.appendChild(cardTitle);
        card.appendChild(img);
        card.appendChild(cardBody);
        col.appendChild(card);
        partsGallery.appendChild(col);
    });

    backButton.onclick = () => {
        partsGallery.style.display = "flex";
        selectedPartSection.style.display = "none";
    };
});

function decrementQuantity(button) {
    const input = button.parentElement.querySelector('input');
    const currentValue = parseInt(input.value);
    if (currentValue > 1) {
        input.value = currentValue - 1;
    }
}

function incrementQuantity(button) {
    const input = button.parentElement.querySelector('input');
    const currentValue = parseInt(input.value);
    const max = parseInt(input.max);
    if (currentValue < max) {
        input.value = currentValue + 1;
    }
}

function addToCart(termekId, button) {
    const row = button.closest('tr');
    const quantity = parseInt(row.querySelector('.quantity-input').value);
    const maxQuantity = parseInt(row.querySelector('.quantity-input').max);
    
    if (quantity > maxQuantity) {
        alert('Nincs elég készleten!');
        return;
    }

    // TODO: Implement cart functionality
    alert(`Termék (${termekId}) hozzáadva a kosárhoz: ${quantity} db`);
}