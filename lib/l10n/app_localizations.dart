import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_ar.dart';

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure the pubspec.yaml of your package doesn't contain a
/// `localizationsDelegates` list yet. Otherwise, the app's
/// `localizationsDelegates` must be merged with the ones in the pubspec.yaml.
///
/// ```yaml
/// flutter:
///   generate: true
/// ```
///
abstract class AppLocalizations {
  AppLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localization's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('ar')
  ];

  /// App title
  ///
  /// In en, this message translates to:
  /// **'ScanGo'**
  String get appTitle;

  /// Capture image button
  ///
  /// In en, this message translates to:
  /// **'Capture Image'**
  String get captureImage;

  /// Pick from gallery button
  ///
  /// In en, this message translates to:
  /// **'Pick from Gallery'**
  String get pickFromGallery;

  /// Scan document button
  ///
  /// In en, this message translates to:
  /// **'Scan Document'**
  String get scanDocument;

  /// Generate PDF button
  ///
  /// In en, this message translates to:
  /// **'Generate PDF'**
  String get generatePDF;

  /// Share PDF button
  ///
  /// In en, this message translates to:
  /// **'Share PDF'**
  String get sharePDF;

  /// Reorder images
  ///
  /// In en, this message translates to:
  /// **'Reorder Images'**
  String get reorderImages;

  /// Dark mode
  ///
  /// In en, this message translates to:
  /// **'Dark Mode'**
  String get darkMode;

  /// Light mode
  ///
  /// In en, this message translates to:
  /// **'Light Mode'**
  String get lightMode;

  /// Language
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get language;

  /// English
  ///
  /// In en, this message translates to:
  /// **'English'**
  String get english;

  /// Arabic
  ///
  /// In en, this message translates to:
  /// **'Arabic'**
  String get arabic;

  /// No images selected
  ///
  /// In en, this message translates to:
  /// **'No images selected'**
  String get noImages;

  /// Saving PDF
  ///
  /// In en, this message translates to:
  /// **'Saving PDF...'**
  String get savingPDF;

  /// PDF saved
  ///
  /// In en, this message translates to:
  /// **'PDF saved successfully'**
  String get pdfSaved;

  /// Share via
  ///
  /// In en, this message translates to:
  /// **'Share via'**
  String get shareVia;

  /// WhatsApp
  ///
  /// In en, this message translates to:
  /// **'WhatsApp'**
  String get whatsapp;

  /// System share
  ///
  /// In en, this message translates to:
  /// **'System Share'**
  String get systemShare;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['ar', 'en'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {

  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar': return AppLocalizationsAr();
    case 'en': return AppLocalizationsEn();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}