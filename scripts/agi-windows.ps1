# AgiSiberShield Advanced Windows Security Script

Write-Host "🔒 Applying advanced security settings for Windows..."

# Disable legacy protocols
Set-SmbServerConfiguration -EnableSMB1Protocol $false -Force

# Enforce strong password policy
secedit /export /cfg C:\security-policy.inf
(Get-Content C:\security-policy.inf).replace("MinimumPasswordLength = 8", "MinimumPasswordLength = 12") | Set-Content C:\security-policy.inf
secedit /configure /db secedit.sdb /cfg C:\security-policy.inf /areas SECURITYPOLICY

# Enable Windows Defender real-time protection
Set-MpPreference -DisableRealtimeMonitoring $false

# Disable RDP for security
Set-ItemProperty -Path 'HKLM:\System\CurrentControlSet\Control\Terminal Server' -Name 'fDenyTSConnections' -Value 1

Write-Host "✅ Windows hardening completed!"
