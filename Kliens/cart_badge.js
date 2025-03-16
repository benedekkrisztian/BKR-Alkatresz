function updateCartBadge() {
    const cart = JSON.parse(localStorage.getItem('cart')) || [];
    const totalItems = cart.reduce((sum, item) => sum + item.quantity, 0);
    const badge = document.getElementById('cart-badge');

    if (badge) {
        badge.textContent = totalItems;
        badge.style.display = totalItems > 0 ? 'block' : 'none';
    }
}

document.addEventListener('DOMContentLoaded', updateCartBadge);

window.addEventListener('storage', function (e) {
    if (e.key === 'cart') {
        updateCartBadge();
    }
});
