import 'package:flutter/material.dart';

// Colors
const Color colorWhite = Color(0xFFFCFCFC);
const Color colorGrey = Color(0xff828282);
const Color colorBlack = Color(0xFF202124);
const Color colorPink1 = Color(0xFFFBC0C0);
const Color colorPink2 = Color(0xFFFB8DA0);
const Color colorPink3 = Color(0xFFFB6C90);
const Color colorPink4 = Color(0xFFFB5490);

const Color colorPrimary = Color(0xFF937DC2);
const Color colorSecondary = Color(0xFFC689C6);

LinearGradient colorGradient = const LinearGradient(
  begin: Alignment.topRight,
  end: Alignment.bottomLeft,
  colors: [
    colorPrimary,
    colorSecondary,
  ],
);

// Font
TextStyle fontNunito = const TextStyle(fontFamily: 'Nunito');

// Font Weight
FontWeight light = FontWeight.w300;
FontWeight regular = FontWeight.w400;
FontWeight medium = FontWeight.w500;
FontWeight semiBold = FontWeight.w600;
FontWeight bold = FontWeight.w700;
FontWeight extraBold = FontWeight.w800;

// Border Radius
const double defaultBorderRadius = 15.0;
const double defaultBorderRadius2 = 30.0;

// Padding
const double defaultPadding = 30.0;
const double defaultPadding2 = 40.0;
const double defaultPadding3 = 50.0;

const double marginTop = 64.0;
