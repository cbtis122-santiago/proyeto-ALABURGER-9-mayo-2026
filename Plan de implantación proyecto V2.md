PROMPT PROFESIONAL COMPLETO

PROYECTO: ALABURGER AL CARBÓN — Aplicación Multiplataforma de Pedidos
FRAMEWORK: Flutter (Dart) | Firebase (Auth + Firestore) | Provider | Antigravity IDE
PLATAFORMAS TARGET: Android · iOS · Web · Windows
MODO: Desarrollo (NO producción — usar Firebase Emulator Suite para testing local)

◼ IDENTIDAD DE MARCA & DESIGN SYSTEM
Filosofía Visual

"Rústico. Intenso. Vivo."
La UI debe evocar una parrilla encendida: brasas que respiran, humo suave,
metal caliente y madera quemada. Minimalismo dark con detalles de fuego.
Anti-genérico. Cero Material Design de caja. 100% ALABURGER.

Frase de Marca
"Hungry? Fire Up ALABURGER."
(Tagline secundario: "Al carbón. Sin pretextos.")
Paleta de Colores — Tokens de Diseño
dart// lib/core/theme/app_colors.dart

class AppColors {
  // 🔥 PRIMARIOS — Fuego & Brasa
  static const Color emberCore      = Color(0xFFFF4500); // OrangeRed — CTA principal
  static const Color flameCrest     = Color(0xFFFF6B2B); // Naranja llama — hover/active
  static const Color coalBlack      = Color(0xFF0D0D0D); // Negro carbón — fondo base
  static const Color ashDark        = Color(0xFF1A1A1A); // Gris carbón — superficies
  static const Color charcoalSurface= Color(0xFF242424); // Cards / bottom sheets
  static const Color ironGray       = Color(0xFF3A3A3A); // Bordes / dividers

  // 💡 SECUNDARIOS — Calor & Resplandor
  static const Color goldenEmber    = Color(0xFFFFAB40); // Ámbar — badges, ratings
  static const Color smokeCream     = Color(0xFFF5ECD7); // Crema humo — texto cuerpo
  static const Color ashWhite       = Color(0xFFFFFFFF); // Blanco — texto headings
  static const Color deepRuby       = Color(0xFF8B0000); // Rojo oscuro — alertas

  // ✅ ESTADOS
  static const Color successGreen   = Color(0xFF4CAF50);
  static const Color errorRed       = Color(0xFFCF6679);
  static const Color warningAmber   = Color(0xFFFFB300);

  // 🌑 GRADIENTES — Firma Visual de ALABURGER
  static const LinearGradient fireGradient = LinearGradient(
    colors: [coalBlack, Color(0xFF3D0000), emberCore],
    stops: [0.0, 0.55, 1.0],
    begin: Alignment.bottomCenter,
    end: Alignment.topRight,
  );

  static const LinearGradient cardGlow = LinearGradient(
    colors: [charcoalSurface, ashDark],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const RadialGradient emberGlow = RadialGradient(
    colors: [Color(0x66FF4500), Colors.transparent],
    radius: 0.85,
  );
}
Tipografía
dart// Google Fonts — Combinación forzada e industrial
primaryFont  : 'Bebas Neue'     // Headings — impacto brutal
secondaryFont: 'Inter'          // Body, labels — legibilidad premium
accentFont   : 'Oswald'         // Precios, badges, contadores
Animaciones & Efectos (Flutter Animate / Lottie)
- Splash: llama animada Lottie (fire loop) + logo fade-in con shimmer
- Product Cards: entrada slide-up + glow pulsante en ember al hover
- CTA Button: ripple naranja + micro-bounce al press
- Cart badge: scale pop al agregar item
- Loading states: skeleton shimmer en tono carbón
- Transiciones de pantalla: fade + slide horizontal suave (300ms ease-out)
- Bottom nav: ink-bar animado color ember
- Precio: counter roll-up animation al cambiar cantidad
Sombras & Glows — Firma ALABURGER
dart// Sombra tipo "brasa encendida" para cards destacadas
BoxShadow emberShadow = BoxShadow(
  color: Color(0x55FF4500),
  blurRadius: 24,
  spreadRadius: 2,
  offset: Offset(0, 6),
);

// Glow sutil para botones primarios
BoxShadow buttonGlow = BoxShadow(
  color: Color(0x99FF6B2B),
  blurRadius: 18,
  spreadRadius: -2,
  offset: Offset(0, 4),
);

◼ ARQUITECTURA DEL PROYECTO
Stack Tecnológico
Flutter SDK   : ≥ 3.22 stable
Dart          : ≥ 3.4
Firebase      : Auth (Email/Password) + Cloud Firestore
Estado        : Provider (ChangeNotifier pattern)
Navegación    : go_router (guards de autenticación)
IDE           : Antigravity / VS Code
Modo Firebase : Desarrollo — NO habilitar opciones de producción
                  (no Crashlytics, no Analytics, no Performance Monitoring)
Estructura de Carpetas — Feature-First + Layered
lib/
│
├── core/
│   ├── theme/
│   │   ├── app_colors.dart          ← Tokens de color ALABURGER
│   │   ├── app_text_styles.dart     ← Tipografía Bebas Neue / Inter
│   │   ├── app_theme.dart           ← ThemeData dark customizado
│   │   └── app_shadows.dart         ← Ember glows y sombras
│   ├── constants/
│   │   ├── app_strings.dart         ← Textos y mensajes UI
│   │   ├── app_assets.dart          ← Rutas de assets / Lottie
│   │   └── app_routes.dart          ← Nombres de rutas go_router
│   └── utils/
│       ├── validators.dart          ← Email, password, phone
│       ├── formatters.dart          ← Moneda MXN, fechas
│       └── extensions.dart          ← String/Color extensions
│
├── data/
│   ├── models/
│   │   ├── user_model.dart
│   │   ├── category_model.dart
│   │   ├── menu_item_model.dart
│   │   ├── cart_item_model.dart
│   │   └── order_model.dart
│   └── services/
│       ├── auth_service.dart        ← Firebase Auth (email/password)
│       └── firestore_service.dart   ← CRUD Firestore (no Analytics)
│
├── providers/
│   ├── auth_provider.dart           ← Session, login, register, logout
│   ├── menu_provider.dart           ← Categorías + items del menú
│   ├── cart_provider.dart           ← Carrito, totales, cantidades
│   └── order_provider.dart          ← Historial y estado de pedidos
│
├── ui/
│   ├── screens/
│   │   ├── splash/
│   │   │   └── splash_screen.dart   ← Lottie fire + logo ALABURGER
│   │   ├── auth/
│   │   │   ├── login_screen.dart
│   │   │   └── register_screen.dart
│   │   ├── home/
│   │   │   ├── home_screen.dart     ← Shell con BottomNavBar
│   │   │   └── menu_tab.dart        ← Catálogo de productos
│   │   ├── product/
│   │   │   └── product_detail_screen.dart
│   │   ├── cart/
│   │   │   └── cart_screen.dart
│   │   ├── orders/
│   │   │   └── orders_history_screen.dart
│   │   └── profile/
│   │       └── profile_screen.dart
│   │
│   └── widgets/
│       ├── shared/
│       │   ├── alaburger_button.dart     ← CTA con ember glow
│       │   ├── alaburger_app_bar.dart
│       │   ├── fire_loading_widget.dart  ← Skeleton carbón
│       │   └── ember_badge.dart          ← Contador carrito
│       ├── menu/
│       │   ├── product_card.dart         ← Card con sombra brasa
│       │   └── category_chip.dart
│       └── cart/
│           └── cart_tile.dart
│
└── main.dart                            ← MultiProvider + Firebase init

◼ PUBSPEC.YAML — DEPENDENCIAS ESTÁNDAR (SIN PRODUCCIÓN)
yamlname: alaburger
description: ALABURGER AL CARBÓN — App de pedidos multiplataforma
publish_to: 'none'
version: 1.0.0+1

environment:
  sdk: '>=3.4.0 <4.0.0'

dependencies:
  flutter:
    sdk: flutter

  # ── ESTADO ──────────────────────────────────────
  provider: ^6.1.2

  # ── FIREBASE (Sin Analytics / Sin Producción) ───
  firebase_core: ^3.2.0
  firebase_auth: ^5.1.0
  cloud_firestore: ^5.2.0

  # ── NAVEGACIÓN ──────────────────────────────────
  go_router: ^14.2.0

  # ── UI & DISEÑO ─────────────────────────────────
  google_fonts: ^6.2.1
  cached_network_image: ^3.3.1
  lottie: ^3.1.0             # Animaciones fuego / splash
  flutter_animate: ^4.5.0    # Micro-animaciones UI
  shimmer: ^3.0.0            # Loading skeleton carbón

  # ── UTILIDADES ──────────────────────────────────
  intl: ^0.19.0              # Formato MXN / fechas
  uuid: ^4.4.0               # IDs únicos para órdenes
  equatable: ^2.0.5          # Comparación de modelos

dev_dependencies:
  flutter_test:
    sdk: flutter
  flutter_lints: ^4.0.0
  mockito: ^5.4.4
  build_runner: ^2.4.9

flutter:
  uses-material-design: true
  assets:
    - assets/images/
    - assets/lottie/
    - assets/icons/
  fonts:
    - family: BebasNeue
      fonts:
        - asset: assets/fonts/BebasNeue-Regular.ttf
    - family: Oswald
      fonts:
        - asset: assets/fonts/Oswald-Regular.ttf
        - asset: assets/fonts/Oswald-Bold.ttf
          weight: 700

◼ MODELOS DE DATOS — FIRESTORE SCHEMA
Colección: users/{uid}
dartclass UserModel {
  final String uid;           // Firebase Auth UID
  final String displayName;   // Nombre completo
  final String email;         // Correo electrónico
  final String? phone;        // Teléfono (opcional)
  final String? photoUrl;     // Avatar URL
  final String role;          // 'customer' | 'admin'
  final List<String> addresses; // Direcciones guardadas
  final DateTime createdAt;   // Timestamp registro
  final DateTime? lastLogin;  // Último acceso
}
Colección: menu/categories/{categoryId}
dartclass CategoryModel {
  final String id;            // Auto-ID Firestore
  final String name;          // "Burgers", "Combos", "Bebidas"
  final String imageUrl;      // URL imagen categoría
  final int displayOrder;     // Orden en pantalla
  final bool isActive;        // Visibilidad en menú
}
Colección: menu/items/{itemId}
dartclass MenuItemModel {
  final String id;            // Auto-ID Firestore
  final String categoryId;    // Referencia categoría
  final String name;          // "ALABURGER Classic"
  final String description;   // "Carne angus al carbón, ..."
  final double price;         // Precio en MXN
  final String imageUrl;      // URL imagen del producto
  final List<String> tags;    // ['bestseller','spicy','nuevo']
  final bool isAvailable;     // Disponible para pedido
  final double rating;        // Promedio de calificación
  final int calories;         // Info nutricional
}
Colección: orders/{orderId}
dartclass OrderModel {
  final String id;              // Auto-ID Firestore
  final String userId;          // UID del cliente
  final List<CartItemModel> items; // Snapshot de productos
  final double subtotal;        // Subtotal sin impuestos
  final double tax;             // IVA (16%)
  final double total;           // Total a pagar
  final String status;          // 'pending'|'preparing'|
                                //  'ready'|'delivered'|'cancelled'
  final String paymentMethod;   // 'efectivo'|'tarjeta'
  final String? deliveryAddress;// Dirección (si aplica)
  final String? notes;          // Notas especiales del pedido
  final DateTime createdAt;     // Timestamp del pedido
  final DateTime? updatedAt;    // Última actualización
}
Modelo: CartItem (en memoria — Provider)
dartclass CartItemModel {
  final MenuItemModel product;  // Snapshot del producto
  int quantity;                 // Cantidad solicitada
  final String? specialRequest; // "Sin cebolla", etc.
  
  double get subtotal => product.price * quantity;
}

◼ FIRESTORE SECURITY RULES (MODO DESARROLLO)
javascriptrules_version = '2';
service cloud.firestore {
  match /databases/{database}/documents {

    // Menú — lectura pública, escritura solo autenticados (admin futuro)
    match /menu/{document=**} {
      allow read: if true;
      allow write: if request.auth != null;
    }

    // Usuarios — solo el propio usuario accede a su documento
    match /users/{userId} {
      allow read, write: if request.auth != null
                         && request.auth.uid == userId;
    }

    // Órdenes — usuario solo ve/crea sus propias órdenes
    match /orders/{orderId} {
      allow read: if request.auth != null
                  && resource.data.userId == request.auth.uid;
      allow create: if request.auth != null
                    && request.resource.data.userId == request.auth.uid;
      allow update: if request.auth != null
                    && resource.data.userId == request.auth.uid;
    }
  }
}

◼ CONFIGURACIÓN MAIN.DART
dart// lib/main.dart
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart'; // Generado por flutterfire configure

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Firebase init — modo ESTÁNDAR (sin Analytics, sin Crashlytics)
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(
    MultiProvider(
      providers: [
        // Servicios base
        Provider<AuthService>(create: (_) => AuthService()),
        Provider<FirestoreService>(create: (_) => FirestoreService()),

        // Providers de estado
        ChangeNotifierProvider(create: (_) => AuthProvider()),
        ChangeNotifierProvider(create: (_) => MenuProvider()),
        ChangeNotifierProvider(create: (_) => CartProvider()),
        ChangeNotifierProvider(create: (_) => OrderProvider()),
      ],
      child: const AlaBurgerApp(),
    ),
  );
}

class AlaBurgerApp extends StatelessWidget {
  const AlaBurgerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'ALABURGER',
      debugShowCheckedModeBanner: false,   // ← Sin banner DEV
      themeMode: ThemeMode.dark,
      darkTheme: AppTheme.darkTheme,       // Tema carbón custom
      routerConfig: AppRouter.router,      // go_router con auth guards
    );
  }
}

◼ FLUJO DE PANTALLAS & NAVEGACIÓN
[SplashScreen]  ──── Firebase init + auth check ────►
                          │
              ┌───────────┴───────────┐
              ▼                       ▼
        [LoginScreen]          [HomeScreen]
        [RegisterScreen]    (usuario autenticado)
              │                       │
              └──── Auth success ─────►
                                      │
                        ┌─────────────┼─────────────┐
                        ▼             ▼              ▼
                  [MenuTab]     [OrdersTab]    [ProfileTab]
                      │
              ┌───────┴────────┐
              ▼                ▼
      [ProductDetail]    [CartScreen]
                               │
                               ▼
                        [CheckoutConfirm]
                               │
                               ▼
                        [OrderSuccess] ─► [HomeScreen]

◼ INFORMACIÓN DEL NEGOCIO — CONTENIDO BASE
NEGOCIO        : ALABURGER AL CARBÓN
CATEGORÍA      : Restaurante de comida rápida / Hamburguesería artesanal
UBICACIÓN      : Av. Ejército Nacional, frente a Smart Satélite
                 Ciudad Juárez, Chihuahua, México
TAGLINE OFICIAL: "Hungry? Fire Up ALABURGER."
TAGLINE ALT    : "Al carbón. Sin pretextos."
CONCEPTO       : Hamburguesas artesanales a las brasas, carne premium,
                 sabor intenso, experiencia de asador urbano
HORARIO SUGERIDO: Lun–Dom 12:00 – 23:00
COLORES MARCA  : Naranja brasa (#FF4500) · Negro carbón (#0D0D0D)
                 Rojo intenso (#8B0000) · Ámbar (#FFAB40)
CATEGORÍAS MENÚ: Burgers Clásicas · Burgers Especiales · Combos ·
                 Sides (papas, aros) · Bebidas · Postres de temporada

◼ FASES DE IMPLEMENTACIÓN (8 SEMANAS — MVP)
SEMANA 1 ── Setup & Fundamentos
  · flutter create alaburger
  · flutterfire configure (Auth + Firestore — modo estándar)
  · Estructura de carpetas completa
  · AppColors, AppTheme dark, AppTextStyles
  · Fuentes locales (Bebas Neue, Oswald, Inter via google_fonts)
  · Assets: logo, íconos, placeholder Lottie fuego

SEMANA 2 ── Autenticación Completa
  · AuthService (signIn, signUp, signOut, authStateChanges)
  · AuthProvider con ChangeNotifier
  · SplashScreen con Lottie fire animation
  · LoginScreen + RegisterScreen con validaciones
  · go_router guards (redirect si no autenticado)
  · Manejo de errores Firebase con mensajes en español

SEMANA 3 ── Menú & Catálogo
  · FirestoreService — lectura de categorías e items
  · MenuProvider (stream de datos)
  · HomeScreen shell + BottomNavBar animado
  · ProductCard con ember shadow y cached_network_image
  · CategoryChip horizontal scroll
  · Estados: loading (shimmer carbón) · empty · error

SEMANA 4 ── Carrito & Pedidos
  · CartProvider (add, remove, updateQty, clear)
  · CartScreen con slide-to-delete
  · ProductDetailScreen con animación hero
  · OrderModel + FirestoreService.createOrder()
  · OrderProvider (historial por usuario)
  · CheckoutScreen (simulado — sin pasarela de pago)

SEMANA 5 ── Perfil & Configuración
  · ProfileScreen con datos del usuario
  · Edición de nombre y teléfono → sync Firestore
  · OrderHistoryScreen con estados de pedido
  · Cerrar sesión con confirmación

SEMANA 6 ── Animaciones & Pulido Visual
  · flutter_animate en todas las entradas de pantalla
  · Lottie splash final + transición a Home
  · Ember glow animado en cards destacadas
  · Fire badge pulsante en carrito (cart count)
  · Smoke texture sutil en fondos (ShaderMask o Stack)
  · Micro-interacciones en botones y chips

SEMANA 7 ── Testing & Calidad
  · Unit tests: AuthProvider, CartProvider, validators
  · Widget tests: ProductCard, AuthForm, CartTile
  · Integration test: flujo Login → Menú → Cart → Order
  · dart analyze sin warnings
  · flutter pub audit (seguridad dependencias)

SEMANA 8 ── Build Multiplataforma & Entrega
  · Android: flutter build apk --release
  · iOS: flutter build ipa (requiere Mac + Apple Dev Account)
  · Web: flutter build web → Firebase Hosting
  · Windows: flutter build windows --release
  · Íconos personalizados con flutter_launcher_icons
  · Splash nativo con flutter_native_splash
  · README.md + documentación técnica

◼ COMANDOS DE SETUP (EN ORDEN)
bash# 1. Crear proyecto Flutter
flutter create alaburger --platforms=android,ios,web,windows
cd alaburger

# 2. Instalar Firebase CLI y configurar
npm install -g firebase-tools
firebase login
dart pub global activate flutterfire_cli

# 3. Conectar Firebase (Auth + Firestore SOLO — sin Analytics)
flutterfire configure \
  --project=alaburger-dev \
  --platforms=android,ios,web,windows \
  --no-apply-gradle-plugins   # configurar manualmente para control

# 4. Instalar dependencias
flutter pub get

# 5. Generar código (si se usa build_runner)
dart run build_runner build --delete-conflicting-outputs

# 6. Verificar entorno
flutter doctor -v

◼ NOTAS CRÍTICAS DE IMPLEMENTACIÓN
✅ HACER
   · Usar Firebase Emulator Suite para desarrollo local
   · Streams de Firestore en lugar de Future one-time reads (menú en vivo)
   · Manejar TODOS los errores de Firebase con catch tipado
   · Formato de precios en MXN usando NumberFormat.currency(locale: 'es_MX')
   · Loading states explícitos en cada operación async
   · Dispose correcto de StreamSubscriptions en Providers

❌ NO HACER  
   · NO habilitar Firebase Analytics
   · NO habilitar Crashlytics (modo desarrollo)
   · NO usar setState en pantallas con Provider disponible
   · NO hardcodear UIDs o colecciones como strings sueltos
     (usar constantes en app_strings.dart)
   · NO ignorar los errores de FirebaseException
   · NO hacer llamadas a Firestore directamente desde la UI
     (siempre pasar por Service → Provider → UI)

FIN DEL PROMPT — ALABURGER AL CARBÓN
Framework: Flutter · Firebase · Provider · Antigravity
Plataformas: Android · iOS · Web · Windows
Modo: Desarrollo Estándar
