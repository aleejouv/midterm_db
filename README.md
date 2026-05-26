# midterm_db

# Este proyecto consiste en crear una base de datos para una compañia de servicios, especificamente para la generacion de turnos

La base de datos permite gestionar:
- Usuarios
- Empleados
- Servicios
- Notificaciones
- Turnos
- Ciudades
- Tipos de usuario

  
Servicios utilizados:
-Docker desktop
-PostgreSQL
-PGAdmin4

## Despliegue de PostgreSQL

```bash
docker run --name postgres_limar \
-e POSTGRES_USER=ulimar \
-e POSTGRES_PASSWORD=ex4men_db \
-p 5432:5432 \
-d postgres:14
