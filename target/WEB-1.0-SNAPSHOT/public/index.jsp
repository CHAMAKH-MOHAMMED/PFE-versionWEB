<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sevrage Tabagique - Accueil</title>
    
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    
    <!-- CSS Personnalisé -->
    <style>
        :root {
            --primary-gradient: linear-gradient(135deg, #4169E1 0%, #2A4A9E 100%);
            --primary-color: #4169E1;
            --secondary-color: #2A4A9E;
            --success-color: #2ecc71;
            --danger-color: #e74c3c;
            --dark-color: #343a40;
            --light-color: #f8f9fa;
        }

        body {
            font-family: 'Segoe UI', system-ui, sans-serif;
            background-color: var(--light-color);
            min-height: 100vh;
            display: flex;
            flex-direction: column;
        }

        .navbar {
            background: var(--primary-gradient);
            box-shadow: 0 4px 15px rgba(0,0,0,0.1);
        }

        .hero-section {
            padding: 4rem 0;
        }

        .hero-image {
            border-radius: 15px;
            transform: perspective(1500px) rotateY(10deg);
            transition: transform 0.5s ease;
            box-shadow: 20px -20px 40px rgba(65, 105, 225, 0.2);
        }

        .hero-image:hover {
            transform: perspective(1500px) rotateY(5deg) scale(1.03);
        }

        .stats-badge {
            position: absolute;
            top: -1rem;
            right: -1rem;
            width: 3.5rem;
            height: 3.5rem;
            background: #fff;
            border-radius: 50%;
            box-shadow: 0 8px 16px rgba(0,0,0,0.1);
            z-index: 1;
        }

        .feature-card {
            transition: transform 0.3s ease, box-shadow 0.3s ease;
            border-radius: 12px;
        }

        .calculateur-card {
            background: rgba(255, 255, 255, 0.95);
            backdrop-filter: blur(10px);
            border-radius: 15px;
        }

        .animate-pop {
            animation: pop 0.5s ease;
        }

        @keyframes pop {
            50% { transform: scale(1.08); }
            100% { transform: scale(1); }
        }

        @media (max-width: 768px) {
            .hero-section {
                padding: 2rem 0;
                text-align: center;
            }
            
            .hero-image {
                transform: none;
                margin-top: 2rem;
            }
        }
    </style>
</head>
<body>
    <!-- Navbar -->
    <nav class="navbar navbar-expand-lg navbar-dark">
        <div class="container">
            <a class="navbar-brand fw-bold" href="#">
                <i class="fas fa-leaf me-2"></i>TabacStop
            </a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ms-auto">
                    <li class="nav-item">
                        <a class="nav-link active" href="#"><i class="fas fa-home me-1"></i>Accueil</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="parcours.jsp"><i class="fas fa-road me-1"></i>Notre Parcours</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#contact"><i class="fas fa-phone me-1"></i>Contact</a>
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

    <!-- Hero Section -->
    <section class="hero-section">
        <div class="container">
            <div class="row align-items-center g-5">
                <div class="col-lg-6">
                    <div class="hero-content">
                        <h1 class="display-4 fw-bold mb-4">
                            Libérez-vous du tabac<br>
                            <span class="text-primary">Pour une vie plus saine</span>
                        </h1>
                        <div class="d-flex flex-column gap-2 mb-4">
                            <p class="lead mb-0">
                                <i class="fas fa-check-circle text-success me-2"></i>Programme personnalisé
                            </p>
                            <p class="lead mb-0">
                                <i class="fas fa-users text-info me-2"></i>Communauté de soutien
                            </p>
                            <p class="lead mb-0">
                                <i class="fas fa-chart-line text-warning me-2"></i>Suivi intelligent
                            </p>
                        </div>
                        <div class="d-flex gap-3">
                            <a href="register.html" class="btn btn-primary btn-lg px-4 py-3">
                                <i class="fas fa-play me-2"></i>Commencer
                            </a>
                            <a href="parcours.jsp" class="btn btn-outline-primary btn-lg px-4 py-3">
                                <i class="fas fa-info-circle me-2"></i>En savoir plus
                            </a>
                        </div>
                    </div>
                </div>
                <div class="col-lg-6">
                    <div class="hero-image position-relative">
                        <img src="../static/docter.jpg" 
                            alt="Libération du tabac" 
                            class="img-fluid">
                        <div class="stats-badge d-flex align-items-center justify-content-center">
                            <span class="text-primary fw-bold fs-5">95%</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Calculateur -->
    <section class="py-5">
        <div class="container">
            <h2 class="text-center mb-5 display-5 fw-bold">
                <i class="fas fa-smoking-ban me-2 text-danger"></i>Calculateur Tabac
            </h2>
            
            <div class="row g-4">
                <div class="col-md-6">
                    <div class="calculateur-card p-4 shadow">
                        <div class="mb-4">
                            <label class="form-label fs-5">Cigarettes/jour</label>
                            <div class="input-group">
                                <input type="number" id="cigsPerDay" class="form-control form-control-lg" value="60">
                                <span class="input-group-text bg-white">
                                    <i class="fas fa-smoking text-primary"></i>
                                </span>
                            </div>
                        </div>
                        <div class="mb-4">
                            <label class="form-label fs-5">Cigarettes/paquet</label>
                            <div class="input-group">
                                <input type="number" id="cigsPerPack" class="form-control form-control-lg" value="20">
                                <span class="input-group-text bg-white">
                                    <i class="fas fa-box-open text-primary"></i>
                                </span>
                            </div>
                        </div>
                        <div class="mb-4">
                            <label class="form-label fs-5">Prix du paquet (€)</label>
                            <div class="input-group">
                                <input type="number" id="packPrice" class="form-control form-control-lg" value="6.8" step="0.1">
                                <span class="input-group-text bg-white">
                                    <i class="fas fa-euro-sign text-primary"></i>
                                </span>
                            </div>
                        </div>
                        <button class="btn btn-primary w-100 btn-lg mt-3" id="resetBtn">
                            <i class="fas fa-sync-alt me-2"></i>Réinitialiser
                        </button>
                    </div>
                </div>

                <div class="col-md-6">
                    <div class="calculateur-card p-4 shadow h-100">
                        <div class="text-center mb-5">
                            <h3 class="mb-4">
                                <i class="fas fa-coins me-2 text-success"></i>Économies
                            </h3>
                            <div class="display-4 fw-bold text-success mb-2" id="monthlySavings">432.4€</div>
                            <small class="text-muted">PAR MOIS</small>
                        </div>
                        <div class="text-center mb-5">
                            <div class="display-4 fw-bold text-success mb-2" id="yearlySavings">5788.8€</div>
                            <small class="text-muted">PAR AN</small>
                        </div>
                        <div class="text-center">
                            <h3 class="mb-4">
                                <i class="fas fa-leaf me-2 text-danger"></i>Empreinte Carbone
                            </h3>
                            <div class="display-4 fw-bold text-danger mb-2" id="carbonFootprint">306.6</div>
                            <small class="text-muted">kg CO2/an</small>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Features Section -->
    <section class="py-5 bg-light">
        <div class="container">
            <div class="row g-4">
                <div class="col-md-4">
                    <div class="card feature-card h-100 p-4 text-center border-0 shadow">
                        <i class="fas fa-heart fa-3x text-danger mb-4"></i>
                        <h3 class="h4 mb-3">Santé Améliorée</h3>
                        <p class="text-muted">Retrouvez une meilleure qualité de vie en cessant de fumer.</p>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card feature-card h-100 p-4 text-center border-0 shadow">
                        <i class="fas fa-brain fa-3x text-primary mb-4"></i>
                        <h3 class="h4 mb-3">Esprit Clair</h3>
                        <p class="text-muted">Réduisez le stress et améliorez votre concentration.</p>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card feature-card h-100 p-4 text-center border-0 shadow">
                        <i class="fas fa-users fa-3x text-info mb-4"></i>
                        <h3 class="h4 mb-3">Soutien Communautaire</h3>
                        <p class="text-muted">Bénéficiez d'une communauté engagée pour vous soutenir.</p>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Footer -->
    <footer class="footer mt-auto py-4 bg-dark text-white">
        <div class="container text-center">
            <p class="mb-2">&copy; 2023 Sevrage Tabagique. Tous droits réservés.</p>
            <div class="d-flex justify-content-center gap-3">
                <a href="#" class="text-white text-decoration-none">Politique de confidentialité</a>
                <a href="#" class="text-white text-decoration-none">Conditions d'utilisation</a>
                <a href="#" class="text-white text-decoration-none">Contact</a>
            </div>
        </div>
    </footer>

    <!-- Scripts -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        $(document).ready(function() {
            function calculateSavings() {
                const cigsPerDay = parseFloat($('#cigsPerDay').val()) || 0;
                const cigsPerPack = parseFloat($('#cigsPerPack').val()) || 1;
                const packPrice = parseFloat($('#packPrice').val()) || 0;

                const monthly = ((cigsPerDay / cigsPerPack) * packPrice * 30).toFixed(1);
                const yearly = (monthly * 12).toFixed(1);
                const carbon = (cigsPerDay * 0.014 * 365).toFixed(1);

                animateValue('#monthlySavings', monthly + 'dh');
                animateValue('#yearlySavings', yearly + 'dh');
                animateValue('#carbonFootprint', carbon + ' kg');
            }

            function animateValue(selector, newValue) {
                $(selector).addClass('animate-pop').html(newValue);
                setTimeout(() => $(selector).removeClass('animate-pop'), 500);
            }

            $('#resetBtn').click(() => {
                $('#cigsPerDay').val(20);
                $('#cigsPerPack').val(20);
                $('#packPrice').val(6.8);
                calculateSavings();
            });

            $('input').on('input', calculateSavings);
            calculateSavings();
        });
    </script>
</body>
</html>