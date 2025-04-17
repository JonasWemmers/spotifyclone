import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

Map<String, String> _localizedStrings = {};
final ValueNotifier<String> currentLanguage = ValueNotifier('de');

Future<void> loadTranslations(String languageCode) async {
  final String jsonString = await rootBundle.loadString('assets/i18n/$languageCode.json');
  final Map<String, dynamic> jsonMap = json.decode(jsonString);
  _localizedStrings = jsonMap.map((key, value) => MapEntry(key, value.toString()));
  currentLanguage.value = languageCode;
}

String trl(String key) {
  return _localizedStrings[key] ?? key;
}
