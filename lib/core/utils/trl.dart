import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

Map<String, dynamic> _localizedStrings = {}; // Wir speichern jetzt das JSON als Map statt als flache Map
final ValueNotifier<String> currentLanguage = ValueNotifier('de');

Future<void> loadTranslations(String languageCode) async {
  final String jsonString = await rootBundle.loadString('assets/i18n/$languageCode.json');
  final Map<String, dynamic> jsonMap = json.decode(jsonString);
  _localizedStrings = jsonMap; // Direktes Speichern als Map
  currentLanguage.value = languageCode;
}

String trl(String key) {
  List<String> keys = key.split('.'); // Trennt die verschachtelten Keys
  dynamic value = _localizedStrings;

  // Gehe durch die verschachtelten Keys
  for (var k in keys) {
    if (value is Map) {
      value = value[k]; // Navigiere tiefer in die Map
    } else {
      return key; // Falls der Key nicht existiert, gebe den Original-Key zurück
    }
  }

  return value ?? key; // Rückgabe des Werts oder des Original-Keys
}
