import 'package:flutter/material.dart';

class TransactionSortDropdown extends StatefulWidget {
  const TransactionSortDropdown({super.key});

  @override
  State<TransactionSortDropdown> createState() =>
      _TransactionSortDropdownState();
}

class _TransactionSortDropdownState extends State<TransactionSortDropdown> {
  late final OverlayEntry _overlayEntry;

  final LayerLink _layerLink = LayerLink();

  @override
  void initState() {
    super.initState();

    _overlayEntry = _customDropdown();
  }

  @override
  void dispose() {
    _overlayEntry.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CompositedTransformTarget(
      link: _layerLink,
      child: ElevatedButton(
        onPressed: () {
          _createCustomDropdown(context);
        },
        child: const Text('Sort'),
      ),
    );
  }

  void _createCustomDropdown(BuildContext context) {
    Overlay.of(context).insert(_overlayEntry);
  }

  void _removeCustomDropdown() {
    _overlayEntry.remove();
  }

  OverlayEntry _customDropdown() {
    return OverlayEntry(builder: (BuildContext context) {
      return Positioned(
        width: 150.0,
        child: CompositedTransformFollower(
            link: _layerLink,
            showWhenUnlinked: false,
            offset: const Offset(0.0, 40.0),
            child: Material(
              elevation: 4.0,
              child: ListView(
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                children: [
                  ListTile(
                    title: const Text('Sort by Date'),
                    onTap: () {},
                  ),
                  ListTile(
                    title: const Text('Sort by Amount'),
                    onTap: () {},
                  ),
                  ListTile(
                    title: const Text('Sort by Type'),
                    onTap: () {},
                  ),
                ],
              ),
            )),
      );
    });
  }
}
