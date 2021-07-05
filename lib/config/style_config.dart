import 'package:flutter/material.dart';
import '../markdown_themes/all_themes.dart';
import '../tags/markdown_tags.dart';
import '../tags/all_tags.dart';
export '../tags/all_tags.dart';

class StyleConfig {
  StyleConfig._internal();

  static StyleConfig? _obj;

  factory StyleConfig({
    CheckBoxBuilder? checkBoxBuilder,
    ImgBuilder? imgBuilder,
    ImgConfig? imgConfig,
    VideoBuilder? videoBuilder,
    VideoConfig? videoConfig,
    TitleConfig? titleConfig,
    PConfig? pConfig,
    CodeConfig? codeConfig,
    OlConfig? olConfig,
    UlConfig? ulConfig,
    PreConfig? preConfig,
    BlockQuoteConfig? blockQuoteConfig,
    TableConfig? tableConfig,
    HrConfig? hrConfig,
    CheckBoxConfig? checkBoxConfig,
    Map<String, dynamic>? markdownTheme,
  }) {
    _obj ??= StyleConfig._internal();
    _obj!.imgBuilder = imgBuilder ?? _obj!.imgBuilder;
    _obj!.imgConfig = imgConfig ?? _obj!.imgConfig;
    _obj!.videoBuilder = videoBuilder ?? _obj!.videoBuilder;
    _obj!.checkBoxBuilder = checkBoxBuilder ?? _obj!.checkBoxBuilder;
    _obj!.titleConfig = titleConfig ?? _obj!.titleConfig;
    _obj!.videoConfig = videoConfig ?? _obj!.videoConfig;
    _obj!.pConfig = pConfig ?? _obj!.pConfig;
    _obj!.codeConfig = codeConfig ?? _obj!.codeConfig;
    _obj!.olConfig = olConfig ?? _obj!.olConfig;
    _obj!.ulConfig = ulConfig ?? _obj!.ulConfig;
    _obj!.preConfig = preConfig ?? _obj!.preConfig;
    _obj!.blockQuoteConfig = blockQuoteConfig ?? _obj!.blockQuoteConfig;
    _obj!.tableConfig = tableConfig ?? _obj!.tableConfig;
    _obj!.hrConfig = hrConfig ?? _obj!.hrConfig;
    _obj!.checkBoxConfig = checkBoxConfig ?? _obj!.checkBoxConfig;
    _obj!.markdownTheme = markdownTheme ?? _obj!.markdownTheme;
    return _obj!;
  }

  ///input
  CheckBoxBuilder? checkBoxBuilder;
  CheckBoxConfig? checkBoxConfig;

  ///img
  ImgBuilder? imgBuilder;
  ImgConfig? imgConfig;

  ///video
  VideoBuilder? videoBuilder;
  VideoConfig? videoConfig;

  ///h1~h5
  TitleConfig? titleConfig;

  ///p
  PConfig? pConfig;

  ///code
  CodeConfig? codeConfig;

  ///ol
  OlConfig? olConfig;

  ///ul
  UlConfig? ulConfig;

  ///pre
  PreConfig? preConfig;

  ///blockquote
  BlockQuoteConfig? blockQuoteConfig;

  ///table
  TableConfig? tableConfig;

  ///hr
  HrConfig? hrConfig;

  ///MarkdownTheme, default is light
  Map<String, dynamic>? markdownTheme;
}

class MarkdownTheme {
  static const Map<String, dynamic> lightTheme = light_theme;
  static const Map<String, dynamic> darkTheme = dark_theme;
}

TextStyle getTextStyle(String tag) {
  final pConfig = StyleConfig().pConfig;
  TextStyle style = TextStyle();
  switch (tag) {
    case del:
      style = pConfig?.delStyle ?? defaultDelStyle;
      break;
    case em:
      style = pConfig?.emStyle ?? defaultEmStyle;
      break;
    case strong:
      style = pConfig?.strongStyle ?? defaultStrongStyle;
      break;
  }
  return style;
}

Map<String, dynamic> get _theme => StyleConfig().markdownTheme ?? light_theme;

TextStyle get defaultPStyle => _theme['PStyle'] ?? light_theme['PStyle'];

TextStyle get defaultCodeStyle =>
    _theme['CodeStyle'] ?? light_theme['CodeStyle'];

TextStyle get defaultDelStyle =>
    TextStyle(decoration: TextDecoration.lineThrough);

TextStyle get defaultEmStyle => TextStyle(fontStyle: FontStyle.italic);

TextStyle get defaultStrongStyle => TextStyle(fontWeight: FontWeight.bold);

TextStyle get defaultBlockStyle =>
    _theme['BlockStyle'] ?? light_theme['BlockStyle'];

TextStyle get defaultLinkStyle =>
    _theme['LinkStyle'] ?? light_theme['LinkStyle'];

Color get defaultCodeBackground =>
    _theme['CodeBackground'] ?? light_theme['CodeBackground'];

Color get defaultTableBorderColor =>
    _theme['TableBorderColor'] ?? light_theme['TableBorderColor'];

Color get defaultDividerColor =>
    _theme['DividerColor'] ?? light_theme['DividerColor'];

Color get defaultBlockColor =>
    _theme['BlockColor'] ?? light_theme['BlockColor'];

Color get defaultPreBackground =>
    _theme['PreBackground'] ?? light_theme['PreBackground'];

Color get defaultTitleColor =>
    _theme['TitleColor'] ?? light_theme['TitleColor'];

Color get defaultUlDotColor =>
    _theme['UlDotColor'] ?? light_theme['UlDotColor'];

Map<String, TextStyle> get defaultHighLightCodeTheme =>
    _theme['HightLightCodeTheme'] ?? light_theme['HightLightCodeTheme'];
