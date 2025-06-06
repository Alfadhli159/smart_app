import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:smart_app/features/welcome/welcome_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Smart App',

      // ❌ هذا مفقود في كودك - إزالة علامة debug
      debugShowCheckedModeBanner: false,

      // ❌ هذا مفقود في كودك - إعداد RTL
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('ar', 'SA'), // العربية - السعودية
        Locale('en', 'US'), // الإنجليزية - أمريكا
      ],
      locale: const Locale('ar', 'SA'), // تعيين اللغة الافتراضية العربية

      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        // إضافة خط يدعم العربية (اختياري)
        fontFamily: 'Arial',
      ),

      // ❌ مفقود const في كودك
      home: const SmartWelcomeScreen(),
    );
  }
}
