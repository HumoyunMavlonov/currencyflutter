// DO NOT EDIT. This is code generated via package:easy_localization/generate.dart

// ignore_for_file: prefer_single_quotes

import 'dart:ui';

import 'package:easy_localization/easy_localization.dart';


class CodegenLoader extends AssetLoader{
  const CodegenLoader();

  @override
  Future<Map<String, dynamic>?> load(String path, Locale locale) {
    return Future.value(mapLocales[locale.toString()]);
  }

  static const Map<String,dynamic> en = {
  "title": "Currency",
  "calc": "Calculate"
};
static const Map<String,dynamic> ru = {
  "title": "Валюта",
  "calc": "Рассчитать"
};
static const Map<String,dynamic> uz = {
  "title": "Valyuta",
  "calc": "Hisoblash"
};
static const Map<String, Map<String,dynamic>> mapLocales = {"en": en, "ru": ru, "uz": uz};
}
