---
description: Sunucu güvenlik denetimi ve sertleştirme — Kastell MCP araçlarıyla 413 kontrol, 29 kategori, CIS/PCI-DSS/HIPAA uyumluluk
---

# Sunucu Güvenlik Denetimi

## Amaç

Production sunucularını kapsamlı güvenlik denetimine alın, zafiyetleri tespit edin ve otomatik sertleştirme uygulayın. Kastell MCP araçlarıyla tam yaşam döngüsü yönetimi.

**Kategori**: Yazılım Geliştirme / DevOps

## Girdiler

### Zorunlu

- **Sunucu**: Denetlenecek sunucu adı veya IP adresi
- **Kastell Plugin**: `claude plugins add kastell` ile kurulmuş olmalı

### Opsiyonel

- **Uyumluluk Framework'ü**: cis-level1, cis-level2, pci-dss, hipaa
- **Çıktı Formatı**: summary, json, score

## Süreç

### 1. Güvenlik Denetimi

413 kontrol, 29 kategori ile tarama çalıştır:

- SSH, Firewall, Docker, TLS, HTTP Headers
- Network, Auth, Crypto, Kernel, Memory
- File Integrity, Malware, MAC, Secrets
- Cloud Metadata, Supply Chain, DNS Security

### 2. Güvenlik Alanı Analizi

Sonuçları 5 güvenlik alanına göre grupla:

| Alan | Kapsam |
|------|--------|
| Çevre | Ağ, Güvenlik Duvarı, DNS |
| Kimlik | SSH, Auth, Kripto, Hesaplar |
| Çalışma Zamanı | Docker, Servisler, Boot |
| İç Yapı | Dosya Sistemi, Kernel, Bellek |
| Uyumluluk | TLS, Headers, Güncellemeler |

### 3. Sertleştirme

19 adımlı production hardening:

- SSH key-only auth + fail2ban
- UFW firewall + sysctl
- auditd + AIDE bütünlük kontrolü
- Docker daemon hardening
- Unattended upgrades

### 4. Doğrulama

Sertleştirme sonrası tekrar denetim çalıştırarak skor iyileşmesini doğrula.

## Kalite Kontrol

- [ ] Denetim 29 kategorinin tamamını kapsıyor mu?
- [ ] Kritik bulgular (severity: critical) hemen ele alındı mı?
- [ ] Sertleştirme dry-run ile önizlendi mi?
- [ ] Doğrulama denetimi skor artışı gösteriyor mu?
- [ ] Uyumluluk gereksinimleri (varsa) karşılandı mı?

## Araçlar

[Kastell](https://kastell.dev) — 13 MCP aracı: server_audit, server_lock, server_secure, server_doctor, server_fleet, server_info, server_logs, server_guard, server_evidence, server_backup, server_provision, server_manage, server_maintain.
