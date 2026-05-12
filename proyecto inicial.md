Como administrador de base de datos, aquí están las entidades clave para un sistema de renta de carros, junto con un diagrama ER:Las entidades centrales del sistema son:
<img width="692" height="757" alt="image" src="https://github.com/user-attachments/assets/6f2849c4-5d68-4853-8b5d-225dc38376c0" />

**Núcleo del negocio:**

`RENTA` es la entidad pivote del sistema — conecta al cliente, el vehículo, la sucursal y el empleado. Tiene estado (activa, finalizada, cancelada) y distingue entre la fecha de devolución prevista y la real para calcular cargos por demora.

`VEHICULO` lleva el estado operativo del auto (disponible, rentado, en mantenimiento) y está vinculado a una categoría y a su sucursal base.

`CLIENTE` guarda el número de licencia de conducir, que es el campo crítico para validaciones legales.

**Soporte operativo:**

`CATEGORIA` define las tarifas por tipo de vehículo (compacto, SUV, lujo, etc.) — esto evita hardcodear precios en el vehículo.

`INSPECCION` registra el estado del auto antes y después de cada renta (tipo: "salida" / "retorno"), incluyendo combustible y kilometraje para detectar daños y cobros adicionales.

`PAGO` está separada de `RENTA` para soportar pagos parciales, anticipos y reembolsos.

`SUCURSAL` y `EMPLEADO` permiten rastrear en qué oficina se generó la renta y quién la atendió, útil para reportes de desempeño.

**Tablas que se pueden añadir según el alcance del proyecto:** `MANTENIMIENTO` del vehículo, `TARIFA_ADICIONAL` (seguro, GPS, silla infantil), `MULTA` por infracciones, y `RESERVA` si se necesita gestionar disponibilidad con anticipación. ¿Quieres que profundice en alguna de estas?
