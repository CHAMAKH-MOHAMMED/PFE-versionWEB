<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="fr">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Sevrage Tabagique - Connexion & Inscription</title>

        <!-- Bootstrap CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

        <!-- Font Awesome -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">

        <!-- Google Fonts for Montserrat -->
        <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@400;700&display=swap" rel="stylesheet">

        <!-- CSS Personnalisé -->
        <style>
            :root {
                --primary-gradient: linear-gradient(135deg, #FF6347 0%, #FFA07A 100%);
                --primary-color: #FF6347;
                --secondary-color: #FFD700;
                --success-color: #32CD32;
                --danger-color: #FF6347;
                --dark-color: #1C2526;
                --light-color: #D3D3D3;
                --input-bg: #2E3A3B;
            }

            .containar {
                margin: 2.5% 0 2.5% 0;
                width: 90%;
                background: rgba(28, 37, 38, 0.85);
                border-radius: 15px;
                padding: 2rem;
            }

            body {
                font-family: 'Montserrat', 'Segoe UI', system-ui, sans-serif;
                background-color: var(--dark-color);
                display: flex;
                justify-content: center;
                background-image: url("../static/background.jpg");
                background-size: cover;
                background-attachment: fixed;
                color: var(--light-color);
            }

            .navbar {
                background: rgba(28, 37, 38, 0.85);
                border-radius: 30px;
            }

            .navbar-brand, .nav-link {

                position: relative;
                transition: color 0.3s ease;
                font-size: 1.2rem;
            }

            .nav-link:hover {
                color: var(--primary-color) !important;
            }

            .nav-link::after {
                content: '';
                position: absolute;
                width: 0;
                height: 2px;
                bottom: -2px;
                left: 0;
                background: var(--primary-color);
                transition: width 0.3s ease;
            }

            .nav-link:hover::after {
                width: 100%;
            }

            .btn-outline-light {
                border: none;
                color: var(--light-color);
                position: relative;
                transition: color 0.3s ease;
                font-size: 1.2rem;
            }

            .btn-outline-light:hover {
                background: none;
                color: var(--primary-color);
            }

            .btn-outline-light::after {
                content: '';
                position: absolute;
                width: 0;
                height: 2px;
                bottom: -2px;
                left: 0;
                background: var(--primary-color);
                transition: width 0.3s ease;
            }

            .btn-outline-light:hover::after {
                width: 100%;
            }

            .auth-section {
                padding: 5rem 0;
                background: rgba(28, 37, 38, 0.7);
                border-radius: 15px;
            }

            .auth-card {
                background: rgba(28, 37, 38, 0.95);

                border-radius: 15px;
                padding: 3rem;
                color: var(--light-color);
                max-width: 600px;
                margin: 0 auto;
                box-shadow: 0 10px 20px rgba(0, 0, 0, 0.2);
            }

            .nav-tabs .nav-link {
                color: var(--light-color);
                border: none;
                padding: 15px 30px;
                font-size: 1.5rem;
                font-weight: 700;
                transition: color 0.3s ease;
            }

            .nav-tabs .nav-link.active {
                color: var(--primary-color);
                border-bottom: 3px solid var(--primary-color);
            }

            .nav-tabs .nav-link:hover {
                color: var(--primary-color);
            }

            .form-control {
                background: var(--input-bg); /* Lighter background for contrast */
                color: var(--light-color);
                border: 1px solid var(--primary-color);
                border-radius: 25px;
                padding: 15px 20px;
                font-size: 1.2rem;
            }

            .form-control::placeholder {
                color: #A9B7B8; /* Light gray for readable placeholders */
                opacity: 1;
            }

            .form-control:focus {
                border-color: var(--secondary-color);
                box-shadow: 0 0 5px rgba(255, 165, 0, 0.5);
                background: var(--input-bg);
                color: var(--light-color);
            }

            .input-group-text {
                background: var(--input-bg);
                color: var(--primary-color);
                border: 1px solid var(--primary-color);
                padding: 15px;
                font-size: 1.2rem;
            }

            .btn-primary {
                background: var(--primary-gradient);
                border: none;
                color: #fff;
                border-radius: 25px;
                padding: 15px 30px;
                font-size: 1.3rem;
                font-weight: 600; /* Bolder button text */
                transition: background 0.3s ease;
            }

            .btn-primary:hover {
                background: linear-gradient(135deg, #FFA07A 0%, #FF6347 100%);
            }

            h2 {
                font-size: 2.5rem;
                font-weight: 700; /* Bolder heading */
                margin-bottom: 2rem;
                text-align: center;
                color: #fff; /* White for better contrast */
            }

            .form-label {
                font-size: 1.2rem; /* Labels for inputs */
                color: var(--light-color);
                margin-bottom: 0.5rem;
            }

            .footer {
                background: var(--dark-color);
            }

            .footer a {
                color: var(--light-color);
                position: relative;
                transition: color 0.3s ease;
                font-size: 1.1rem;
            }

            .footer a:hover {
                color: var(--primary-color);
            }

            .footer a::after {
                content: '';
                position: absolute;
                width: 0;
                height: 2px;
                bottom: -2px;
                left: 0;
                background: var(--primary-color);
                transition: width 0.3s ease;
            }

            .footer a:hover::after {
                width: 100%;
            }
        </style>
    </head>
    <body>
        <div class="containar">
            <!-- Navbar -->
            <nav class="navbar navbar-expand-lg navbar-dark">
                <div class="container">
                    <a class="navbar-brand fw-bold" href="index.jsp">
                        <i class="fas fa-leaf me-2"></i>TabacStop
                    </a>
                    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                    <div class="collapse navbar-collapse" id="navbarNav">
                        <ul class="navbar-nav ms-auto">
                            <li class="nav-item">
                                <a class="nav-link" href="index.jsp"><i class="fas fa-home me-1"></i>Accueil</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="parcours.jsp"><i class="fas fa-road me-1"></i>Notre Parcours</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="InfoTest.jsp"><i class="fa-stethoscope"></i> Outil tests</a>

                            </li>
                            <li class="nav-item">
                                <a class="btn btn-outline-light rounded-pill" href="Authentifications.jsp">
                                    <i class="fas fa-sign-in-alt me-2"></i>Connexion/Inscription
                                </a>
                            </li>
                        </ul>
                    </div>
                </div>
            </nav>

            <!-- Authentication Section -->
            <section class="auth-section">
                <div class="container">
                    <div class="auth-card mx-auto">
                        <ul class="nav nav-tabs justify-content-center mb-4" id="authTab" role="tablist">
                            <li class="nav-item" role="presentation">
                                <button class="nav-link active" id="login-tab" data-bs-toggle="tab" data-bs-target="#login" type="button" role="tab" aria-controls="login" aria-selected="true">Connexion</button>
                            </li>
                            <li class="nav-item" role="presentation">
                                <button class="nav-link" id="register-tab" data-bs-toggle="tab" data-bs-target="#register" type="button" role="tab" aria-controls="register" aria-selected="false">Inscription</button>
                            </li>
                        </ul>

                        <div class="tab-content" id="authTabContent">
                            <!-- Login Tab -->
                            <div class="tab-pane fade show active" id="login" role="tabpanel" aria-labelledby="login-tab">
                                <h2>Connexion</h2>
                                <form action="LoginServlet" method="post" id="loginForm">
                                    <div class="mb-3">
                                        <label class="form-label">Adresse email</label>
                                        <div class="input-group">
                                            <span class="input-group-text"><i class="fas fa-envelope"></i></span>
                                            <input type="email" name="email" class="form-control" placeholder="Entrez votre email" required>
                                        </div>
                                    </div>
                                    <div class="mb-3">
                                        <label class="form-label">Mot de passe</label>
                                        <div class="input-group">
                                            <span class="input-group-text"><i class="fas fa-lock"></i></span>
                                            <input type="password" name="password" class="form-control" placeholder="Entrez votre mot de passe" required>
                                        </div>
                                    </div>
                                    <button type="submit" class="btn btn-primary w-100">Se connecter</button>
                                </form>
                            </div>
                            <!-- Registration Tab -->
                            <div class="tab-pane fade" id="register" role="tabpanel" aria-labelledby="register-tab">
                                <h2>Créer un compte</h2>
                                <form action="creerCompte" method="post" id="registerForm">
                                    <div class="mb-3">
                                        <label class="form-label">Nom d'utilisateur</label>
                                        <div class="input-group">
                                            <span class="input-group-text"><i class="fas fa-user"></i></span>
                                            <input type="text" name="username" class="form-control" placeholder="Choisissez un nom d'utilisateur" required>
                                        </div>
                                    </div>
                                    <div class="mb-3">
                                        <label class="form-label">Adresse email</label>
                                        <div class="input-group">
                                            <span class="input-group-text"><i class="fas fa-envelope"></i></span>
                                            <input type="email" name="email" class="form-control" placeholder="Entrez votre email" required>
                                        </div>
                                    </div>
                                    <div class="mb-3">
                                        <label class="form-label">Mot de passe</label>
                                        <div class="input-group">
                                            <span class="input-group-text"><i class="fas fa-lock"></i></span>
                                            <input type="password" name="password" class="form-control" placeholder="Créez un mot de passe" required>
                                        </div>
                                    </div>
                                    <div class="mb-3">
                                        <label class="form-label">Confirmer le mot de passe</label>
                                        <div class="input-group">
                                            <span class="input-group-text"><i class="fas fa-lock"></i></span>
                                            <input type="password" name="confirmPassword" class="form-control" placeholder="Confirmez votre mot de passe" required>
                                        </div>
                                    </div>
                                    <button type="submit" class="btn btn-primary w-100">S'inscrire</button>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </section>

            <!-- Footer -->
            <footer class="footer mt-auto py-4 bg-dark text-white">
                <div class="container text-center">
                    <p class="mb-2">© 2023 Sevrage Tabagique. Tous droits réservés.</p>
                    <div class="d-flex justify-content-center gap-3">
                        <a href="#" class="text-white text-decoration-none">Politique de confidentialité</a>
                        <a href="#" class="text-white text-decoration-none">Conditions d'utilisation</a>
                        <a href="#" class="text-white text-decoration-none">Contact</a>
                    </div>
                </div>
            </footer>
        </div>

        <!-- Scripts -->
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>