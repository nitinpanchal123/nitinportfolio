# Nitin Mistry — Flutter Portfolio

Native Flutter app of the same portfolio: selected work with Play Store
screenshots, experience, skills, contact, and a downloadable résumé.

The compiled web build is what opens from **Open Flutter app** on the site.

## Run

```bash
cd flutter_app
flutter pub get
flutter run
```

Pick a device (Android, iOS simulator, or Chrome).

## Build

```bash
# Android
flutter build apk --release

# iOS (macOS)
flutter build ios --release

# Web (served from the site at /app/)
flutter build web --release --base-href /app/
```

## Stack

- Flutter 3.47 / Dart 3.13
- Bundled Instrument Serif + Outfit
- `url_launcher` — email, phone, LinkedIn, Play Store, résumé

## Layout

```
lib/
  main.dart
  launch.dart
  data/portfolio.dart
  theme/app_theme.dart
  screens/home_screen.dart
  screens/project_screen.dart
assets/images/          # hero + Play Store screenshots
assets/docs/            # résumé PDF
```
