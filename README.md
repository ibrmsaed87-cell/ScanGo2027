# ScanGo

ScanGo is a Flutter mobile application for document scanning and PDF generation.

## Features

- **Image Capture**: Capture images from camera or pick multiple from gallery.
- **Document Scanner**: Edge detection and document cropping using Google ML Kit.
- **PDF Generation**: Merge multiple images into a single PDF, save locally, and share via WhatsApp or system share.
- **Drag & Drop Reordering**: Reorder images before PDF generation.
- **Dark/Light Mode**: Toggle between dark and light themes, defaulting to dark mode.
- **Localization**: Full Arabic and English support with auto-detection and RTL/LTR layouts.
- **AdMob Integration**: Banner ads at the bottom and interstitial ads before PDF saving (test mode).

## Getting Started

1. Ensure you have Flutter installed.
2. Clone the repository.
3. Run `flutter pub get` to install dependencies.
4. Run `flutter run` to start the app.

## Permissions

The app requires camera and photo library permissions for image capture and selection.

## AdMob

The app uses test Ad Unit IDs. Replace with your own for production.

## Localization

Supported languages: English (en) and Arabic (ar).
