import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:wallet_app/constant/theme/theme_resources.dart';
import 'package:wallet_app/interface/service/router_service.dart';
import 'package:wallet_app/interface/view/cs/announcement_screen.dart';
import 'package:wallet_app/interface/view/exchange/exchange_screen.dart';
import 'package:wallet_app/interface/view/settings/settings_screen.dart';
import 'package:wallet_app/interface/view/transaction/transaction_screen.dart';
import 'package:wallet_app/interface/view/wallet/wallet_screen.dart';

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
  late int _currentIndex;
  late List<BottomNavigationBarItem> _navItems;
  late List<Widget> _pages;

  @override
  void initState() {
    super.initState();

    setState(() {
      _currentIndex = widget.child.currentIndex;
    });
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
      const ExchangeScreen(),
      const WalletScreen(),
      const TransactionScreen(),
      const AnnouncementScreen(),
      const SettingsScreen(),
    ];
  }

  @override
  didUpdateWidget(BottomNavigation oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (widget.child.currentIndex != _currentIndex) {
      setState(() {
        _currentIndex = widget.child.currentIndex;
      });
    }

    if (oldWidget.child != widget.child) {
      setState(() {
        _currentIndex = widget.child.currentIndex;
      });
    }
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

                switch (index) {
                  case 0:
                    RouterService.instance.router.go('/exchange');
                    break;

                  case 1:
                    RouterService.instance.router.go('/wallet');
                    break;

                  case 2:
                    RouterService.instance.router.go('/transaction');
                    break;

                  case 3:
                    RouterService.instance.router.go('/cs');
                    break;

                  case 4:
                    RouterService.instance.router.go('/settings');
                    break;
                }

                // return widget.child.goBranch(index);
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
