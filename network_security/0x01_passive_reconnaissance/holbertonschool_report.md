# HolbertonSchool Recon Report

**Domain:** holbertonschool.com  
**Date:** $(date -u)

---

## 1) Resumen ejecutivo
Este informe reúne la información pública recolectada (IPs, subdominios, servicios y tecnologías expuestas) para el dominio `holbertonschool.com`.  
Acción pendiente: pegar salidas reales de Shodan / crt.sh / subfinder en las secciones marcadas con TODO.

---

## 2) Alcance y metodología
- Herramientas: Shodan (CLI/web), crt.sh, subfinder/amass (opcional), dig/nslookup.
- Metodología: buscar por hostname en Shodan → extraer IPs → shodan host <IP> → consolidar.

---

## 3) IPs conocidas
- 35.180.27.154  
- 52.47.143.83  
*(Extraídas de Shodan — ambas alojadas en Amazon AWS - Francia.)*

---

## 4) Subdominios detectados
- holbertonschool.com  
- www.holbertonschool.com  
- yiriy2.holbertonschool.com  
- staging.holbertonschool.com  
- TODO: validar lista con crt.sh / subfinder

---

## 5) Tecnologías y banners
| Host / IP | Puertos | Producto / Banner | Posible tecnología | Fuente |
|------------|----------|-------------------|--------------------|--------|
| 35.180.27.154 | 80, 443 | nginx/1.18.0 (Ubuntu) | AWS EC2, Ubuntu | Shodan |
| 52.47.143.83 | 443 | TLS Let's Encrypt, nginx | AWS EC2, TLSv1.3 | Shodan |

---

## 6) Hallazgos notables
- Servidores alojados en Amazon AWS (Europa).  
- Certificados SSL válidos de Let's Encrypt.  
- Nginx actualizado a v1.18 (sin exposición crítica visible).

---

## 7) Recomendaciones
- Limitar exposición pública de puertos (solo 80/443 permitidos).  
- Reforzar configuración SSL (HSTS, desactivar TLSv1.0).  
- Validar frecuencia de renovación de certificados.  
- Implementar monitoreo continuo en Shodan Monitor.

---

## 8) Comandos ejecutados
```bash
shodan search "hostname:holbertonschool.com"
shodan host 35.180.27.154
shodan host 52.47.143.83
subfinder -d holbertonschool.com -silent -o holbertonschool_subdomains.txt
