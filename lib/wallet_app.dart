import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:wallet_app/interface/service/router_service.dart';

class WalletApp extends StatelessWidget {
  const WalletApp({super.key});

  @override
  Widget build(BuildContext context) {
    FlutterNativeSplash.remove();

    return MaterialApp.router(
      theme: ThemeData(fontFamily: 'Pretendard'),
      routerConfig: RouterService.instance.router,
    );
  }
}
