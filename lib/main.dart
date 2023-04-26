import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';
import 'package:qvf_farm/presentation/splash_screen.dart';


import 'data/data_storage/token_local_storage.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  TokenStorage.init();
  runApp(DevicePreview(enabled: true, builder: (context) => const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
    );
  }
}
