*** Settings ***
Library    SeleniumLibrary
Library    OperatingSystem
Variables   ../keywords/Data.py
Variables   ../locators/Locators.py



*** Keywords ***
Instagram anasayfasina git
   Open Browser   ${Datas.UrlInsta}     chrome
   Maximize Browser Window
   Set Selenium Implicit Wait    10s
   Click Element    ${InsLocators.AccepterCookies}
   

Instagram giriş sayfasina başarı ile bağlandığını dogrula
   ${actualFaceBaglanText}   Get Text    ${InsLocators.btnFaceBaglan}
   Should Be Equal   ${actualFaceBaglanText}     ${Datas.ExpectedBtnFaceTexti}
   Title Should Be    ${Datas.TitleBaglanti}


Kullanıcı adını ve şifreyi gir 
   Input Text    ${InsLocators.placeUsername}    ${Datas.Email}
   Input Text    ${InsLocators.placePassword}    ${Datas.Password}
   Sleep    2s
   Click Element    ${InsLocators.btnGiris}



Anasaya başarılı bir şekilde bağlandığını dogrula
   Wait Until Page Contains    Instagram


Geçersiz şifreyi gir
    Input Text    ${InsLocators.placeUsername}    ${Datas.Email}
    Input Text    ${InsLocators.placePassword}    ${Datas.GeçersizSifre}
    Sleep    2s
    Click Element    ${InsLocators.btnGiris}

Hata mesajını dogrula 
  ${SifreHataMesaji}    Get Text      ${InsLocators.placaHataMesaji}
  Should Be Equal      ${SifreHataMesaji}    ${Datas.expectedHataMesajiYanlisSifre}

Geçersiz kullanıcı adı gir
    Input Text    ${InsLocators.placeUsername}    ${Datas.GeçersizKullaniciAdi}
    Input Text    ${InsLocators.placePassword}    ${Datas.Password}
    Sleep    2s
    Click Element    ${InsLocators.btnGiris}

Kullanıcı adı hata mesajını dogrula
  ${SifreHataMesaji}    Get Text      ${InsLocators.placaHataMesaji}
  Should Be Equal      ${SifreHataMesaji}    ${Datas.expectedHataMesajiYanlisKullaniciAdi}

Kullanıcı adı ve şifre alanlarını boş bırakın ve kontrol edin
    ${PlaceUsername}    Get Text    ${InsLocators.placeUsername}
    Should Be Empty    ${PlaceUsername}

    ${PlacePassword}   Get Text   ${InsLocators.placePassword}
    Should Be Empty     ${PlacePassword}

    ${is_disabled} =  Element Should Be Disabled    ${InsLocators.btnGiris}
     Run Keyword If    '${is_disabled}' == 'True'    Log     Öğe devre dışıdır




















