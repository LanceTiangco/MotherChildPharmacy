window.onload = loadProducts;

let currentPage = 1;
const itemsPerPage = 12;
let totalItems = 0;
let totalPages = 0;
let searchQuery = '';
let basket = [];

async function fetchProducts(query = '') {
    try {
        const response = await fetch('fetchProductData.php', {
            method: 'POST',
            headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
            body: new URLSearchParams({ query })
        });
        const text = await response.text();
        const jsonMatch = text.match(/<!-- (.*?) -->/);
        const data = jsonMatch ? JSON.parse(jsonMatch[1]) : [];
        totalItems = data.length; // Count all products, including out-of-stock
        totalPages = Math.ceil(totalItems / itemsPerPage);
        return data; // Return all products, including out-of-stock
    } catch (error) {
        console.error('Error fetching products:', error);
        return [];
    }
}

function formatUnitOfMeasure(unit) {
    const unitMap = {
        kilograms: 'kg',
        milligrams: 'mg',
        grams: 'g',
        liters: 'L',
        milliliters: 'mL',
        pieces: 's'
    };
    return unitMap[unit.toLowerCase()] || unit;
}

async function loadProducts() {
    const products = await fetchProducts(searchQuery);
    const inStockContainer = document.getElementById('in-stock-list');
    const lowStockContainer = document.getElementById('low-stock-list');
    const outOfStockContainer = document.getElementById('out-of-stock-list');
    
    inStockContainer.innerHTML = '';
    lowStockContainer.innerHTML = '';
    outOfStockContainer.innerHTML = '';

    document.querySelectorAll('.clickable-card').forEach(card => card.classList.remove('active'));
    localStorage.removeItem('selectedCardId');

    const itemsPerRow = 4;
    const rowsPerCategory = 1;
    const itemsPerCategory = itemsPerRow * rowsPerCategory;

    // Separate products by stock level
    const inStockProducts = products.filter(product => product.InStock >= 50);
    const lowStockProducts = products.filter(product => product.InStock < 50 && product.InStock > 0);
    const outOfStockProducts = products.filter(product => product.InStock == 0);

    // Calculate start index for each category
    const startIndex = (currentPage - 1) * itemsPerCategory;
    const endIndex = startIndex + itemsPerCategory;

    function createProductHTML(product) {
        const formattedUnit = formatUnitOfMeasure(product.UnitOfMeasure);
        let stockBadge = '';

        if (product.InStock == 0) {
            stockBadge = `<span class="badge bg-danger"><i class="bi bi-exclamation-octagon me-1"></i>Out-of-Stock</span>`;
        } else if (product.InStock < 50 && product.InStock > 0) {
            stockBadge = `<span class="badge bg-warning text-dark"><i class="bi bi-exclamation-triangle me-1"></i>Low-Stock <span class="badge bg-white text-primary">${product.InStock}</span></span>`;
        } else {
            stockBadge = `<span class="badge bg-info text-dark"><i class="bi bi-info-circle me-1"></i>In-Stock <span class="badge bg-white text-primary">${product.InStock}</span></span>`;
        }

        return `
            <div class="col-lg-3 mb-3">
                <div class="card clickable-card ${product.InStock == 0 ? 'non-clickable-card' : ''}" data-id="${product.BrandName.toLowerCase().replace(/ /g, "-")}" data-product='${JSON.stringify(product)}'>
                    ${stockBadge}
                    <img src="../inventory/${product.ProductIcon}" class="card-img-top" style="width: 100px; height: 100px; object-fit: contain; margin: 0 auto;">
                    <div class="card-body">
                        <div class="row align-items-top">
                            <div class="col-lg-4">
                                <span class="badge rounded-pill bg-light text-dark">${product.Mass}${formattedUnit}</span>
                            </div>
                            <div class="col-lg-3 mx-3">
                                <span class="badge bg-success">₱${product.PricePerUnit}</span>
                            </div>
                        </div>
                        <h5 class="card-title">${product.BrandName}</h5>
                        <p class="card-text">${product.GenericName}</p>
                    </div>
                </div>
            </div>
        `;
    }

    // Display paginated products for each category
    inStockProducts.slice(startIndex, endIndex).forEach(product => {
        inStockContainer.insertAdjacentHTML('beforeend', createProductHTML(product));
    });

    lowStockProducts.slice(startIndex, endIndex).forEach(product => {
        lowStockContainer.insertAdjacentHTML('beforeend', createProductHTML(product));
    });

    outOfStockProducts.slice(startIndex, endIndex).forEach(product => {
        outOfStockContainer.insertAdjacentHTML('beforeend', createProductHTML(product));
    });

    attachCardListeners();

    // Update pagination
    totalItems = Math.max(inStockProducts.length, lowStockProducts.length, outOfStockProducts.length);
    totalPages = Math.ceil(totalItems / itemsPerCategory);
    updatePaginationControls();

    if (searchQuery && (inStockContainer.children.length > 0 || lowStockContainer.children.length > 0 || outOfStockContainer.children.length > 0)) {
        const firstCard = document.querySelector('.clickable-card:not(.non-clickable-card)');
        if (firstCard) {
            highlightCard(firstCard);
        }
    }
}

function updatePaginationControls() {
    const paginationList = document.querySelector('.pagination');
    paginationList.innerHTML = '';

    // Only show pagination if there are products
    if (totalItems > 0) {
        paginationList.insertAdjacentHTML('beforeend', `
            <li class="page-item ${currentPage === 1 ? 'disabled' : ''}" id="first-page">
                <a class="page-link" href="#" aria-label="First">
                    <span aria-hidden="true">«</span>
                </a>
            </li>
            <li class="page-item ${currentPage === 1 ? 'disabled' : ''}" id="prev-page">
                <a class="page-link" href="#">Previous</a>
            </li>
        `);

        // Add page numbers
        const startPage = Math.max(1, currentPage - 2);
        const endPage = Math.min(totalPages, startPage + 4);
        
        for (let i = startPage; i <= endPage; i++) {
            paginationList.insertAdjacentHTML('beforeend', `
                <li class="page-item ${i === currentPage ? 'active' : ''}" id="page-${i}">
                    <a class="page-link" href="#">${i}</a>
                </li>
            `);
        }

        paginationList.insertAdjacentHTML('beforeend', `
            <li class="page-item ${currentPage === totalPages ? 'disabled' : ''}" id="next-page">
                <a class="page-link" href="#">Next</a>
            </li>
            <li class="page-item ${currentPage === totalPages ? 'disabled' : ''}" id="last-page">
                <a class="page-link" href="#" aria-label="Last">
                    <span aria-hidden="true">»</span>
                </a>
            </li>
        `);

        // Add event listeners
        document.querySelectorAll('.pagination .page-item').forEach(item => {
            item.addEventListener('click', function(e) {
                e.preventDefault();
                if (this.classList.contains('disabled')) return;
                
                if (this.id === 'first-page') {
                    currentPage = 1;
                } else if (this.id === 'prev-page' && currentPage > 1) {
                    currentPage--;
                } else if (this.id === 'next-page' && currentPage < totalPages) {
                    currentPage++;
                } else if (this.id === 'last-page') {
                    currentPage = totalPages;
                } else if (this.id.startsWith('page-')) {
                    currentPage = parseInt(this.id.split('-')[1]);
                }
                loadProducts();
            });
        });
    }
}

function attachCardListeners() {
    document.querySelectorAll('.clickable-card').forEach(card => {
        card.addEventListener('click', function() {
            if (!this.classList.contains('non-clickable-card')) {
                highlightCard(this);
                const productData = JSON.parse(this.dataset.product);
                showQuantityModal(productData);
            }
        });
    });
}

document.head.insertAdjacentHTML('beforeend', `
    <style>
        .non-clickable-card {
            opacity: 0.6;
            cursor: not-allowed;
        }
    </style>
`);

const searchInput = document.querySelector('input[name="query"]');
searchInput.addEventListener('input', function() {
    searchQuery = this.value;
    currentPage = 1;
    loadProducts();
});

searchInput.addEventListener('keypress', async function(event) {
    if (event.key === 'Enter') {
        event.preventDefault();
        if (this.value.trim() === '') return;
        searchQuery = this.value;
        currentPage = 1;
        await loadProducts();
        const firstClickableCard = document.querySelector('.clickable-card');
        if (firstClickableCard) {
            highlightCard(firstClickableCard);
            firstClickableCard.click();
        } else {
            showToast("No in-stock products found for your search.");
        }
        this.value = '';
        this.focus();
    }
});

function showQuantityModal(product) {
    const modalBody = document.getElementById('quantity-modal-body');
    const formattedUnit = formatUnitOfMeasure(product.UnitOfMeasure);
    let stockBadge = product.InStock < 50 ? 
        `<span class="badge bg-warning text-dark"><i class="bi bi-exclamation-triangle me-1"></i>Low-Stock <span class="badge bg-white text-primary">${product.InStock}</span></span>` :
        `<span class="badge bg-info text-dark"><i class="bi bi-info-circle me-1"></i>In-Stock <span class="badge bg-white text-primary">${product.InStock}</span></span>`;
    
    modalBody.innerHTML = `
        <div class="card mb-3">
            <div class="row g-0">
                <div class="col-md-4">
                    <img src="../inventory/${product.ProductIcon}" class="img-fluid rounded-start" alt="Product Icon">
                </div>
                <div class="col-md-8">
                    <div class="card-body">
                        ${stockBadge}
                        <small class="card-text">₱${product.PricePerUnit}</small>
                        <h5 class="card-title">${product.BrandName} ${product.Mass}${formattedUnit}</h5>
                        <p class="card-text">${product.GenericName}</p>
                    </div>
                </div>
            </div>
        </div>
    `;

    const quantityInput = document.getElementById('quantity-input');
    quantityInput.value = 1;
    quantityInput.max = product.InStock;

    const addItemButton = document.getElementById('add-item-button');
    addItemButton.onclick = () => {
        const quantity = parseInt(quantityInput.value, 10);
        if (quantity > 0 && quantity <= product.InStock) {
            addItemToBasket(product, quantity);
            bootstrap.Modal.getInstance(document.getElementById('quantity-modal')).hide();
        } else {
            showToast("Please enter a valid quantity.");
        }
    };

    new bootstrap.Modal(document.getElementById('quantity-modal')).show();
}

document.getElementById('quantity-cancel').addEventListener('click', function() {
    document.querySelectorAll('.clickable-card').forEach(card => card.classList.remove('active'));
    localStorage.removeItem('selectedCardId');
});

function highlightCard(card) {
    if (card.querySelector('.badge.bg-danger')) return;
    document.querySelectorAll('.clickable-card').forEach(c => c.classList.remove('active'));
    card.classList.add('active');
    localStorage.setItem('selectedCardId', card.getAttribute('data-id'));
    card.scrollIntoView({ behavior: 'smooth', block: 'nearest' });
}

function showToast(message) {
    const toastBody = document.querySelector('#alert-toast .toast-body');
    toastBody.textContent = message;
    const toast = new bootstrap.Toast(document.getElementById('alert-toast'));
    toast.show();
}

function addItemToBasket(product, quantity) {
    const existingItemIndex = basket.findIndex(item => item.id === product.BrandName.toLowerCase().replace(/ /g, "-"));
    if (existingItemIndex > -1) {
        basket[existingItemIndex].quantity += quantity;
    } else {
        basket.push({
            id: product.BrandName.toLowerCase().replace(/ /g, "-"),
            BrandName: product.BrandName,
            GenericName: product.GenericName,
            PricePerUnit: product.PricePerUnit,
            quantity: quantity
        });
    }
    updateBasketDisplay();
    updateCheckoutButtonState();
    deselectCurrentItem();
}

function deselectCurrentItem() {
    document.querySelectorAll('.clickable-card').forEach(card => card.classList.remove('active'));
    localStorage.removeItem('selectedCardId');
}

function updateBasketDisplay() {
    const basketItemsContainer = document.getElementById('basket-items');
    basketItemsContainer.innerHTML = '';
    let basketTotal = 0;

    basket.forEach(item => {
        const itemTotal = item.PricePerUnit * item.quantity;
        basketTotal += itemTotal;

        basketItemsContainer.insertAdjacentHTML('beforeend', `
            <a href="#" class="list-group-item list-group-item-action">
                <div class="d-flex w-100 justify-content-between">
                    <h5 class="mb-1">${item.BrandName}</h5>
                    <button type="button" class="btn btn-danger btn-sm-custom" onclick="removeItemFromBasket('${item.id}')">
                        <i class="bi bi-trash"></i>
                    </button>
                </div>
                <p class="mb-1">${item.GenericName}</p>
                <div class="d-flex w-100 justify-content-between">
                    <small>₱${itemTotal.toFixed(2)}</small>
                    <small>x${item.quantity}</small>
                </div>
            </a>
        `);
    });

    const tax = (basketTotal * 0.12).toFixed(2);
    const totalAmount = (basketTotal + parseFloat(tax)).toFixed(2);
    document.getElementById('basket-total').textContent = `₱${totalAmount}`;
    document.getElementById('basket-tax').textContent = `₱${tax}`;
    updateCheckoutButtonState();
}

function removeItemFromBasket(itemId) {
    basket = basket.filter(item => item.id !== itemId);
    updateBasketDisplay();
    updateCheckoutButtonState();
}

function updateCheckoutButtonState() {
    const checkoutButton = document.querySelector('button[data-bs-target="#verticalycentered"]');
    checkoutButton.disabled = basket.length === 0;
    checkoutButton.classList.toggle('btn-secondary', basket.length === 0);
    checkoutButton.classList.toggle('btn-primary', basket.length > 0);
}

document.addEventListener('DOMContentLoaded', updateCheckoutButtonState);

document.getElementById('clear-search').addEventListener('click', function(event) {
    event.preventDefault();
    clearSearch();
});

function clearSearch() {
    const searchInput = document.querySelector('input[name="query"]');
    searchInput.value = '';
    searchQuery = '';
    currentPage = 1;
    loadProducts();
    searchInput.focus();
    document.querySelectorAll('.clickable-card').forEach(card => card.classList.remove('active'));
    localStorage.removeItem('selectedCardId');
}

document.getElementById('verticalycentered').addEventListener('show.bs.modal', updateModalTotal);

document.querySelectorAll('#verticalycentered .form-check-input').forEach(checkbox => {
    checkbox.addEventListener('change', updateModalTotal);
});

function updateModalTotal() {
    const subtotal = basket.reduce((total, item) => total + (item.PricePerUnit * item.quantity), 0);
    const tax = subtotal * 0.12;
    let discountPercentage = 0;

    if (document.getElementById('seniorCitizenCheckbox').checked) discountPercentage += 20;

    const discountAmount = subtotal * (discountPercentage / 100);
    const discountedTotal = subtotal + tax - discountAmount;

    document.getElementById('total-display').textContent = `Total: ₱${discountedTotal.toFixed(2)}`;
}

let receiptItems = [];

function generateReceiptItems() {
    receiptItems = basket.map(item => ({
        quantity: item.quantity,
        item_name: item.BrandName,
        total_item_price: (item.PricePerUnit * item.quantity).toFixed(2)
    }));

    updateTotalItemsDisplay();
    updateSubtotalDisplay();
    updateTaxDisplay();
    updateAmountDueDisplay();
}

function updateTotalItemsDisplay() {
    const totalQuantity = receiptItems.reduce((total, item) => total + item.quantity, 0);
    document.getElementById('total-items').textContent = totalQuantity;
}

function updateSubtotalDisplay() {
    const subtotal = receiptItems.reduce((total, item) => total + parseFloat(item.total_item_price), 0).toFixed(2);
    document.getElementById('sub-total').textContent = `₱${subtotal}`;
}

function updateTaxDisplay() {
    const subtotal = receiptItems.reduce((total, item) => total + parseFloat(item.total_item_price), 0);
    const tax = (subtotal * 0.12).toFixed(2);
    document.getElementById('tax').textContent = `₱${tax}`;
}

function updateAmountDueDisplay() {
    const subtotal = receiptItems.reduce((total, item) => total + parseFloat(item.total_item_price), 0);
    const tax = subtotal * 0.12;
    const amountDue = (subtotal + tax).toFixed(2);
    document.getElementById('amount-due').textContent = `₱${amountDue}`;
}

function displayReceiptItems() {
    const receiptContainer = document.getElementById('receiptItems');
    receiptContainer.innerHTML = '';
    
    const headerHTML = `
        <div class="row text-center mb-2">
            <div class="col-4"><small><strong>Quantity</strong></small></div>
            <div class="col-4"><small><strong>Item</strong></small></div>
            <div class="col-3"><small><strong>Price</strong></small></div>
        </div>
    `;
    receiptContainer.insertAdjacentHTML('beforeend', headerHTML);
    
    receiptItems.forEach(item => {
        const itemHTML = `
            <div class="row text-center">
                <div class="col-4"><small>${item.quantity}</small></div>
                <div class="col-4"><small>${item.item_name}</small></div>
                <div class="col-3"><small>₱${item.total_item_price}</small></div>
            </div>
        `;
        receiptContainer.insertAdjacentHTML('beforeend', itemHTML);
    });
}

function updatePaymentDisplay() {
    const payment = parseFloat(document.getElementById("paymentInput").value) || 0;
    document.getElementById("payment").textContent = `₱${payment.toFixed(2)}`;
}

function updateChangeDisplay() {
    const payment = parseFloat(document.getElementById("paymentInput").value) || 0;
    const amountDue = parseFloat(document.getElementById('amount-due').textContent.replace(/[^0-9.-]+/g,""));
    const change = Math.max(0, payment - amountDue);
    document.getElementById("change").textContent = `₱${change.toFixed(2)}`;
}

document.addEventListener('DOMContentLoaded', function() {
    const checkoutButton = document.getElementById('checkout');
    if (checkoutButton) {
        checkoutButton.addEventListener('click', function() {
            if (basket.length === 0) {
                showToast("Your basket is empty. Please add items before checking out.");
                return;
            }
            generateReceiptItems();
            displayReceiptItems();
            updatePaymentDisplay();
            updateChangeDisplay();
            updateModalTotal();

            const checkoutModal = new bootstrap.Modal(document.getElementById('verticalycentered'));
            checkoutModal.show();
        });
    }
});

document.getElementById('paymentInput').addEventListener('input', function() {
    const payment = parseFloat(this.value) || 0;
    const totalAmount = parseFloat(document.getElementById('total-display').textContent.replace(/[^0-9.-]+/g,""));
    const change = payment - totalAmount;
    
    const confirmButton = document.getElementById('confirm-button');
    
    if (payment >= totalAmount) {
        confirmButton.removeAttribute('disabled');
        document.getElementById('change-display').textContent = `Change: ₱${change.toFixed(2)}`;
    } else {
        confirmButton.setAttribute('disabled', 'true');
        document.getElementById('change-display').textContent = 'Change: ₱0.00';
    }
    
    updatePaymentDisplay();
    updateChangeDisplay();
});

document.getElementById('cancel-receipt').addEventListener('click', function() {
    setTimeout(() => {
        const checkoutModal = new bootstrap.Modal(document.getElementById('verticalycentered'));
        checkoutModal.show();
    }, 100);
});

let orderNum = 0;

function fetchInvoiceID() {
    fetch('fetchOrderNumber.php')
        .then(response => response.json())
        .then(data => {
            const newInvoiceID = data.newInvoiceID;
            orderNum = newInvoiceID;
            const formattedInvoiceID = newInvoiceID > 0 ? `#${newInvoiceID}` : '#0';
            document.getElementById('order-num').textContent = `Order No.: ${formattedInvoiceID}`;
        })
        .catch(error => console.error('Error fetching InvoiceID:', error));
}

document.addEventListener('DOMContentLoaded', fetchInvoiceID);

let userID = 0;
let employeeName = '';

function fetchAccountID() {
    fetch('fetchAccountID.php')
        .then(response => response.json())
        .then(data => {
            if (data.accountID) {
                const accountID = data.accountID;
                userID = accountID;
                employeeName = data.employeeName || 'Unknown Staff';
                console.log('AccountID:', accountID);
                console.log('Employee Name:', employeeName);
                receiptData.accountID = accountID;
            } else {
                console.error('Error fetching AccountID:', data.error);
            }
        })
        .catch(error => console.error('Error fetching AccountID:', error));
}

document.addEventListener('DOMContentLoaded', fetchAccountID);

function getCurrentDateTime() {
    const now = new Date();
    const year = now.getFullYear();
    const month = String(now.getMonth() + 1).padStart(2, '0'); // Months are zero-indexed
    const day = String(now.getDate()).padStart(2, '0');
    const hours = String(now.getHours()).padStart(2, '0');
    const minutes = String(now.getMinutes()).padStart(2, '0');
    const seconds = String(now.getSeconds()).padStart(2, '0');

    return `${year}-${month}-${day} ${hours}:${minutes}:${seconds}`;
}

function getSalesDetails() {
    const salesDetails = {};

    receiptItems.forEach((item, index) => {
        salesDetails[index + 1] = {
            itemID: item.itemID, // Ensure itemID is available in receiptItems
            qty: item.quantity
        };
    });

    return salesDetails;
}

document.addEventListener('DOMContentLoaded', function() {
    const paymentInput = document.getElementById('paymentInput');
    const confirmButton = document.getElementById('confirm-button');
    const totalDisplay = document.getElementById('total-display');
    const changeDisplay = document.getElementById('change-display');

    function updatePaymentValidation() {
        const payment = parseFloat(paymentInput.value) || 0;
        const totalAmount = parseFloat(totalDisplay.textContent.replace(/[^0-9.-]+/g,""));

        if (payment === 0 || payment < totalAmount) {
            paymentInput.classList.add('is-invalid');
            paymentInput.classList.remove('is-valid');
            confirmButton.setAttribute('disabled', 'true');
            changeDisplay.textContent = 'Change: ₱0.00';
        } else {
            paymentInput.classList.remove('is-invalid');
            paymentInput.classList.add('is-valid');
            confirmButton.removeAttribute('disabled');
            const change = payment - totalAmount;
            changeDisplay.textContent = `Change: ₱${change.toFixed(2)}`;
        }
    }

    paymentInput.addEventListener('input', updatePaymentValidation);

    // Set initial state
    paymentInput.value = '';
    updatePaymentValidation();
});

// Print button
document.getElementById('print-button').addEventListener('click', function() {
    const receiptData = {
        invoiceID: orderNum,
        saleDate: getCurrentDateTime(),
        accountID: userID,
        salesDetails: getSalesDetails(),
        totalItems: receiptItems.reduce((sum, item) => sum + item.quantity, 0),
        subtotal: receiptItems.reduce((sum, item) => sum + parseFloat(item.total_item_price), 0).toFixed(2),
        tax: (receiptItems.reduce((sum, item) => sum + parseFloat(item.total_item_price), 0) * 0.12).toFixed(2),
        discount: 0.00,
        amountPaid: parseFloat(document.getElementById("payment").textContent.replace(/[^0-9.-]+/g,"")),
        paymentMethod: 'Cash',
        status: 'Sales',
        refundAmount: 0.00
    };

    // Save the receipt data to the server
    fetch('saveReceipt.php', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json',
        },
        body: JSON.stringify(receiptData),
    })
    .then(response => {
        if (!response.ok) {
            throw new Error(`HTTP error! status: ${response.status}`);
        }
        return response.text();
    })
    .then(text => {
        console.log('Raw response:', text);
        return JSON.parse(text);
    })
    .then(data => {
        if (data.success) {
            console.log('Receipt saved successfully');
            // After successful save, proceed with saving as text file and printing
            saveAsTxtAndPrint();
        } else {
            console.error('Error saving receipt:', data.error);
            showToast('Error saving receipt. Please try again.');
        }
    })
    .catch((error) => {
        console.error('Error:', error);
        showToast('An error occurred. Please try again.');
    });
});

function saveAsTxtAndPrint() {
    const receiptContent = generateReceiptContent();
    
    // Create a form data object to send the content to PHP
    const formData = new FormData();
    formData.append('content', receiptContent);
    formData.append('orderNum', orderNum);

    // Send the content to a PHP script that will create and print the file
    fetch('printReceipt.php', {
        method: 'POST',
        body: formData
    })
    .then(response => response.json())
    .then(data => {
        if (data.success) {
            console.log('Receipt printed successfully');
            window.location.reload(); // Reload the page after successful print
        } else {
            console.error('Error printing receipt:', data.error);
            showToast('Error printing receipt. Please try again.');
        }
    })
    .catch(error => {
        console.error('Error:', error);
        showToast('An error occurred while printing. Please try again.');
    });
}

function generateReceiptContent() {
    const maxWidth = 32;

    function centerText(text) {
        const padding = Math.max(0, Math.floor((maxWidth - text.length) / 2));
        return ' '.repeat(padding) + text;
    }

    function formatLine(left, right) {
        const space = maxWidth - left.length - right.length - 1;
        return left + ' '.repeat(space) + right;
    }

    let content = 
`${centerText('Mother & Child')}
${centerText('Pharmacy and Medical Supplies')}
${centerText('Gen. Luna Street, Babo Sacan,')}
${centerText('Porac, Pampanga')}
${'-'.repeat(maxWidth)}
\nQuantity\tItem\tPrice\n`;

    // Add items to the content
    receiptItems.forEach(item => {
        const itemName = item.item_name.length > 20 ? item.item_name.substring(0, 17) + '...' : item.item_name;
        content += `${item.quantity}\t${itemName}\tP${item.total_item_price}\n`;
    });

    const totalItems = receiptItems.reduce((sum, item) => sum + item.quantity, 0);
    const subtotal = parseFloat(receiptItems.reduce((sum, item) => sum + parseFloat(item.total_item_price), 0)).toFixed(2);
    const tax = (subtotal * 0.12).toFixed(2);
    const discount = 0.00;
    const amountDue = (parseFloat(subtotal) + parseFloat(tax) - discount).toFixed(2);
    const amountPaid = parseFloat(document.getElementById("payment").textContent.replace(/[^0-9.-]+/g,"")).toFixed(2);
    const change = (amountPaid - amountDue).toFixed(2);

    // Add summary information
    content += `${'-'.repeat(maxWidth)}\n`;
    content += formatLine(`Total Items:`, `${totalItems}\n`);
    content += formatLine(`Subtotal:`, `P${subtotal}\n`);
    content += formatLine(`Tax 12%:`, `P${tax}\n`);
    content += formatLine(`Discount:`, `P-${discount.toFixed(2)}\n`);
    content += formatLine(`Amount Due:`, `P${amountDue}\n`);
    content += formatLine(`Refund Amount:`, `P${amountDue}\n`);
    content += formatLine(`Payment:`, `P${amountPaid}\n`);
    content += formatLine(`Change:`, `P${change}\n`);
    content += `${'-'.repeat(maxWidth)}\n`;
    content += formatLine(`Order No.:`, `#${orderNum}\n`);
    content += formatLine(`Date:`, `${getCurrentDateTime()}\n`);
    content += formatLine(`Staff:`, `${employeeName}\n`);
    content += formatLine(`Status:`, `Sales\n`);
    content += `\n`;
    content += `\n${centerText('Thank you for your purchase!')}\n`; 
    content += `\n\n`; 

    return content;
}