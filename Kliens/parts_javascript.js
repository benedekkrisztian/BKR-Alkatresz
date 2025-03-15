document.addEventListener("DOMContentLoaded", function() {
    const partsGallery = document.getElementById("parts-gallery");
    const selectedPartSection = document.getElementById("selected-part-section");
    const selectedImage = document.getElementById("selected-image");
    const partName = document.createElement("h2");
    partName.id = "part-name";
    selectedPartSection.insertBefore(partName, selectedPartSection.firstChild);
    const backButton = document.getElementById("back-button");
    const partDetailsBody = document.getElementById("part-details-body");
    const parts = [
        { filename: "316i_1.png", name: "Motorblokk rögzítő alkatrészek" },
        { filename: "316i_2.png", name: "Motorblokk" },
        { filename: "316i_3.png", name: "Vezérlés " },
        { filename: "316i_4.png", name: "IDŐZÍTÉS TOK" },
        { filename: "316i_5.png", name: "OLAJSZINT/OLAJSZINT KIJELZŐ" },
        { filename: "316i_6.png", name: "HÁZ KIMENETI TENGELYEKKEL" },
        { filename: "316i_7.png", name: "HENGERFEJ" },
        { filename: "316i_8.png", name: "HENGERFEJBURKOLAT" },
        { filename: "316i_9.png", name: "FORGATTYÚHÁZ-SZELLŐZÉS" },
        { filename: "316i_10.png", name: "A HENGERFEJRE RÖGZÍTETT ALKATRÉSZEK" },
        { filename: "316i_11.png", name: "SZÍJHAJTÁS-REZGÉSCSILLAPÍTÓ" },
        { filename: "316i_12.png", name: "SZÍJHAJTÁSÚ VÍZSZIVATTYÚ/ALTERNÁTOR" },
        { filename: "316i_13.png", name: "SZÍJHAJTÁSÚ KLÍMAKOMPRESSZOR" },
        { filename: "316i_14.png", name: "LENDKERÉK / IKERTÖMEGŰ LENDKERÉK" },
        { filename: "316i_15.png", name: "FŐTENGELY-DUGATTYÚK" },
        { filename: "316i_16.png", name: "FŐTENGELY CSATLAKOZÓRÚD" },
        { filename: "316i_17.png", name: "FŐTENGELY CSAPÁGYHÉJÁVAL" },
        { filename: "316i_18.png", name: "VEZETŐ- ÉS SZELEP VONAT-IDŐZÍTŐ LÁNC" },
        { filename: "316i_19.png", name: "SZELEP VEZÉSFOKOZAT - BÜTÖKTENGELY" },
        { filename: "316i_20.png", name: "KENŐRENDSZER-OLAJSZŰRŐ" },
        { filename: "316i_21.png", name: "KENŐRENDSZER/OLAJSZIVATTYÚ HAJTÁSSAL" },
        { filename: "316i_22.png", name: "VÍZSZIVATTYÚ - TERMOSZTÁT" },
        { filename: "316i_23.png", name: "HŰTÉSRENDSZER VÍZCSÖMLŐK" },
        { filename: "316i_24.png", name: "RÖGZÍTŐ ALKATRÉSZEK F SZÍVÓCSERE RENDSZER" },
        { filename: "316i_25.png", name: "SZÍVÓCSŐ RENDSZER" },
        { filename: "316i_26.png", name: "VÁKUUMSZABÁLYOZÁS - MOTOR" },
        { filename: "316i_27.png", name: "LEVEGŐSZIVATTYÚ F VÁKUUMSZABÁLYOZÁS" },
        { filename: "316i_28.png", name: "KIBOCSÁTÁSSZABÁLYOZÓ LEVEGŐ SZIVATTYÚ" },
        { filename: "316i_29.png", name: "KIPUFOGÓ-CSERE" },
        { filename: "316i_30.png", name: "SZERVIZ KÉSZLET VIZSGÁLATHOZ II" },
        { filename: "316i_31.png", name: "SZERVIZKÉSZLET, VIZSGÁLAT I / OLAJSZERVIZ" },
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
            partsGallery.style.display = "none";
            selectedPartSection.style.display = "flex";
            selectedImage.src = img.src;
            selectedImage.alt = part.name;
            partName.textContent = part.name;

            const response = await fetch(`http://localhost:3000/termekek?kep=${part.filename.split('_')[1].split('.')[0]}`);
            const partDetails = await response.json();

            partDetailsBody.innerHTML = "";
            partDetails.forEach(detail => {
                const row = document.createElement("tr");
                row.innerHTML = `
                    <td>${detail.termek_id}</td>
                    <td>${detail.leiras}</td>
                    <td>${detail.darab}</td>
                    <td>${detail.alkatreszszam}</td>
                    <td>${detail.ar} FT</td>
                `;
                partDetailsBody.appendChild(row);
            });
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
