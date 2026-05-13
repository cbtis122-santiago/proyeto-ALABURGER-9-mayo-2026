# ALABURGER AL CARBÓN — Dependencias pubspec.yaml

---

## DEPENDENCIES (Producción)

### 🔥 CORE FLUTTER
| # | Paquete | Versión | Propósito |
|---|---------|---------|-----------|
| 1 | `flutter` | sdk: flutter | Framework base multiplataforma |
| 2 | `flutter_localizations` | sdk: flutter | Localización español (MXN, fechas) |

---

### ⚡ ESTADO — Provider
| # | Paquete | Versión | Propósito |
|---|---------|---------|-----------|
| 3 | `provider` | ^6.1.2 | Gestión de estado ChangeNotifier |
| 4 | `equatable` | ^2.0.5 | Comparación eficiente de modelos |

---

### 🔐 FIREBASE (Sin Analytics · Sin Producción)
| # | Paquete | Versión | Propósito |
|---|---------|---------|-----------|
| 5 | `firebase_core` | ^3.2.0 | Inicialización base de Firebase |
| 6 | `firebase_auth` | ^5.1.0 | Autenticación email y password |
| 7 | `cloud_firestore` | ^5.2.0 | Base de datos NoSQL en tiempo real |

---

### 🗺️ NAVEGACIÓN
| # | Paquete | Versión | Propósito |
|---|---------|---------|-----------|
| 8 | `go_router` | ^14.2.0 | Navegación declarativa con guards de auth |

---

### 🎨 UI & DISEÑO VISUAL
| # | Paquete | Versión | Propósito |
|---|---------|---------|-----------|
| 9 | `google_fonts` | ^6.2.1 | Tipografía Inter y Oswald desde CDN |
| 10 | `flutter_animate` | ^4.5.0 | Micro-animaciones y transiciones UI |
| 11 | `lottie` | ^3.1.0 | Animación fuego/llamas en Splash y Loading |
| 12 | `shimmer` | ^3.0.0 | Skeleton loader efecto carbón encendido |
| 13 | `cached_network_image` | ^3.3.1 | Carga optimizada de imágenes del menú |
| 14 | `flutter_svg` | ^2.0.10 | Iconos vectoriales SVG del branding |
| 15 | `glass_kit` | ^4.0.0 | Efecto glassmorphism en cards y overlays |
| 16 | `animate_do` | ^3.3.4 | Animaciones predefinidas fadeIn slideUp |

---

### 🛒 CARRITO & PEDIDOS
| # | Paquete | Versión | Propósito |
|---|---------|---------|-----------|
| 17 | `uuid` | ^4.4.0 | Generación de IDs únicos para órdenes |
| 18 | `collection` | ^1.18.0 | Utilidades avanzadas para listas y mapas |

---

### 💰 FORMATO & LOCALIZACIÓN
| # | Paquete | Versión | Propósito |
|---|---------|---------|-----------|
| 19 | `intl` | ^0.19.0 | Formato moneda MXN y fechas en español |

---

### 📱 EXPERIENCIA DE USUARIO
| # | Paquete | Versión | Propósito |
|---|---------|---------|-----------|
| 20 | `flutter_rating_bar` | ^4.0.1 | Estrellas de calificación en productos |
| 21 | `another_flushbar` | ^1.12.30 | Snackbars y alertas personalizadas |
| 22 | `url_launcher` | ^6.3.0 | Abrir Google Maps, WhatsApp, redes sociales |
| 23 | `share_plus` | ^10.0.0 | Compartir productos y promociones |
| 24 | `smooth_page_indicator` | ^1.1.0 | Indicadores en carruseles de banners |
| 25 | `carousel_slider` | ^5.0.0 | Carrusel de promociones y destacados |

---

### 🗺️ UBICACIÓN & MAPAS
| # | Paquete | Versión | Propósito |
|---|---------|---------|-----------|
| 26 | `geolocator` | ^13.0.0 | Obtener ubicación GPS del usuario |
| 27 | `geocoding` | ^3.0.0 | Convertir coordenadas a dirección legible |

---

### 💾 ALMACENAMIENTO LOCAL
| # | Paquete | Versión | Propósito |
|---|---------|---------|-----------|
| 28 | `shared_preferences` | ^2.3.2 | Persistir preferencias: tema, sesión, onboarding |
| 29 | `hive_flutter` | ^1.1.0 | Cache local rápido para menú offline |
| 30 | `hive` | ^2.2.3 | Motor de base de datos local NoSQL |

---

### 🔔 NOTIFICACIONES
| # | Paquete | Versión | Propósito |
|---|---------|---------|-----------|
| 31 | `flutter_local_notifications` | ^17.2.2 | Notificaciones locales de estado de pedido |

---

### 🖼️ IMÁGENES & ASSETS
| # | Paquete | Versión | Propósito |
|---|---------|---------|-----------|
| 32 | `image_picker` | ^1.1.2 | Seleccionar foto de perfil del usuario |
| 33 | `flutter_cache_manager` | ^3.4.1 | Gestión avanzada de cache de imágenes |

---

### 🌐 RED & CONECTIVIDAD
| # | Paquete | Versión | Propósito |
|---|---------|---------|-----------|
| 34 | `connectivity_plus` | ^6.0.5 | Detectar estado de red (online/offline) |
| 35 | `http` | ^1.2.2 | Peticiones HTTP para APIs externas futuras |

---

## DEV DEPENDENCIES (Solo Desarrollo)

| # | Paquete | Versión | Propósito |
|---|---------|---------|-----------|
| 36 | `flutter_test` | sdk: flutter | Testing framework oficial de Flutter |
| 37 | `flutter_lints` | ^4.0.0 | Reglas de calidad y estilo de código |
| 38 | `mockito` | ^5.4.4 | Mocks para unit testing de providers |
| 39 | `build_runner` | ^2.4.9 | Generador de código (Hive adapters, mocks) |
| 40 | `hive_generator` | ^2.0.1 | Generador de adaptadores Hive |
| 41 | `flutter_launcher_icons` | ^0.14.1 | Íconos de app personalizados ALABURGER |
| 42 | `flutter_native_splash` | ^2.4.1 | Splash screen nativo con logo y fondo negro |
| 43 | `very_good_analysis` | ^6.0.0 | Análisis estricto de calidad de código |

---

## pubspec.yaml COMPLETO

```yaml
name: alaburger
description: ALABURGER AL CARBÓN — App multiplataforma de pedidos
publish_to: 'none'
version: 1.0.0+1

environment:
  sdk: '>=3.4.0 <4.0.0'

dependencies:
  flutter:
    sdk: flutter
  flutter_localizations:
    sdk: flutter

  # ── ESTADO ──────────────────────────
  provider: ^6.1.2                   # 3
  equatable: ^2.0.5                  # 4

  # ── FIREBASE (Sin Analytics) ────────
  firebase_core: ^3.2.0              # 5
  firebase_auth: ^5.1.0              # 6
  cloud_firestore: ^5.2.0            # 7

  # ── NAVEGACIÓN ──────────────────────
  go_router: ^14.2.0                 # 8

  # ── UI & DISEÑO ─────────────────────
  google_fonts: ^6.2.1               # 9
  flutter_animate: ^4.5.0            # 10
  lottie: ^3.1.0                     # 11
  shimmer: ^3.0.0                    # 12
  cached_network_image: ^3.3.1       # 13
  flutter_svg: ^2.0.10               # 14
  glass_kit: ^4.0.0                  # 15
  animate_do: ^3.3.4                 # 16

  # ── CARRITO & PEDIDOS ───────────────
  uuid: ^4.4.0                       # 17
  collection: ^1.18.0                # 18

  # ── FORMATO & LOCALIZACIÓN ──────────
  intl: ^0.19.0                      # 19

  # ── EXPERIENCIA DE USUARIO ──────────
  flutter_rating_bar: ^4.0.1         # 20
  another_flushbar: ^1.12.30         # 21
  url_launcher: ^6.3.0               # 22
  share_plus: ^10.0.0                # 23
  smooth_page_indicator: ^1.1.0      # 24
  carousel_slider: ^5.0.0            # 25

  # ── UBICACIÓN & MAPAS ───────────────
  geolocator: ^13.0.0                # 26
  geocoding: ^3.0.0                  # 27

  # ── ALMACENAMIENTO LOCAL ────────────
  shared_preferences: ^2.3.2         # 28
  hive_flutter: ^1.1.0               # 29
  hive: ^2.2.3                       # 30

  # ── NOTIFICACIONES ──────────────────
  flutter_local_notifications: ^17.2.2  # 31

  # ── IMÁGENES & ASSETS ───────────────
  image_picker: ^1.1.2               # 32
  flutter_cache_manager: ^3.4.1      # 33

  # ── RED & CONECTIVIDAD ──────────────
  connectivity_plus: ^6.0.5          # 34
  http: ^1.2.2                       # 35

dev_dependencies:
  flutter_test:
    sdk: flutter
  flutter_lints: ^4.0.0              # 37
  mockito: ^5.4.4                    # 38
  build_runner: ^2.4.9               # 39
  hive_generator: ^2.0.1             # 40
  flutter_launcher_icons: ^0.14.1    # 41
  flutter_native_splash: ^2.4.1      # 42
  very_good_analysis: ^6.0.0         # 43

flutter:
  uses-material-design: true
  generate: true

  assets:
    - assets/images/
    - assets/lottie/
    - assets/icons/
    - assets/fonts/

  fonts:
    - family: BebasNeue
      fonts:
        - asset: assets/fonts/BebasNeue-Regular.ttf
    - family: Oswald
      fonts:
        - asset: assets/fonts/Oswald-Regular.ttf
        - asset: assets/fonts/Oswald-Bold.ttf
          weight: 700
```

---

## Resumen por Categoría

| Categoría | Cantidad |
|-----------|----------|
| Core Flutter | 2 |
| Estado (Provider) | 2 |
| Firebase | 3 |
| Navegación | 1 |
| UI & Diseño Visual | 8 |
| Carrito & Pedidos | 2 |
| Formato & Localización | 1 |
| Experiencia de Usuario | 6 |
| Ubicación & Mapas | 2 |
| Almacenamiento Local | 3 |
| Notificaciones | 1 |
| Imágenes & Assets | 2 |
| Red & Conectividad | 2 |
| **Dev Dependencies** | **8** |
| **TOTAL** | **43** |
