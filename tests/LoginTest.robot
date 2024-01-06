*** Settings ***
Library    SeleniumLibrary
Resource    ../pages/LoginPage.robot


Test Setup     Aller sur le site de GreenMorrow
Test Teardown    Close Browser


*** Test Cases ***
Vérifier la page d'accueil
   Vérifie l'URL
   Vérifie les autres éléments de la page

Créer un compte
   Crée un compte avec des utilisateurs différents
   Générer une Adresse E-mail Aléatoire
   Générer un Utilisateur Aléatoire
   Vérifier et Cliquer sur le Bouton Continuer
   Générer un Mot de Passe
   Cliquer sur Créer un compte et me connecter
   Vérifier la Connexion à la Page d'Accueil


