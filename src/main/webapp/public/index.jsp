<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="fr">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Sevrage Tabagique - Accueil</title>
  
  <!-- Bootstrap CSS -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
  
  <!-- Font Awesome -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
  
  <!-- CSS Personnalisé -->
  <style>
    :root {
      --primary-gradient: linear-gradient(135deg, #4169E1 0%, #2A4A9E 100%);
      --primary-color: #4169E1;
      --secondary-color: #2A4A9E;
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
      box-shadow: 0 4px 15px rgba(0,0,0,0.1);
    }
    .navbar-brand i {
      font-size: 1.5rem;
    }
    
    /* Hero Section */
    .hero-section {
      padding: 80px 0;
      position: relative;
    }
    .hero-content h1 {
      font-size: 2.75rem;
      font-weight: bold;
      margin-bottom: 1rem;
    }
    .hero-content p {
      font-size: 1.125rem;
      margin-bottom: 1.5rem;
    }
    .hero-image {
      position: relative;
      overflow: hidden;
      border-radius: 15px;
      box-shadow: 20px -20px 40px rgba(65, 105, 225, 0.2);
      transition: transform 0.5s ease;
    }
    .hero-image:hover {
      transform: scale(1.03);
    }
    .hero-image img {
      width: 100%;
      max-height: 350px;
      object-fit: cover;
      border-radius: 15px;
    }
    .stats-badge {
      position: absolute;
      top: -15px;
      right: -15px;
      width: 50px;
      height: 50px;
      background: #fff;
      border-radius: 50%;
      display: flex;
      align-items: center;
      justify-content: center;
      font-size: 1rem;
      box-shadow: 0 8px 16px rgba(0,0,0,0.1);
    }
    
    /* Feature Cards */
    .feature-card {
      transition: transform 0.4s ease, box-shadow 0.4s ease;
      background: #fff;
      border: none;
      border-radius: 10px;
      box-shadow: 0 4px 10px rgba(0,0,0,0.1);
    }
    .feature-card:hover {
      transform: translateY(-5px);
      box-shadow: 0 10px 20px rgba(0,0,0,0.2);
    }
    
    /* Animated Text */
    .animated-text {
      opacity: 0;
      transform: translateY(20px);
      animation: fadeInUp 0.8s forwards;
    }
    @keyframes fadeInUp {
      to {
        opacity: 1;
        transform: translateY(0);
      }
    }
    
    .btn-pulse {
      animation: pulse 2s infinite;
    }
    @keyframes pulse {
      0% { transform: scale(1); }
      50% { transform: scale(1.05); }
      100% { transform: scale(1); }
    }
    
    /* Footer */
    .footer {
      background: #343a40;
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
              <i class="fas fa-sign-in-alt me-2"></i>Connexion/Inscruptions
            </a>
          </li>
        </ul>
      </div>
    </div>
  </nav>
  
  <!-- Hero Section -->
  <section class="hero-section">
    <div class="container">
      <div class="row align-items-center">
        <!-- Text Content -->
        <div class="col-lg-6 mb-4 mb-lg-0">
          <div class="hero-content">
            <h1 class="animated-text" style="animation-delay: 0.2s;">
              Libérez-vous du tabac<br>
              <span class="text-primary">Pour une vie plus saine</span>
            </h1>
            <p class="animated-text" style="animation-delay: 0.4s;">
              <i class="fas fa-check-circle text-success me-2"></i>Programme personnalisé<br>
              <i class="fas fa-users text-info me-2"></i>Communauté de soutien<br>
              <i class="fas fa-chart-line text-warning me-2"></i>Suivi intelligent
            </p>
            <div class="d-flex gap-3 animated-text" style="animation-delay: 0.6s;">
              <a href="register.html" class="btn btn-primary btn-lg btn-pulse px-4">
                <i class="fas fa-play me-2"></i>Commencer
              </a>
                <a href="parcours.jsp" class="btn btn-outline-primary btn-lg px-4">
                <i class="fas fa-info-circle me-2"></i>En savoir plus
              </a>
            </div>
          </div>
        </div>
        <!-- Hero Image -->
        <div class="col-lg-6">
          <div class="hero-image">
            <img src="https://images.unsplash.com/photo-1582610285985-a42d9193f2fd?ixlib=rb-4.0.3&auto=format&fit=crop&w=800&q=80" 
                 alt="Libération du tabac">
            <div class="stats-badge">
              <span class="text-primary fw-bold">95%</span>
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>
  
  <!-- Features Section -->
  <section id="features" class="py-5 bg-light">
    <div class="container">
      <div class="row g-4">
        <!-- Example Feature Cards -->
        <div class="col-md-4">
          <div class="card feature-card p-3 text-center">
            <i class="fas fa-heart fa-3x text-danger mb-3"></i>
            <h5 class="card-title">Santé Améliorée</h5>
            <p class="card-text">Retrouvez une meilleure qualité de vie en cessant de fumer.</p>
          </div>
        </div>
        <div class="col-md-4">
          <div class="card feature-card p-3 text-center">
            <i class="fas fa-brain fa-3x text-secondary mb-3"></i>
            <h5 class="card-title">Esprit Clair</h5>
            <p class="card-text">Réduisez le stress et améliorez votre concentration.</p>
          </div>
        </div>
        <div class="col-md-4">
          <div class="card feature-card p-3 text-center">
            <i class="fas fa-users fa-3x text-info mb-3"></i>
            <h5 class="card-title">Soutien Communautaire</h5>
            <p class="card-text">Bénéficiez d'une communauté engagée pour vous soutenir.</p>
          </div>
        </div>
      </div>
    </div>
  </section>
  
  <!-- Footer -->
  <footer class="footer py-4 text-white">
    <div class="container text-center">
      <p>&copy; 2023 Sevrage Tabagique. Tous droits réservés.</p>
      <p>
        <a href="#" class="text-white text-decoration-none">Politique de confidentialité</a> |
        <a href="#" class="text-white text-decoration-none">Conditions d'utilisation</a> |
        <a href="#" class="text-white text-decoration-none">Contact</a>
      </p>
    </div>
  </footer>
  
  <!-- Scripts -->
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
  <script>
    $(document).ready(function() {
      $(window).scroll(function() {
        $('.animated-text').each(function() {
          var position = $(this).offset().top;
          var scrollPosition = $(window).scrollTop() + $(window).height();
          if (scrollPosition > position) {
            $(this).css('opacity', '1');
          }
        });
      });
    });
  </script>
</body>
</html>
