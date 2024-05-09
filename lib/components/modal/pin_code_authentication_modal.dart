import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:wallet_app/components/buildSubmit.dart';
import 'package:wallet_app/interface/service/router_service.dart';
import 'package:wallet_app/theme/DefaultLayout.dart';

class PinCodeAuthenticationModal extends StatefulWidget {
  final Function(String pin)? onCompletedHandler;
  const PinCodeAuthenticationModal({
    super.key,
    this.onCompletedHandler,
  });

  @override
  State<PinCodeAuthenticationModal> createState() =>
      _PinCodeAuthenticationModalState();
}

class _PinCodeAuthenticationModalState
    extends State<PinCodeAuthenticationModal> {
  final textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      leader: const BackButton(color: Colors.white),
      customTitleWidget: const Text(
        'FANC',
        style: TextStyle(
          fontWeight: FontWeight.w900,
          fontSize: 18.0,
          color: Colors.white,
        ),
      ),
      appBarBackgroundColor: const Color(0xFF0A043C),
      backgroundColor: const Color(0xFF0A043C),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildPinCodeInput(context),
          const SizedBox(height: 100.0),
          _buildKeyPad(),
        ],
      ),
    );
  }

  void _handleKeyPadButtonPressed(dynamic key) {
    switch (key) {
      case 'CLR':
        // Clear pin code
        textEditingController.clear();
        break;
      case 'DEL':
        // Delete last digit
        final text = textEditingController.text;
        if (text.isNotEmpty) {
          textEditingController.text = text.substring(0, text.length - 1);
        }

        break;
      default:
        // Append digit to pin code
        final text = textEditingController.text;
        if (text.length < 6) {
          textEditingController.text = text + key.toString();
        }
        break;
    }
  }

  Widget _buildKeyPadButton(dynamic key) {
    return Expanded(
      child: ElevatedButton(
        onPressed: () {
          _handleKeyPadButtonPressed(key);
        },
        style: ElevatedButton.styleFrom(
          elevation: 0.0,
          minimumSize: const Size.fromHeight(100.0),
          backgroundColor: Colors.transparent,
          shape: const RoundedRectangleBorder(
            side: BorderSide(color: Colors.transparent, width: 0.0),
          ),
        ),
        child: Text(
          key.toString(),
          style: const TextStyle(
            color: Colors.white,
            fontSize: 24.0,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }

  Widget _buildKeyPadRow(List<dynamic> keys) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: keys.map((key) => _buildKeyPadButton(key)).toList(),
    );
  }

  Widget _buildKeyPad() {
    return Column(
      children: [
        _buildKeyPadRow([1, 2, 3]),
        _buildKeyPadRow([4, 5, 6]),
        _buildKeyPadRow([7, 8, 9]),
        _buildKeyPadRow(['CLR', 0, 'DEL']),
      ],
    );
  }

  Widget _buildPinCodeInput(BuildContext context) {
    const defaultTheme = PinTheme(
      width: 16.0,
      height: 16.0,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Color(0xFFC4C4C4),
      ),
      textStyle: TextStyle(
        color: Colors.transparent,
        fontSize: 24.0,
        fontWeight: FontWeight.w500,
      ),
    );

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Pinput(
          controller: textEditingController,
          length: 6,
          onCompleted: (pin) {
            if (widget.onCompletedHandler != null) {
              widget.onCompletedHandler!(pin);
            }
          },
          useNativeKeyboard: false,
          defaultPinTheme: defaultTheme,
          submittedPinTheme: defaultTheme.copyWith(
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Color(0xFF523EE8),
            ),
          ),
        ),
        const SizedBox(height: 60.0),
        TextButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            elevation: 0.0,
            backgroundColor: Colors.transparent,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50.0),
              side: const BorderSide(width: 0.0),
            ),
          ),
          child: const Text(
            'PIN 번호를 잊으셨나요?',
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 14.0,
              color: Color(0xFFFDA325),
            ),
          ),
        )
      ],
    );
  }
}
