import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:wallet_app/components/bottomNavigation.dart';
import 'package:wallet_app/components/error_page.dart';
import 'package:wallet_app/interface/view/assets/exchange_point_screen.dart';
import 'package:wallet_app/interface/view/assets/point_conversion_screen.dart';
import 'package:wallet_app/interface/view/cs/announcement_screen.dart';
import 'package:wallet_app/interface/view/linking_account_screen.dart';
import 'package:wallet_app/interface/view/security/recover_words.dart';
import 'package:wallet_app/interface/view/intro/select_language_screen.dart';
import 'package:wallet_app/interface/view/security/sign_in.dart';
import 'package:wallet_app/interface/view/security/sign_up.dart';
import 'package:wallet_app/interface/view/intro/welcome_screen.dart';
import 'package:wallet_app/interface/view/settings/settings_screen.dart';
import 'package:wallet_app/interface/view/transaction/transaction_screen.dart';
import 'package:wallet_app/interface/view/wallet/wallet_screen.dart';
import 'package:wallet_app/theme/DefaultLayout.dart';

class RouterService {
  static final RouterService _instance = RouterService._privateConstructor();
  static bool _isInitialize = false;
  static bool get isInitialize => _isInitialize;

  static RouterService get instance => _instance;
  late final GoRouter _goRouter;

  final GlobalKey<NavigatorState> _rootNavigatorKey =
      GlobalKey<NavigatorState>();

  GoRouter get router => _goRouter;

  initializeRoute() async {
    RouterService._isInitialize = true;
  }

  RouterService._privateConstructor() {
    _goRouter = GoRouter(
      debugLogDiagnostics: kDebugMode ? true : false,
      navigatorKey: _rootNavigatorKey,
      // observers: [_logger.getObserver()],
      initialLocation: kDebugMode ? '/assets/point/conversion' : '/',
      // (Authentication.state.isAuthentication) ? '/' : '/login',
      // refreshListenable: Authentication.state,
      errorBuilder: (context, state) {
        return const ErrorPage();
      },
      routes: [
        StatefulShellRoute.indexedStack(
          builder: (context, state, shell) {
            return BottomNavigation(child: shell);
          },
          branches: [
            StatefulShellBranch(
              routes: [
                GoRoute(
                  path: '/assets/point/conversion',
                  builder: (context, state) {
                    return const PointConversionScreen();
                  },
                ),
                GoRoute(
                  path: '/assets/point/exchange',
                  builder: (context, state) {
                    return const ExchangePointScreen();
                  },
                ),
              ],
            ),
            StatefulShellBranch(
              routes: [
                GoRoute(
                  path: '/wallet',
                  builder: (context, state) {
                    return const WalletScreen();
                  },
                ),
              ],
            ),
            StatefulShellBranch(
              routes: [
                GoRoute(
                  path: '/transaction',
                  builder: (context, state) {
                    return const TransactionScreen();
                  },
                ),
              ],
            ),
            StatefulShellBranch(
              routes: [
                GoRoute(
                  path: '/cs',
                  builder: (context, state) {
                    return const AnnouncementScreen();
                  },
                ),
              ],
            ),
            StatefulShellBranch(
              routes: [
                GoRoute(
                  path: '/settings',
                  builder: (context, state) {
                    return const SettingsScreen();
                  },
                ),
              ],
            ),
          ],
        ),
        GoRoute(
          parentNavigatorKey: _rootNavigatorKey,
          path: '/intro/select-language',
          builder: (context, state) => const SelectLanguageScreen(),
        ),
        GoRoute(
          parentNavigatorKey: _rootNavigatorKey,
          path: '/intro/welcome',
          builder: (context, state) => const WelcomeScreen(),
        ),
        GoRoute(
          parentNavigatorKey: _rootNavigatorKey,
          path: '/sign/up',
          builder: (context, state) => const SignUp(),
        ),
        GoRoute(
          parentNavigatorKey: _rootNavigatorKey,
          path: '/sign/in',
          builder: (context, state) => const SignIn(),
        ),
        GoRoute(
          path: '/security/recover-words',
          builder: (context, state) => const RecoverWords(),
        ),
        GoRoute(
          path: '/linking-account',
          builder: (context, state) => const LinkingAccountScreen(),
        ),
        GoRoute(
          path: '/something-wrong',
          builder: (context, state) => const ErrorPage(),
        ),
      ],
    );
  }
}
