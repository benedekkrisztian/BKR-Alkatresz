document.addEventListener("DOMContentLoaded", function () {
    const cart = JSON.parse(localStorage.getItem('cart')) || [];
    const cartTableBody = document.querySelector('.cart-table tbody');
    let total = 0;

    cartTableBody.innerHTML = '';

    cart.forEach((item, index) => {
        const row = document.createElement('tr');
        const itemTotal = item.ar * item.quantity;
        total += itemTotal;

        row.innerHTML = `
            <td>${item.termekId}</td>
            <td>${item.leiras}</td>
            <td>${item.darab}</td>
            <td>${item.alkatreszszam}</td>
            <td>${item.ar} Ft</td>
            <td>
                <div class="quantity-controls">
                    <button class="btn btn-sm btn-danger decrease-qty" data-index="${index}">-</button>
                    <span class="quantity-display">${item.quantity}</span>
                    <button class="btn btn-sm btn-secondary increase-qty" data-index="${index}">+</button>
                </div>
            </td>
            <td>${itemTotal} Ft</td>
            <td>
                <button class="btn btn-danger btn-sm remove-item" data-index="${index}">Törlés</button>
            </td>
        `;
        cartTableBody.appendChild(row);
    });

    const totalRow = document.createElement('tr');
    totalRow.innerHTML = `
        <td colspan="6" class="text-end"><strong>Teljes összeg:</strong></td>
        <td colspan="2"><strong>${total} Ft</strong></td>
    `;
    cartTableBody.appendChild(totalRow);

    document.querySelectorAll('.decrease-qty').forEach(button => {
        button.addEventListener('click', function () {
            const index = this.dataset.index;
            if (cart[index].quantity > 1) {
                cart[index].quantity--;
                localStorage.setItem('cart', JSON.stringify(cart));
                location.reload();
            }
        });
    });

    document.querySelectorAll('.increase-qty').forEach(button => {
        button.addEventListener('click', function () {
            const index = this.dataset.index;
            cart[index].quantity++;
            localStorage.setItem('cart', JSON.stringify(cart));
            location.reload();
        });
    });

    document.querySelectorAll('.remove-item').forEach(button => {
        button.addEventListener('click', function () {
            const index = this.dataset.index;
            cart.splice(index, 1);
            localStorage.setItem('cart', JSON.stringify(cart));
            location.reload();
        });
    });

    document.getElementById('checkout-button').addEventListener('click', function () {
        document.getElementById('popupbutton_cart').style.display = 'block';
    });

    document.getElementById('close_cart').addEventListener('click', function () {
        document.getElementById('popupbutton_cart').style.display = 'none';
    });

    document.getElementById('pay_cart').addEventListener('click', handleCheckout);
});

async function handleCheckout() {
    const token = localStorage.getItem('token');
    if (!token) {
        alert('A rendeléshez be kell jelentkezni!');
        window.location.href = 'bejelentkezes.html';
        return;
    }

    const cart = JSON.parse(localStorage.getItem('cart')) || [];
    if (cart.length === 0) {
        alert('A kosár üres!');
        return;
    }

    const cardName = document.getElementById("payment_details_1_cart").value.trim();
    const cardNumber = document.getElementById("payment_details_2_cart").value.trim();
    const expiryDate = document.getElementById("payment_details_3_cart").value.trim();
    const cvv = document.getElementById("payment_details_4_cart").value.trim();
    const postalCode = document.getElementById("payment_details_5_cart").value.trim();
    const city = document.getElementById("payment_details_6_cart").value.trim();
    const street = document.getElementById("payment_details_7_cart").value.trim();
    const phoneNumber = document.getElementById("payment_details_8_cart").value.trim();
    const email = document.getElementById("payment_details_9_cart").value.trim();

    const namePattern = /^[a-zA-ZáéíóöőúüűÁÉÍÓÖŐÚÜŰ\s]+$/;
    const numberPattern = /^\d{16}$/;
    const datePattern = /^(0[1-9]|1[0-2])\/\d{2}$/;
    const cvvPattern = /^\d{3}$/;
    const postalCodePattern = /^\d{4}$/;
    const phonePattern = /^\d{10,11}$/;
    const emailPattern = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;

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

    if (!postalCode.match(postalCodePattern)) {
        alert("Az irányítószámnak 4 számjegyűnek kell lennie!");
        return;
    }

    if (!phoneNumber.match(phonePattern)) {
        alert("A telefonszámnak 10 vagy 11 számjegyűnek kell lennie!");
        return;
    }

    if (!email.match(emailPattern)) {
        alert("Az email cím formátuma érvénytelen!");
        return;
    }

    try {
        const response = await fetch('http://localhost:3000/rendelesek', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json',
                'Authorization': `Bearer ${token}`
            },
            body: JSON.stringify({ cart, iranyitoszam: postalCode, varos: city, utca: street, telefonszam: phoneNumber, email })
        });

        if (!response.ok) {
            throw new Error('Hiba történt a rendelés során.');
        }

        localStorage.removeItem('cart');
        alert('Rendelés sikeresen leadva!');
        window.location.href = 'webshop.html';
    } catch (error) {
        console.error('Hiba történt a rendelés során:', error);
        alert('Hiba történt a rendelés során.');
    }
}

document.getElementById('clear_cart').addEventListener('click', function () {
    localStorage.removeItem('cart');
    alert('A kosár kiürült!');
    location.reload();
});
