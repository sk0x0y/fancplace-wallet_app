import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:wallet_app/constant/theme/theme_resources.dart';
import 'package:wallet_app/interface/service/router_service.dart';
import 'package:wallet_app/interface/view/assets/point_conversion_screen.dart';
import 'package:wallet_app/interface/view/cs/announcement_screen.dart';
import 'package:wallet_app/interface/view/settings/settings_screen.dart';
import 'package:wallet_app/interface/view/transaction/transaction_screen.dart';
import 'package:wallet_app/interface/view/wallet/wallet_screen.dart';
import 'package:wallet_app/theme/DefaultLayout.dart';

class BottomNavigation extends StatefulWidget {
  final StatefulNavigationShell child;
  const BottomNavigation({
    super.key,
    required this.child,
  });

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation>
    with SingleTickerProviderStateMixin {
  int _currentIndex = 0;
  late List<BottomNavigationBarItem> _navItems;
  late List<Widget> _pages;

  @override
  void initState() {
    super.initState();

    _navItems = [
      BottomNavigationBarItem(
        icon: SizedBox(
          height: 70.0,
          child: Padding(
            padding: const EdgeInsets.all(22.0),
            child: SvgPicture.asset(
                'assets/bottom_navigation/bottom_exchange.svg'),
          ),
        ),
        activeIcon: SizedBox(
          height: 70.0,
          child: Padding(
            padding: const EdgeInsets.all(22.0),
            child: SvgPicture.asset(
                'assets/bottom_navigation/bottom_exchange_active.svg'),
          ),
        ),
        label: 'Exchange',
      ),
      BottomNavigationBarItem(
        icon: SizedBox(
          height: 70.0,
          child: Padding(
            padding: const EdgeInsets.all(22.0),
            child:
                SvgPicture.asset('assets/bottom_navigation/bottom_wallet.svg'),
          ),
        ),
        activeIcon: SizedBox(
          height: 70.0,
          child: Padding(
            padding: const EdgeInsets.all(22.0),
            child: SvgPicture.asset(
                'assets/bottom_navigation/bottom_wallet_active.svg'),
          ),
        ),
        label: 'Wallet',
      ),
      BottomNavigationBarItem(
        icon: SizedBox(
          height: 70.0,
          child: Padding(
            padding: const EdgeInsets.all(22.0),
            child: SvgPicture.asset(
                'assets/bottom_navigation/bottom_transaction-history.svg'),
          ),
        ),
        activeIcon: SizedBox(
          height: 70.0,
          child: Padding(
            padding: const EdgeInsets.all(22.0),
            child: SvgPicture.asset(
                'assets/bottom_navigation/bottom_transaction-history_active.svg'),
          ),
        ),
        label: 'Transaction History',
      ),
      BottomNavigationBarItem(
        icon: SizedBox(
          height: 70.0,
          child: Padding(
            padding: const EdgeInsets.all(22.0),
            child: SvgPicture.asset(
                'assets/bottom_navigation/bottom_announcement.svg'),
          ),
        ),
        activeIcon: SizedBox(
          height: 70.0,
          child: Padding(
            padding: const EdgeInsets.all(22.0),
            child: SvgPicture.asset(
                'assets/bottom_navigation/bottom_announcement_active.svg'),
          ),
        ),
        label: 'Announcement',
      ),
      BottomNavigationBarItem(
        icon: SizedBox(
          height: 70.0,
          child: Padding(
            padding: const EdgeInsets.all(22.0),
            child: SvgPicture.asset(
                'assets/bottom_navigation/bottom_settings.svg'),
          ),
        ),
        activeIcon: SizedBox(
          height: 70.0,
          child: Padding(
            padding: const EdgeInsets.all(22.0),
            child: SvgPicture.asset(
                'assets/bottom_navigation/bottom_settings_active.svg'),
          ),
        ),
        label: 'Settings',
      ),
    ];
    _pages = [
      const PointConversionScreen(),
      const WalletScreen(),
      const TransactionScreen(),
      const AnnouncementScreen(),
      const SettingsScreen(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: widget.key,
      bottomNavigationBar: Theme(
        data: ThemeData(
          splashColor: AppColors.white.withOpacity(0.07),
          highlightColor: AppColors.white.withOpacity(0.07),
        ),
        child: SizedBox(
          height: 70.0,
          child: Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: const Color(0xFF05042D).withOpacity(0.2),
                  blurRadius: 7.0,
                  offset: const Offset(0, -4),
                ),
              ],
            ),
            child: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              onTap: (int index) {
                setState(() {
                  _currentIndex = index;
                });

                return widget.child.goBranch(index);
              },
              currentIndex: _currentIndex,
              items: _navItems,
              backgroundColor: const Color(0xFF110A4D),
              selectedFontSize: 0.0,
            ),
          ),
        ),
      ),
      body: widget.child,
    );
  }
}
