<?php include '../fetchUser.php'; ?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta content="width=device-width, initial-scale=1.0" name="viewport">

    <title>Suppliers - Mother & Child Pharmacy and Medical Supplies</title>
    <meta content="" name="description">
    <meta content="" name="keywords">

    <!-- Favicons -->
    <link href="../resources/img/favicon.png" rel="icon">
    <link href="../resources/img/apple-touch-icon.png" rel="apple-touch-icon">

    <!-- Google Fonts -->
    <link href="https://fonts.gstatic.com" rel="preconnect">
    <link
        href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Nunito:300,300i,400,400i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i"
        rel="stylesheet">

    <!-- Vendor CSS Files -->
    <link href="../resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="../resources/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
    <link href="../resources/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
    <link href="../resources/vendor/quill/quill.snow.css" rel="stylesheet">
    <link href="../resources/vendor/quill/quill.bubble.css" rel="stylesheet">
    <link href="../resources/vendor/remixicon/remixicon.css" rel="stylesheet">
    <link href="../resources/vendor/simple-datatables/style.css" rel="stylesheet">
    <link rel="stylesheet" href="supp_styles.css">

    <!-- DataTables Imports -->
    <link rel="stylesheet" href="../users/dataTablesUsers/dataTables.css" />
    <script type="text/javascript" language="javascript" src="https://code.jquery.com/jquery-3.7.1.js"></script>
    <script src="https://cdn.datatables.net/2.1.6/js/dataTables.js"></script>

    <!-- Template Main CSS File -->
    <link href="../style.css" rel="stylesheet">

</head>

<body>

    <!-- ======= Header ======= -->
    <header id="header" class="header fixed-top d-flex align-items-center">

        <div class="d-flex align-items-center justify-content-between">
            <i class="bi bi-list toggle-sidebar-btn"></i>
            <a href="../dashboard/dashboard.php" class="logo d-flex align-items-center">
                <img src="../resources/img/logo.png" alt="">
                <span class="d-none d-lg-block span1">Mother & Child</span>
                <span class="d-none d-lg-block span2">Pharmacy and Medical Supplies</span>
            </a>
        </div><!-- End Logo -->

        <nav class="header-nav ms-auto">
            <ul class="d-flex align-items-center">

                <li class="nav-item dropdown pe-3">

                    <a class="nav-link nav-profile d-flex align-items-center pe-0" href="#" data-bs-toggle="dropdown">
                        <img src="../users/uploads/<?php echo htmlspecialchars($picture); ?>" alt="Profile"
                            class="rounded-circle">
                        <span
                            class="d-none d-md-block dropdown-toggle ps-2"><?php echo htmlspecialchars($formattedName); ?></span>
                    </a><!-- End Profile Image Icon -->

                    <ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow profile">
                        <li class="dropdown-header">
                            <h6><?php echo htmlspecialchars($employeeFullName); ?></h6>
                            <span><?php echo htmlspecialchars($role); ?></span>
                        </li>
                        <li>
                            <hr class="dropdown-divider">
                        </li>

                        <li>
                            <a class="dropdown-item d-flex align-items-center"
                                href="users-profile/users-profile.php">
                                <i class="bi bi-person"></i>
                                <span>My Profile</span>
                            </a>
                        </li>
                        <li>
                            <hr class="dropdown-divider">
                        </li>

                        <li>
                            <a class="dropdown-item d-flex align-items-center sign-out-link" href="../#">
                                <i class="bi bi-box-arrow-right"></i>
                                <span>Sign Out</span>
                            </a>
                        </li>

                    </ul><!-- End Profile Dropdown Items -->

                </li><!-- End Profile Nav -->

            </ul>
        </nav><!-- End Icons Navigation -->

    </header><!-- End Header -->

    <!-- ======= Sidebar ======= -->
    <aside id="sidebar" class="sidebar">

        <ul class="sidebar-nav" id="sidebar-nav">

            <li class="nav-item">
                <a class="nav-link collapsed" href="../dashboard/dashboard.php">
                    <i class="bi bi-grid"></i>
                    <span>Dashboard</span>
                </a>
            </li><!-- End Dashboard Nav -->

            <li class="nav-heading"></li>

            <li class="nav-item">
                <a class="nav-link" href="#">
                    <i class="bi bi-truck"></i>
                    <span>Suppliers</span>
                </a>
            </li><!-- End Suppliers Page Nav -->

            <li class="nav-item"></li>
            <a class="nav-link collapsed" href="../transactions/transactions.php">
                <i class="bi bi-cash-coin"></i>
                <span>Transactions</span>
            </a>
            </li><!-- End Transactions Page Nav -->

            <li class="nav-item"></li>
            <a class="nav-link collapsed" href="../purchaseorders/purchaseorders.php">
                <i class="bi bi-mailbox"></i>
                <span>Purchase Orders</span>
            </a>
            </li><!-- End Purchase Order Page Nav -->


            <li class="nav-item">
            <a class="nav-link collapsed" href="../delivery/delivery.php">
                <i class="bi bi-truck"></i>
                <span>Delivery</span>
            </a>
            </li><!-- End Delivery Page Nav -->

            <li class="nav-item"></li>
            <a class="nav-link collapsed" href="../inventory/inventory.php">
                <i class="bi bi-box-seam"></i>
                <span>Inventory</span>
            </a>
            </li><!-- End Inventory Page Nav -->

            <li class="nav-heading"></li>

            <li class="nav-item"></li>
            <a class="nav-link collapsed" href="../pos/pos.php">
                <i class="bi bi-printer"></i>
                <span>POS</span>
            </a>
            </li><!-- End POS Page Nav -->

            <li class="nav-item"></li>
            <a class="nav-link collapsed" href="../returnexchange/returnexchange.php">
                <i class="bi bi-cart-dash"></i>
                <span>Return & Exchange</span>
            </a>
            </li><!-- End Return & Exchange Page Nav -->



            <li class="nav-heading"></li>

            <li class="nav-item">
            <a class="nav-link collapsed" href="../users/users.php">
                <i class="bi bi-person"></i>
                <span>Users</span>
            </a>
            </li><!-- End Users Page Nav -->

            <li class="nav-item">
                <a class="nav-link collapsed" href="../audittrail/audittrail.php">
                    <i class="bi bi-clipboard-data"></i>
                    <span>Audit Trail</span>
                </a>
            </li><!-- End Audit Trail Page Nav -->


            <li class="nav-item">
                <a class="nav-link collapsed" href="../backuprestore/backuprestore.php">
                    <i class="bi bi-cloud-check"></i>
                    <span>Backup & Restore</span>
                </a>
  </li><!-- End B&R Page Nav -->


        </ul>

    </aside><!-- End Sidebar-->

    <main id="main" class="main">

        <div class="pagetitle">
            <h1>Suppliers</h1>
            <nav>
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="../dashboard/dashboard.php">Home</a></li>
                    <li class="breadcrumb-item active">Suppliers</li>
                </ol>
            </nav>
        </div><!-- End Page Title -->

        <section class="section users">
            <div class="row">
                <div class="containerAddArchive">
                    <div class="button" id="addUser">
                        <img src="../resources/img/add.png" alt="Add Supplier"> Add New
                    </div>
                    <div class="archived-users" id="toArchivedUsers">
                        Archived Suppliers<img src="../resources/img/right-arrow-3.png" alt="Archive Button">
                    </div>
                </div>
                <br>
                <!-- <div id="usersNum" class="usercount">
                    0 users
                </div> -->
                <div class="col-xl-12">
                    <div class="card">
                        <div class="card-body profile-card usersTableSize flex-column align-items-center">
                            <table id="example" class="display">
                                <thead>
                                    <tr class="highlight-row">
                                        <th style="text-align: center;">Supplier ID</th>
                                        <th style="text-align: center;">Company Name</th>
                                        <th style="text-align: center;">Agent Name</th>
                                        <th style="text-align: center;">Contact No.</th>
                                        <th style="text-align: center;">Email</th>
                                        
                                        <th style="text-align: center;">Actions</th>
                                    </tr>
                                </thead>
                                <tbody id="tableBody">
                                    <!-- Data rows will be inserted here by JavaScript -->
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </section>

    </main><!-- End #main -->

    <!-- ======= Footer ======= -->
    <footer id="footer" class="footer">
        <div class="copyright">
            &copy; Copyright <strong><span>Mother & Child Pharmacy and Medical Supplies</span></strong>. All Rights
            Reserved
        </div>
        <div class="credits">
            Designed by <a href="https://www.sti.edu/campuses-details.asp?campus_id=QU5H">STI College Angeles - BSIT4-A
                S.Y. 2024-2025 </a>
        </div>
    </footer><!-- End Footer -->

    <a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i
            class="bi bi-arrow-up-short"></i></a>

      <!-- Archive Modal (overlayAD) -->
        <div id="overlayAD" class="overlay" style="display: none;"> <!-- Initially hidden -->
            <div class="overlayAD-content">
                <span id="closeBtnAD" class="close-btn">&times;</span>
                <h2>Other Options</h2>
                <hr>
                <button id="archiveUserBtn" type="button" data-bs-toggle="modal" data-bs-target="#disablebackdrop-AD">
                    <img src="../resources/img/box-archive.png"> Archive Product
                </button>
                <br>
                <div class="modal" id="disablebackdrop-AD" tabindex="-1" data-bs-backdrop="false">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="modalVerifyTitle-AD">Confirmation</h5>
                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close" id="modalClose-AD"></button>
                            </div>
                            <div class="modal-body" id="modalVerifyText-AD">
                                Are you sure you want to do this?
                            </div>
                            <div class="modal-footer" id="modal-footer-AD">
                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">No</button>
                                <button type="button" class="btn btn-primary" id="modalYes">Yes</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    <div id="overlay" class="overlay">
        <div class="overlay-content">
            <span id="closeBtn" class="close-btn">&times;</span>
            <h2>Add New Supplier</h2>
            <hr>
            <form id="userForm" action="addData.php" method="post" enctype="multipart/form-data"
                onsubmit="handleFormSubmit()">
                <div class="container">
                    <div class="textbox">
                        <div class="label">
                            <label for="newID">Supplier ID</label><br>
                        </div>
                        <input type="text" id="newID" name="newID" disabled>
                    </div>
                </div>
                <div class="container">
                    <div class="textbox">
                        <div class="label">
                            <label for="companyName">Company Name</label><br>
                        </div>
                        <input type="text" id="companyName" name="companyName" required>
                    </div>
                    <!-- <div class="textbox">
                        <div class="label">
                            <label for="employeeName">Employee Middle Name</label><br>
                        </div>
                        <input type="text" id="employeeMidName" name="employeeMidName" required>
                    </div> -->
                    <div class="textbox">
                        <div class="label">
                            <label for="agentName" >Agent Name</label><br>
                        </div>
                        <input type="text" id="agentName" name="agentName" required> 
                    </div>
                </div>
                <div class="container">
                    <div class="textbox">
                        <div class="label">
                            <label for="ContactNo">Contact No.</label><br>
                        </div>
                        <input type="text" id="ContactNo" name="ContactNo" required>
                    </div>
                    <div class="textbox">
                        <div class="label">
                            <label for="Email">Email</label><br>
                        </div>
                        <input type="email" id="Email" name="Email" required>
                    </div>
                </div>
                <div class="container">
                    <div class="textbox">
                        <div class="label">
                            <label for="Notes">Notes</label><br>
                        </div>
                        <input type="text" id="Notes" name="Notes">
                    </div>
                </div>
                
                <br>
                <div class="line"></div>
                <div class="button-container">
                    <button id="cancelBtn" type="button" onclick="closeOverlay()">Cancel</button>
                    <button type="submit">Add</button>
                </div>
            </form>
        </div>
    </div>
    <!-- End of Overlay for Add -->


    <!-- Update FORM -->


    <div id="overlayEdit1" class="overlay">
    <div class="overlay-content">
        <span id="closeBtnEdit" class="close-btn">&times;</span>
        <h2>Update Supplier</h2>
        <hr>
        <form id="userFormEdit" action="updateSupplier.php" method="post" enctype="multipart/form-data"
              onsubmit="handleFormSubmit1(event)">
            <div class="container">
                <div class="textbox">
                    <div class="label">
                        <label for="newID">Supplier ID</label><br>
                    </div>
                    <!--<input type="hidden" id="edit_newID" name="newID">  Changed to hidden -->
                    <input type="hidden" id="edit_newID" name="supplierID" />
                </div>
            </div>
            <div class="container">
                <div class="textbox">
                    <div class="label">
                        <label for="companyName">Company Name</label><br>
                    </div>
                    <input type="text" id="edit_companyName" name="companyName">
                </div>
                <div class="textbox">
                    <div class="label">
                        <label for="agentName">Agent Name</label><br>
                    </div>
                    <input type="text" id="edit_agentName" name="agentName">
                </div>
            </div>
            <div class="container">
                <div class="textbox">
                    <div class="label">
                        <label for="ContactNo">Contact No.</label><br>
                    </div>
                    <input type="text" id="edit_ContactNo" name="ContactNo">
                </div>
                <div class="textbox">
                    <div class="label">
                        <label for="Email">Email</label><br>
                    </div>
                    <input type="email" id="edit_Email" name="Email">
                </div>
            </div>
            <div class="container">
                <div class="textbox">
                    <div class="label">
                        <label for="Notes">Notes</label><br>
                    </div>
                    <input type="text" id="edit_Notes" name="Notes">
                </div>
            </div>
            <br>
            <div class="line"></div>


            <!-- Button of update -->
            <div class="button-container">
                <button id="cancelBtn" type="button" onclick="closeEditOverlay()">Cancel</button>
                <button type="submit">Update</button> <!-- Changed type to submit -->
            </div>
        </form>
    </div>
</div>


    <!-- End of update -->



    <div id="overlayEdit" class="overlay">
        <div class="overlay-content">
            <span id="closeBtnEdit" class="close-btn">&times;</span>
            <h2>Edit User</h2>
            <hr>
            
        </div>
    </div>
    <!-- End of Overlay for Edit -->

    <div id="overlayAD" class="overlay">
        <div class="overlayAD-content">
            <span id="closeBtnAD" class="close-btn">&times;</span>
            <h2>Other Options</h2>
            <hr>
            <form id="userFormAD" action="archiveAccount.php" method="post" enctype="multipart/form-data"
                onsubmit="handleFormSubmit()">
                <button id="archiveUserBtn" type="button"><img src="../resources/img/archive.png"> Archive User
                    Account</button>
                <button id="deleteUserBtn" type="button"><img src="../resources/img/delete.png"> Delete User
                    Permanently</button>
                <button id="resetPasswordBtn" type="button"><img src="../resources/img/resetPass.png"> Reset
                    Password</button>
            </form>
        </div>
    </div>


    <!-- Success Modal -->
    <div id="successModal" class="modal" style="display: none;">
        <div class="modal-content">
            <span class="close-btn" onclick="closeSuccessModal()">&times;</span>
            <h2>Success!</h2>
            <p id="successMessage"></p>
        </div>
    </div>
















    <!-- End of Overlay for Archive/Delete -->


    <!-- Template Main JS File -->
    <script src="../main.js"></script>
    <script src="Suppliers.js"></script>

    <!-- Vendor JS Files -->
    <script src="../resources/vendor/apexcharts/apexcharts.min.js"></script>
    <script src="../resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
    <script src="../resources/vendor/chart.js/chart.umd.js"></script>
    <script src="../resources/vendor/echarts/echarts.min.js"></script>
    <script src="../resources/vendor/quill/quill.js"></script>
    <script src="../resources/vendor/simple-datatables/simple-datatables.js"></script>
    <script src="../resources/vendor/tinymce/tinymce.min.js"></script>
    <script src="../resources/vendor/php-email-form/validate.js"></script>

</body>

</html>