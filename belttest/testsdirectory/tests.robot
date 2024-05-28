*** Settings ***
Library    seat_belts.py

*** Test Cases ***
Test Seatbelt Alerts
    [Documentation]    Vérifie que les alertes lumineuses et sonores fonctionnent correctement lorsque la ceinture de sécurité n'est pas attachée et attachée.

    Unfasten Seatbelt
    ${light_red}=    Is Light Indicator Red
    ${sound_on}=    Is Sound Alarm On
    Should Be True    ${light_red}    La lumière d'alerte doit clignoter en rouge lorsque la ceinture n'est pas attachée.
    Should Be True    ${sound_on}    L'alarme sonore doit être activée lorsque la ceinture n'est pas attachée.

    Fasten Seatbelt
    ${light_green}=    Is Light Indicator Green
    ${sound_on}=    Is Sound Alarm On
    ${light_off}=  Set Variable    ${light_green} == True
    ${sound_off}=  Set Variable    ${sound_on} == False
    Should Be True    ${light_off}    La lumière d'alerte doit être verte lorsque la ceinture est attachée.
    Should Be True    ${sound_off}    L'alarme sonore doit être désactivée lorsque la ceinture est attachée.
