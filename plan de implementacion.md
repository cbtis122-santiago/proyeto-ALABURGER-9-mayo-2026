# 📋 Plan de Implementación: `ALABURGER al carbón`
**Stack:** Flutter + Dart | Firebase (Auth + Firestore) | Provider | VS Code  
**Objetivo:** Aplicación multiplataforma (iOS, Android, Web) para restaurante de comida rápida con autenticación, catálogo de menú, gestión de pedidos y perfil de usuario.

---

## 🛠️ 1. Entorno y Herramientas Requeridas
| Categoría | Herramienta | Notas |
|-----------|-------------|-------|
| **IDE Principal** | Visual Studio Code | Extensiones: `Flutter`, `Dart`, `Firebase`, `Error Lens`, `Pretty TypeScript Errors` (opcional), `GitLens` |
| **Alternativa IDE** | Android Studio / IntelliJ | Útil para emuladores avanzados y profiling |
| **Nota sobre "Antigravity"** | ❌ No es un IDE estándar para Flutter | Se recomienda VS Code o Android Studio. Si te refieres a un editor de IA (Cursor, Windsurf, etc.), puede usarse como asistente, pero la compilación y emulación requieren el SDK oficial |
| **SDK & CLI** | Flutter SDK (≥3.22 stable), Dart, Firebase CLI, Git | Verificar con `flutter doctor` |
| **Diseño UI/UX** | Figma / Penpot / Adobe XD | Exportar assets en `webp`/`png`, definir tokens de diseño |
| **Control de Versiones** | GitHub / GitLab + Git Flow o Trunk-based | Ramas: `main`, `develop`, `feature/*`, `hotfix/*` |

---

## 🎨 2. Planificación UI/UX
1. **Arquitectura de Información**
   - Pantallas: `Splash` → `Login` → `Register` → `Home/Menú` → `Detalle Producto` → `Carrito` → `Checkout` → `Perfil` → `Historial Pedidos`
2. **Design System**
   - Paleta: Primario (rojo carbón/negro), Secundario (amarillo mostaza), Fondo (claro/oscuro), Texto, Éxito/Error
   - Tipografía: Sans-serif legible (ej. `Inter`, `Roboto`, `Montserrat`)
   - Componentes reutilizables: `AppBar`, `BottomNavBar`, `ProductCard`, `CartTile`, `AuthForm`, `LoadingOverlay`
3. **Principios**
   - Mobile-first, touch targets ≥48px
   - Estados de carga/empty/error explícitos
   - Accesibilidad: contraste ≥4.5:1, soporte TalkBack/VoiceOver
   - Navegación protegida por estado de autenticación

---

## 📦 3. Dependencias (`pubspec.yaml`)
| Paquete | Versión sugerida | Propósito |
|---------|------------------|-----------|
| `firebase_core` | latest | Inicialización Firebase |
| `firebase_auth` | latest | Login/Registro email-password |
| `cloud_firestore` | latest | Base de datos NoSQL en tiempo real |
| `provider` | latest | Gestión de estado (ChangeNotifier) |
| `go_router` | latest | Navegación declarativa + guards de auth |
| `cached_network_image` | latest | Carga optimizada de imágenes del menú |
| `fluttertoast` o `another_flushbar` | latest | Feedback visual de acciones |
| `intl` | latest | Formato de moneda y fechas |
| `flutter_lints` | latest | Calidad de código y estilo |
| `mockito` + `build_runner` | latest | Testing unitario |

> ⚠️ Mantén versiones fijas en producción. Usa `flutter pub get` tras editar `pubspec.yaml`.

---

## 🔐 4. Firebase: Autenticación y Firestore
### 4.1 Configuración
- Crear proyecto en [Firebase Console](https://console.firebase.google.com)
- Registrar apps: Android (SHA-1), iOS (Bundle ID), Web
- Descargar `google-services.json` / `GoogleService-Info.plist` / config web
- Ejecutar: `flutterfire configure`

### 4.2 Auth (Email/Password)
- Habilitar método `Email/Password` en Firebase Auth
- Validaciones cliente: email válido, contraseña ≥8 chars, confirmación
- Manejo de errores: `auth/email-already-in-use`, `auth/weak-password`, `auth/user-not-found`, `auth/wrong-password`
- Persistencia de sesión automática (Firebase la gestiona)

### 4.3 Firestore Estructura
```
users/{uid}
  - displayName, email, phone, createdAt, role, address[]
menu/
  categories/{categoryId} → name, image, order
  items/{itemId} → name, description, price, category, image, isAvailable, tags
orders/{orderId}
  - uid, items[], total, status, createdAt, paymentMethod
```
### 4.4 Reglas de Seguridad (Ejemplo base)
```firestore.rules
rules_version = '2';
service cloud.firestore {
  match /databases/{database}/documents {
    match /menu/{document=**} { allow read: if true; }
    match /users/{userId} { allow read, write: if request.auth != null && request.auth.uid == userId; }
    match /orders/{orderId} { allow read, write: if request.auth != null && resource.data.uid == request.auth.uid; }
  }
}
```

---

## 🏗️ 5. Arquitectura y Estado (Provider)
- **Patrón:** MVVM simplificado + `ChangeNotifierProvider`
- **Estructura de carpetas sugerida:**
  ```
  lib/
  ├── core/ (constants, theme, utils, errors)
  ├── data/ (models, services/firebase_*.dart)
  ├── domain/ (repositories, usecases - opcional)
  ├── providers/ (auth_provider.dart, menu_provider.dart, cart_provider.dart, theme_provider.dart)
  ├── ui/ (screens/, widgets/, routes/)
  └── main.dart
  ```
- **Flujo de datos:**
  `UI → Provider → Service → Firebase → Provider (notifyListeners) → UI`
- **State Management:**
  - `AuthProvider`: maneja login, registro, logout, estado `isAuthenticated`
  - `MenuProvider`: carga categorías/items, cache local opcional
  - `CartProvider`: agrega/elimina items, calcula totales, persiste en memoria
  - `ThemeProvider`: modo claro/oscuro

---

## 📝 6. Fases de Implementación (Paso a Paso)
| Fase | Actividades | Entregable |
|------|-------------|------------|
| **1. Setup** | `flutter create`, limpiar boilerplate, configurar `pubspec.yaml`, `flutterfire configure` | Proyecto base + Firebase conectado |
| **2. Arquitectura** | Crear estructura de carpetas, definir modelos (`User`, `MenuItem`, `Order`), configurar `main.dart` con `MultiProvider` | Esqueleto escalable |
| **3. UI Base** | Implementar `ThemeData`, `go_router` con rutas públicas/privadas, splash, login/register UI | Pantallas estáticas + navegación |
| **4. Autenticación** | `AuthServiceProvider`, `AuthProvider`, formularios con validación, manejo de errores Firebase | Login/registro funcional |
| **5. Firestore + Menú** | `FirestoreService`, `MenuProvider`, carga asíncrona, `cached_network_image`, estados loading/empty/error | Catálogo dinámico |
| **6. Carrito y Flujo** | `CartProvider`, widgets de producto, cálculo de total, validación de checkout (simulado por ahora) | Flujo de pedido base |
| **7. Perfil y Ajustes** | `UserProfileScreen`, edición de datos, cierre de sesión, sincronización con Firestore | Gestión de cuenta |
| **8. Testing** | Unit tests (providers/services), widget tests (AuthForm, ProductCard), integración de flujo completo | Cobertura ≥70% en lógica crítica |
| **9. Pulido** | Animaciones, empty states, manejo offline básico, optimización de builds, iconos/splash | App lista para staging |
| **10. Despliegue** | `flutter build apk/ipa/web`, subir a Play Console/App Store Connect, Firebase Hosting (web), CI/CD básico | Versiones 1.0.0 publicadas |

---

## 🧪 7. Testing y Calidad
- **Unit:** `provider` listeners, validaciones de formulario, cálculos de carrito
- **Widget:** Renders de `AuthForm`, `ProductCard`, loading/empty states
- **Integration:** Flujo `Register → Login → Load Menu → Add to Cart`
- **Herramientas:** `flutter test`, `coverage`, `dart analyze`, `flutter pub run build_runner build`
- **Buenas prácticas:** 
  - Separar lógica de UI
  - Usar `try/catch` con tipos de error Firebase
  - Evitar `setState` en pantallas grandes; delegar a `Provider`

---

## 🚀 8. Despliegue y Mantenimiento
- **Pre-lanzamiento:** Iconos, splash, permisos, políticas de privacidad, términos
- **Builds:** `flutter build apk --release`, `flutter build ipa`, `flutter build web`
- **Distribución:** 
  - Android: Google Play Console (Internal → Beta → Production)
  - iOS: App Store Connect (TestFlight → Review)
  - Web: Firebase Hosting o Vercel/Netlify
- **Monitoreo:** Firebase Crashlytics, Analytics, Performance Monitoring
- **Actualizaciones:** Semantic versioning, changelog, hotfixes via Firebase Remote Config (futuro)

---

## 📅 9. Cronograma Sugerido (MVP: ~4-5 semanas)
| Semana | Foco |
|--------|------|
| 1 | Setup, UI/UX, Firebase, estructura base |
| 2 | Autenticación, routing protegido, Theme |
| 3 | Firestore menú, Provider, Carrito básico |
| 4 | Testing, pulido, builds, documentación |
| 5 | Despliegue, feedback, iteración 1.1 |

---

## ✅ Siguientes Pasos (Antes de escribir código)
1. Validar este plan con stakeholders/diseñador
2. Confirmar alcance del MVP (¿checkout real con pasarela? ¿notificaciones push? ¿roles admin?)
3. Preparar assets (logo, imágenes de hamburguesas, iconos)
4. Configurar repositorio Git con ramas y `.gitignore`
5. **Cuando apruebes este plan, procederé a generar:**
   - `pubspec.yaml` exacto con versiones compatibles
   - Estructura de carpetas + archivos base
   - Implementación de `AuthProvider` + Firebase Auth
   - Configuración de `go_router` + guards
   - Ejemplos de `FirestoreService` y `Provider` listeners

¿Deseas ajustar alguna fase, agregar integración de pagos, o proceder con la generación del código base?
