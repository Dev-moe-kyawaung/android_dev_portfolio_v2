# Android Developer Portfolio V2

Premium Flutter Web portfolio for an Android developer, with:
- 5 featured projects
- animated cards
- screenshot carousel
- GitHub and Play Store buttons
- interactive tech-stack cloud
- deferred-loaded project pages for a lighter initial experience

## Setup

```bash
flutter pub get
flutter run -d chrome

```bash
flutter build web

## How to use

1. Create a Flutter project.
2. Replace the generated `lib/` files with the code above.
3. Add real screenshots to `assets/screenshots/`.
4. Update project URLs and metrics.
5. Run `flutter pub get`, then `flutter run -d chrome`.

This V2 design uses Flutter’s standard navigation model, `url_launcher` for external links, and deferred loading for a lighter first-load path on the web [1][4][2].
