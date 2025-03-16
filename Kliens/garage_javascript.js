document.addEventListener('DOMContentLoaded', () => {
    const typeSelect = document.getElementById('type');
    const bodytypeSelect = document.getElementById('bodytype');
    const modelSelect = document.getElementById('model');
    const partsLink = document.getElementById('partsLink');
    const nameInput = document.getElementById('name1');

    const loadLastSavedCar = () => {
        const savedCars = JSON.parse(localStorage.getItem('garage')) || [];
        if (savedCars.length > 0) {
            const lastCar = savedCars[savedCars.length - 1];
            nameInput.value = lastCar.name;

            typeSelect.value = lastCar.type;
            typeSelect.dispatchEvent(new Event('change'));

            setTimeout(() => {
                bodytypeSelect.value = lastCar.bodytype;
                bodytypeSelect.dispatchEvent(new Event('change'));

                setTimeout(() => {
                    modelSelect.value = lastCar.model;
                }, 100);
            }, 100);
        }
    };

    fetch('http://localhost:3000/tipus')
        .then(response => response.json())
        .then(data => {
            data.forEach(item => {
                const option = document.createElement('option');
                option.value = item.name;
                option.textContent = item.name;
                typeSelect.appendChild(option);
            });
            loadLastSavedCar();
        });

    typeSelect.addEventListener('change', () => {
        bodytypeSelect.disabled = !typeSelect.value;
        modelSelect.disabled = true;
        bodytypeSelect.innerHTML = '<option value="">Válasszon kivitelt...</option>';
        modelSelect.innerHTML = '<option value="">Válasszon modelt...</option>';

        if (typeSelect.value) {
            fetch(`http://localhost:3000/kivitel?tipus=${typeSelect.value}`)
                .then(response => response.json())
                .then(data => {
                    data.forEach(item => {
                        const option = document.createElement('option');
                        option.value = item.name;
                        option.textContent = item.name;
                        bodytypeSelect.appendChild(option);
                    });
                });
        }
    });

    bodytypeSelect.addEventListener('change', () => {
        modelSelect.disabled = !bodytypeSelect.value;
        modelSelect.innerHTML = '<option value="">Válasszon modelt...</option>';

        if (bodytypeSelect.value) {
            fetch(`http://localhost:3000/model?tipus=${typeSelect.value}&kivitel=${bodytypeSelect.value}`)
                .then(response => response.json())
                .then(data => {
                    data.forEach(item => {
                        const option = document.createElement('option');
                        option.value = item.name;
                        option.textContent = item.name;
                        modelSelect.appendChild(option);
                    });
                });
        }
    });

    partsLink.addEventListener('click', async (e) => {
        e.preventDefault();

        if (!typeSelect.value || !bodytypeSelect.value || !modelSelect.value) {
            alert('Kérjük válasszon ki minden szükséges adatot!');
            return;
        }

        try {
            const response = await fetch(`http://localhost:3000/tipus?tipus=${typeSelect.value}&kivitel=${bodytypeSelect.value}&model=${modelSelect.value}`);
            const data = await response.json();

            if (data && data.length > 0) {
                if (data[0].hasProducts > 0) {
                    window.location.href = `parts.html?tipus_id=${data[0].tipus_id}`;
                } else {
                    alert('A kiválasztott típushoz nem található alkatrész!');
                }
            } else {
                alert('A kiválasztott típus nem található!');
            }
        } catch (error) {
            alert('Hiba történt az adatok lekérése közben!');
        }
    });

    const form = document.querySelector('form');
    form.addEventListener('submit', async (e) => {
        e.preventDefault();

        const carData = {
            name: nameInput.value,
            type: typeSelect.value,
            bodytype: bodytypeSelect.value,
            model: modelSelect.value
        };

        if (!carData.name || !carData.type || !carData.bodytype || !carData.model) {
            alert('Kérjük töltse ki az összes mezőt!');
            return;
        }

        let savedCars = JSON.parse(localStorage.getItem('garage')) || [];
        if (savedCars.length > 0) {
            savedCars[savedCars.length - 1] = carData;
        } else {
            savedCars.push(carData);
        }

        localStorage.setItem('garage', JSON.stringify(savedCars));
        alert('Autó sikeresen mentve a garázsba!');
    });

    document.querySelector('button[type="reset"]').addEventListener('click', () => {
        form.reset();
        bodytypeSelect.disabled = true;
        modelSelect.disabled = true;
        bodytypeSelect.innerHTML = '<option value="">Válasszon kivitelt...</option>';
        modelSelect.innerHTML = '<option value="">Válasszon modelt...</option>';
        localStorage.removeItem('garage');
    });
});