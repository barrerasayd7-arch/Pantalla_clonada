# BetPlay Clon

App de apuestas deportivas y casino, clonada visualmente a partir de BetPlay. El objetivo era practicar cómo estructurar pantallas, navegación y estado compartiendo un mismo diseño (colores, tarjetas, barra inferior) entre secciones distintas.

## Las pantallas

* `HomeScreen` — resumen de saldo, accesos rápidos y jackpots.
* `DeporteScreen` — deportes, eventos en vivo y combinadas sugeridas.
* `CasinoScreen` — categorías de juegos, torneos y recomendados.
* `BilleteraScreen` — saldo, recargas/retiros y movimientos.
* `PerfilScreen` — datos de sesión, información personal y ajustes.
* `BottomNav` — widget compartido que navega entre las 5 pantallas.

Decisión: los datos (saldo, movimientos, juegos, partidos) están fijos directamente en cada pantalla, sin modelos ni backend, porque el foco era la interfaz, no la lógica de negocio.

## Cómo correrlo

```
flutter pub get
flutter run
```
