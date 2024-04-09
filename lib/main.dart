import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:wallet_app/interface/di/get_it.dart';
import 'package:wallet_app/wallet_app.dart';

void main() {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  setupDependencyInjection();

  runApp(const WalletApp());
}
