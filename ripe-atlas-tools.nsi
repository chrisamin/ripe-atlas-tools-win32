!include "MUI.nsh"
!include "WinVer.nsh"

!define MUI_PRODUCT "RIPE Atlas Tools"

Name "${MUI_PRODUCT}"
Outfile "RipeAtlasToolsSetup.exe"

InstallDir "$LOCALAPPDATA\Programs\${MUI_PRODUCT}"

!insertmacro MUI_PAGE_LICENSE "LICENSE"
!insertmacro MUI_PAGE_INSTFILES

!insertmacro MUI_UNPAGE_CONFIRM
!insertmacro MUI_UNPAGE_INSTFILES

; Set languages (first is default language)
!insertmacro MUI_LANGUAGE "English"

!define MUI_TEXT_LICENSE_TITLE "RIPE Atlas Tools"

Icon "ncc.ico"
RequestExecutionLevel user

Function .onInit
  ${IfNot} ${AtLeastWin7}
    MessageBox MB_OK "RIPE Atlas Tools requires Windows 7 or above"
    Quit
  ${EndIf}
FunctionEnd

Section
    SetOutPath $INSTDIR

    WriteUninstaller $INSTDIR\uninstaller.exe

    File /r dist\ripe-atlas

    File ncc.ico

    File ripe-atlas-tools.bat

    CreateShortCut "$DESKTOP\${MUI_PRODUCT}.lnk" "$INSTDIR\ripe-atlas-tools.bat" "" "$INSTDIR\ncc.ico"
    CreateShortCut "$SMPROGRAMS\${MUI_PRODUCT}.lnk" "$INSTDIR\ripe-atlas-tools.bat" "" "$INSTDIR\ncc.ico"

    WriteRegStr HKCU "Software\Microsoft\Windows\CurrentVersion\Uninstall\RipeAtlasTools" "DisplayName" "${MUI_PRODUCT}"
    WriteRegStr HKCU "Software\Microsoft\Windows\CurrentVersion\Uninstall\RipeAtlasTools" "UninstallString" "$INSTDIR\uninstaller.exe"
    WriteRegStr HKCU "Software\Microsoft\Windows\CurrentVersion\Uninstall\RipeAtlasTools" "DisplayIcon" "$INSTDIR\ncc.ico"

SectionEnd

Section "Uninstall"
    RMDir /r $INSTDIR
    Delete "$DESKTOP\${MUI_PRODUCT}.lnk"
    DeleteRegKey HKCU "Software\Microsoft\Windows\CurrentVersion\Uninstall\RipeAtlasTools"
SectionEnd
