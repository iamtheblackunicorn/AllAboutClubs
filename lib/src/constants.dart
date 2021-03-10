import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'constants.dart';

Dio dio = new Dio();
String apiUrl = 'https://public.allaboutapps.at/hiring/clubs.json';
String appTitle = 'All About Clubs';
String headingFont = 'Roboto';
String defaultFont = 'Roboto';
Color accentColor = Color(0xFF01C13B);
Color mainColor = Color(0xFFFFFFFF);
Color tertiaryColor = Color(0xFF000000);
double headingFontSize = 40;
double stdPadding = 7;
double stdFontSize = 20;
double stdRounding = 25;
double headingSpacing = 50;
double stdSpacing = 20;
double cardPadding = 20;
double stdWidth = 200;
double postHeadingFontSize = 25;
double extraRounding = 25;
List<dynamic> defaultMap = [
    'API Fail.',
    'Could not fetch the API.',
    'There was an error fetching the API!',
    'https://blckunicorn.art/assets/images/logo/logo.svg'
  ];
