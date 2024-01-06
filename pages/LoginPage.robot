*** Settings ***
Library     SeleniumLibrary
Library     FakerLibrary
Library    Collections
Library    String
Variables   ../keywords/Data.py
Variables   ../locators/LoginLocators.py



*** Variables ***
${Browser}    chrome





*** Keywords ***
Aller sur le site de GreenMorrow
   Open Browser    ${LoginDatas.Url}     browser=${Browser}
   Set Selenium Implicit Wait    5
   Maximize Browser Window


Vérifie l'URL
   Location Should Be    ${LoginDatas.Url}

Vérifie les autres éléments de la page
   ${actualTextSeConnecterAvecGoogle}   Get Text    ${LogLocators.seConnecterAvecGoogle}
   Should Be Equal      ${actualTextSeConnecterAvecGoogle}   ${LoginDatas.expectedTextSeConnecterAvecGoogle}
   Log To Console    Texte actuel : ${actualTextSeConnecterAvecGoogle}

  ${actualTextSeConnecterAvecEmail}   Get Text    ${LogLocators.seConnecterAvecEmail}
   Should Be Equal      ${actualTextSeConnecterAvecEmail}   ${LoginDatas.expectedTextSeConnecterAvecEmail}
   Log To Console    Texte actuel : ${actualTextSeConnecterAvecEmail}

   ${actualTextcréerUnCompte}   Get Text    ${LogLocators.créerUnCompte}
   Should Be Equal      ${actualTextcréerUnCompte}   ${LoginDatas.expectedTextCréerUnCompte}
   Log To Console    Texte actuel : ${actualTextcréerUnCompte}

Crée un compte avec des utilisateurs différents
  Click Element    ${LogLocators.créerUnCompte}
  ${actualTextInsription}  Get Text  ${LogLocators.textInscription}
  Should Be Equal As Strings    ${actualTextInsription}    Inscription

Générer une Adresse E-mail Aléatoire
  ${fake_email}=   FakerLibrary.Email
  Input Text        ${LogLocators.placeEmail}    ${fake_email}
  Log To Console      ${fake_email}

Générer un Utilisateur Aléatoire
  ${fake_name} =   FakerLibrary.Name
  Input Text     ${LogLocators.placeUtilisateur}    ${fake_name}
  Log To Console    ${LogLocators.placeUtilisateur}

Vérifier et Cliquer sur le Bouton Continuer
  Click Element    ${LogLocators.btnContinuer}

Générer un Mot de Passe
  Input Text     ${LogLocators.placePassword}      ${LoginDatas.password}
  Input Text     ${LogLocators.placePasswordConfirm}    ${LoginDatas.password}

Cliquer sur Créer un compte et me connecter
  Click Element    ${LogLocators.btnCréerUnCompte}


Vérifier la Connexion à la Page d'Accueil
    ${mesPlantes}    Get Text    ${LogLocators.mesPlantes}
    Should Be Equal As Strings    ${mesPlantes}     ${LoginDatas.expectedTextMesPlantes}









