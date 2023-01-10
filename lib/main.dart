import 'package:aplikasi_uts/app/modules/auth/aurh_view.dart';
import 'package:aplikasi_uts/app/modules/home/home_view.dart';
import 'package:aplikasi_uts/app/theme/default_theme.dart';
import 'package:flutter/material.dart';
import 'package:sp_util/sp_util.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SpUtil.getInstance();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: DefaultTheme.defaultTheme,
      debugShowCheckedModeBanner: false,
      title: "Aplikasi Pencari Nilai Terkecil",
      home: SpUtil.getBool("isLogin") == true
          ? const HomeView()
          : const AuthView(),
    );
  }
}
