document.addEventListener("DOMContentLoaded", async function () {
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
                    <div class="quantity-controls">
                        <button class="btn btn-sm btn-danger" type="button" onclick="decrementQuantity(this)">-</button>
                        <span class="quantity-display">1</span>
                        <button class="btn btn-sm btn-secondary" type="button" onclick="incrementQuantity(this)">+</button>
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
    const display = button.parentElement.querySelector('.quantity-display');
    const currentValue = parseInt(display.textContent);
    if (currentValue > 1) {
        display.textContent = currentValue - 1;
    }
}

function incrementQuantity(button) {
    const display = button.parentElement.querySelector('.quantity-display');
    const currentValue = parseInt(display.textContent);
    if (currentValue < 99) {
        display.textContent = currentValue + 1;
    }
}

function addToCart(termekId, button) {
    const row = button.closest('tr');
    const quantity = parseInt(row.querySelector('.quantity-display').textContent);

    const leiras = row.cells[1].textContent;
    const darab = parseInt(row.cells[2].textContent);
    const alkatreszszam = row.cells[3].textContent;
    const ar = parseInt(row.cells[4].textContent);

    const termek = {
        termekId,
        leiras,
        darab,
        alkatreszszam,
        ar,
        quantity
    };

    let cart = JSON.parse(localStorage.getItem('cart')) || [];
    const existingItemIndex = cart.findIndex(item => item.termekId === termekId);

    if (existingItemIndex > -1) {
        cart[existingItemIndex].quantity += quantity;
    } else {
        cart.push(termek);
    }

    localStorage.setItem('cart', JSON.stringify(cart));
    alert(`Termék (${termekId}) hozzáadva a kosárhoz: ${quantity} db`);
}