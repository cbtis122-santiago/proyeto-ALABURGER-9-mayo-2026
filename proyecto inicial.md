1. users — Usuarios / Clientes
Colección: users/{uid}
#AtributoTipoDescripción1uidStringID único de Firebase Auth2displayNameStringNombre completo del cliente3emailStringCorreo electrónico4phoneString?Teléfono (opcional)5photoUrlString?URL foto de perfil6roleString'customer' o 'admin'7addressesList<String>Direcciones guardadas8createdAtTimestampFecha de registro9lastLoginTimestamp?Último acceso

2. categories — Categorías del Menú
Colección: menu/categories/{categoryId}
#AtributoTipoDescripción1idStringAuto-ID Firestore2nameStringEj: "Burgers", "Combos", "Bebidas"3imageUrlStringURL imagen representativa4displayOrderIntegerOrden de aparición en pantalla5isActiveBooleanVisible o no en el menú

3. menu_items — Productos del Menú
Colección: menu/items/{itemId}
#AtributoTipoDescripción1idStringAuto-ID Firestore2categoryIdStringReferencia a categoría (FK)3nameStringNombre del producto4descriptionStringDescripción del platillo5priceDoublePrecio en MXN6imageUrlStringURL imagen del producto7tagsList<String>['bestseller','spicy','nuevo']8isAvailableBooleanDisponible para ordenar9ratingDoubleCalificación promedio (0.0–5.0)10caloriesIntegerCalorías del producto

4. cart_items — Carrito de Compra (en memoria — Provider)
No persiste en Firestore — vive en CartProvider (RAM)
#AtributoTipoDescripción1productMenuItemModelSnapshot completo del producto2quantityIntegerCantidad seleccionada3specialRequestString?Ej: "Sin cebolla, extra queso"4subtotalDoubleprice × quantity (calculado)

5. orders — Pedidos
Colección: orders/{orderId}
#AtributoTipoDescripción1idStringAuto-ID Firestore2userIdStringUID del cliente (FK → users)3itemsList<CartItemModel>Snapshot de productos ordenados4subtotalDoubleMonto sin impuestos5taxDoubleIVA 16%6totalDoubleTotal final a pagar7statusStringpending · preparing · ready · delivered · cancelled8paymentMethodString'efectivo' o 'tarjeta'9deliveryAddressString?Dirección si es a domicilio10notesString?Notas especiales del pedido11createdAtTimestampFecha y hora del pedido12updatedAtTimestamp?Última actualización de estado

6. order_items — Detalle de Productos por Pedido (sub-colección)
Colección: orders/{orderId}/order_items/{itemId}
#AtributoTipoDescripción1idStringAuto-ID2orderIdStringReferencia al pedido padre3productIdStringID del producto (FK → menu_items)4productNameStringSnapshot nombre al momento de compra5productPriceDoubleSnapshot precio al momento de compra6quantityIntegerUnidades pedidas7specialRequestString?Instrucciones especiales8subtotalDoubleproductPrice × quantity

7. ratings — Calificaciones de Productos
Colección: ratings/{ratingId}
#AtributoTipoDescripción1idStringAuto-ID Firestore2userIdStringUID del cliente (FK → users)3productIdStringID del producto calificado (FK → menu_items)4orderIdStringPedido relacionado (FK → orders)5scoreIntegerPuntuación del 1 al 56commentString?Comentario opcional7createdAtTimestampFecha de la calificación

8. promotions — Promociones y Descuentos
Colección: promotions/{promoId}
#AtributoTipoDescripción1idStringAuto-ID Firestore2titleStringNombre de la promo — "2×1 Jueves"3descriptionStringDescripción de la oferta4discountTypeString'percentage' o 'fixed'5discountValueDoubleEj: 15.0 = 15% o $15 MXN6minOrderAmountDouble?Monto mínimo para aplicar7applicableItemsList<String>?IDs de productos aplicables8startDateTimestampInicio de vigencia9endDateTimestampFin de vigencia10isActiveBooleanPromoción activa o no

9. notifications — Notificaciones del Sistema
Colección: notifications/{notificationId}
#AtributoTipoDescripción1idStringAuto-ID Firestore2userIdStringUID destinatario (FK → users)3titleStringTítulo de la notificación4messageStringCuerpo del mensaje5typeString'order_update' · 'promo' · 'system'6isReadBooleanLeída o no por el usuario7relatedOrderIdString?Pedido relacionado (si aplica)8createdAtTimestampFecha de creación

10. business_info — Información del Negocio
Colección: business_info/{infoId}   ← Documento único "alaburger"
#AtributoTipoDescripción1idString'alaburger' (documento fijo)2nameString"ALABURGER AL CARBÓN"3taglineString"Hungry? Fire Up ALABURGER."4addressStringAv. Ejército Nacional frente a Smart Satélite5phoneStringTeléfono de contacto6emailStringCorreo de contacto7openingHoursMap<String,String>Horarios por día8isOpenBooleanAbierto / cerrado en tiempo real9logoUrlStringURL del logo oficial10socialLinksMap<String,String>Instagram, Facebook, TikTok11locationGeoPointCoordenadas GPS del local12updatedAtTimestampÚltima actualización

Resumen de Entidades
#EntidadColección FirestorePersistencia1Usuariosusers/{uid}☁️ Firestore2Categoríasmenu/categories/{id}☁️ Firestore3Productos del Menúmenu/items/{id}☁️ Firestore4Carrito de Compra— Provider —💾 RAM5Pedidosorders/{id}☁️ Firestore6Detalle de Pedidoorders/{id}/order_items/{id}☁️ Firestore7Calificacionesratings/{id}☁️ Firestore8Promocionespromotions/{id}☁️ Firestore9Notificacionesnotifications/{id}☁️ Firestore10Info del Negociobusiness_info/alaburger☁️ Firestore
