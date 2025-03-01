<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="fr">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Sevrage Tabagique - Notre Parcours</title>
  
  <!-- Bootstrap CSS -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
  
  <!-- Font Awesome -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
  
  <!-- Custom CSS -->
  <style>
    :root {
      --primary-gradient: linear-gradient(135deg, #4169E1 0%, #2A4A9E 100%);
      --primary-color: #4169E1;
      --secondary-color: #2A4A9E;
      --accent-color: #ff6f61;
    }
    
    body {
      font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
      background-color: #f8f9fa;
      margin: 0;
      padding: 0;
    }
    
    /* Navbar */
    .navbar {
      background: var(--primary-gradient);
      box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
    }
    .navbar-brand i {
      font-size: 1.5rem;
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
      color: #6c757d;
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
      background: var(--accent-color);
      border: 4px solid #fff;
      box-shadow: 0 0 0 2px var(--primary-color);
    }
    .timeline-item.left::before {
      right: -10px;
    }
    .timeline-item.right::before {
      left: -10px;
    }
    .timeline-content {
      background: #fff;
      padding: 1.5rem;
      border-radius: 10px;
      position: relative;
      box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
      transition: transform 0.3s, box-shadow 0.3s, opacity 0.5s;
      opacity: 0;
      transform: translateY(20px);
    }
    /* Class to trigger animation */
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
      color: #555;
    }
    .timeline-tip {
      display: flex;
      align-items: center;
      font-size: 0.95rem;
      color: #777;
      margin-top: 0.5rem;
      border-top: 1px dotted #ccc;
      padding-top: 0.5rem;
    }
    .timeline-tip i {
      margin-right: 0.5rem;
      color: var(--accent-color);
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
    
    /* Footer */
    .footer {
      background: #343a40;
      color: #fff;
      padding: 1rem 0;
    }
    .footer a {
      color: #adb5bd;
    }
    .footer a:hover {
      color: #fff;
    }
  </style>
</head>
<body>
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
            <a class="nav-link active" href="parcours.jsp"><i class="fas fa-road me-1"></i>Notre Parcours</a>
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
  
  <!-- Timeline Section -->
  <section class="py-5">
    <div class="container">
      <div class="section-header">
        <h2 class="fw-bold">Notre Parcours</h2>
        <p>Découvrez les étapes clés de votre sevrage tabagique</p>
      </div>
      <ul class="timeline">
        <!-- Timeline Item 1: Left -->
        <li class="timeline-item left">
          <div class="timeline-content animated-text" style="animation-delay: 0.2s;">
            <h4><i class="fas fa-seedling me-2"></i>Étape 1: Prise de Conscience</h4>
            <p>Il s'agit de reconnaître l'impact négatif du tabac sur votre santé. Cette étape est cruciale pour amorcer le changement.</p>
            <div class="timeline-tip">
              <i class="fas fa-lightbulb"></i>
              <span>Conseil: Tenez un journal de vos sensations et des moments où l'envie de fumer se fait sentir.</span>
            </div>
          </div>
        </li>
        <!-- Timeline Item 2: Right -->
        <li class="timeline-item right">
          <div class="timeline-content animated-text" style="animation-delay: 0.4s;">
            <h4><i class="fas fa-edit me-2"></i>Étape 2: Plan Personnalisé</h4>
            <p>Développez un programme sur-mesure adapté à votre situation, en tenant compte de vos habitudes et de vos besoins.</p>
            <div class="timeline-tip">
              <i class="fas fa-lightbulb"></i>
              <span>Conseil: Consultez un spécialiste pour établir un plan réaliste et sécurisé.</span>
            </div>
          </div>
        </li>
        <!-- Timeline Item 3: Left -->
        <li class="timeline-item left">
          <div class="timeline-content animated-text" style="animation-delay: 0.6s;">
            <h4><i class="fas fa-users me-2"></i>Étape 3: Soutien Communautaire</h4>
            <p>Intégrez une communauté de personnes qui partagent le même objectif pour vous soutenir et vous motiver.</p>
            <div class="timeline-tip">
              <i class="fas fa-lightbulb"></i>
              <span>Conseil: Participez activement aux groupes de soutien et échangez vos expériences.</span>
            </div>
          </div>
        </li>
        <!-- Timeline Item 4: Right -->
        <li class="timeline-item right">
          <div class="timeline-content animated-text" style="animation-delay: 0.8s;">
            <h4><i class="fas fa-heartbeat me-2"></i>Étape 4: Suivi & Évolution</h4>
            <p>Recevez un suivi régulier pour ajuster votre programme en fonction de vos progrès et surmonter les obstacles.</p>
            <div class="timeline-tip">
              <i class="fas fa-lightbulb"></i>
              <span>Conseil: Fixez-vous des objectifs hebdomadaires pour mesurer vos avancées.</span>
            </div>
          </div>
        </li>
        <!-- Timeline Item 5: Left -->
        <li class="timeline-item left">
          <div class="timeline-content animated-text" style="animation-delay: 1s;">
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
  
  <!-- Footer -->
  <footer class="footer text-center">
    <div class="container">
      <p>&copy; 2023 Sevrage Tabagique. Tous droits réservés.</p>
      <p>
        <a href="#" class="text-decoration-none">Politique de confidentialité</a> |
        <a href="#" class="text-decoration-none">Conditions d'utilisation</a> |
        <a href="#" class="text-decoration-none">Contact</a>
      </p>
    </div>
  </footer>
  
  <!-- Scripts -->
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
  <script>
    $(document).ready(function() {
      // Trigger fade-in animations on scroll
      $(window).on('scroll', function() {
        $('.timeline-content').each(function() {
          var elementTop = $(this).offset().top;
          var viewportBottom = $(window).scrollTop() + $(window).height();
          if (viewportBottom > elementTop + 50) {
            $(this).addClass('animate');
          }
        });
      });
    });
  </script>
</body>
</html>
