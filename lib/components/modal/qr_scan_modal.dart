import 'dart:async';

import 'package:flutter/material.dart';
import 'package:vibration/vibration.dart';
import 'package:wakelock_plus/wakelock_plus.dart';

import 'package:wallet_app/theme/DefaultLayout.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class QRScanModal extends StatefulWidget {
  const QRScanModal(context, {super.key});

  @override
  State<QRScanModal> createState() => _CameraViewModalState();
}

class _CameraViewModalState extends State<QRScanModal>
    with WidgetsBindingObserver {
  Timer? _vibrationTimer;
  late final MobileScannerController _mobileScannerController;
  late final List<Barcode> _barCodesTest = [];

  @override
  void initState() {
    super.initState();

    _initialize();
  }

  void _initialize() async {
    _mobileScannerController = MobileScannerController();

    WakelockPlus.enable();
  }

  @override
  dispose() {
    _mobileScannerController.dispose();
    WakelockPlus.disable();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return DefaultLayout(
      useSafeArea: false,
      // backgroundColor: Colors.black.withOpacity(0.2),
      child: Stack(
        children: [
          MobileScanner(
            controller: _mobileScannerController,
            scanWindow: Rect.fromLTWH(
              (size.width - 240.0) / 2,
              (size.height - 240.0) / 2,
              240.0,
              240.0,
            ),
            onDetect: (capture) {
              // _barCodesTest = capture.barcodes;
              // setState(() {
              //   _barCodesTest = capture.barcodes;
              // });

              for (final barcode in capture.barcodes) {
                print(barcode);
                setState(() {
                  _barCodesTest.add(barcode);
                });
              }

              // for (final barcode in _barCodesTest) {
              //   print(barcode);
              // setState(() {
              //   _barCodesTest.add(barcode);
              // });
              // }
            },
          ),
          ColorFiltered(
            colorFilter: ColorFilter.mode(
              Colors.black.withOpacity(0.2),
              BlendMode.srcOut,
            ), // This one will create the magic
            child: Stack(
              children: [
                Container(
                  decoration: const BoxDecoration(
                    color: Colors.red,
                    backgroundBlendMode: BlendMode.dstOut,
                  ), // This one will handle background + difference out
                ),
                Positioned(
                  top: size.height / 2 - 160.0,
                  left: (size.width - 240) / 2,
                  child: Align(
                    alignment: Alignment.center,
                    child: Container(
                      height: 240.0,
                      width: 240.0,
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: size.height / 2 - 160.0,
            left: (size.width - 240) / 2,
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 240.0,
                  height: 240.0,
                  decoration: BoxDecoration(
                    border:
                        Border.all(color: const Color(0xFF523EE8), width: 1),
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                ),
                const SizedBox(height: 30.0),
                const Text(
                  '전송 받을 지갑 주소',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 13.0,
                    color: Colors.white,
                  ),
                ),
                Text(
                  _barCodesTest.isNotEmpty
                      ? _barCodesTest.last.rawValue.toString()
                      : '',
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 20.0,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 10.0),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.qr_code_scanner, color: Colors.white),
                    SizedBox(width: 12.0),
                    Text(
                      'QR 코드를 스캔하세요',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 20.0,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Positioned(
            width: MediaQuery.of(context).size.width,
            bottom: 30.0,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Container(
                decoration: BoxDecoration(
                  color: const Color(0xFF0A043C),
                  borderRadius: BorderRadius.circular(24.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      const Row(
                        children: [
                          Icon(Icons.link, color: Color(0xFF523EE8)),
                          SizedBox(width: 4.0),
                          Text(
                            'Address',
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 15.0,
                              color: Color(0xFF84819D),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20.0),
                      Row(
                        children: [
                          const SizedBox(width: 28.0),
                          const Text(
                            '0x379isdv…sv9ujw1Z',
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 15.0,
                              color: Color(0xFFF8F7F7),
                            ),
                          ),
                          const Expanded(child: SizedBox()),
                          SizedBox(
                            width: 80.0,
                            height: 36.0,
                            child: ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                side: BorderSide(
                                  color:
                                      const Color(0xFF523EE8).withOpacity(0.2),
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(6.0),
                                ),
                                backgroundColor: const Color(0xFF0F084B),
                              ),
                              child: const Text(
                                '확인',
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 15.0,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
