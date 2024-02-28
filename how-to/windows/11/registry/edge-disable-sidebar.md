# Disable the Edge Sidebar

Run Windows Terminal with Admin Privileges and run the following commands:

```
reg add "HKLM\Software\Policies\Microsoft\Edge" /v "HubsSidebarEnabled" /t REG_DWORD /d "0" /f
reg add "HKLM\Software\Policies\Microsoft\Edge" /v "SearchInSidebarEnabled" /t REG_DWORD /d "2" /f
reg add "HKLM\Software\Policies\Microsoft\Edge" /v "StandaloneHubsSidebarEnabled" /t REG_DWORD /d "0" /f
```
