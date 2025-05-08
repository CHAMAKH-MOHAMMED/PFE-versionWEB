<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="fr">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Tests d'évaluation en santé</title>

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
                background-image: url("../static/background.jpg");
                background-size: cover;
                background-attachment: fixed;
                color: var(--light-color);
            }

            .containar {
                margin: 2.5% auto 2.5% auto;
                width: 90%;
                background: rgba(28, 37, 38, 0.85);
                border-radius: 15px;
                padding: 2rem;
            }

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

            .test-card {
                background: rgba(28, 37, 38, 0.95);
                color: var(--light-color);
                border: none;
                border-radius: 15px;
                transition: transform 0.3s ease, box-shadow 0.3s ease;
            }

            .test-card:hover {
                transform: translateY(-10px);
                box-shadow: 0 10px 20px rgba(255, 69, 0, 0.3);
            }

            .nav-pills .nav-link {
                color: var(--light-color);
            }

            .nav-pills .nav-link.active {
                background-color: var(--primary-color);
                color: #fff;
            }

            .btn-outline-primary {
                border-color: var(--primary-color);
                color: var(--primary-color);
            }

            .btn-outline-primary:hover {
                background: var(--primary-color);
                color: #fff;
            }

            .footer {
                background: var(--dark-color);
            }

            .footer a {
                color: var(--light-color);
                transition: color 0.3s ease;
            }

            .footer a:hover {
                color: var(--primary-color);
            }

        </style>
    </head>
    <body >
        <div class="containar">
            <!-- Navbar from Index Page -->
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
                                <a class="btn btn-outline-light rounded-pill" href="Authentifications.jsp">
                                    <i class="fas fa-sign-in-alt me-2"></i>Connexion/Inscription
                                </a>
                            </li>
                        </ul>
                    </div>
                </div>
            </nav>

            <!-- Main Content -->
            <div class="container my-5">
                <h1 class="text-center mb-4 text-white">Tests d'évaluation en santé</h1>
                <ul class="nav nav-pills justify-content-center mb-5">
                    <li class="nav-item"><a class="nav-link" href="#fagerstrom">Fagerström</a></li>
                    <li class="nav-item"><a class="nav-link" href="#had">HAD</a></li>
                    <li class="nav-item"><a class="nav-link" href="#prochaska">Prochaska</a></li>
                    <li class="nav-item"><a class="nav-link" href="#cage-cast">CAGE/CAST</a></li>
                    <li class="nav-item"><a class="nav-link" href="#echelle-motivation">Motivation</a></li>
                </ul>
            </div>

            <!-- Test Sections -->
            <section id="fagerstrom" class="mb-5">
                <div class="card test-card p-4">
                    <div class="d-flex align-items-center mb-4">
                        <div class="p-3 rounded-circle me-3" style="background: rgba(255, 69, 0, 0.1);">
                            <i class="fas fa-smoking text-primary" style="font-size: 1.5rem;"></i>
                        </div>
                        <h2 class="h4 mb-0 text-white">Test de Fagerström</h2>
                    </div>
                    <div>
                        <p class="mb-4">Le test de Fagerström est un questionnaire bref et validé permettant d'évaluer l'intensité de la dépendance nicotinique. Il est couramment utilisé dans le cadre du sevrage tabagique.</p>
                        <h3 class="mt-4 mb-3">Composition du test</h3>
                        <p class="mb-4">Le test comprend 6 questions évaluant différents aspects de la consommation de tabac :</p>
                        <ul class="list-disc pl-5 mb-4">
                            <li>Le temps entre le réveil et la première cigarette</li>
                            <li>La difficulté à s'abstenir dans les lieux interdits</li>
                            <li>La cigarette dont il est le plus difficile de se passer</li>
                            <li>Le nombre de cigarettes fumées par jour</li>
                            <li>La consommation matinale plus importante que le reste de la journée</li>
                            <li>Fumer même malade</li>
                        </ul>
                        <h3 class="mt-4 mb-3">Interprétation</h3>
                        <p class="mb-4">Le score total varie de 0 à 10 :</p>
                        <ul class="list-disc pl-5 mb-4">
                            <li>0-2 : dépendance très faible</li>
                            <li>3-4 : dépendance faible</li>
                            <li>5-6 : dépendance moyenne</li>
                            <li>7-8 : dépendance forte</li>
                            <li>9-10 : dépendance très forte</li>
                            <p>Ce test permet d'adapter la stratégie de sevrage en fonction du niveau de dépendance du patient.</p>
                        </ul> <h3 class="mt-4 mb-3">Médicaments de soutien</h3>
                        <p class="mb-4">Pour accompagner le sevrage tabagique, des traitements pharmacologiques peuvent être prescrits :</p>
                        <ul class="list-disc pl-5 mb-4">
                            <li><strong>Bupropion (Zyban)</strong> : Un antidépresseur qui réduit les symptômes de sevrage et l'envie de fumer en agissant sur les neurotransmetteurs (dopamine et noradrénaline). Il est généralement pris sous forme de comprimés sur une durée de 7 à 12 semaines. Les effets secondaires possibles incluent insomnie, maux de tête et sécheresse buccale.</li>
                            <li><strong>Varenicline (Champix)</strong> : Un médicament qui agit sur les récepteurs nicotiniques du cerveau, réduisant l'envie de fumer et les sensations de plaisir associées au tabac. Il est administré sous forme de comprimés, avec une dose croissante sur plusieurs semaines. Les effets secondaires courants incluent nausées, insomnie et rêves anormaux.</li>
                        </ul>

                    </div>

                    <a href="#" class="btn btn-outline-primary mt-4">
                        <i class="fas fa-arrow-up me-2"></i>Retour en haut
                    </a>
                </div>
            </section>

            <section id="had" class="mb-5">
                <div class="card test-card p-4">
                    <div class="d-flex align-items-center mb-4">
                        <div class="p-3 rounded-circle me-3" style="background: rgba(255, 69, 0, 0.1);">
                            <i class="fas fa-brain text-primary" style="font-size: 1.5rem;"></i>
                        </div>
                        <h2 class="h4 mb-0 text-white">Échelle HAD (Hospital Anxiety and Depression)</h2>
                    </div>
                    <div>
                        <p class="mb-4">L'échelle HAD est un outil de dépistage des troubles anxieux et dépressifs, particulièrement adapté aux patients souffrant de pathologies somatiques. Elle a été développée pour être utilisée en milieu hospitalier.</p>
                        <h3 class="mt-4 mb-3">Structure du questionnaire</h3>
                        <p class="mb-4">L'échelle comprend 14 items répartis en deux sous-échelles :</p>
                        <ul class="list-disc pl-5 mb-4">
                            <li>7 items pour l'anxiété (HAD-A)</li>
                            <li>7 items pour la dépression (HAD-D)</li>
                        </ul>
                        <p class="mb-4">Chaque item est coté de 0 à 3, donnant un score total par sous-échelle variant de 0 à 21.</p>
                        <h3 class="mt-4 mb-3">Interprétation des scores</h3>
                        <p class="mb-2">Pour chaque sous-échelle :</p>
                        <ul class="list-disc pl-5 mb-4">
                            <li>0-7 : absence de symptomatologie</li>
                            <li>8-10 : symptomatologie douteuse</li>
                            <li>11-21 : symptomatologie certaine</li>
                        </ul>
                        <h3 class="mt-4 mb-3">Avantages</h3>
                        <ul class="list-disc pl-5 mb-4">
                            <li>Rapidité de passation (5 minutes environ)</li>
                            <li>Absence d'items somatiques qui pourraient fausser l'interprétation chez les patients atteints de pathologies organiques</li>
                            <li>Validation dans de nombreuses langues et cultures</li>
                        </ul>
                    </div>
                    <a href="#" class="btn btn-outline-primary mt-4">
                        <i class="fas fa-arrow-up me-2"></i>Retour en haut
                    </a>
                </div>
            </section>

            <section id="prochaska" class="mb-5">
                <div class="card test-card p-4">
                    <div class="d-flex align-items-center mb-4">
                        <div class="p-3 rounded-circle me-3" style="background: rgba(255, 69, 0, 0.1);">
                            <i class="fas fa-sync-alt text-primary" style="font-size: 1.5rem;"></i>
                        </div>
                        <h2 class="h4 mb-0 text-white">Modèle de Prochaska et Di Clemente</h2>
                    </div>
                    <div>
                        <p class="mb-4">Également appelé "modèle transthéorique du changement", ce modèle décrit les étapes par lesquelles passe un individu lorsqu'il modifie un comportement problématique (tabagisme, alcool, etc.).</p>
                        <h3 class="mt-4 mb-3">Les 6 étapes du changement</h3>
                        <div class="p-3 rounded mb-4" style="background: rgba(255, 255, 255, 0.05);">
                            <ol class="list-decimal pl-5">
                                <li><strong>Pré-contemplation</strong> : Le sujet ne perçoit pas de problème dans son comportement et n'envisage pas de changement.</li>
                                <li><strong>Contemplation</strong> : Le sujet reconnaît l'existence d'un problème et envisage un changement, mais sans engagement.</li>
                                <li><strong>Préparation</strong> : Le sujet se prépare activement à modifier son comportement (recherche d'aide, planification).</li>
                                <li><strong>Action</strong> : Le sujet modifie effectivement son comportement (début du sevrage).</li>
                                <li><strong>Maintien</strong> : Le sujet consolide les changements acquis et prévient les rechutes.</li>
                                <li><strong>Terminaison</strong> : Le comportement problématique a disparu et ne présente plus de risque de rechute.</li>
                            </ol>
                        </div>
                        <h3 class="mt-4 mb-3">Application pratique</h3>
                        <p class="mb-4">Ce modèle permet d'adapter les interventions en fonction du stade où se trouve le patient :</p>
                        <ul class="list-disc pl-5 mb-4">
                            <li>En pré-contemplation : information et prise de conscience</li>
                            <li>En contemplation : renforcement des motivations</li>
                            <li>En préparation : aide à la planification</li>
                            <li>En action : soutien et gestion des symptômes de sevrage</li>
                            <li>En maintien : prévention de la rechute</li>
                        </ul>
                        <p class="mb-4">Il est important de noter que le processus n'est pas linéaire : les rechutes font partie du processus et ramènent souvent le sujet à des stades antérieurs.</p>
                    </div>
                    <a href="#" class="btn btn-outline-primary mt-4">
                        <i class="fas fa-arrow-up me-2"></i>Retour en haut
                    </a>
                </div>
            </section>

            <section id="cage-cast" class="mb-5">
                <div class="card test-card p-4">
                    <div class="d-flex align-items-center mb-4">
                        <div class="p-3 rounded-circle me-3" style="background: rgba(255, 69, 0, 0.1);">
                            <i class="fas fa-wine-glass-alt text-primary" style="font-size: 1.5rem;"></i>
                        </div>
                        <h2 class="h4 mb-0 text-white">Questionnaires CAGE et CAST</h2>
                    </div>
                    <div>
                        <h3 class="mb-3">Questionnaire CAGE</h3>
                        <p class="mb-4">Le CAGE est un outil de dépistage des problèmes liés à la consommation d'alcool. Son nom est un acronyme des 4 questions posées :</p>
                        <div class="p-3 rounded mb-4" style="background: rgba(255, 255, 255, 0.05);">
                            <ol class="list-decimal pl-5">
                                <li><strong>Cut down</strong> : Avez-vous déjà ressenti le besoin de diminuer votre consommation de boissons alcoolisées ?</li>
                                <li><strong>Annoyed</strong> : Votre entourage vous a-t-il déjà fait des remarques au sujet de votre consommation ?</li>
                                <li><strong>Guilty</strong> : Avez-vous déjà eu l'impression que vous buviez trop ?</li>
                                <li><strong>Eye-opener</strong> : Avez-vous déjà eu besoin d'alcool dès le matin pour vous sentir en forme ?</li>
                            </ol>
                        </div>
                        <p class="mb-4">Un score ≥ 2 (réponses positives) suggère une possible consommation problématique d'alcool et justifie une évaluation plus approfondie.</p>
                        <h3 class="mt-4 mb-3">Questionnaire CAST (Cannabis Abuse Screening Test)</h3>
                        <p class="mb-4">Le CAST est un outil de dépistage des problèmes liés à la consommation de cannabis, adapté aux jeunes et aux adultes. Il comprend 6 items :</p>
                        <div class="p-3 rounded mb-4" style="background: rgba(255, 255, 255, 0.05);">
                            <ol class="list-decimal pl-5">
                                <li>Avez-vous déjà consommé du cannabis avant midi ?</li>
                                <li>Avez-vous déjà consommé du cannabis alors que vous étiez seul(e) ?</li>
                                <li>Avez-vous déjà eu des problèmes de mémoire quand vous consommiez du cannabis ?</li>
                                <li>Des amis ou des membres de votre famille vous ont-ils déjà dit que vous devriez réduire votre consommation de cannabis ?</li>
                                <li>Avez-vous déjà essayé sans succès de réduire ou d'arrêter votre consommation de cannabis ?</li>
                                <li>Avez-vous déjà eu des problèmes à cause de votre consommation de cannabis (disputes, bagarres, accidents, mauvais résultats scolaires...) ?</li>
                            </ol>
                        </div>
                        <p class="mb-4">Chaque réponse positive vaut 1 point. Un score ≥ 2 chez les adultes ou ≥ 3 chez les adolescents suggère un usage problématique de cannabis.</p>
                        <h3 class="mt-4 mb-3">Utilisation clinique</h3>
                        <p class="mb-4">Ces questionnaires brefs sont particulièrement utiles en médecine générale pour :</p>
                        <ul class="list-disc pl-5 mb-4">
                            <li>Dépister rapidement des consommations à risque</li>
                            <li>Ouvrir le dialogue sur les consommations de substances</li>
                            <li>Orienter vers des évaluations plus complètes si nécessaire</li>
                        </ul>
                    </div>
                    <a href="#" class="btn btn-outline-primary mt-4">
                        <i class="fas fa-arrow-up me-2"></i>Retour en haut
                    </a>
                </div>
            </section>

            <section id="echelle-motivation" class="mb-5">
                <div class="card test-card p-4">
                    <div class="d-flex align-items-center mb-4">
                        <div class="p-3 rounded-circle me-3" style="background: rgba(255, 69, 0, 0.1);">
                            <i class="fas fa-bullseye text-primary" style="font-size: 1.5rem;"></i>
                        </div>
                        <h2 class="h4 mb-0 text-white">Échelle analogique d'évaluation de la motivation</h2>
                    </div>
                    <div>
                        <p class="mb-4">Cette échelle visuelle simple permet d'évaluer rapidement le niveau de motivation d'un patient à changer un comportement (arrêt du tabac, perte de poids, etc.).</p>
                        <h3 class="mt-4 mb-3">Mode d'utilisation</h3>
                        <p class="mb-4">On présente au patient une ligne horizontale de 10 cm avec deux extrémités :</p>
                        <div class="p-3 rounded mb-4" style="background: rgba(255, 255, 255, 0.05);">
                            <div class="d-flex justify-content-between mb-2 text-muted">
                                <span>Pas du tout motivé</span>
                                <span>Extrêmement motivé</span>
                            </div>
                            <div class="progress" style="height: 10px;">
                                <div class="progress-bar bg-success" role="progressbar" style="width: 70%;" aria-valuenow="70" aria-valuemin="0" aria-valuemax="100"></div>
                            </div>
                            <div class="mt-2 text-end text-muted">Score : 7/10</div>
                        </div>
                        <p class="mb-4">Le patient indique par une marque sur la ligne son niveau de motivation perçu. La distance entre le début de la ligne et la marque est mesurée pour obtenir un score sur 10.</p>
                        <h3 class="mt-4 mb-3">Interprétation</h3>
                        <ul class="list-disc pl-5 mb-4">
                            <li>0-3 : motivation faible</li>
                            <li>4-6 : motivation modérée</li>
                            <li>7-10 : motivation forte</li>
                        </ul>
                        <h3 class="mt-4 mb-3">Avantages</h3>
                        <ul class="list-disc pl-5 mb-4">
                            <li>Simplicité et rapidité d'utilisation</li>
                            <li>Adaptation facile à différents contextes</li>
                            <li>Permet un suivi longitudinal de l'évolution de la motivation</li>
                            <li>Peut servir de point de départ à une discussion sur les motivations et freins</li>
                        </ul>
                        <p class="mb-4">Cette échelle est souvent utilisée en complément d'autres outils comme le modèle de Prochaska et Di Clemente pour affiner l'évaluation de la disposition au changement.</p>
                    </div>
                    <a href="#" class="btn btn-outline-primary mt-4">
                        <i class="fas fa-arrow-up me-2"></i>Retour en haut
                    </a>
                </div>
            </section>

            <!-- Footer from Index Page -->
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
        <script>
            // Highlight active nav link on scroll
            const sections = document.querySelectorAll('section');
            const navLinks = document.querySelectorAll('.nav-pills .nav-link');

            window.addEventListener('scroll', () => {
                let current = '';
                sections.forEach(section => {
                    const sectionTop = section.offsetTop;
                    if (pageYOffset >= (sectionTop - 100)) {
                        current = section.getAttribute('id');
                    }
                });
                navLinks.forEach(link => {
                    link.classList.remove('active');
                    if (link.getAttribute('href') === '#' + current) {
                        link.classList.add('active');
                    }
                });
            });

            // Smooth scroll for back to top links
            document.querySelectorAll('a[href="#"]').forEach(anchor => {
                anchor.addEventListener('click', function (e) {
                    e.preventDefault();
                    window.scrollTo({
                        top: 0,
                        behavior: 'smooth'
                    });
                });
            });
        </script>
    </body>
</html>