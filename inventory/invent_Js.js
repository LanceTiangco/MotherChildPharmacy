// Get the modal
var modal = document.getElementById("PurchaseForm");

// Get the button that opens the modal for new product
var btn = document.querySelector(".Create_PO");


// Get the close button
var closeBtn = document.getElementById("closeBtn");

// Get the notification elements
var notification = document.getElementById("notification");
var notificationMessage = document.getElementById("notificationMessage");
var closeNotification = document.getElementById("closeNotification");

// For tracking if this is an update or a new product
var isEditMode = false;
var currentItemId = null; // Store the ItemID when editing
var formClosedWithoutSubmission = false; // Flag to indicate if form was closed without submission

// When the user clicks the button, open the modal for new product
btn.onclick = function() {
    modal.style.display = "block";
    isEditMode = false; // Indicate that this is a new product
    document.getElementById('PurchaseForm').reset(); // Clear form fields
    document.getElementById('iconPreview').src = '../resources/img/add_icon.png'; // Reset icon preview

    // Fetch the next auto-increment value for ItemID
    fetch('getNextItemId.php')
        .then(response => response.json())
        .then(data => {
            if (data.success) {
                document.getElementById('itemID').value = data.nextItemID; // Set the ItemID textbox with the next auto-increment value
            } else {
                console.error('Error fetching next ItemID:', data.message);
            }
        })
        .catch(error => {
            console.error('Error fetching next ItemID:', error);
        });
};




// Get the Clear button
var clearBtn = document.getElementById("Clear");

// Clear button functionality
var clearBtn = document.getElementById("Clear");
clearBtn.onclick = function() {
    document.getElementById('PurchaseForm').reset(); // Reset the form
    document.getElementById('iconPreview').src = '../resources/default_icon.png'; // Reset icon preview
};
closeBtn.onclick = function() {
    formClosedWithoutSubmission = true; // Set the flag to indicate form was closed without submission
    modal.style.display = "none";
}



// Function to validate required fields

function validateForm() {
    const errors = [];
    
    // Check for required fields
    const itemType = document.getElementById('itemType').value;
    const pricePerUnit = document.getElementById('pricePerUnit').value.trim();
    const brandName = document.getElementById('brandName').value.trim();
    const genericName = document.getElementById('genericName').value.trim();
    const mass = document.getElementById('mass').value.trim();
    const unitOfMeasure = document.getElementById('unitOfMeasure').value;
    const productCode = document.getElementById('productCode').value.trim();
    
    if (!itemType) errors.push("Item Type is required.");
    if (!pricePerUnit) errors.push("Price Per Unit is required.");
    if (!brandName) errors.push("Brand Name is required.");
    if (!genericName) errors.push("Generic Name is required.");
    if (!mass) errors.push("Mass is required.");
    if (!unitOfMeasure) errors.push("Unit of Measure is required.");
    if (!productCode) errors.push("Product Code is required.");
    if (!Discount) errors.push("Discount is required.");

    return errors;
}


// HANDLE BOTH ADDING AND UPDATING


// Handle form submission

// Add event listener for form submission
// Add event listener for "New Product" button
// Disable the InStock field when the New Product button is clicked



const modalVerifyTextFront = document.getElementById('modalVerifyText-Front');

// UPDATE AND ADDING

// Add event listener for form submission
// Add event listener for form submission
document.getElementById('PurchaseForm').addEventListener('submit', function(event) {
    event.preventDefault(); // Prevent default form submission

    // Validate form fields
    const validationErrors = validateForm();
    if (validationErrors.length > 0) {
        showError(validationErrors.join(" ")); // Show errors in a single message
        return; // Stop submission if there are errors
    }

    const form = document.getElementById('PurchaseForm');
    const formData = new FormData(form);

    // Ensure ItemID is included in the form data if in edit mode
    if (isEditMode) {
        formData.append('itemID', document.getElementById('itemID').value);
        
        // If icon was not changed, remove ProductIcon from FormData
        if (!document.getElementById('iconFile').hasAttribute('data-changed')) {
            formData.delete('ProductIcon');
        }
    } else {
        // For adding a new product, set a default value for InStock to 0
        formData.append('InStock', 0); // Automatically set InStock to 0
    }

    // Get values from input fields for validation
    const mass = parseFloat(document.getElementById('mass').value);
    const pricePerUnit = parseFloat(document.getElementById('pricePerUnit').value.replace('₱ ', '').trim());
    //const inStock = parseInt(formData.get('InStock'), 10); // Get the value of InStock from formData
    const discount = parseInt(document.querySelector('select[name="Discount"]').value, 10); // Ensure correct fetching of discount
    const vatExempted = parseInt(document.getElementById('VAT_exempted').value, 10); // Get VAT exempted value

    // Validate mass, pricePerUnit, and InStock for negative values
    if (mass < 0) {
        showError('Mass cannot be negative.');
        return;
    }
    if (pricePerUnit < 0) {
        showError('Price per unit cannot be negative.');
        return;
    }
    //if (isNaN(inStock) || inStock < 0) {
   //     showError('In Stock must be a non-negative number.');
   //     return;
   // }

    // Update discount validation to allow value 0 (Unavailable)
    if (isNaN(discount)) { // Check if discount is not a number (i.e., no option selected)
        showError('Please select a discount option.');
        return;
    }

    // Validate VAT exempted value
    if (isNaN(vatExempted)) {
        showError('Please select a VAT exemption option.');
        return;
    }

    // Prepare to send the request
    const url = isEditMode ? 'updateInventory.php' : 'insertInventory.php'; // Use update script if in edit mode

    fetch(url, { method: 'POST', body: formData })
        .then(response => response.json())
        .then(data => {
            if (data.success) {
                // Show confirmation modal on success
                const confirmationModal = new bootstrap.Modal(document.getElementById('disablebackdrop'));
                document.getElementById('modalVerifyTitle').textContent = 'Success';
                document.getElementById('modalVerifyText').textContent = isEditMode ? 
                    'Product has been updated successfully!' : 'Product has been added successfully!';
                confirmationModal.show();

                // Redirect after a short delay
                setTimeout(() => {
                    window.location.href = 'inventory.php'; // Redirect on success
                }, 1000);
            } else {
                showError('Error saving product: ' + data.message);
            }
        })
        .catch(error => {
            alert('An error occurred: ' + error.message);
        });
});




// Function to load form data for editing
function loadFormForEdit(item) {
    isEditMode = true; // Set to edit mode
    currentItemId = item.ItemID;

    document.getElementById('itemID').value = item.ItemID; // Set ItemID field as read-only
    document.getElementById('productCode').value = item.ProductCode;
    document.getElementById('genericName').value = item.GenericName;
    document.getElementById('brandName').value = item.BrandName;
    document.getElementById('itemType').value = item.ItemType;
    document.getElementById('mass').value = item.Mass;
    document.getElementById('unitOfMeasure').value = item.UnitOfMeasure;
    document.getElementById('pricePerUnit').value = item.PricePerUnit;
    document.getElementById('Discount').value = item.Discount;
    document.getElementById('VAT_exempted').value = item.VAT_exempted; // Set VAT_exempted field
    //document.getElementById('inStockInput').value = item.InStock; // Use the correct ID for InStock input


    // Enable the In Stock field for editing
    //document.getElementById('inStockInput').disabled = false; 

    // Set the icon preview
    document.getElementById('iconPreview').src = item.ProductIcon || '../resources/img/add_icon.png'; // Use default if no icon

    modal.style.display = "block"; // Show the modal
}
















//Handle Image//


// Function to preview the selected image
function previewImage(event) {
    const iconPreview = document.getElementById('iconPreview');
    const file = event.target.files[0]; // Get the selected file

    if (file) {
        const reader = new FileReader();
        
        // Set up the reader to update the image preview
        reader.onload = function(e) {
            iconPreview.src = e.target.result; // Update the image source with the file data
        }

        // Read the file as a Data URL
        reader.readAsDataURL(file);
    } else {
        // If no file is selected, set the default icon
        iconPreview.src = "../resources/img/add_icon.png";
    }
}

// Add event listener to the file input to trigger the image preview
document.getElementById('iconFile').addEventListener('change', previewImage);





//CLOSING FORM

// Function to close the form/modal
document.getElementById('closeBtn').addEventListener('click', function(event) {
    console.log('Close button clicked'); // Check if this logs
    event.preventDefault(); // Prevent any default behavior
    document.getElementById('PurchaseForm').style.display = 'none'; // Hide the form/modal
});

// Stop form submission if the close button is clicked
document.getElementById('closeBtn').addEventListener('click', function(event) {
    event.stopPropagation(); // Stop the click event from bubbling up to the form
});


// CLOSING FORM









// Function to show errors
function showError(message) {
    console.error(message);
    const notificationMessage = document.getElementById("notificationMessage");
    const notification = document.getElementById("notification");
    
    notificationMessage.textContent = message; // Set the error message
    notification.style.display = "block"; // Show the notification

    // Add event listener to the close button
    document.getElementById("closeNotification").addEventListener("click", closeError);
}


function closeError() {
    const notification = document.getElementById("notification");
    notification.style.display = "none"; // Hide the notification
}



// Function to handle update button click
function handleUpdate(itemId) {
    if (!itemId) {
        showError('Error: ItemID is missing.');
        return;
    }

    // Log the itemId for debugging
    console.log('Fetching data for ItemID:', itemId);

    fetch(`getProduct_data.php?itemID=${encodeURIComponent(itemId)}`)
        .then(response => {
            // Check if the response is OK
            if (response.ok) {
                // Check if the response is JSON
                const contentType = response.headers.get('Content-Type');
                if (contentType && contentType.includes('application/json')) {
                    return response.json();
                } else {
                    return response.text().then(text => {
                        throw new Error(`Unexpected response: ${text}`);
                    });
                }
            } else {
                throw new Error('Network response was not ok');
            }
        })
        .then(data => {
            // Log the data for debugging
            console.log('Fetched data:', data);

            if (data.success) {
                loadFormForEdit(data.data); // Load item data into the form
            } else {
                showError('Error fetching product data: ' + data.message);
            }
        })
        .catch(error => {
            showError('An error occurred while fetching the product data.');
        });
}


// Function to initialize or reinitialize DataTables
function setDataTables() {
    if ($.fn.dataTable.isDataTable('#example')) {
        $('#example').DataTable().destroy(); // Destroy the existing instance before reinitializing
    }

    var table = $('#example').DataTable({
        "order": [], // Disable initial sorting
        "autoWidth": false, // Disable automatic column width calculation
        "responsive": true, // Enable responsiveness
        "columnDefs": [
            { "targets": 0, "width": "5%" }, // Item ID
            { "targets": 1, "width": "10%", "orderable": false }, // Icon 
            { "targets": 2, "width": "10%", "orderable": false }, // Generic Name
            { "targets": 3, "width": "10%", "orderable": false }, // Brand Name
            { "targets": 4, "width": "10%", "orderable": false }, // Item Type
            { "targets": 5, "width": "5%" }, // Mass & Unit of Measure
            { "targets": 6, "width": "10%" }, // Price Per Unit
            { "targets": 7, "width": "10%" }, // InStock
            { "targets": 8, "width": "10%" }, // Ordered
            { "targets": 9, "width": "100px", "orderable": false, "className": "text-center fixed-width" } // Actions
        ]
    });

    // Adjust table layout on sidebar toggle
    $(window).on('resize', function() {
        table.columns.adjust().draw(); // Redraw the DataTable to adjust the columns
    });
}

// Function to update the table with new data
function updateTable(items) {
    var tableBody = document.getElementById('tableBody');
    tableBody.innerHTML = ''; // Clear existing rows

    items.forEach(item => {
        var row = document.createElement('tr');
        row.setAttribute('data-id', item.ItemID); // Set data-id attribute

        row.innerHTML = `
                <td class="text-center text-truncate">${item.ItemID}</td>
                <td class="text-center"><img src="${item.ProductIcon}" alt="Icon" style="width: 50px; height: auto;"></td>
                <td class="text-center text-truncate">${item.GenericName}</td>
                <td class="text-center text-truncate">${item.BrandName}</td>
                <td class="text-center text-truncate">${item.ItemType}</td>
                <td class="text-center text-truncate">${item.Mass} ${item.UnitOfMeasure}</td>
                <td class="text-center text-truncate">₱ ${item.PricePerUnit}</td>
                <td class="text-center text-truncate">${item.InStock}</td>
                <td class="text-center text-truncate">${item.Ordered}</td>
                <td class="text-center">
                <img src="../resources/img/d-edit.png" alt="Edit" style="cursor:pointer; display: inline-block; width: 15px;" onclick="handleUpdate('${item.ItemID}')" />
                <img src="../resources/img/s-remove.png" alt="Delete" style="cursor:pointer; display: inline-block; width: 15px; margin-left: 10px;" onclick="showDeleteOptions('${item.ItemID}')" />
    </td>
        `;

        tableBody.appendChild(row);
    });
        //<td style="text-align: center;">${item.Status}</td>
        //img class="update-btn" onclick="handleUpdate(${item.ItemID})">Update</button>
        //<img class="delete-btn" onclick="handleDelete(${item.ItemID})">Delete</button>
    setDataTables(); // Reinitialize DataTables
}

// Function to handle delete operation
function handleDelete(itemId) {
    if (confirm('Are you sure you want to delete this item?')) {
        fetch(`deleteProduct.php?itemID=${encodeURIComponent(itemId)}`, { method: 'POST' })
            .then(response => response.json())
            .then(data => {
                if (data.success) {
                    alert(data.message);
                    loadInventory(); // Reload the inventory table
                    location.reload();
                } else {
                    showError('Error deleting product: ' + data.message);
                }
            })
            .catch(error => {
                showError('An error occurred while deleting the product.');
            });
    }
}

// Function to load inventory data and refresh the table
function loadInventory() {
    console.log("Loading inventory..."); // Debugging line to check if this function is called
    fetch('getProduct_data.php')
        .then(response => response.json())
        .then(data => {
            if (data.success) {
                updateTable(data.data); // Update the table with fetched data
            } else {
                showError('Error fetching inventory data: ' + data.message);
            }
        })
        .catch(error => {
            showError('An error occurred while loading inventory data.');
        });
}

// Load inventory when the page loads
window.onload = loadInventory;


//////////////////////////Archive//////////////////////////////////
const overlayAD = document.getElementById('overlayAD');
const closeBtnAD = document.getElementById('closeBtnAD');
const archiveUserBtn = document.getElementById('archiveUserBtn');
const modalYes = document.getElementById('modalYes');
const modalVerifyTextAD = document.getElementById('modalVerifyText-AD');
const modalFooterAD = document.getElementById('modal-footer-AD');
const modalCloseAD = document.getElementById('modalClose-AD');

let selectedItemID = '';  // Store the selected product ID
let modalStatus = '';  // To store the status of the modal action

// Function to show the overlayAD modal
function showDeleteOptions(ItemID) {
    selectedItemID = ItemID;  // Store the selected item ID
    overlayAD.style.display = 'flex';  // Show the overlay
}

// Event listener for archive button click
archiveUserBtn.addEventListener('click', function () {
    modalVerifyTextAD.textContent = 'Are you sure you want to archive this product?';
    modalStatus = 'archive';  // Set the modal status to 'archive'
    
});

// Event listener for 'Yes' button in the modal
modalYes.addEventListener('click', function () {
    if (modalStatus === 'archive') {
        if (!selectedItemID || selectedItemID.trim() === '') {
            alert('No product selected.');
            return;
        }

        // Sending the archive request via fetch API
        fetch('ArchivingProd.php', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify({ itemID: selectedItemID }) // Sending itemID
        })
        .then(response => {
            if (!response.ok) {
                if (response.status === 404) {
                    throw new Error('Product not found.');
                } else if (response.status === 500) {
                    throw new Error('Server error. Please try again later.');
                } else {
                    throw new Error('Error: ' + response.statusText);
                }
            }
            return response.json();
        })
        .then(data => {
            modalVerifyTextAD.textContent = data.message; // Display the response message
            modalFooterAD.style.display = 'none';
            modalCloseAD.style.display = 'none';
            modalVerifyTextAD.textContent = 'Product has been archived successfully!';
            document.getElementById('modalVerifyTitle-AD').textContent = 'Success';

            // Redirect after a short delay
            setTimeout(() => {
                window.location.href = '../inventory/ArchiveProduct/ArchiveProd.php'; // Adjust URL if necessary
            }, 1000);
        })
        .catch(error => {
            alert('Error: ' + error.message);
        });
    }
});


// Event listener for close button (x) inside the modal
closeBtnAD.addEventListener('click', function () {
    overlayAD.style.display = 'none'; // Hide the overlay when the close button is clicked
    document.getElementById('disablebackdrop-AD').style.display = 'none'; // Hide the modal
});

// Optional: Click anywhere outside the modal to close it
window.addEventListener('click', function (event) {
    if (event.target === overlayAD) {
        overlayAD.style.display = 'none'; // Hide the modal if clicked outside of it
        document.getElementById('disablebackdrop-AD').style.display = 'none'; // Hide the modal
    }
});

// Redirect to archived users page
const toArchivedUsers = document.getElementById('toArchivedUsers');
toArchivedUsers.addEventListener('click', function () {
    window.location.href = 'ArchiveProduct/ArchiveProd.php';
});

// End of Archive


// ECONOMIC ORDER QUANTITY //


// Function to truncate text
// Function to truncate text to a specified length
function truncateText(text, maxLength) {
    return text.length > maxLength ? text.substring(0, maxLength) + '...' : text; // Append ellipsis if truncated
}

// Function to check low stock items

// Function to fetch low stock items via AJAX

function checkLowStock() {
    $.ajax({
        url: 'checkLowStock.php',
        method: 'GET',
        dataType: 'json',
        success: function(data) {
            const lowStockItemsBody = document.getElementById('lowStockItemsBody');
            lowStockItemsBody.innerHTML = ''; // Clear previous items

            // Always open the modal
            

            if (data.error) {
                console.error("Error: " + data.error);
                lowStockItemsBody.innerHTML = `<tr><td colspan="5">Error retrieving low stock items.</td></tr>`;
                return;
            }

            // Populate low stock items or show "sufficient stock" message
            if (data.length > 0) {
                let hasLowStockItems = false;

                data.forEach(item => {
                    const inStock = parseInt(item.InStock, 10);
                    const ordered = parseInt(item.Ordered, 10);
                    const reorderLevel = parseInt(item.ReorderLevel, 10) || (ordered * 0.5);

                    let eoq = 0;
                    if (ordered > 0) {
                        const demand = ordered;
                        const orderingCost = 50;
                        const holdingCost = 2;
                        eoq = Math.sqrt((2 * demand * orderingCost) / holdingCost).toFixed(2);
                    }

                    if (inStock <= reorderLevel) {
                        hasLowStockItems = true;
                        const row = document.createElement('tr');
                        row.innerHTML = `

                        <td class="table-row" style="padding-left: 10px; padding-bottom: 5px;">${truncateText(item.BrandName, 20)}</td>
                        <td class="table-row" style="padding-left: 10px; padding-bottom: 5px;">${truncateText(item.GenericName, 20)}</td>
                        <td class="table-row low-stock" style="padding-bottom: 5px; padding-left: 20px;">${inStock}</td>
                        <td class="table-row" style="padding-bottom: 5px; padding-left: 20px;">${ordered}</td>
                        <td class="table-row" style="padding-bottom: 5px padding-left: 20px;">${eoq}</td>

                        `;
                        lowStockItemsBody.appendChild(row);
                    }
                });

                // If no low stock items, show a message
                if (!hasLowStockItems) {
                    lowStockItemsBody.innerHTML = `<tr><td colspan="5">All items are sufficiently stocked.</td></tr>`;
                }
            } else {
                lowStockItemsBody.innerHTML = `<tr><td colspan="5">All items are sufficiently stocked.</td></tr>`;
            }
        },
        error: function(xhr, status, error) {
            console.error("AJAX Error: " + error);
            const lowStockItemsBody = document.getElementById('lowStockItemsBody');
            lowStockItemsBody.innerHTML = `<tr><td colspan="5">Error connecting to server.</td></tr>`;
            openModal(); // Ensure the modal opens even on error
        }
    });
}

function checkNearExpiry() {
    $.ajax({
        url: 'checkNearExpiry.php',
        method: 'GET',
        dataType: 'json',
        success: function(data) {
            const lowStockItemsBody = document.getElementById('lowStockItemsBody');
            lowStockItemsBody.innerHTML = ''; // Clear previous items



            // Check for errors in the response
            if (data.error) {
                console.error("Error: " + data.error);
                lowStockItemsBody.innerHTML = `<tr><td colspan="3">Error retrieving near expiry items.</td></tr>`;
                return;
            }

            // Populate near expiry items
            if (data.length > 0) {
                data.forEach(item => {
                    const row = document.createElement('tr');
                    row.innerHTML = `
                        <td class="table-row" style="padding-left: 10px">${truncateText(item.BrandName, 20)}</td>
                        <td class="table-row" style="padding-left: 20px;">${truncateText(item.GenericName, 20)}</td>
                        <td class="table-row" style="padding-left: 10px;">${item.ExpiryDate}</td>
                    `;
                    lowStockItemsBody.appendChild(row);
                });
            } else {
                lowStockItemsBody.innerHTML = `<tr><td colspan="3">No items nearing expiry.</td></tr>`;
            }
        },
        error: function(xhr, status, error) {
            console.error("AJAX Error: " + error);
            const lowStockItemsBody = document.getElementById('lowStockItemsBody');
            lowStockItemsBody.innerHTML = `<tr><td colspan="3">Error connecting to server.</td></tr>`;
            openModal(); // Ensure the modal opens even on error
        }
    });
}



// END OF EOQ


// START OF TABLE OF LOW STOCK AND EXPIRY 

// Function to update table view based on the dropdown selection


function updateTableView() {
    const selectedView = document.getElementById("modalSelect").value;
    const tableHeader = document.getElementById("tableHeader");
    const tableBody = document.getElementById("lowStockItemsBody");

    // Clear the existing table headers and rows
    tableHeader.innerHTML = "";
    tableBody.innerHTML = "";

    if (selectedView === "lowStock") {
        // Set headers for Low Stock Items view
        tableHeader.innerHTML = `
            <th style="text-align: left; padding: 8px;">Brand Name</th>
            <th style="text-align: left; padding: 8px;">Generic Name</th>
            <th style="text-align: left; padding: 8px;">In Stock</th>
            <th>Ordered</th>
            <th>EOQ</th>
        `;

        // Populate table with low stock data via AJAX
        checkLowStock(); 
        
    } else if (selectedView === "nearExpiry") {
        // Set headers for Near Expiry Items view
        tableHeader.innerHTML = `
            <th style="text-align: left; padding: 8px;">Brand Name</th>
            <th style="text-align: left; padding: 8px;">Generic Name</th>
            <th style="text-align: left; padding: 8px;">Expiry Date</th>
        `;

        // Populate table with near expiry data
        checkNearExpiry();
    }
}







document.addEventListener('DOMContentLoaded', function () {
    // Open modal button event listener
    const openModalButton = document.getElementById('checkLowStockButton');
    if (openModalButton) {
        openModalButton.addEventListener('click', openModal);
    }

    // Close modal button event listener
    const closeButton = document.getElementById('BtnCloseLowStock');
    if (closeButton) {
        closeButton.addEventListener('click', function(event) {
            event.stopPropagation(); // Prevent propagation to parent elements
            console.log('Close button clicked'); // Debugging log
            closeModal();
        });
    }

    // Close modal when clicking outside the modal content
    window.addEventListener('click', function(event) {
        const modal = document.getElementById('lowStockModal');
        if (event.target === modal) {
            closeModal();
        }
    });
});

// Open modal function
// Open modal function
function openModal() {
    const modal = document.getElementById('lowStockModal');
    modal.style.display = 'block'; // Show modal
    updateTableView();
}


// Close modal function
function closeModal() {
    const modal = document.getElementById('lowStockModal');
    modal.style.display = 'none'; // Hide modal
}


////////////////////////////////////////
// GOODS ISSUE PART///



    // Show the overlay when the Goods Issue button is clicked
    document.getElementById("GoodsIssueBtn").addEventListener("click", function () {
        document.getElementById("overlayEdit1").style.display = "flex";
    });

    // Close the overlay when the close button is clicked
    document.getElementById("GIcloseBtn").addEventListener("click", function () {
        closeEditOverlay();
    });

// Function to close the overlay and reset the form
function closeEditOverlay() {
    const form = document.getElementById('userFormEdit'); // Use the actual ID of your form
    if (form) {
        form.reset(); // Reset all form fieldss
    }

    const overlay = document.getElementById('overlayEdit1'); // Use the actual ID of your overlay
    if (overlay) {
        overlay.style.display = 'none'; // Hide the overlay
    }
}



function filterOptions() {
    const input = document.getElementById('selectProd');
    const filter = input.value.toLowerCase();
    const dropdown = document.getElementById('productSelect');
    dropdown.innerHTML = ''; // Clear previous options
    dropdown.style.display = 'none'; // Initially hide the dropdown

    // Clear Ordered and QuantityRemaining fields if the input is empty
    if (filter === '') {
        resetOrderedField(); // Only reset the Ordered field
        return; // Stop function if input is empty
    }

    // AJAX request to fetch matching products
    const xhr = new XMLHttpRequest();
    xhr.open('GET', `goodIssueGetData.php?query=${encodeURIComponent(filter)}`, true);
    xhr.onreadystatechange = function () {
        if (xhr.readyState === 4) {
            if (xhr.status === 200) {
                const products = JSON.parse(xhr.responseText);
                const MAX_LENGTH = 50;

                if (products.length > 0) {
                    const defaultOption = document.createElement('div');
                    defaultOption.classList.add('option');
                    defaultOption.textContent = 'Select a product';
                    defaultOption.onclick = () => {
                        input.value = ''; // Clear input if default is clicked
                        dropdown.style.display = 'none';
                    };
                    dropdown.appendChild(defaultOption);

                    products.forEach(product => {
                        const option = document.createElement('div');
                        option.classList.add('option');
                        option.dataset.value = product.ItemID; // Store the ItemID
                        const displayText = `${product.GenericName} ${product.BrandName} (${product.Mass} ${product.UnitOfMeasure})`;
                        option.textContent = displayText.length > MAX_LENGTH 
                            ? displayText.substring(0, MAX_LENGTH - 3) + '...' 
                            : displayText;
                        option.onclick = function() {
                            selectProduct(option);
                        };
                        dropdown.appendChild(option);
                    });
                    dropdown.style.display = 'block'; // Show dropdown if results found
                }
            } else {
                console.error('Error fetching product data:', xhr.statusText);
            }
        }
    };
    xhr.send();
}

function selectProduct(option) {
    const input = document.getElementById('selectProd');
    input.value = option.textContent;
    currentSelectedItemID = option.dataset.value; // Store the selected ItemID
    document.getElementById('productSelect').style.display = 'none';

    // Fetch product data and update Ordered field
    fetchProductData(currentSelectedItemID);
}

// LOT 

function filterLotOptions() {
    const input = document.getElementById('selectLot');
    const filter = input.value.toLowerCase();
    const dropdown = document.getElementById('lotSelect');

    // Ensure dropdown exists and clear its content
    if (dropdown) {
        dropdown.innerHTML = '';
        dropdown.style.display = 'none';
    }

    if (filter === '') {
        resetQuantityRemainingField(); // Only clear QuantityRemaining when input is empty
        return; // Exit function
    }

    const xhr = new XMLHttpRequest();
    xhr.open('GET', `goodIssueGetData.php?lotQuery=${encodeURIComponent(filter)}`, true);
    
    xhr.onreadystatechange = function () {
        if (xhr.readyState === 4) {
            if (xhr.status === 200) {
                const lots = JSON.parse(xhr.responseText);
                const MAX_LENGTH = 50;

                if (lots.length > 0) {
                    const defaultOption = document.createElement('div');
                    defaultOption.classList.add('option');
                    defaultOption.textContent = 'Select a Lot Number';
                    defaultOption.onclick = () => {
                        input.value = '';
                        dropdown.style.display = 'none';
                        resetQuantityRemainingField(); // Clear QuantityRemaining when default is clicked
                    };
                    dropdown.appendChild(defaultOption);

                    lots.forEach(lot => {
                        const option = document.createElement('div');
                        option.classList.add('option');
                        option.dataset.value = lot.LotNumber;
                        option.dataset.quantity = lot.QuantityRemaining; // Store QuantityRemaining in data attribute

                        option.textContent = lot.LotNumber.length > MAX_LENGTH 
                            ? lot.LotNumber.substring(0, MAX_LENGTH - 3) + '...' 
                            : lot.LotNumber;

                        option.onclick = function() {
                            selectLot(option);
                        };
                        dropdown.appendChild(option);
                    });
                    dropdown.style.display = 'block';
                } else {
                    const noResultsOption = document.createElement('div');
                    noResultsOption.classList.add('option');
                    noResultsOption.textContent = 'No results found';
                    dropdown.appendChild(noResultsOption);
                    dropdown.style.display = 'block';
                }
            } else {
                console.error("Error fetching lots:", xhr.statusText);
            }
        }
    };
    
    xhr.send();
}


function selectLot(option) {
    const input = document.getElementById('selectLot');
    input.value = option.dataset.value; // Set the input value to the selected lot number
    document.getElementById('lotSelect').style.display = 'none'; // Hide the dropdown

    // Display QuantityRemaining in the appropriate field
    const quantityRemaining = option.dataset.quantity; // Get the quantity remaining from the data attribute
    document.getElementById('QuantityRemaining').value = quantityRemaining || 0; // Set QuantityRemaining to the input field

    // Set the currentLotNumber variable to the selected LotNumber
    currentLotNumber = option.dataset.value; // Store the selected LotNumber
    console.log(`Lot selected: ${currentLotNumber}, Quantity Remaining: ${quantityRemaining || 0}`);

    // Optionally, fetch product data using the selected LotNumber if needed
    // fetchProductData(currentLotNumber); // Uncomment if necessary
}

// Function to reset the QuantityRemaining field (not defined in your provided code)
function resetQuantityRemainingField() {
    document.getElementById('QuantityRemaining').value = ''; // Clear QuantityRemaining field
}

function fetchProductData(itemID) {
    if (itemID) {
        const xhr = new XMLHttpRequest();
        xhr.open('GET', `goodIssueGetData.php?itemID=${itemID}`, true);
        
        xhr.onreadystatechange = function () {
            if (xhr.readyState === 4) {
                if (xhr.status === 200) {
                    const productData = JSON.parse(xhr.responseText);
                    console.log(productData); // Debugging log

                    if (productData) {
                        // Update Ordered only, do not clear QuantityRemaining
                        document.getElementById('Ordered').value = productData.Ordered || 0; // Update Ordered only
                    } else {
                        document.getElementById('Ordered').value = 0; // Set Ordered to 0 if no data found
                    }
                } else {
                    console.error('Error fetching product data:', xhr.statusText);
                    document.getElementById('Ordered').value = 0; // Reset Ordered on error
                }
            }
        };
        xhr.send();
    }
}

// Separate function to reset the Ordered field
function resetOrderedField() {
    document.getElementById('Ordered').value = ''; // Clear Ordered
}

// Separate function to reset the QuantityRemaining field
function resetQuantityRemainingField() {
    document.getElementById('QuantityRemaining').value = ''; // Clear QuantityRemaining
}
//Inserting Goods Issue

let isAddMode = true; // Default mode is Add
let currentSelectedItemID; // Declare a variable to hold the selected ItemID
let currentLotNumber; // Store the selected LotNumber

// Event listener for the Add button
document.getElementById('ToggleAdd').addEventListener('click', function() {
    isAddMode = true;
    this.style.backgroundColor = 'green'; 
    this.style.boxShadow = '0 0 10px green'; 
    document.getElementById('ToggleSub').style.backgroundColor = ''; 
    document.getElementById('ToggleSub').style.boxShadow = ''; 
});


// Event listener for the Subtract button
document.getElementById('ToggleSub').addEventListener('click', function() {
    isAddMode = false;
    this.style.backgroundColor = 'red'; 
    this.style.boxShadow = '0 0 10px red'; 
    document.getElementById('ToggleAdd').style.backgroundColor = ''; 
    document.getElementById('ToggleAdd').style.boxShadow = ''; 
});


// Get references to the input fields
const quantityInput = document.getElementById('Quantity');

// Add event listener to the Confirm button
document.getElementById('ConfirmAction').addEventListener('click', function() {
    const quantityInput = document.getElementById('Quantity');
    const quantity = parseInt(quantityInput.value, 10);
    const reason = document.getElementById('Reason').value;

    // Validate if fields are empty
    if (!quantityInput.value.trim() || !reason.trim()) {
        showNotification('Please fill in all required fields.'); // Show notification for empty fields
        console.error("One or more required fields are empty."); // Log error
        return;
    }

    // Validate quantity input
    if (isNaN(quantity) || quantity <= 0) {
        showNotification('Please enter a valid quantity.'); // Show error message using notification
        console.error("Invalid quantity entered."); // Log error
        return;
    }

    // Determine action based on isAddMode
    const action = isAddMode ? 'add' : 'subtract';

    // Prepare the data to send to the server
    const data = {
        itemID: currentSelectedItemID, // Ensure this is set before confirming
        lotNumber: currentLotNumber,     // Ensure this is set before confirming
        Quantity: quantity,
        reason: reason,                   // Use the actual reason input
        timestamp: new Date().toISOString(), // Use current timestamp
        action: action
    };

    // Send the data to the PHP script using fetch
    fetch('insertGoodIssue.php', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json',
        },
        body: JSON.stringify(data),
    })
    .then(response => response.json())
    .then(result => {
        console.log(result.message);
        
        // Display the response message in the modal
        modalVerifyTextAD.textContent = result.message; // Display the response message
        modalFooterAD.style.display = 'none';
        modalCloseAD.style.display = 'none';
        document.getElementById('modalVerifyTitle-AD').textContent = 'Success';

        // Show the success modal
        const successModal = new bootstrap.Modal(document.getElementById('disablebackdrop'));
        successModal.show();

        // Redirect after a short delay
        setTimeout(() => {
            window.location.href = 'inventory.php'; // Redirect to inventory.php
        }, 1000);
    })
    .catch(error => {
        console.error('Error:', error);
        showNotification('Error: ' + error.message); // Show error message using notification
    });
});




// Function to show notification messages
function showNotification(message) {
    const notification = document.getElementById('notification');
    const notificationMessage = document.getElementById('notificationMessage');
    const closeNotification = document.getElementById('closeNotification');

    // Set the notification message
    notificationMessage.textContent = message;

    // Show the notification
    notification.style.display = 'block';

    // Close notification when the close button is clicked
    closeNotification.onclick = function() {
        notification.style.display = 'none';
    };

    // Automatically hide the notification after 3 seconds
    setTimeout(() => {
        notification.style.display = 'none';
    }, 3000);
}


