<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="fr">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Sevrage Tabagique - Notre Parcours</title>

        <!-- Bootstrap CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

        <!-- Font Awesome -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">

        <!-- Google Fonts for Montserrat -->
        <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@400;700&display=swap" rel="stylesheet">

        <!-- Custom CSS -->
        <style>
            :root {
                --primary-gradient: linear-gradient(135deg, #FF4500 0%, #FFA500 100%);
                --primary-color: #FF4500;
                --secondary-color: #FFD700;
                --success-color: #32CD32;
                --danger-color: #FF4500;
                --dark-color: #1C2526;
                --light-color: #D3D3D3;
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
                margin: 0;
                padding: 0;
            }

            .containar {
                margin: 2.5% 0 2.5% 0;
                width: 90%;
                background: rgba(28, 37, 38, 0.85);
                border-radius: 15px;
                padding: 2rem;
            }

            /* Navbar */
            .navbar {
                background: rgba(28, 37, 38, 0.85);
                border-radius: 30px;
            }

            .navbar-brand, .nav-link {
                color: var(--light-color) !important;
                position: relative;
                transition: color 0.3s ease;
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

            /* Header */
            header {
                padding: 4rem 0;
                background: rgba(28, 37, 38, 0.7);
                border-radius: 15px;
            }

            /* Section Header */
            .section-header {
                text-align: center;
                margin-bottom: 2rem;
            }

            .section-header h2 {
                color: var(--primary-color);
                font-size: 2.5rem;
                margin-bottom: 0.5rem;
            }

            .section-header p {
                color: var(--light-color);
                font-size: 1.1rem;
            }

            /* Timeline */
            .timeline {
                position: relative;
                padding: 3rem 0;
                list-style: none;
            }

            .timeline::before {
                content: '';
                position: absolute;
                top: 0;
                bottom: 0;
                left: 50%;
                width: 4px;
                background: var(--primary-color);
                transform: translateX(-50%);
            }

            .timeline-item {
                position: relative;
                width: 50%;
                padding: 1.5rem 2rem;
                margin-bottom: 2rem;
            }

            .timeline-item.left {
                left: 0;
                text-align: right;
            }

            .timeline-item.right {
                left: 50%;
                text-align: left;
            }

            .timeline-item::before {
                content: '';
                position: absolute;
                top: 1.5rem;
                width: 20px;
                height: 20px;
                border-radius: 50%;
                background: var(--primary-color);
                border: 4px solid var(--dark-color);
                box-shadow: 0 0 0 2px var(--secondary-color);
            }

            .timeline-item.left::before {
                right: -10px;
            }

            .timeline-item.right::before {
                left: -10px;
            }

            .timeline-content {
                background: rgba(28, 37, 38, 0.9);
                padding: 1.5rem;
                border-radius: 12px;
                position: relative;
                box-shadow: 0 4px 10px rgba(255, 69, 0, 0.2);
                transition: transform 0.3s, box-shadow 0.3s, opacity 0.5s;
                opacity: 0;
                transform: translateY(20px);
                color: var(--light-color);
            }

            .timeline-content.animate {
                opacity: 1;
                transform: translateY(0);
            }

            .timeline-content h4 {
                margin-top: 0;
                color: var(--primary-color);
                font-size: 1.25rem;
                margin-bottom: 0.5rem;
            }

            .timeline-content p {
                margin-bottom: 0.5rem;
                font-size: 1rem;
                color: var(--light-color);
            }

            .timeline-tip {
                display: flex;
                align-items: center;
                font-size: 0.95rem;
                color: var(--secondary-color);
                margin-top: 0.5rem;
                border-top: 1px dotted var(--light-color);
                padding-top: 0.5rem;
            }

            .timeline-tip i {
                margin-right: 0.5rem;
                color: var(--primary-color);
            }

            /* Style for the timeline image */
            .timeline-item .timeline-image {
                position: absolute;
                top: 1.5rem; /* Align with the dot */
                width: 60px;
                height: 60px;
                display: flex;
                align-items: center;
                justify-content: center;
            }

            /* Position image to the right of the central line for left items */
            .timeline-item.left .timeline-image {
                left: calc(50% + 20px);
            }

            /* Position image to the left of the central line for right items */
            .timeline-item.right .timeline-image {
                right: calc(50% + 20px);
            }

            /* Hide images on small screens for cleaner mobile view */
            @media (max-width: 767px) {
                .timeline-image {
                    display: none;
                }
            }

            /* Benefits Section */
            .card {
                background: rgba(28, 37, 38, 0.9);
                border: none;
                border-radius: 12px;
                color: var(--light-color);
                transition: transform 0.3s ease, box-shadow 0.3s ease;
            }

            .card:hover {
                transform: translateY(-10px);
                box-shadow: 0 10px 20px rgba(255, 69, 0, 0.3);
            }

            .card-header {
                border-radius: 12px 12px 0 0;
            }

            .list-group-item {
                background: transparent;
                color: var(--light-color);
                border: none;
                border-bottom: 1px dotted var(--light-color);
            }

            /* Health Timeline Section */
            .bg-white {
                background: rgba(28, 37, 38, 0.5) !important;
            }

            .border {
                border: 1px solid var(--primary-color) !important;
            }

            .badge {
                background: var(--primary-color) !important;
            }

            /* Modal */
            .modal-content {
                background: rgba(28, 37, 38, 0.95);
                color: var(--light-color);
                border: 1px solid var(--primary-color);
            }

            .modal-header {
                background: var(--primary-gradient);
                border-bottom: none;
            }

            .btn-close-white {
                filter: invert(1);
            }

            /* Footer */
            .footer {
                background: var(--dark-color);
                padding: 1rem 0;
            }

            .footer a {
                color: var(--light-color);
                position: relative;
                transition: color 0.3s ease;
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

            /* Responsive Timeline */
            @media (max-width: 767px) {
                .timeline::before {
                    left: 20px;
                }

                .timeline-item {
                    width: 100%;
                    padding-left: 2.5rem;
                    padding-right: 1.5rem;
                    margin-bottom: 2.5rem;
                    text-align: left;
                    left: 0 !important;
                }

                .timeline-item::before {
                    left: -10px;
                }
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
                               <a class="nav-link" href="InfoTest.jsp"><i class="fas fa-stethoscope me-1"></i>Outils Tests</a>

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
            <header class="mt-5">
                <div class="container py-5 text-center">
                    <h1 class="display-4 fw-bold text-primary mb-4">
                        Transformez votre santé<br>
                        <span class="text-primary">en arrêtant de fumer</span>
                    </h1>
                    <p class="lead mb-4 text-muted">
                        Découvrez les bénéfices scientifiquement prouvés d'une vie sans tabac
                    </p>
                    <div class="d-grid gap-2 d-md-flex justify-content-center">
                        <button class="btn btn-primary btn-lg px-4" data-bs-toggle="modal" data-bs-target="#expertModal">
                            <i class="fas fa-user-md me-2"></i>Conseils d'Expert
                        </button>
                    </div>
                </div>
            </header>

            <!-- Timeline Section -->
            <section class="py-5">
                <div class="container">
                    <div class="section-header">
                        <h2 class="fw-bold">Notre Parcours</h2>
                        <p>Découvrez les étapes clés de votre sevrage tabagique</p>
                    </div>
                    <ul class="timeline">
                        <!-- Étape 1: Left (Content on Left, Image on Right) -->
                        <li class="timeline-item left">
                            <div class="timeline-image">
                                <i class="fas fa-seedling fa-3x text-primary"></i>
                            </div>
                            <div class="timeline-content">
                                <span class="badge bg-primary mb-2">Day 1</span>
                                <h4><i class="fas fa-seedling me-2"></i>Étape 1: Prise de Conscience</h4>
                                <p>Il s'agit de reconnaître l'impact négatif du tabac sur votre santé. Cette étape est cruciale pour amorcer le changement.</p>
                                <div class="timeline-tip">
                                    <i class="fas fa-lightbulb"></i>
                                    <span>Conseil: Tenez un journal de vos sensations et des moments où l'envie de fumer se fait sentir.</span>
                                </div>
                            </div>
                        </li>
                        <!-- Étape 2: Right (Content on Right, Image on Left) -->
                        <li class="timeline-item right">
                            <div class="timeline-image">
                                <i class="fas fa-edit fa-3x text-primary"></i>
                            </div>
                            <div class="timeline-content">
                                <span class="badge bg-primary mb-2">Week 1</span>
                                <h4><i class="fas fa-edit me-2"></i>Étape 2: Plan Personnalisé</h4>
                                <p>Développez un programme sur-mesure adapté à votre situation, en tenant compte de vos habitudes et de vos besoins.</p>
                                <div class="timeline-tip">
                                    <i class="fas fa-lightbulb"></i>
                                    <span>Conseil: Consultez un spécialiste pour établir un plan réaliste et sécurisé.</span>
                                </div>
                            </div>
                        </li>
                        <!-- Étape 3: Left (Content on Left, Image on Right) -->
                        <li class="timeline-item left">
                            <div class="timeline-image">
                                <i class="fas fa-users fa-3x text-primary"></i>
                            </div>
                            <div class="timeline-content">
                                <span class="badge bg-primary mb-2">Week 2</span>
                                <h4><i class="fas fa-users me-2"></i>Étape 3: Soutien Communautaire</h4>
                                <p>Intégrez une communauté de personnes qui partagent le même objectif pour vous soutenir et vous motiver.</p>
                                <div class="timeline-tip">
                                    <i class="fas fa-lightbulb"></i>
                                    <span>Conseil: Participez activement aux groupes de soutien et échangez vos expériences.</span>
                                </div>
                            </div>
                        </li>
                        <!-- Étape 4: Right (Content on Right, Image on Left) -->
                        <li class="timeline-item right">
                            <div class="timeline-image">
                                <i class="fas fa-heartbeat fa-3x text-primary"></i>
                            </div>
                            <div class="timeline-content">
                                <span class="badge bg-primary mb-2">Month 1</span>
                                <h4><i class="fas fa-heartbeat me-2"></i>Étape 4: Suivi & Évolution</h4>
                                <p>Recevez un suivi régulier pour ajuster votre programme en fonction de vos progrès et surmonter les obstacles.</p>
                                <div class="timeline-tip">
                                    <i class="fas fa-lightbulb"></i>
                                    <span>Conseil: Fixez-vous des objectifs hebdomadaires pour mesurer vos avancées.</span>
                                </div>
                            </div>
                        </li>
                        <!-- Étape 5: Left (Content on Left, Image on Right) -->
                        <li class="timeline-item left">
                            <div class="timeline-image">
                                <i class="fas fa-trophy fa-3x text-primary"></i>
                            </div>
                            <div class="timeline-content">
                                <span class="badge bg-primary mb-2">Month 3</span>
                                <h4><i class="fas fa-trophy me-2"></i>Étape 5: Réussite & Bien-Être</h4>
                                <p>Célébrez vos succès et adoptez un mode de vie sain pour profiter d'une vie sans tabac.</p>
                                <div class="timeline-tip">
                                    <i class="fas fa-lightbulb"></i>
                                    <span>Conseil: Récompensez-vous pour chaque étape franchie et partagez votre réussite avec vos proches.</span>
                                </div>
                            </div>
                        </li>
                    </ul>
                </div>
            </section>

            <!-- Benefits Section -->
            <section id="benefits" class="py-5">
                <div class="container">
                    <h2 class="text-center mb-5 display-5 fw-bold text-primary">Aperçu des Bénéfices</h2>
                    <div class="row g-4">
                        <!-- Short-term Benefits -->
                        <div class="col-lg-6">
                            <div class="card h-100 shadow-sm">
                                <div class="card-header bg-success text-white">
                                    <h3 class="h4 mb-0"><i class="fas fa-bolt me-2"></i>Bénéfices Immédiats (24-72 Heures)</h3>
                                </div>
                                <div class="card-body">
                                    <ul class="list-group list-group-flush">
                                        <li class="list-group-item">
                                            <i class="fas fa-lungs text-success me-2"></i>
                                            Amélioration de la circulation d'oxygène
                                        </li>
                                        <li class="list-group-item">
                                            <i class="fas fa-heart text-danger me-2"></i>
                                            Réduction de la pression artérielle
                                        </li>
                                        <li class="list-group-item">
                                            <i class="fas fa-brain text-info me-2"></i>
                                            Amélioration de la perception sensorielle
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>

                        <!-- Long-term Benefits -->
                        <div class="col-lg-6">
                            <div class="card h-100 shadow-sm">
                                <div class="card-header bg-primary text-white">
                                    <h3 class="h4 mb-0"><i class="fas fa-calendar-check me-2"></i>Bénéfices à Long Terme (1+ An)</h3>
                                </div>
                                <div class="card-body">
                                    <ul class="list-group list-group-flush">
                                        <li class="list-group-item">
                                            <i class="fas fa-lungs text-success me-2"></i>
                                            Risque de cancer du poumon réduit de 50%
                                        </li>
                                        <li class="list-group-item">
                                            <i class="fas fa-running text-warning me-2"></i>
                                            Amélioration des fonctions cardiovasculaires
                                        </li>
                                        <li class="list-group-item">
                                            <i class="fas fa-smile-beam text-info me-2"></i>
                                            Qualité de vie améliorée
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>

            <!-- Health Timeline Section -->
            <section id="timeline" class="py-5 bg-white">
                <div class="container">
                    <h2 class="text-center mb-5 display-5 fw-bold text-primary">Chronologie de Récupération</h2>
                    <div class="row g-4">
                        <div class="col-md-6">
                            <div class="p-4 border rounded-3 shadow-sm">
                                <h3 class="h5 text-primary"><i class="fas fa-clock me-2"></i>Premier Mois</h3>
                                <ul class="list-unstyled">
                                    <li class="mb-3">
                                        <span class="badge bg-primary me-2">Semaine 1</span>
                                        Amélioration de la circulation et de l'oxygénation
                                    </li>
                                    <li class="mb-3">
                                        <span class="badge bg-primary me-2">Semaine 2</span>
                                        Fonction pulmonaire augmentée jusqu'à 30%
                                    </li>
                                    <li>
                                        <span class="badge bg-primary me-2">Semaine 4</span>
                                        Réduction de la toux et de l'essoufflement
                                    </li>
                                </ul>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="p-4 border rounded-3 shadow-sm">
                                <h3 class="h5 text-success"><i class="fas fa-calendar-alt me-2"></i>Première Année</h3>
                                <ul class="list-unstyled">
                                    <li class="mb-3">
                                        <span class="badge bg-success me-2">3 Mois</span>
                                        Capacité et fonction pulmonaires améliorées
                                    </li>
                                    <li class="mb-3">
                                        <span class="badge bg-success me-2">6 Mois</span>
                                        Réduction des infections respiratoires
                                    </li>
                                    <li>
                                        <span class="badge bg-success me-2">1 An</span>
                                        Risque de maladie cardiaque divisé par deux
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </section>

            <!-- Expert Modal -->
            <div class="modal fade" id="expertModal">
                <div class="modal-dialog modal-dialog-centered">
                    <div class="modal-content">
                        <div class="modal-header bg-primary text-white">
                            <h5 class="modal-title"><i class="fas fa-user-md me-2"></i>Conseil d'Expert Médical</h5>
                            <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal"></button>
                        </div>
                        <div class="modal-body">
                            <p class="lead">En tant que spécialiste pulmonaire, je recommande :</p>
                            <ul class="list-group list-group-flush">
                                <li class="list-group-item">1. Fixez une date d'arrêt et tenez-vous y</li>
                                <li class="list-group-item">2. Utilisez un traitement de substitution nicotinique</li>
                                <li class="list-group-item">3. Pratiquez une activité physique régulière</li>
                                <li class="list-group-item">4. Recherchez un soutien professionnel</li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Footer -->
            <footer class="footer text-center">
                <div class="container">
                    <p>© 2023 Sevrage Tabagique. Tous droits réservés.</p>
                    <p>
                        <a href="#" class="text-decoration-none">Politique de confidentialité</a> |
                        <a href="#" class="text-decoration-none">Conditions d'utilisation</a> |
                        <a href="#" class="text-decoration-none">Contact</a>
                    </p>
                </div>
            </footer>
        </div>

        <!-- Scripts -->
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
        <script>
            $(document).ready(function () {
                // Trigger fade-in animations on scroll
                $(window).on('scroll', function () {
                    $('.timeline-content').each(function () {
                        var elementTop = $(this).offset().top;
                        var viewportBottom = $(window).scrollTop() + $(window).height();
                        if (viewportBottom > elementTop + 50) {
                            $(this).addClass('animate');
                        }
                    });
                });

                // Trigger initial animation on page load
                $(window).trigger('scroll');
            });
        </script>
    </body>
</html>