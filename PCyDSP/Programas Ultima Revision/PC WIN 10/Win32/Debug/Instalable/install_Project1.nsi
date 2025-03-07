/*

This example script installs a simple application for a single user.

If multiple users on the same machine run this installer, each user
will end up with a separate install that is not affected by
update/removal operations performed by other users.

Per-user installers should only write to HKCU and 
folders inside the users profile.

*/

!define NAME "Control Hidroponia"
!define REGPATH_UNINSTSUBKEY "Software\Microsoft\Windows\CurrentVersion\Uninstall\${NAME}"
Name "${NAME}"
OutFile "Install ${NAME}.exe"
Unicode True
RequestExecutionLevel User ; We don't need UAC elevation
InstallDir "" ; Don't set a default $InstDir so we can detect /D= and InstallDirRegKey
InstallDirRegKey HKCU "${REGPATH_UNINSTSUBKEY}" "UninstallString"

!include "Library.nsh"
!include LogicLib.nsh
!include WinCore.nsh
!include Integration.nsh

!define SourceDLL1 '"${NSISDIR}\Lib\rtl260.bpl"'
!define SourceDLL2 '"${NSISDIR}\Lib\vcl260.bpl"'
!define SourceDLL3 '"${NSISDIR}\Lib\borlndmm.DLL"'
!define SourceDLL4 '"${NSISDIR}\Lib\cc32c260mt.DLL"'

Page Directory
Page InstFiles

Uninstpage UninstConfirm
Uninstpage InstFiles


Function .onInit
  SetShellVarContext Current

  ${If} $InstDir == "" ; No /D= nor InstallDirRegKey?
    GetKnownFolderPath $InstDir ${FOLDERID_UserProgramFiles} ; This folder only exists on Win7+
    StrCmp $InstDir "" 0 +2 
    StrCpy $InstDir "$LocalAppData\Programs" ; Fallback directory

    StrCpy $InstDir "$InstDir\$(^Name)"
  ${EndIf}
FunctionEnd

Function un.onInit
  SetShellVarContext Current
FunctionEnd

Section "Program files (Required)"
  SectionIn Ro

  !insertmacro InstallLib TLB       NOTSHARED REBOOT_PROTECTED      ${SourceDLL1} $INSTDIR\rtl260.bpl $INSTDIR
  !insertmacro InstallLib TLB       NOTSHARED REBOOT_PROTECTED      ${SourceDLL2} $INSTDIR\vcl260.bpl $INSTDIR
  !insertmacro InstallLib DLL       NOTSHARED REBOOT_PROTECTED      ${SourceDLL3} $INSTDIR\borlndmm.DLL $INSTDIR
  !insertmacro InstallLib DLL       NOTSHARED REBOOT_PROTECTED      ${SourceDLL4} $INSTDIR\cc32c260mt.DLL $INSTDIR
 
  SetOutPath $InstDir
  WriteUninstaller "$InstDir\Uninst.exe"
  WriteRegStr HKCU "${REGPATH_UNINSTSUBKEY}" "DisplayName" "${NAME}"
  WriteRegStr HKCU "${REGPATH_UNINSTSUBKEY}" "DisplayIcon" "$InstDir\MyApp.exe,0"
  WriteRegStr HKCU "${REGPATH_UNINSTSUBKEY}" "UninstallString" '"$InstDir\Uninst.exe"'
  WriteRegDWORD HKCU "${REGPATH_UNINSTSUBKEY}" "NoModify" 1
  WriteRegDWORD HKCU "${REGPATH_UNINSTSUBKEY}" "NoRepair" 1

  File "/oname=$InstDir\Control Hidroponia.exe" "Project1.exe"; "${NSISDIR}\Bin\MakeLangId.exe" Pretend that we have a real application to install
SectionEnd

Section "Start Menu shortcut"
  CreateShortcut /NoWorkingDir "$SMPrograms\${NAME}.lnk" "$InstDir\${NAME}.exe"
SectionEnd

/*
This Section registers a fictional .test-nullsoft file extension and the Nullsoft.Test ProgId. 
Proprietary file types are encouraged (by Microsoft) to use long file extensions and ProgIds that include the company name.

When registering with "Open With" your executable should ideally have a somewhat unique name, 
otherwise there could be a naming collision with a different application (with the same name) installed on the same machine.

REGISTER_DEFAULTPROGRAMS is not defined because proprietary file types do not typically use the Default Programs functionality. 
If your application registers a standard file type such as .mp3 or .html or a protocol like HTTP it should register as a Default Program. 
It should also register as a client (https://docs.microsoft.com/en-us/windows/win32/shell/reg-middleware-apps#common-registration-elements-for-all-client-types).
*/
!define ASSOC_EXT ".test-nullsoft"
!define ASSOC_PROGID "Nullsoft.Test"
!define ASSOC_VERB "Project1"
!define ASSOC_APPEXE "Project1.exe"
Section -ShellAssoc
  # Register file type
  WriteRegStr ShCtx "Software\Classes\${ASSOC_PROGID}\DefaultIcon" "" "$InstDir\${ASSOC_APPEXE},0"
  ;WriteRegStr ShCtx "Software\Classes\${ASSOC_PROGID}\shell\${ASSOC_VERB}" "" "Nullsoft Test App" [Optional]
  ;WriteRegStr ShCtx "Software\Classes\${ASSOC_PROGID}\shell\${ASSOC_VERB}" "MUIVerb" "@$InstDir\${ASSOC_APPEXE},-42" ; WinXP+ [Optional] Localizable verb display name
  WriteRegStr ShCtx "Software\Classes\${ASSOC_PROGID}\shell\${ASSOC_VERB}\command" "" '"$InstDir\${ASSOC_APPEXE}" "%1"'
  WriteRegStr ShCtx "Software\Classes\${ASSOC_EXT}" "" "${ASSOC_PROGID}"

  # Register "Open With" [Optional]
  WriteRegNone ShCtx "Software\Classes\${ASSOC_EXT}\OpenWithList" "${ASSOC_APPEXE}" ; Win2000+ [Optional]
  ;WriteRegNone ShCtx "Software\Classes\${ASSOC_EXT}\OpenWithProgids" "${ASSOC_PROGID}" ; WinXP+ [Optional]
  WriteRegStr ShCtx "Software\Classes\Applications\${ASSOC_APPEXE}\shell\open\command" "" '"$InstDir\${ASSOC_APPEXE}" "%1"'
  WriteRegStr ShCtx "Software\Classes\Applications\${ASSOC_APPEXE}" "FriendlyAppName" "Nullsoft Test App" ; [Optional]
  WriteRegStr ShCtx "Software\Classes\Applications\${ASSOC_APPEXE}" "ApplicationCompany" "Nullsoft" ; [Optional]
  WriteRegNone ShCtx "Software\Classes\Applications\${ASSOC_APPEXE}\SupportedTypes" "${ASSOC_EXT}" ; [Optional] Only allow "Open With" with specific extension(s) on WinXP+

  # Register "Default Programs" [Optional]
  !ifdef REGISTER_DEFAULTPROGRAMS
  WriteRegStr ShCtx "Software\Classes\Applications\${ASSOC_APPEXE}\Capabilities" "ApplicationDescription" "Shell association example test application"
  WriteRegStr ShCtx "Software\Classes\Applications\${ASSOC_APPEXE}\Capabilities\FileAssociations" "${ASSOC_EXT}" "${ASSOC_PROGID}"
  WriteRegStr ShCtx "Software\RegisteredApplications" "Nullsoft Test App" "Software\Classes\Applications\${ASSOC_APPEXE}\Capabilities"
  !endif

  ${NotifyShell_AssocChanged}
SectionEnd


Section -un.ShellAssoc
  # Unregister file type
  ClearErrors
  DeleteRegKey ShCtx "Software\Classes\${ASSOC_PROGID}\shell\${ASSOC_VERB}"
  DeleteRegKey /IfEmpty ShCtx "Software\Classes\${ASSOC_PROGID}\shell"
  ${IfNot} ${Errors}
    DeleteRegKey ShCtx "Software\Classes\${ASSOC_PROGID}\DefaultIcon"
  ${EndIf}
  ReadRegStr $0 ShCtx "Software\Classes\${ASSOC_EXT}" ""
  DeleteRegKey /IfEmpty ShCtx "Software\Classes\${ASSOC_PROGID}"
  ${IfNot} ${Errors}
  ${AndIf} $0 == "${ASSOC_PROGID}"
    DeleteRegValue ShCtx "Software\Classes\${ASSOC_EXT}" ""
    DeleteRegKey /IfEmpty ShCtx "Software\Classes\${ASSOC_EXT}"
  ${EndIf}

  # Unregister "Open With"
  DeleteRegKey ShCtx "Software\Classes\Applications\${ASSOC_APPEXE}"
  DeleteRegValue ShCtx "Software\Classes\${ASSOC_EXT}\OpenWithList" "${ASSOC_APPEXE}"
  DeleteRegKey /IfEmpty ShCtx "Software\Classes\${ASSOC_EXT}\OpenWithList"
  DeleteRegValue ShCtx "Software\Classes\${ASSOC_EXT}\OpenWithProgids" "${ASSOC_PROGID}"
  DeleteRegKey /IfEmpty ShCtx "Software\Classes\${ASSOC_EXT}\OpenWithProgids"
  DeleteRegKey /IfEmpty  ShCtx "Software\Classes\${ASSOC_EXT}"

  # Unregister "Default Programs"
  !ifdef REGISTER_DEFAULTPROGRAMS
  DeleteRegValue ShCtx "Software\RegisteredApplications" "Nullsoft Test App"
  DeleteRegKey ShCtx "Software\Classes\Applications\${ASSOC_APPEXE}\Capabilities"
  DeleteRegKey /IfEmpty ShCtx "Software\Classes\Applications\${ASSOC_APPEXE}"
  !endif

  # Attempt to clean up junk left behind by the Windows shell
  DeleteRegValue HKCU "Software\Microsoft\Windows\CurrentVersion\Search\JumplistData" "$InstDir\${ASSOC_APPEXE}"
  DeleteRegValue HKCU "Software\Classes\Local Settings\Software\Microsoft\Windows\Shell\MuiCache" "$InstDir\${ASSOC_APPEXE}.FriendlyAppName"
  DeleteRegValue HKCU "Software\Classes\Local Settings\Software\Microsoft\Windows\Shell\MuiCache" "$InstDir\${ASSOC_APPEXE}.ApplicationCompany"
  DeleteRegValue HKCU "Software\Microsoft\Windows\ShellNoRoam\MUICache" "$InstDir\${ASSOC_APPEXE}" ; WinXP
  DeleteRegValue HKCU "Software\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Compatibility Assistant\Store" "$InstDir\${ASSOC_APPEXE}"
  DeleteRegValue HKCU "Software\Microsoft\Windows\CurrentVersion\ApplicationAssociationToasts" "${ASSOC_PROGID}_${ASSOC_EXT}"
  DeleteRegValue HKCU "Software\Microsoft\Windows\CurrentVersion\ApplicationAssociationToasts" "Applications\${ASSOC_APPEXE}_${ASSOC_EXT}"
  DeleteRegValue HKCU "Software\Microsoft\Windows\CurrentVersion\Explorer\FileExts\${ASSOC_EXT}\OpenWithProgids" "${ASSOC_PROGID}"
  DeleteRegKey /IfEmpty HKCU "Software\Microsoft\Windows\CurrentVersion\Explorer\FileExts\${ASSOC_EXT}\OpenWithProgids"
  DeleteRegKey /IfEmpty HKCU "Software\Microsoft\Windows\CurrentVersion\Explorer\FileExts\${ASSOC_EXT}\OpenWithList"
  DeleteRegKey /IfEmpty HKCU "Software\Microsoft\Windows\CurrentVersion\Explorer\FileExts\${ASSOC_EXT}"
  ;DeleteRegKey HKCU "Software\Microsoft\Windows\Roaming\OpenWith\FileExts\${ASSOC_EXT}"
  ;DeleteRegKey HKCU "Software\Microsoft\Windows\CurrentVersion\Explorer\RecentDocs\${ASSOC_EXT}"

  ${NotifyShell_AssocChanged}
SectionEnd

Section -Uninstall
  ${UnpinShortcut} "$SMPrograms\${NAME}.lnk"
  Delete "$SMPrograms\${NAME}.lnk"

  !insertmacro UninstallLib TLB       NOTSHARED REBOOT_PROTECTED      $INSTDIR\RTL260.bpl 
  !insertmacro UninstallLib TLB       NOTSHARED REBOOT_PROTECTED      $INSTDIR\VCL260.bpl
  !insertmacro UninstallLib DLL       NOTSHARED REBOOT_PROTECTED      $INSTDIR\BORLANDMM.DLL
  !insertmacro UninstallLib DLL       NOTSHARED REBOOT_PROTECTED      $INSTDIR\CC32C260MT.DLL


  Delete "$InstDir\Project1.exe"
  Delete "$InstDir\Uninst.exe"
  RMDir "$InstDir"
  DeleteRegKey HKCU "${REGPATH_UNINSTSUBKEY}"
SectionEnd
