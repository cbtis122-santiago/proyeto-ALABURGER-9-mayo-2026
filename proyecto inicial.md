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

<img width="720" height="393" alt="image" src="https://github.com/user-attachments/assets/c4c9f105-65e6-4599-b60f-8626b3714ba8" />
<img width="724" height="458" alt="image" src="https://github.com/user-attachments/assets/749db2e0-b96b-4482-a04d-c55d478bf6ab" />
<img width="727" height="266" alt="image" src="https://github.com/user-attachments/assets/6a60ab09-3a03-492d-af5d-c036533c08a1" />
<img width="728" height="455" alt="image" src="https://github.com/user-attachments/assets/5c1decbd-08d1-4c56-a436-8c0a460335d9" />
<img width="727" height="329" alt="image" src="https://github.com/user-attachments/assets/a410d1d1-115f-47d0-896d-3b637bf03d8f" />
<img width="731" height="359" alt="image" src="https://github.com/user-attachments/assets/4caa8dc1-043a-41e7-a674-290ed7b8219a" />
<img width="726" height="330" alt="image" src="https://github.com/user-attachments/assets/fe25be98-84b6-4493-ac23-508ddaedc723" />
<img width="726" height="358" alt="image" src="https://github.com/user-attachments/assets/c1c2d4c3-48d0-4093-94f4-0fa74b8736de" />
