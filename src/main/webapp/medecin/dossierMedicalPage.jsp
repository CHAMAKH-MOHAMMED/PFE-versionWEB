<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://unpkg.com/bs-brain@2.0.4/tutorials/timelines/timeline-7/assets/css/timeline-7.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js" integrity="sha384-0pUGZvbkm6XF6gxjEnlmuGrJXVbNuzT9qBBavbLwCsOGabYfZo0T0to5eqruptLy" crossorigin="anonymous"></script>
        <title>Dossier Medical</title>
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <style>
            .material-icons {
                font-family: 'Material Icons';
                font-weight: normal;
                font-style: normal;
                font-size: 24px;
                display: inline-block;
                line-height: 1;
                text-transform: none;
                letter-spacing: normal;
                word-wrap: normal;
                white-space: nowrap;
                direction: ltr;
                -webkit-font-smoothing: antialiased;
                
                -moz-osx-font-smoothing: grayscale;
                font-feature-settings: 'liga';
                color: #b5b5b8;
            }
            .nav .nav-link.active {
                background-color: #57cbee;
                color: white;
                border-bottom: 0;
            }
            .nav .nav-link.active .material-icons {
                color: white;
            }
            .card {
                transition: transform 0.2s;
            }
            .card:hover {
                transform: translateY(-5px);
            }
        </style>
    </head>
    <body>
        <section>
            <div class="m-5">
                <nav>
                    <div class="nav nav-tabs" id="nav-tab-patient" role="tablist">
                        <button class="nav-link active" id="nav-generale-tab" data-bs-toggle="tab" data-bs-target="#nav-general" type="button" role="tab" aria-controls="nav-general" aria-selected="true" title="Informations">
                            <span class="material-icons">assignment_ind</span>
                        </button>
                        <button class="nav-link" id="nav-maladies-tab" data-bs-toggle="tab" data-bs-target="#nav-maladies" type="button" role="tab" aria-controls="nav-maladies" aria-selected="false" title="Maladies">
                            <span class="material-icons">vaccines</span>
                        </button>
                        <button class="nav-link" id="nav-historiqueTabagique-tab" data-bs-toggle="tab" data-bs-target="#nav-historiqueTabagique" type="button" role="tab" aria-controls="nav-historiqueTabagique" aria-selected="false" title="Historique tabagique">
                            <span class="material-icons">smoking_rooms</span>
                        </button>
                        <button class="nav-link" id="nav-rendezvous-tab" data-bs-toggle="tab" data-bs-target="#nav-rendezvous" type="button" role="tab" aria-controls="nav-rendezvous" aria-selected="false" title="Rendez-vous">
                            <span class="material-icons">contact_phone</span>
                        </button>
                        <button class="nav-link" id="nav-consultation-tab" data-bs-toggle="tab" data-bs-target="#nav-consultation" type="button" role="tab" aria-controls="nav-consultation" aria-selected="false" title="Consultations">
                            <span class="material-icons">stethoscope</span>
                        </button>
                    </div>
                </nav>
                <div class="tab-content" id="nav-tabContent">
                    <div class="tab-pane show active" id="nav-general" role="tabpanel" aria-labelledby="nav-generale-tab" tabindex="0">
                        <ul class="list-group" id="nav-general-list">
                            <li class="list-group-item text-white bg-info">Informations générales</li>
                        </ul>
                    </div>
                    <div class="tab-pane" id="nav-maladies" role="tabpanel" aria-labelledby="nav-maladies-tab" tabindex="0">
                        <ul class="list-group" id="nav-maladies_list">
                            <li class="list-group-item text-white bg-info">Maladies</li>
                        </ul>
                    </div>
                    <div class="tab-pane" id="nav-historiqueTabagique" role="tabpanel" aria-labelledby="nav-historiqueTabagique-tab" tabindex="0">
                        <ul class="list-group list-group-flush" id="nav-historiqueTabagique_list">
                            <li class="list-group-item text-white bg-info">Historique tabagique</li>
                            <li class="list-group-item">TODO ...</li>
                        </ul>
                    </div>
                    <div class="tab-pane" id="nav-rendezvous" role="tabpanel" aria-labelledby="nav-rendezvous-tab" tabindex="0">
                        <ul class="list-group list-group-flush" id="nav-rendezvous-list">
                            <li class="list-group-item text-white bg-info">Liste des rendez-vous</li>
                            <li class="list-group-item">TODO ...</li>
                        </ul>
                    </div>
                    <div class="tab-pane" id="nav-consultation" role="tabpanel" aria-labelledby="nav-consultation-tab" tabindex="0">
                        <ul class="list-group list-group-flush" id="nav-consultation_list">
                            <li class="list-group-item text-white bg-info">Liste des consultations</li>
                            <li class="list-group-item">TODO ...</li>
                        </ul>
                    </div>
                </div>
            </div>
        </section>

        <section class="bsb-timeline-7 bg-light py-3 py-md-5 py-xl-8">
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-10 col-md-12 col-xl-10 col-xxl-9">
                        <ul class="timeline"></ul>
                    </div>
                </div>
            </div>
        </section>

        <div id="loading" class="text-center" style="display: none;">
            <div class="spinner-border text-primary" role="status">
                <span class="visually-hidden">Loading...</span>
            </div>
        </div>

        <script>
            $(document).ready(function() {
                function ChargerDossierMedical() {
                    $('#loading').show();
                    $.ajax({
                        url: 'http://localhost:8080/WEB/medecin/DossierMedical?id=' + <%= request.getParameter("id") %>,
                        type: "GET",
                        dataType: 'json',
                        success: function(response, textStatus, jqXHR) {
                            let listInfos = '<li class="list-group-item border-top-0"><span class="material-icons align-middle m-3">person</span>' + 
                                            response.patient.prenom + ' ' + response.patient.nom + '</li>' +
                                            '<li class="list-group-item border-top-0"><span class="material-icons align-middle m-3">calendar_month</span>' + 
                                            response.patient.dateNaissance + '</li>';
                            $('#nav-general-list').append(listInfos);

                            if (response.maladies.length === 0) {
                                $('#nav-maladies_list').append('<li class="list-group-item border-top-0">No chronic diseases</li>');
                            } else {
                                for (let k = 0; k < response.maladies.length; k++) {
                                    let itemMaladie = '<li class="list-group-item border-top-0">' + response.maladies[k].titre + '</li>';
                                    $('#nav-maladies_list').append(itemMaladie);
                                }
                            }

                            for (let i = 0; i < response.protocoleSevrage.phases.length; i++) {
                                let listActions = '<ul class="list-group list-group-numbered" id="timeLine_item_action_list">';
                                if (response.protocoleSevrage.phases[i].actions.length === 0) {
                                    listActions += '<li class="list-group-item border-top-0">No actions available</li>';
                                } else {
                                    for (let j = 0; j < response.protocoleSevrage.phases[i].actions.length; j++) {
                                        listActions += '<li class="list-group-item border-top-0">' + response.protocoleSevrage.phases[i].actions[j].titre + '</li>';
                                    }
                                }
                                listActions += '</ul>';

                                let listTestPsychologiques = '<ul class="list-group" id="timeLine_item_action_list">';
                                if (response.protocoleSevrage.phases[i].testPsychologiques.length === 0) {
                                    listTestPsychologiques += '<li class="list-group-item border-top-0">No psychological tests available</li>';
                                } else {
                                    for (let j = 0; j < response.protocoleSevrage.phases[i].testPsychologiques.length; j++) {
                                        listTestPsychologiques += '<li class="list-group-item border-top-0">' + response.protocoleSevrage.phases[i].testPsychologiques[j].titre + '</li>';
                                    }
                                }
                                listTestPsychologiques += '</ul>';

                                let listTraitements = '<ul class="list-group" id="timeLine_item_action_list">';
                                if (response.protocoleSevrage.phases[i].traitements.length === 0) {
                                    listTraitements += '<li class="list-group-item border-top-0">No treatments available</li>';
                                } else {
                                    for (let j = 0; j < response.protocoleSevrage.phases[i].traitements.length; j++) {
                                        listTraitements += '<li class="list-group-item border-top-0">' + response.protocoleSevrage.phases[i].traitements[j].titre + '</li>';
                                    }
                                }
                                listTraitements += '</ul>';

                                const row = '<li class="timeline-item">' +
                                    '<div class="timeline-body">' +
                                        '<div class="timeline-meta">' +
                                            '<div class="d-inline-flex flex-column px-2 py-1 text-success-emphasis bg-warning border border-warning-subtle rounded-2 text-md-end shadow">' +
                                                '<span class="fw-bold">' + response.protocoleSevrage.phases[i].dateDebut + ' - ' + response.protocoleSevrage.phases[i].dateFin + '</span>' +
                                                '<span>Phase ' + (i + 1) + '</span>' +
                                            '</div>' +
                                        '</div>' +
                                        '<div class="timeline-content timeline-indicator">' +
                                            '<div class="card border-0 shadow">' +
                                                '<div class="card-header text-white bg-info">' + response.protocoleSevrage.phases[i].titre + '</div>' +
                                                '<div class="card-body p-xl-4">' +
                                                    '<h6 class="card-subtitle text-secondary mb-3">' + response.protocoleSevrage.phases[i].titre + '</h6>' +
                                                    '<p class="card-text m-0">' + response.protocoleSevrage.phases[i].description + '</p>' +
                                                    '<div class="mt-3">' +
                                                        '<nav>' +
                                                            '<div class="nav nav-tabs" id="nav-tab' + response.protocoleSevrage.phases[i].id + '" role="tablist">' +
                                                                '<button class="nav-link active" id="nav-actions-tab' + response.protocoleSevrage.phases[i].id + '" data-bs-toggle="tab" data-bs-target="#nav-actions' + response.protocoleSevrage.phases[i].id + '" type="button" role="tab" aria-controls="nav-actions' + response.protocoleSevrage.phases[i].id + '" aria-selected="true" title="Actions">' +
                                                                    '<span class="material-icons">fact_check</span>' +
                                                                '</button>' +
                                                                '<button class="nav-link" id="nav-test-tab' + response.protocoleSevrage.phases[i].id + '" data-bs-toggle="tab" data-bs-target="#nav-test' + response.protocoleSevrage.phases[i].id + '" type="button" role="tab" aria-controls="nav-test' + response.protocoleSevrage.phases[i].id + '" aria-selected="false" title="Tests psychologique">' +
                                                                    '<span class="material-icons">psychology_alt</span>' +
                                                                '</button>' +
                                                                '<button class="nav-link" id="nav-analyse-tab' + response.protocoleSevrage.phases[i].id + '" data-bs-toggle="tab" data-bs-target="#nav-analyse' + response.protocoleSevrage.phases[i].id + '" type="button" role="tab" aria-controls="nav-analyse' + response.protocoleSevrage.phases[i].id + '" aria-selected="false" title="Analyses">' +
                                                                    '<span class="material-icons">biotech</span>' +
                                                                '</button>' +
                                                                '<button class="nav-link" id="nav-traitement-tab' + response.protocoleSevrage.phases[i].id + '" data-bs-toggle="tab" data-bs-target="#nav-traitement' + response.protocoleSevrage.phases[i].id + '" type="button" role="tab" aria-controls="nav-traitement' + response.protocoleSevrage.phases[i].id + '" aria-selected="false" title="Traitements">' +
                                                                    '<span class="material-icons">medication</span>' +
                                                                '</button>' +
                                                            '</div>' +
                                                        '</nav>' +
                                                        '<div class="tab-content" id="nav-tabContent' + response.protocoleSevrage.phases[i].id + '">' +
                                                            '<div class="tab-pane fade show active" id="nav-actions' + response.protocoleSevrage.phases[i].id + '" role="tabpanel" aria-labelledby="nav-actions-tab' + response.protocoleSevrage.phases[i].id + '" tabindex="0">' +
                                                                listActions +
                                                            '</div>' +
                                                            '<div class="tab-pane fade" id="nav-test' + response.protocoleSevrage.phases[i].id + '" role="tabpanel" aria-labelledby="nav-test-tab' + response.protocoleSevrage.phases[i].id + '" tabindex="0">' +
                                                                listTestPsychologiques +
                                                            '</div>' +
                                                            '<div class="tab-pane fade" id="nav-analyse' + response.protocoleSevrage.phases[i].id + '" role="tabpanel" aria-labelledby="nav-analyse-tab' + response.protocoleSevrage.phases[i].id + '" tabindex="0">' +
                                                                '<p>No analyses available</p>' +
                                                            '</div>' +
                                                            '<div class="tab-pane fade" id="nav-traitement' + response.protocoleSevrage.phases[i].id + '" role="tabpanel" aria-labelledby="nav-traitement-tab' + response.protocoleSevrage.phases[i].id + '" tabindex="0">' +
                                                                listTraitements +
                                                            '</div>' +
                                                        '</div>' +
                                                    '</div>' +
                                                '</div>' +
                                            '</div>' +
                                        '</div>' +
                                    '</div>' +
                                '</li>';
                                $('.timeline').append(row);
                            }
                            $('#loading').hide();
                        },
                        error: function(response, textStatus, jqXHR) {
                            $('#loading').hide();
                            $('#nav-general-list').append('<li class="list-group-item text-danger">Error loading data</li>');
                        }
                    });
                }
                ChargerDossierMedical();
            });
        </script>
    </body>
</html>