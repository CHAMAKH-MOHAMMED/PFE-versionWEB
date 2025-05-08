<%-- 
    Document   : prtocole
    Created on : 3 avr. 2025, 03:07:30
    Author     : vPro
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Liste des patients</title>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js"></script>
    </head>
    <body>
        <h2>Liste des patients </h2>
        <div class="container mt-5">
        <div class="d-flex justify-content-center row">
            <div class="col-md-10">
                <div class="rounded">
                    <div class="table-responsive">
                        <table class="table">
                            <thead>
                                <tr class="text-white bg-info">
                                    <th>N</th>
                                    <th>Nom</th>
                                    <th></th>
                                    <th></th>
                                </tr>
                            </thead>
                            <tbody class="table-body" id="table_patients">
                                
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
        
    <script>
        $(document).ready(function() {
                function dossierMedical(id){
                    alert(id);
                }
            	/****** Fonction pour charger la liste des patients ****/
                function populatePatientsTable(){
                        $.ajax({
                                url : "/medecin/PatientList",
                                type: "GET",
                                dataType: "json",
                                success: function(response,textStatus ,jqXHR){
                                        for(i=0;i<response.length;i++){
                                                var row='<td>'+response[i].id+'</td><td>'+response[i].nom +' '+response[i].prenom+'</td><td><a href="dossierMedicalPage.jsp?id='+response[i].id+'" class="badge badge-success pe-auto" patientId="'+response[i].id+'">Dossier</a></td><td><i class="fa fa-ellipsis-h text-black-50"></i></td>';
                                                var tr = document.createElement("tr");
                                                tr.innerHTML= row;
                                                $('#table_patients').append(tr);
                                        }
                            },
                            error: function(response,textStatus ,jqXHR){
                                alert("Erreur de chargement des patients");
                                //TODO : traiter l'affichage du message derreur obtenu du serveur
                        }
                        });
                }
                populatePatientsTable();
             
        });
    </script>
    </body>
</html>
