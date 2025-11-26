# Modulo1_Corte3
# 🚀 Acortador de URLs con AWS, Terraform y CI/CD

Este proyecto implementa un sistema completo de acortamiento de URLs dividido en **5 módulos independientes**, cada uno con su propio pipeline y recursos en AWS, todos conectados mediante una tabla DynamoDB compartida.

---

# 📦 Arquitectura del Proyecto

Módulo 1 ───> DynamoDB <─── Módulo 2
│ │

└──────────────> Módulo 3
│
Módulo 4 (Frontend Stats)
Módulo 5 (Frontend Acortador)


Todos los módulos despliegan por separado usando **Terraform + GitHub Actions**, pero comparten la misma tabla.

---

# 🟦 Módulo 1 — Servicio de Acortamiento  
**Endpoint:** `POST /shorten`  
Genera un código único y almacena la información en DynamoDB.

### Tecnologías
- AWS Lambda
- API Gateway
- DynamoDB (compartido)
- Terraform
- GitHub Actions

### Funcionalidad
- Recibe una URL original
- Genera un shortcode
- Guarda en DynamoDB:
  - `code`
  - `originalUrl`
  - `createdAt`
- Devuelve:
```json
{
  "shortUrl": "http://localhost/HS3_jT",
  "code": "HS3_jT",
  "originalUrl": "https://ejemplo.com"
}
