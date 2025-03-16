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
                <td>
                    <div class="input-group" style="width: 120px">
                        <button class="btn btn-outline-secondary btn-sm" type="button" onclick="decrementQuantity(this)">-</button>
                        <input type="number" class="form-control form-control-sm text-center quantity-input" 
                            value="1" min="1" max="99" readonly>
                        <button class="btn btn-outline-secondary btn-sm" type="button" onclick="incrementQuantity(this)">+</button>
                    </div>
                </td>
                <td>
                    <button class="btn btn-primary btn-sm" onclick="addToCart(${item.termek_id}, this)">Kosárba</button>
                </td>
            `;
            partDetailsTable.appendChild(row);
        });

    } catch (error) {
        console.error("Hiba történt:", error);
        alert("Hiba történt az alkatrész betöltése során!");
    }
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

    alert(`Termék (${termekId}) hozzáadva a kosárhoz: ${quantity} db`);
}