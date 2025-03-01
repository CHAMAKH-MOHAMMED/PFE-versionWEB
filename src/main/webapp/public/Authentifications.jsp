<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="fr">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Sevrage Tabagique - Connexion & Inscription</title>
  
  <!-- Bootstrap CSS -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
  <!-- Font Awesome (optional) -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
  
  <!-- Custom CSS -->
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
    .navbar-brand, .navbar .nav-link {
      color: #fff !important;
      font-weight: 500;
    }
    .navbar .nav-link:hover {
      color: lightgray !important;
    }
    /* Authentication Section */
    .auth-section {
      background: linear-gradient(135deg, #f8f9fa, #e9ecef);
      min-height: 100vh;
      padding: 80px 0;
      display: flex;
      align-items: center;
    }
    .auth-card {
      max-width: 500px;
      width: 100%;
      margin: auto;
      border-radius: 15px;
      box-shadow: 0 0 20px rgba(0,0,0,0.1);
      background-color: #fff;
      padding: 2rem;
    }
    .nav-tabs .nav-link {
      font-weight: 500;
      border: none;
      border-bottom: 2px solid transparent;
    }
    .nav-tabs .nav-link.active {
      color: var(--primary-color);
      border-color: var(--primary-color);
    }
    .form-control {
      border-radius: 25px;
      padding: 12px 20px;
      border: 1px solid #ced4da;
      transition: border-color 0.3s, box-shadow 0.3s;
    }
    .form-control:focus {
      border-color: var(--primary-color);
      box-shadow: 0 0 5px rgba(65,105,225,0.5);
    }
    .btn-primary {
      background-color: var(--primary-color);
      border: none;
      border-radius: 25px;
      padding: 12px 20px;
      font-weight: 500;
      transition: background-color 0.3s;
    }
    .btn-primary:hover {
      background-color: var(--secondary-color);
    }
    /* Footer */
    .footer {
      background: var(--primary-gradient);
      color: #fff;
      padding: 20px 0;
    }
    .footer a {
      color: #fff;
      text-decoration: none;
    }
    .footer a:hover {
      text-decoration: underline;
    }
  </style>
</head>
<body>
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
              <a class="nav-link active" href="index.jsp"><i class="fas fa-home me-1"></i>Accueil</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="parcours.jsp"><i class="fas fa-road me-1"></i>Notre Parcours</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#contact"><i class="fas fa-phone me-1"></i>Contact</a>
          </li>

        </ul>
      </div>
    </div>
  </nav>
  <!-- Authentication Section -->
  <section class="auth-section">
    <div class="container">
      <div class="card auth-card mx-auto">
        <!-- Nav Tabs -->
        <ul class="nav nav-tabs justify-content-center mb-4" id="authTab" role="tablist">
          <li class="nav-item" role="presentation">
            <button class="nav-link active" id="login-tab" data-bs-toggle="tab" data-bs-target="#login" type="button" role="tab" aria-controls="login" aria-selected="true">Connexion</button>
          </li>
          <li class="nav-item" role="presentation">
            <button class="nav-link" id="register-tab" data-bs-toggle="tab" data-bs-target="#register" type="button" role="tab" aria-controls="register" aria-selected="false">Inscription</button>
          </li>
        </ul>
        <!-- Tab Content -->
        <div class="tab-content" id="authTabContent">
          <!-- Login Tab -->
          <div class="tab-pane fade show active" id="login" role="tabpanel" aria-labelledby="login-tab">
            <h2 class="text-center mb-4" style="color: var(--primary-color);">Connexion</h2>
            <form action="LoginServlet" method="post" id="loginForm">
              <div class="mb-3">
                <input type="email" name="email" class="form-control" placeholder="Adresse email" required>
              </div>
              <div class="mb-3">
                <input type="password" name="passwordLog" class="form-control" placeholder="Mot de passe" required>
              </div>
              <button type="submit" class="btn btn-primary w-100 py-2">Se connecter</button>
            </form>
          </div>
          <!-- Registration Tab -->
          <div class="tab-pane fade" id="register" role="tabpanel" aria-labelledby="register-tab">
            <h2 class="text-center mb-4" style="color: var(--primary-color);">Créer un compte</h2>
            <form action="creerCompte" method="post" id="registerForm">
              <div class="mb-3">
                <input type="text" name="username" class="form-control" placeholder="Nom d'utilisateur" required>
              </div>
              <div class="mb-3">
                <input type="email" name="email" class="form-control" placeholder="Adresse email" required>
              </div>
              <div class="mb-3">
                <input type="password" name="password" class="form-control" placeholder="Mot de passe" required>
              </div>
              <div class="mb-3">
                <input type="password" name="confirmPassword" class="form-control" placeholder="Confirmer le mot de passe" required>
              </div>
              <button type="submit" class="btn btn-primary w-100 py-2">S'inscrire</button>
            </form>
          </div>
        </div>
      </div>
    </div>
  </section>
  
  <!-- Footer -->
  <footer class="footer">
    <div class="container text-center">
      <p>&copy; 2023 Sevrage Tabagique. Tous droits réservés.</p>
      <p>
        <a href="#">Politique de confidentialité</a> |
        <a href="#">Conditions d'utilisation</a> |
        <a href="#">Contact</a>
      </p>
    </div>
  </footer>
  
  <!-- jQuery and Bootstrap JS -->
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
  <script>
    $(document).ready(function(){
      // Fade in the auth card on page load
      $('.auth-card').hide().fadeIn(1000);
      
      // Password matching validation for registration
      const password = document.querySelector('input[name="password"]');
      const confirmPassword = document.querySelector('input[name="confirmPassword"]');
      
      function validatePassword() {
        if (password.value !== confirmPassword.value) {
          confirmPassword.setCustomValidity("Les mots de passe ne correspondent pas");
        } else {
          confirmPassword.setCustomValidity('');
        }
      }
      
      if(password && confirmPassword){
        password.onchange = validatePassword;
        confirmPassword.onkeyup = validatePassword;
      }
      
    });
  </script>
</body>
</html>
