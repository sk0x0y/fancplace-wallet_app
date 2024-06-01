import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:wallet_app/components/bottomNavigation.dart';
import 'package:wallet_app/components/error_page.dart';
import 'package:wallet_app/interface/view/cs/announcement_screen.dart';
import 'package:wallet_app/interface/view/exchange/exchange_point_page.dart';
import 'package:wallet_app/interface/view/exchange/exchange_screen.dart';
import 'package:wallet_app/interface/view/intro/select_language_screen.dart';
import 'package:wallet_app/interface/view/intro/welcome_screen.dart';
import 'package:wallet_app/interface/view/linking_account_screen.dart';
import 'package:wallet_app/interface/view/security/recover_words.dart';
import 'package:wallet_app/interface/view/security/sign_in.dart';
import 'package:wallet_app/interface/view/security/sign_up.dart';
import 'package:wallet_app/interface/view/settings/policy_screen.dart';
import 'package:wallet_app/interface/view/settings/profile/change_password_page.dart';
import 'package:wallet_app/interface/view/settings/profile_screen.dart';
import 'package:wallet_app/interface/view/settings/security_screen.dart';
import 'package:wallet_app/interface/view/settings/settings_screen.dart';
import 'package:wallet_app/interface/view/transaction/transaction_screen.dart';
import 'package:wallet_app/interface/view/wallet/transaction_history_page.dart';
import 'package:wallet_app/interface/view/wallet/wallet_screen.dart';

class RouterService {
  static final RouterService _instance = RouterService._privateConstructor();
  static bool _isInitialize = false;
  static bool get isInitialize => _isInitialize;

  static RouterService get instance => _instance;
  late final GoRouter _goRouter;

  final GlobalKey<NavigatorState> _rootNavigatorKey =
      GlobalKey<NavigatorState>();
  final GlobalKey<NavigatorState> _pointNavigatorKey =
      GlobalKey<NavigatorState>();
  final GlobalKey<NavigatorState> _walletNavigatorKey =
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
      initialLocation: kDebugMode ? '/settings' : '/intro/select-language',
      // (Authentication.state.isAuthentication) ? '/' : '/login',
      // refreshListenable: Authentication.state,
      errorBuilder: (context, state) {
        WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
          context.go('/something-wrong');
        });

        return const SizedBox.shrink();
      },
      routes: [
        StatefulShellRoute.indexedStack(
          parentNavigatorKey: _rootNavigatorKey,
          builder: (context, state, navigationShell) {
            return BottomNavigation(child: navigationShell);
          },
          branches: [
            StatefulShellBranch(
              // navigatorKey: _pointNavigatorKey,
              routes: [
                GoRoute(
                  path: '/exchange',
                  builder: (context, state) {
                    return const ExchangeScreen();
                  },
                ),
                GoRoute(
                  path: '/exchange/point',
                  builder: (context, state) {
                    return const ExchangePointPage();
                  },
                ),
              ],
            ),
            StatefulShellBranch(
              // navigatorKey: _walletNavigatorKey,
              routes: [
                GoRoute(
                  path: '/wallet',
                  builder: (context, state) {
                    return const WalletScreen();
                  },
                  routes: [
                    GoRoute(
                      path: 'transaction-history',
                      builder: (context, state) {
                        return const TransactionHistoryPage();
                      },
                    ),
                  ],
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
                  routes: [
                    GoRoute(
                      path: 'profile',
                      builder: (context, state) {
                        return const ProfileScreen();
                      },
                      routes: [
                        GoRoute(
                          path: 'change-password',
                          builder: (context, state) {
                            return const ChangePasswordPage();
                          },
                        ),
                      ],
                    ),
                    GoRoute(
                      path: 'security',
                      builder: (context, state) {
                        return const SecurityScreen();
                      },
                    ),
                    GoRoute(
                      path: 'faq',
                      builder: (context, state) {
                        return const Text('FAQ Page');
                      },
                    ),
                    GoRoute(
                      path: 'policy',
                      builder: (context, state) {
                        return const PolicyScreen();
                      },
                    ),
                  ],
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
          parentNavigatorKey: _rootNavigatorKey,
          path: '/something-wrong',
          builder: (context, state) => const ErrorPage(),
        ),
      ],
    );
  }
}
