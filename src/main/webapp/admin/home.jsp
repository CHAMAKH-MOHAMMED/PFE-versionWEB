<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="fr">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Tableau de Bord Médical</title>

        <!-- Bootstrap CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

        <!-- Font Awesome -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    </head>

    <body class="bg-light">
        <!-- Header -->
        <nav class="navbar navbar-expand-lg navbar-dark bg-primary shadow">
            <div class="container-fluid">
                <a class="navbar-brand" href="#">
                    <i class="fas fa-leaf me-2"></i>TabacStop
                </a>

                <!-- Profile -->
                <div class="d-flex align-items-center">
                    <div class="dropdown">
                        <button class="btn btn-link text-white dropdown-toggle" type="button" id="profileDropdown"
                                data-bs-toggle="dropdown">
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
        <div class="d-flex">
            <div class="bg-white shadow-sm p-3" style="width: 250px; min-height: 100vh;">
                <ul class="nav flex-column pt-3">
                    <li class="nav-item">
                        <a class="nav-link active" href="#"><i class="fas fa-home me-2"></i>Tableau de bord</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#userManagement"><i class="fas fa-user-cog me-2"></i>Gestion Utilisateurs</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#"><i class="fas fa-chart-bar me-2"></i>Rapports</a>
                    </li>
                </ul>
            </div>

            <!-- Main Content -->
            <main class="flex-grow-1 p-4">
                <!-- User Management Section -->
                <section id="userManagement" class="mt-4">
                    <!-- Table des utilisateurs -->
                    <div class="card shadow-lg rounded-3 mb-4">
                        <div class="card-header bg-primary text-white py-3">
                            <div class="d-flex justify-content-between align-items-center">
                                <h4 class="mb-0">
                                    <i class="fas fa-users me-2"></i>Liste des Utilisateurs
                                </h4>
                                <button type="button" class="btn btn-light btn-sm rounded-pill px-3" id="btnAddUser">
                                    <i class="fas fa-plus-circle me-2"></i>Ajouter
                                </button>
                            </div>
                        </div>

                        <!-- Barre de recherche -->
                        <div class="card-body py-2 bg-light border-bottom">
                            <div class="input-group">
                                <span class="input-group-text bg-white border-end-0">
                                    <i class="fas fa-search text-primary"></i>
                                </span>
                                <input type="text" class="form-control border-start-0" id="searchInput" placeholder="Rechercher un utilisateur...">
                            </div>
                        </div>

                        <div class="card-body p-0">
                            <div id="userTableLoading" class="text-center py-4">
                                <div class="spinner-border text-primary" role="status">
                                    <span class="visually-hidden">Chargement...</span>
                                </div>
                                <p class="mt-2">Chargement des utilisateurs...</p>
                            </div>
                            <div class="table-responsive" id="userTableContainer" style="display: none;">
                                <table class="table table-hover mb-0" id="userTable">
                                    <thead class="bg-light">
                                        <tr>
                                            <th scope="col">Nom utilisateur</th>
                                            <th scope="col">Email</th>
                                            <th scope="col">Rôle</th>
                                            <th scope="col" class="text-center">Actions</th>
                                        </tr>
                                    </thead>
                                    <tbody id="userTableBody">
                                        <!-- Le contenu ajouté dynamiquement via AJAX -->
                                    </tbody>
                                </table>
                            </div>
                            <div id="userTableEmpty" class="text-center py-4" style="display: none;">
                                <i class="fas fa-info-circle fa-2x text-muted mb-2"></i>
                                <p>Aucun utilisateur à afficher.</p>
                            </div>
                            <div id="userTableError" class="text-center py-4" style="display: none;">
                                <i class="fas fa-exclamation-triangle fa-2x text-danger mb-2"></i>
                                <p>Une erreur est survenue lors du chargement des utilisateurs.</p>
                                <button class="btn btn-sm btn-primary mt-2" id="btnRetryLoad">
                                    <i class="fas fa-sync-alt me-2"></i>Réessayer
                                </button>
                            </div>
                        </div>
                    </div>

                    <!-- Formulaire de gestion d'utilisateur (masqué par défaut) -->
                    <div class="card shadow-lg rounded-3" id="userFormCard" style="display: none;">
                        <div class="card-header bg-primary text-white py-3">
                            <div class="d-flex justify-content-between align-items-center">
                                <h4 class="mb-0" id="formTitle">
                                    <i class="fas fa-user-cog me-2"></i>Gestion des Comptes et Utilisateurs
                                </h4>
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

                        <div class="card-body p-4">
                            <form id="combinedForm">

                                <input type="hidden" id="formMode" name="formMode" value="add">
                                <div class="row g-4">
                                    <!-- Partie Création de Compte -->
                                    <div class="col-md-6 border-end">
                                        <div class="d-flex flex-column gap-4">
                                            <h5 class="text-primary d-flex align-items-center mb-3">
                                                <i class="fas fa-user-lock me-2 bg-primary text-white p-2 rounded"></i>Création de Compte
                                            </h5>

                                            <div class="mb-3">
                                                <label class="fw-bold p-2 bg-light rounded d-flex align-items-center shadow-sm">
                                                    <i class="fas fa-id-badge me-2 text-info"></i>Identifiants
                                                </label>
                                                <div class="input-group mb-2">
                                                    <span class="input-group-text"><i class="fas fa-user text-primary"></i></span>
                                                    <input type="hidden" id="userId" name="userId" value="">
                                                    <input type="text" class="form-control" placeholder="Nom d'utilisateur" id="username" name="username" required>
                                                </div>
                                                <div class="input-group mb-2">
                                                    <span class="input-group-text"><i class="fas fa-envelope text-primary"></i></span>
                                                    <input type="email" class="form-control" placeholder="Email" id="email" name="email" required>
                                                </div>
                                                <div class="input-group">
                                                    <span class="input-group-text"><i class="fas fa-key text-primary"></i></span>
                                                    <input type="password" class="form-control" placeholder="Mot de passe" id="password" name="password" required>
                                                </div>
                                            </div>

                                            <div class="mb-3">
                                                <label class="fw-bold p-2 bg-light rounded d-flex align-items-center shadow-sm">
                                                    <i class="fas fa-shield-alt me-2 text-warning"></i>Sécurité
                                                </label>
                                                <div class="input-group">
                                                    <span class="input-group-text"><i class="fas fa-user-shield text-primary"></i></span>
                                                    <select class="form-select" id="role" name="role" required>
                                                        <option value="admin">Admin</option>
                                                        <option value="patient">Patient</option>
                                                        <option value="medecin">Medcin</option>
                                                        <option value="assitant">Assitant</option>
                                                    </select>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <!-- Partie Informations Personnelles -->
                                    <div class="col-md-6">
                                        <div class="d-flex flex-column gap-4">
                                            <h5 class="text-primary d-flex align-items-center mb-3">
                                                <i class="fas fa-user-plus me-2 bg-primary text-white p-2 rounded"></i>Informations Personnelles
                                            </h5>

                                            <!-- Identité -->
                                            <div class="mb-3">
                                                <label class="fw-bold p-2 bg-light rounded d-flex align-items-center shadow-sm">
                                                    <i class="fas fa-id-card me-2 text-primary"></i>Identité
                                                </label>
                                                <div class="row g-2">
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
                                                </div>
                                            </div>

                                            <!-- Détails Personnels -->
                                            <div class="mb-3">
                                                <label class="fw-bold p-2 bg-light rounded d-flex align-items-center shadow-sm">
                                                    <i class="fas fa-venus-mars me-2 text-info"></i>Détails Personnels
                                                </label>
                                                <div class="row g-2">
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
                                                </div>
                                            </div>

                                            <!-- Coordonnées -->
                                            <div class="mb-3">
                                                <label class="fw-bold p-2 bg-light rounded d-flex align-items-center shadow-sm">
                                                    <i class="fas fa-address-book me-2 text-success"></i>Coordonnées
                                                </label>
                                                <div class="input-group mb-2">
                                                    <span class="input-group-text"><i class="fas fa-map-marker-alt text-primary"></i></span>
                                                    <input type="text" class="form-control" placeholder="Adresse" id="adresseString" name="adresseString">
                                                </div>
                                                <div class="row g-2">
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

                                            <!-- Détails Professionnels -->
                                            <div class="mb-3">
                                                <label class="fw-bold p-2 bg-light rounded d-flex align-items-center shadow-sm">
                                                    <i class="fas fa-briefcase me-2 text-warning"></i>Détails Professionnels
                                                </label>
                                                <div class="row g-2">
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
                                                </div>
                                            </div>

                                            <!-- Spécialités -->
                                            <div class="mb-3">
                                                <label class="fw-bold p-2 bg-light rounded d-flex align-items-center shadow-sm">
                                                    <i class="fas fa-certificate me-2 text-danger"></i>Spécialités
                                                </label>
                                                <div class="input-group">
                                                    <span class="input-group-text"><i class="fas fa-star text-primary"></i></span>
                                                    <input type="text" class="form-control" placeholder="Spécialité principale" id="specialitePrincipaleString" name="specialitePrincipaleString">
                                                </div>
                                            </div>

                                            <!-- Sécurité -->
                                            <div class="mb-3">
                                                <label class="fw-bold p-2 bg-light rounded d-flex align-items-center shadow-sm">
                                                    <i class="fas fa-lock me-2 text-secondary"></i>Sécurité
                                                </label>
                                                <div class="row g-2">
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
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </section>
            </main>
        </div>

        <!-- Modal de confirmation de suppression -->
        <div class="modal fade" id="deleteConfirmationModal" tabindex="-1" aria-labelledby="deleteConfirmationModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header bg-danger text-white">
                        <h5 class="modal-title" id="deleteConfirmationModalLabel">Confirmation de suppression</h5>
                        <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal" aria-label="Close"></button>
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

        <!-- Scripts -->
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">


           <script>
            $(document).ready(function () {
                let currentUserId = null;
                let userData = [];

                // Initialisation
                function init() {
                    loadUsers();
                    initFormSubmit();
                    initSearch();
                    initUserActions();
                }

                // Chargement des utilisateurs
                function loadUsers() {
                    showLoading(true);
                    $.ajax({
                        url: 'http://localhost:8080/WEB/admin/chargerUtilisateur',
                        type: 'POST',
                        success: function (data) {
                            userData = data;
                            updateUserTable(data);
                            showLoading(false);
                        },
                        error: handleAjaxError
                    });
                }

                // Mise à jour du tableau
                function updateUserTable(users) {
                    const $table = $("#userTableBody").empty();

                    if (users && users.length > 0) {
                        $.each(users, function (index, user) {
                            const row = $('<tr>').attr('data-user-id', user.id);

                            row.append(
                                    $('<td>').text(user.nomUtilsateur),
                                    $('<td>').text(user.email),
                                    $('<td>').html(getRoleBadge(user.role.nom)),
                                    $('<td>').addClass('text-center action-buttons').append(
                                    actionButton('info', 'Voir', 'eye', () => viewUser(user)),
                                    actionButton('warning', 'Editer', 'edit', () => editUser(user.id)),
                                    actionButton('danger', 'Supprimer', 'trash', () => confirmDelete(user.id))
                                    )
                                    );
                            $table.append(row);
                        });
                    } else {
                        showEmptyState();
                    }
                }

                // Gestion du formulaire
                function initFormSubmit() {
                    $('#combinedForm').off('submit').on('submit', function (e) {
                        e.preventDefault();

                        const $form = $(this);
                        const formMode = $('#formMode').val();

                        // Validation simple
                       
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
                            success: function (response) {
                                $('#userFormCard').slideUp();
                                loadUsers();
                                alert(`Utilisateur ${isEdit ? 'modifié' : 'ajouté'} avec succès !`);
                            },
                            error: function (xhr) {
                                alert('Erreur lors de la soumission : ' + xhr.responseText);
                            },
                            complete: function () {
                                $submitBtn.prop('disabled', false);
                            }
                        });
                    });
                }
               
                // Gestion des actions utilisateur
                function initUserActions() {
                    $(document)
                            .on('click', '#btnAddUser', () => showUserForm('add'))
                            .on('click', '#btnCancelForm', () => $('#userFormCard').slideUp());
                }

                // Édition d'utilisateur

                function editUser(Id) {
                    let userId = Id;
                    currentUserId = userId;

                    showLoading(true);
                    $.ajax({
                        url: 'http://localhost:8080/WEB/admin/chercherUtilisateur',
                        type: 'GET',
                        data: {userId}, // Le paramètre est correct
                        success: function (data) {
                            showLoading(false);
                            if (data) {
                                // Extraire les données du sous-objet Personnel
                                const personnel = data.Personnel || {};
                                showUserForm('edit', {
                                    id: data.id,
                                    username: data.nomUtilsateur,
                                    pswd:data.pswd,
                                    email: data.email,
                                    role: data.role.nom.toLowerCase(), // "patient" en minuscule
                                    nom: personnel.nom, // "ABDNOUR"
                                    prenom: personnel.prenom, // "TEST"
                                    dateNaissance: personnel.dateNaissance || '', // Non présent dans le JSON, valeur par défaut
                                    sexe: personnel.sexe || '', // "" (vide dans le JSON)
                                    adresse: personnel.adresse, // "242573563"
                                    telephone: personnel.telephone, // "07655772762"
                                    matricule: personnel.matricule, // "JDHHHEHDJZE2334"
                                    dateEmbauche: personnel.dateEmbauche || '', // Non présent, valeur par défaut
                                    specialite: personnel.specialitePrincipale || '', // Non présent, valeur par défaut
                                    cin: personnel.cin, // "35DDHDH"
                                    etatCivil: personnel.etatCivil // "celi"
                                });
                            }
                        },
                        error: function (xhr) {
                            showLoading(false);
                            alert('Erreur lors du chargement: ' + xhr.status);
                        }
                    });
                }
                function viewUser(user) {
                    let userId = user.id;
                    showLoading(true);
                    $.ajax({
                        url: 'http://localhost:8080/WEB/admin/chercherUtilisateur',
                        type: 'GET',
                        data: {userId},
                        success: function (data) {
                            showLoading(false);
                            if (data) {
                                const personnel = data.Personnel || {};
                                showUserForm('view', {
                                    id: data.id,
                                    username: data.nomUtilsateur,
                                    pswd:data.pswd,
                                    email: data.email,
                                    role: data.role.nom.toLowerCase(),
                                    nom: personnel.nom,
                                    prenom: personnel.prenom,
                                    dateNaissance: personnel.dateNaissance || '',
                                    sexe: personnel.sexe || '',
                                    adresse: personnel.adresse,
                                    telephone: personnel.telephone,
                                    matricule: personnel.matricule,
                                    dateEmbauche: personnel.dateEmbauche || '',
                                    specialite: personnel.specialitePrincipale || '',
                                    cin: personnel.cin,
                                    etatCivil: personnel.etatCivil
                                });
                            }
                        },
                        error: function (xhr) {
                            showLoading(false);
                            alert('Erreur lors du chargement: ' + xhr.status);
                        }
                    });
                }


                // Affichage du formulaire
                function showUserForm(mode, user = {}) {


                    const validModes = ['add', 'edit', 'view'];
                    if (!validModes.includes(mode)) {
                        console.error("Mode invalide. Modes acceptés : 'add', 'edit', 'view'");
                        return;
                    }

                    const $form = $('#combinedForm');
                    $form[0].reset();

                    $('#formMode').val(mode);
                    $('#userId').val(user.id || '');

                    const isViewMode = mode === 'view';
                    const isAddMode = mode === 'add';
                     const isEditMode = mode === 'edit';

                    // Champs du compte
                    $('#userId').val(user.id || '');
                    $('#username').val(user.username || '').prop('disabled', isViewMode);
                    $('#email').val(user.email || '').prop('disabled', isViewMode);
                    $('#role').val(user.role || 'user').prop('disabled', isViewMode);
                    $('#password')
                            .val(user.pswd)
                            .prop('required', isAddMode)
                            .closest('.input-group')
                            .toggle(isAddMode || isEditMode );

                    // Champs des informations personnelles
                    $('#nomString').val(user.nom || '').prop('disabled', isViewMode);
                    $('#prenomString').val(user.prenom || '').prop('disabled', isViewMode);
                    $('#dateNaissance').val(user.dateNaissance || '').prop('disabled', isViewMode);
                    $('#sexechar').val(user.sexe || 'M').prop('disabled', isViewMode);
                    $('#adresseString').val(user.adresse || '').prop('disabled', isViewMode);
                    $('#telephoneString').val(user.telephone || '').prop('disabled', isViewMode);
                    $('#emailString').val(user.email || '').prop('disabled', isViewMode);
                    $('#matriculeString').val(user.matricule || '').prop('disabled', isViewMode);
                    $('#dateEmbaucheString').val(user.dateEmbauche || '').prop('disabled', isViewMode);
                    $('#specialitePrincipaleString').val(user.specialite || '').prop('disabled', isViewMode);
                    $('#cinString').val(user.cin || '').prop('disabled', isViewMode);
                    $('#etatCivilString').val(user.etatCivil || 'Célibataire').prop('disabled', isViewMode);

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
                    $('#searchInput').on('input', function () {
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

                function actionButton(color, title, icon, callback) {
                    return $('<button>')
                            .addClass("btn btn-" + color + " btn-sm mx-1")
                            .html("<i class='fas fa-" + icon + "'></i> " + title)
                            .css({
                                'color': 'black',
                                'min-width': '95px',
                                'padding': '0.25rem 0.5rem'
                            })
                            .on('click', callback);
                }

                function showLoading(show) {
                    $('#userTableLoading').toggle(show);
                    $('#userTableContainer').toggle(!show);
                }
                // Attacher la soumission du formulaire
                $('#combinedForm').submit(function (e) {
                    e.preventDefault(); // Empêche le rechargement de la page
                    submitUserForm(); // Appeler la fonction de soumission
                });
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
                $('#confirmDelete').click(function () {
                    $.ajax({
                        url: 'http://localhost:8080/WEB/admin/supprimerUtilisateur',
                        type: 'GET',
                        data: {id: currentUserId},
                        success: function () {
                            loadUsers(); // Recharge la liste
                            var modal = bootstrap.Modal.getInstance(document.getElementById('deleteConfirmationModal'));
                            modal.hide(); // Ferme le modal
                        },
                        error: function () {
                            alert('Erreur lors de la suppression.');
                        }
                    });
                });
                function handleAjaxError(xhr) {
                    alert('Erreur ' + xhr.status + ': ' + (xhr.responseText || 'Erreur de traitement'));
                }

                // Lancement
                init();
            });
        </script>
    
    </body>
</html>