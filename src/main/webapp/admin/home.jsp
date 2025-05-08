<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Tableau de Bord Médical</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        /* Fixed Sidebar Styles */
        .sidebar {
            transition: all 0.3s ease;
            width: 250px;
            height: 100vh;
            position: fixed;
            top: 0;
            left: 0;
            z-index: 1030;
            overflow-y: auto;
            padding-top: 60px; /* Espace pour la navbar */
        }

        .sidebar.collapsed {
            width: 60px;
            transform: translateX(0);
        }

        .sidebar.collapsed .nav-link span {
            display: none;
        }

        .sidebar.collapsed .nav-link i {
            margin-right: 0;
        }

        .main-content {
            transition: all 0.3s ease;
            margin-left: 250px;
            padding-top: 70px;
        }

        .sidebar.collapsed + .main-content {
            margin-left: 60px;
        }

        .navbar {
            z-index: 1040;
            position: fixed;
            width: 100%;
            top: 0;
            left: 0;
        }

        /* Mobile Sidebar */
        @media (max-width: 768px) {
            .sidebar {
                transform: translateX(-100%);
                width: 250px;
            }
            
            .sidebar.collapsed {
                transform: translateX(-100%);
            }
            
            .sidebar.mobile-visible {
                transform: translateX(0);
                box-shadow: 0 0 15px rgba(0, 0, 0, 0.2);
            }
            
            .main-content {
                margin-left: 0 !important;
                width: 100%;
            }
            
            .overlay {
                display: none;
                position: fixed;
                top: 0;
                left: 0;
                right: 0;
                bottom: 0;
                background-color: rgba(0, 0, 0, 0.5);
                z-index: 1025;
            }
            
            .overlay.active {
                display: block;
            }
        }

        /* Responsive Adjustments */
        @media (max-width: 992px) {
            .card-header h4 {
                font-size: 1.1rem;
            }
            .table-responsive {
                font-size: 0.9rem;
            }
            .card-header .d-flex {
                flex-direction: column;
                align-items: flex-start !important;
            }
            .card-header .btn {
                margin-top: 10px;
            }
        }

        /* Tab Styles */
        .nav-tabs .nav-link {
            border-radius: 0;
            padding: 12px 20px;
        }

        .tab-content {
            padding: 20px;
            background: #fff;
            border: 1px solid #dee2e6;
            border-top: none;
        }

        /* Form Responsive */
        @media (max-width: 992px) {
            .user-form .col-md-6 {
                flex: 0 0 100%;
                max-width: 100%;
                border-right: none !important;
            }
            .nav-tabs .nav-link {
                padding: 8px 12px;
                font-size: 0.9rem;
            }
        }

        /* Dropdown Menu */
        .dropdown-menu {
            min-width: 140px;
        }

        .fa-ellipsis-v:hover {
            color: #0d6efd;
        }
        
        /* Animation fix */
        .card {
            overflow: hidden;
        }
    </style>
</head>
<body class="bg-light">
    <!-- Overlay for mobile -->
    <div class="overlay" id="overlay"></div>
    
    <!-- Header -->
    <nav class="navbar navbar-expand-lg navbar-dark bg-primary shadow">
        <div class="container-fluid">
            <button class="btn btn-primary me-2 sidebar-toggle" id="sidebarToggle">
                <i class="fas fa-bars"></i>
            </button>
            <a class="navbar-brand" href="#">
                <i class="fas fa-leaf me-2"></i>TabacStop
            </a>
            <div class="d-flex align-items-center">
                <div class="dropdown">
                    <button class="btn btn-link text-white dropdown-toggle" type="button" id="profileDropdown" data-bs-toggle="dropdown">
                        <i class="fas fa-user-circle fa-lg"></i>
                    </button>
                    <ul class="dropdown-menu dropdown-menu-end shadow">
                        <li><a class="dropdown-item" href="#"><i class="fas fa-cog me-2"></i>Paramètres</a></li>
                        <li><hr class="dropdown-divider"></li>
                        <li><a class="dropdown-item" href="#"><i class="fas fa-sign-out-alt me-2"></i>Déconnexion</a></li>
                    </ul>
                </div>
            </div>
        </div>
    </nav>

    <!-- Sidebar -->
    <div class="sidebar bg-white shadow-sm p-3" id="sidebar">
        <ul class="nav flex-column">
            <li class="nav-item">
                <a class="nav-link active" href="#"><i class="fas fa-home me-2"></i><span>Tableau de bord</span></a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="#userManagement"><i class="fas fa-user-cog me-2"></i><span>Gestion Utilisateurs</span></a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="#"><i class="fas fa-chart-bar me-2"></i><span>Rapports</span></a>
            </li>
        </ul>
    </div>

    <!-- Main Content -->
    <main class="main-content flex-grow-1 p-4 mt-4">
        <section id="userManagement" class="mt-4">
            <div class="card shadow-lg rounded-3 mb-4">
                <div class="card-header bg-primary text-white py-3">
                    <div class="d-flex justify-content-between align-items-center flex-wrap">
                        <h4 class="mb-0"><i class="fas fa-users me-2"></i>Liste des Utilisateurs</h4>
                        <button type="button" class="btn btn-light btn-sm rounded-pill px-3" id="btnAddUser">
                            <i class="fas fa-plus-circle me-2"></i>Ajouter
                        </button>
                    </div>
                </div>
                <div class="card-body py-2 bg-light border-bottom">
                    <div class="input-group">
                        <span class="input-group-text bg-white border-end-0"><i class="fas fa-search text-primary"></i></span>
                        <input type="text" class="form-control border-start-0" id="searchInput" placeholder="Rechercher un utilisateur...">
                    </div>
                </div>
                <div class="card-body p-0">
                    <div id="userTableLoading" class="text-center py-4">
                        <div class="spinner-border text-primary" role="status">
                            <span class="visually-hidden">Chargement...</span>
                        </div>
                    </div>
                    <div class="table-responsive" id="userTableContainer" style="display: none;">
                        <table class="table table-hover mb-0" id="userTable">
                            <thead class="bg-light">
                                <tr>
                                    <th scope="col">User</th>
                                    <th scope="col">Email</th>
                                    <th scope="col">Rôle</th>
                                    <th scope="col" class="text-center">Actions</th>
                                </tr>
                            </thead>
                            <tbody id="userTableBody"></tbody>
                        </table>
                    </div>
                </div>
            </div>

            <!-- Tabbed User Form -->
            <div class="card shadow-lg rounded-3 user-form" id="userFormCard" style="display: none;">
                <div class="card-header bg-primary text-white py-3">
                    <div class="d-flex justify-content-between align-items-center flex-wrap">
                        <h4 class="mb-0" id="formTitle"><i class="fas fa-user-cog me-2"></i>Gestion des Comptes</h4>
                        <div>
                            <button type="button" class="btn btn-light btn-sm rounded-pill px-3 me-2" id="btnCancelForm">
                                <i class="fas fa-times me-2"></i>Annuler
                            </button>
                            <button type="submit" class="btn btn-success btn-sm rounded-pill px-3" form="combinedForm">
                                <i class="fas fa-save me-2"></i>Enregistrer
                            </button>
                        </div>
                    </div>
                </div>
                <div class="card-body p-0">
                    <form id="combinedForm">
                        <input type="hidden" id="formMode" name="formMode" value="add">
                        <input type="hidden" id="userId" name="userId" value="">

                        <ul class="nav nav-tabs" role="tablist">
                            <li class="nav-item">
                                <a class="nav-link active" id="account-tab" data-bs-toggle="tab" href="#account" role="tab">
                                    <i class="fas fa-user-lock me-2"></i><span class="d-none d-sm-inline">Compte</span>
                                </a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" id="personal-tab" data-bs-toggle="tab" href="#personal" role="tab">
                                    <i class="fas fa-id-card me-2"></i><span class="d-none d-sm-inline">Personnel</span>
                                </a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" id="contact-tab" data-bs-toggle="tab" href="#contact" role="tab">
                                    <i class="fas fa-address-book me-2"></i><span class="d-none d-sm-inline">Contact</span>
                                </a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" id="professional-tab" data-bs-toggle="tab" href="#professional" role="tab">
                                    <i class="fas fa-briefcase me-2"></i><span class="d-none d-sm-inline">Pro</span>
                                </a>
                            </li>
                        </ul>

                        <div class="tab-content">
                            <!-- Account Tab -->
                            <div class="tab-pane fade show active" id="account" role="tabpanel">
                                <div class="p-4">
                                    <div class="mb-3">
                                        <div class="input-group">
                                            <span class="input-group-text"><i class="fas fa-user text-primary"></i></span>
                                            <input type="text" class="form-control" placeholder="Nom d'utilisateur" id="username" name="username" required>
                                        </div>
                                    </div>
                                    <div class="mb-3">
                                        <div class="input-group">
                                            <span class="input-group-text"><i class="fas fa-envelope text-primary"></i></span>
                                            <input type="email" class="form-control" placeholder="Email" id="email" name="email" required>
                                        </div>
                                    </div>
                                    <div class="mb-3">
                                        <div class="input-group">
                                            <span class="input-group-text"><i class="fas fa-key text-primary"></i></span>
                                            <input type="password" class="form-control" placeholder="Mot de passe" id="password" name="password" required>
                                        </div>
                                    </div>
                                    <div class="mb-3">
                                        <div class="input-group">
                                            <span class="input-group-text"><i class="fas fa-user-shield text-primary"></i></span>
                                            <select class="form-select" id="role" name="role" required>
                                                <option value="admin">Admin</option>
                                                <option value="patient">Patient</option>
                                                <option value="medecin">Médecin</option>
                                                <option value="assistant">Assistant</option>
                                            </select>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <!-- Personal Tab -->
                            <div class="tab-pane fade" id="personal" role="tabpanel">
                                <div class="p-4">
                                    <div class="row g-3">
                                        <div class="col-md-6">
                                            <div class="input-group">
                                                <span class="input-group-text"><i class="fas fa-user text-primary"></i></span>
                                                <input type="text" class="form-control" placeholder="Nom" id="nomString" name="nomString">
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="input-group">
                                                <span class="input-group-text"><i class="fas fa-user-tag text-primary"></i></span>
                                                <input type="text" class="form-control" placeholder="Prénom" id="prenomString" name="prenomString">
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="input-group">
                                                <span class="input-group-text"><i class="fas fa-calendar-alt text-primary"></i></span>
                                                <input type="date" class="form-control" id="dateNaissance" name="dateNaissance">
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="input-group">
                                                <span class="input-group-text"><i class="fas fa-venus-mars text-primary"></i></span>
                                                <select class="form-select" id="sexechar" name="sexechar">
                                                    <option value="M">Masculin</option>
                                                    <option value="F">Féminin</option>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="input-group">
                                                <span class="input-group-text"><i class="fas fa-id-card text-primary"></i></span>
                                                <input type="text" class="form-control" placeholder="CIN" id="cinString" name="cinString">
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="input-group">
                                                <span class="input-group-text"><i class="fas fa-heart text-primary"></i></span>
                                                <select class="form-select" id="etatCivilString" name="etatCivilString">
                                                    <option value="Célibataire">Célibataire</option>
                                                    <option value="Marié(e)">Marié(e)</option>
                                                    <option value="Divorcé(e)">Divorcé(e)</option>
                                                </select>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <!-- Contact Tab -->
                            <div class="tab-pane fade" id="contact" role="tabpanel">
                                <div class="p-4">
                                    <div class="mb-3">
                                        <div class="input-group">
                                            <span class="input-group-text"><i class="fas fa-map-marker-alt text-primary"></i></span>
                                            <input type="text" class="form-control" placeholder="Adresse" id="adresseString" name="adresseString">
                                        </div>
                                    </div>
                                    <div class="row g-3">
                                        <div class="col-md-6">
                                            <div class="input-group">
                                                <span class="input-group-text"><i class="fas fa-phone text-primary"></i></span>
                                                <input type="tel" class="form-control" placeholder="Téléphone" id="telephoneString" name="telephoneString">
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="input-group">
                                                <span class="input-group-text"><i class="fas fa-envelope text-primary"></i></span>
                                                <input type="email" class="form-control" placeholder="Email" id="emailString" name="emailString">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <!-- Professional Tab -->
                            <div class="tab-pane fade" id="professional" role="tabpanel">
                                <div class="p-4">
                                    <div class="row g-3">
                                        <div class="col-md-6">
                                            <div class="input-group">
                                                <span class="input-group-text"><i class="fas fa-id-badge text-primary"></i></span>
                                                <input type="text" class="form-control" placeholder="Matricule" id="matriculeString" name="matriculeString">
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="input-group">
                                                <span class="input-group-text"><i class="fas fa-calendar-check text-primary"></i></span>
                                                <input type="date" class="form-control" id="dateEmbaucheString" name="dateEmbaucheString">
                                            </div>
                                        </div>
                                        <div class="col-12">
                                            <div class="input-group">
                                                <span class="input-group-text"><i class="fas fa-star text-primary"></i></span>
                                                <input type="text" class="form-control" placeholder="Spécialité principale" id="specialitePrincipaleString" name="specialitePrincipaleString">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </section>
    </main>

    <!-- Delete Confirmation Modal -->
    <div class="modal fade" id="deleteConfirmationModal" tabindex="-1">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header bg-danger text-white">
                    <h5 class="modal-title">Confirmation de suppression</h5>
                    <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal"></button>
                </div>
                <div class="modal-body">
                    <p>Êtes-vous sûr de vouloir supprimer cet utilisateur ? Cette action est irréversible.</p>
                    <p class="fw-bold" id="deleteUserInfo"></p>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Annuler</button>
                    <button type="button" class="btn btn-danger" id="confirmDelete">
                        <span class="spinner-border spinner-border-sm me-2 d-none" id="deleteSpinner"></span>
                        Supprimer
                    </button>
                </div>
            </div>
        </div>
    </div>

    <!-- Message Modal -->
    <div class="modal fade" id="messageModal" tabindex="-1">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header" id="messageModalHeader">
                    <h5 class="modal-title" id="messageModalTitle"></h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                </div>
                <div class="modal-body" id="messageModalBody"></div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Fermer</button>
                </div>
            </div>
        </div>
    </div>

    <!-- Scripts -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        $(document).ready(function() {
            // Sidebar Toggle pour desktop et mobile
            $('#sidebarToggle').on('click', function() {
                const $sidebar = $('#sidebar');
                const $overlay = $('#overlay');
                
                if ($(window).width() <= 768) {
                    // Mode mobile
                    $sidebar.toggleClass('mobile-visible');
                    $overlay.toggleClass('active');
                } else {
                    // Mode desktop
                    $sidebar.toggleClass('collapsed');
                }
            });

            // Fermer la sidebar mobile en cliquant sur l'overlay
            $('#overlay').on('click', function() {
                $('#sidebar').removeClass('mobile-visible');
                $(this).removeClass('active');
            });

            // Ajustement responsive de la sidebar
            function adjustSidebar() {
                const $sidebar = $('#sidebar');
                const $overlay = $('#overlay');
                
                if ($(window).width() <= 768) {
                    $sidebar.removeClass('collapsed').removeClass('mobile-visible');
                    $overlay.removeClass('active');
                } else {
                    $sidebar.removeClass('mobile-visible');
                    $overlay.removeClass('active');
                    if (!$sidebar.hasClass('collapsed')) {
                        $sidebar.removeClass('collapsed');
                    }
                }
            }

            adjustSidebar();
            $(window).on('resize', adjustSidebar);

            let currentUserId = null;
            let userData = [];

            // Fonction pour afficher les messages dans une modal
            function showMessage(type, title, message) {
                const $modal = $('#messageModal');
                const $header = $('#messageModalHeader');
                const $title = $('#messageModalTitle');
                const $body = $('#messageModalBody');

                $header.removeClass('bg-success bg-danger bg-warning bg-info text-white');

                switch(type) {
                    case 'success':
                        $header.addClass('bg-success text-white');
                        break;
                    case 'error':
                        $header.addClass('bg-danger text-white');
                        break;
                    case 'warning':
                        $header.addClass('bg-warning');
                        break;
                    default:
                        $header.addClass('bg-info text-white');
                }

                $title.text(title);
                $body.html(message);
                
                const modal = new bootstrap.Modal($modal[0]);
                modal.show();
            }

            // Initialisation
            function init() {
                loadUsers();
                initFormSubmit();
                initSearch();
                initUserActions();
            }

            // Date Formatting Function
            function formatDateForInput(dateStr) {
                if (!dateStr) return '';
                const date = new Date(dateStr);
                if (isNaN(date.getTime())) return '';
                return date.toISOString().split('T')[0];
            }

            // Chargement des utilisateurs
            function loadUsers() {
                showLoading(true);
                $.ajax({
                    url: 'http://localhost:8080/WEB/admin/chargerUtilisateur',
                    type: 'POST',
                    success: function(data) {
                        userData = data;
                        updateUserTable(data);
                        showLoading(false);
                    },
                    error: function(xhr) {
                        showLoading(false);
                        showMessage('error', 'Erreur de Chargement', 
                            'Impossible de charger les utilisateurs. Code: ' + xhr.status);
                    }
                });
            }

            // Mise à jour du tableau
            function updateUserTable(users) {
                const $table = $("#userTableBody").empty();

                if (users && users.length > 0) {
                    $.each(users, function(index, user) {
                        const row = $('<tr>').attr('data-user-id', user.id);

                        const dropdownMenu = `
                            <div class="dropdown">
                                <button class="btn btn-link p-0" type="button" data-bs-toggle="dropdown">
                                    <i class="fas fa-ellipsis-v"></i>
                                </button>
                                <ul class="dropdown-menu shadow">
                                    <li>
                                        <a class="dropdown-item text-primary" href="#" data-action="view">
                                            <i class="fas fa-eye me-2"></i>Voir
                                        </a>
                                    </li>
                                    <li>
                                        <a class="dropdown-item text-warning" href="#" data-action="edit">
                                            <i class="fas fa-edit me-2"></i>Editer
                                        </a>
                                    </li>
                                    <li>
                                        <a class="dropdown-item text-danger" href="#" data-action="delete">
                                            <i class="fas fa-trash me-2"></i>Supprimer
                                        </a>
                                    </li>
                                </ul>
                            </div>
                        `;

                        row.append(
                            $('<td>').text(user.nomUtilsateur),
                            $('<td>').text(user.email),
                            $('<td>').html(getRoleBadge(user.role.nom)),
                            $('<td>').addClass('text-center').html(dropdownMenu)
                        );
                        $table.append(row);
                    });
                } else {
                    showEmptyState();
                }
            }

            // Gestion du formulaire
            function initFormSubmit() {
                $('#combinedForm').off('submit').on('submit', function(e) {
                    e.preventDefault();

                    const $form = $(this);
                    const formMode = $('#formMode').val();
                    let formData = $form.serialize();

                    const isEdit = formMode === 'edit';
                    const url = isEdit
                        ? 'http://localhost:8080/WEB/admin/modifierUtilisateur'
                        : 'http://localhost:8080/WEB/admin/ajouterUtilisateur';
                    const method = 'POST';

                    const $submitBtn = $form.find('button[type="submit"]');
                    $submitBtn.prop('disabled', true);

                    $.ajax({
                        url: url,
                        type: method,
                        data: formData,
                        success: function(response) {
                            $('#userFormCard').slideUp();
                            loadUsers();
                            showMessage('success', 'Succès', 
                                `Utilisateur ${isEdit ? 'modifié' : 'ajouté'} avec succès !`);
                        },
                        error: function(xhr) {
                            showMessage('error', 'Erreur de Soumission', 
                                'Erreur lors de la soumission : ' + (xhr.responseText || 'Erreur inconnue'));
                        },
                        complete: function() {
                            $submitBtn.prop('disabled', false);
                        }
                    });
                });
            }

            // Gestion des actions utilisateur
            function initUserActions() {
                $(document)
                    .on('click', '#btnAddUser', () => showUserForm('add'))
                    .on('click', '#btnCancelForm', () => $('#userFormCard').slideUp())
                    .on('click', '[data-action]', function(e) {
                        e.preventDefault();
                        const action = $(this).data('action');
                        const userId = $(this).closest('tr').data('user-id');

                        switch (action) {
                            case 'view':
                                viewUser({id: userId});
                                break;
                            case 'edit':
                                editUser(userId);
                                break;
                            case 'delete':
                                confirmDelete(userId);
                                break;
                        }
                    });
            }

            // Édition d'utilisateur
            function editUser(Id) {
                let userId = Id;
                currentUserId = userId;

                showLoading(true);
                $.ajax({
                    url: 'http://localhost:8080/WEB/admin/chercherUtilisateur',
                    type: 'GET',
                    data: {userId},
                    success: function(data) {
                        showLoading(false);
                        if (data) {
                            const personnel = data.Personnel || {};
                            showUserForm('edit', {
                                id: data.id,
                                username: data.nomUtilsateur,
                                pswd: data.pswd,
                                email: data.email,
                                role: data.role.nom.toLowerCase(),
                                nom: personnel.nom,
                                prenom: personnel.prenom,
                                dateNaissance: formatDateForInput(personnel.dateNaissance),
                                sexe: personnel.sexe || '',
                                adresse: personnel.adresse,
                                telephone: personnel.telephone,
                                matricule: personnel.matricule,
                                dateEmbauche: formatDateForInput(personnel.dateEmbauche),
                                specialite: personnel.specialitePrincipale || '',
                                cin: personnel.cin,
                                etatCivil: personnel.etatCivil
                            });
                        }
                    },
                    error: function(xhr) {
                        showLoading(false);
                        showMessage('error', 'Erreur de Chargement', 
                            'Erreur lors du chargement : ' + xhr.status);
                    }
                });
            }

            // Voir utilisateur
            function viewUser(user) {
                let userId = user.id;
                showLoading(true);
                $.ajax({
                    url: 'http://localhost:8080/WEB/admin/chercherUtilisateur',
                    type: 'GET',
                    data: {userId},
                    success: function(data) {
                        showLoading(false);
                        if (data) {
                            const personnel = data.Personnel || {};
                            showUserForm('view', {
                                id: data.id,
                                username: data.nomUtilsateur,
                                pswd: data.pswd,
                                email: data.email,
                                role: data.role.nom.toLowerCase(),
                                nom: personnel.nom,
                                prenom: personnel.prenom,
                                dateNaissance: formatDateForInput(personnel.dateNaissance),
                                sexe: personnel.sexe || '',
                                adresse: personnel.adresse,
                                telephone: personnel.telephone,
                                matricule: personnel.matricule,
                                dateEmbauche: formatDateForInput(personnel.dateEmbauche),
                                specialite: personnel.specialitePrincipale || '',
                                cin: personnel.cin,
                                etatCivil: personnel.etatCivil
                            });
                        }
                    },
                    error: function(xhr) {
                        showLoading(false);
                        showMessage('error', 'Erreur de Chargement', 
                            'Erreur lors du chargement : ' + xhr.status);
                    }
                });
            }

            // Affichage du formulaire
            function showUserForm(mode, user = {}) {
                const validModes = ['add', 'edit', 'view'];
                if (!validModes.includes(mode)) return;

                const $form = $('#combinedForm');
                $form[0].reset();

                $('#formMode').val(mode);
                $('#userId').val(user.id || '');

                const isViewMode = mode === 'view';
                const isAddMode = mode === 'add';
                const isEditMode = mode === 'edit';

                // Account Tab
                $('#username').val(user.username || '').prop('disabled', isViewMode);
                $('#email').val(user.email || '').prop('disabled', isViewMode);
                $('#role').val(user.role || 'user').prop('disabled', isViewMode);
                $('#password')
                    .val(user.pswd)
                    .prop('required', isAddMode)
                    .closest('.mb-3')
                    .toggle(isAddMode || isEditMode);

                // Personal Tab
                $('#nomString').val(user.nom || '').prop('disabled', isViewMode);
                $('#prenomString').val(user.prenom || '').prop('disabled', isViewMode);
                $('#dateNaissance').val(user.dateNaissance || '').prop('disabled', isViewMode);
                $('#sexechar').val(user.sexe || 'M').prop('disabled', isViewMode);
                $('#cinString').val(user.cin || '').prop('disabled', isViewMode);
                $('#etatCivilString').val(user.etatCivil || 'Célibataire').prop('disabled', isViewMode);

                // Contact Tab
                $('#adresseString').val(user.adresse || '').prop('disabled', isViewMode);
                $('#telephoneString').val(user.telephone || '').prop('disabled', isViewMode);
                $('#emailString').val(user.email || '').prop('disabled', isViewMode);

                // Professional Tab
                $('#matriculeString').val(user.matricule || '').prop('disabled', isViewMode);
                $('#dateEmbaucheString').val(user.dateEmbauche || '').prop('disabled', isViewMode);
                $('#specialitePrincipaleString').val(user.specialite || '').prop('disabled', isViewMode);

                const titles = {
                    add: 'Ajouter un Utilisateur',
                    edit: 'Modifier un Utilisateur',
                    view: 'Consulter un Utilisateur'
                };
                $('#formTitle').text(titles[mode]);
                $('button[type="submit"]').prop('disabled', isViewMode);

                $('#userFormCard').slideDown();
            }

            // Recherche
            function initSearch() {
                $('#searchInput').on('input', function() {
                    const term = $(this).val().toLowerCase();
                    const filtered = userData.filter(u =>
                        u.nomUtilsateur.toLowerCase().includes(term) ||
                        u.email.toLowerCase().includes(term)
                    );
                    updateUserTable(filtered);
                });
            }

            // Helpers
            function getRoleBadge(role) {
                const color = role === 'admin' ? 'bg-primary' : 'bg-secondary';
                return '<span class="badge ' + color + ' p-2">' + role + '</span>';
            }

            function showLoading(show) {
                $('#userTableLoading').toggle(show);
                $('#userTableContainer').toggle(!show);
            }

            function showEmptyState() {
                $('#userTableBody').html(
                    '<tr>' +
                    '<td colspan="4" class="text-center text-muted py-4">' +
                    '<i class="fas fa-users-slash fa-2x mb-3"></i>' +
                    '<p>Aucun utilisateur trouvé</p>' +
                    '</td>' +
                    '</tr>'
                );
            }

            function confirmDelete(userId) {
                currentUserId = userId;
                var modal = new bootstrap.Modal(document.getElementById('deleteConfirmationModal'));
                modal.show();
            }

            $('#confirmDelete').click(function() {
                $.ajax({
                    url: 'http://localhost:8080/WEB/admin/supprimerUtilisateur',
                    type: 'POST',
                    data: {id: currentUserId},
                    success: function() {
                        loadUsers();
                        var modal = bootstrap.Modal.getInstance(document.getElementById('deleteConfirmationModal'));
                        modal.hide();
                        showMessage('success', 'Succès', 'Utilisateur supprimé avec succès !');
                    },
                    error: function(xhr) {
                        showMessage('error', 'Erreur de Suppression', 
                            'Erreur lors de la suppression : ' + (xhr.responseText || 'Erreur inconnue'));
                    }
                });
            });

            function handleAjaxError(xhr) {
                showMessage('error', 'Erreur ' + xhr.status, 
                    xhr.responseText || 'Une erreur de traitement s\'est produite.');
            }

            // Lancement
            init();
        });
    </script>
</body>
</html>