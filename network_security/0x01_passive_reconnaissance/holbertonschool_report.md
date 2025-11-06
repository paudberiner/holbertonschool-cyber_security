# HolbertonSchool Report

**Domain:** holbertonschool.com  
---

## IPs conocidas
- 35.180.27.154  
- 52.47.143.83  
*(Extraídas de Shodan — ambas alojadas en Amazon AWS - Francia.)*

---

## Subdominios
- holbertonschool.com  
- www.holbertonschool.com  
- yiriy2.holbertonschool.com  
- staging.holbertonschool.com  


---

## Fuente
| Host / IP | Puertos | Producto / Banner | Posible tecnología | Fuente |
|------------|----------|-------------------|--------------------|--------|
| 35.180.27.154 | 80, 443 | nginx/1.18.0 (Ubuntu) | AWS EC2, Ubuntu | Shodan |
| 52.47.143.83 | 443 | TLS Let's Encrypt, nginx | AWS EC2, TLSv1.3 | Shodan |

---

## Findings
- Servidores alojados en Amazon AWS (Europa).  
- Certificados SSL válidos de Let's Encrypt.  
- Nginx actualizado a v1.18 (sin exposición crítica visible).

---

## Recomendaciones
- Limitar exposición pública de puertos (solo 80/443 permitidos).  
- Reforzar configuración SSL (HSTS, desactivar TLSv1.0).  
- Validar frecuencia de renovación de certificados.  
- Implementar monitoreo continuo en Shodan Monitor.

---

## Comandos
```bash
shodan search "hostname:holbertonschool.com"
shodan host 35.180.27.154
shodan host 52.47.143.83
subfinder -d holbertonschool.com -silent -o holbertonschool_subdomains.txt
