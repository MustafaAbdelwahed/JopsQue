import 'package:flutter/material.dart';
import 'package:graduated_project/test1/test1.dart';
import 'package:pinput/pinput.dart';

/// This is the basic usage of Pinput
/// For more examples check out the demo directory
class CustomOTP extends StatefulWidget {
  const CustomOTP({Key? key, required this.pinController}) : super(key: key);
  final TextEditingController pinController;

  @override
  State<CustomOTP> createState() => _CustomOTPState();
}

class _CustomOTPState extends State<CustomOTP> {
  final focusNode = FocusNode();
  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    widget.pinController.dispose();
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const focusedBorderColor = Color(0xffD1D5DB);
    const borderColor = Color(0xffD1D5DB);

    final defaultPinTheme = PinTheme(
      width: 44,
      height: 44,
      textStyle: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        color: Color.fromRGBO(30, 60, 87, 1),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: borderColor),
      ),
    );

    return Align(
      alignment: Alignment.centerLeft,
      child: Pinput(
        // scrollPadding: EdgeInsets.all(0),
        onSubmitted: (value) {
          print(value);
        },
        length: 6,
        controller: widget.pinController,
        focusNode: focusNode,
        defaultPinTheme: defaultPinTheme,
        isCursorAnimationEnabled: false,

        // showCursor: false,
        // separatorBuilder: (index) => const ,
        validator: (value) {
          if (value!.isEmpty || value.length != 6) {
            return "fill This Filed";
          }
          return null;
        },
        cursor: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              margin: const EdgeInsets.only(bottom: 9),
              width: 22,
              height: 1,
              color: focusedBorderColor,
            ),
          ],
        ),
        focusedPinTheme: defaultPinTheme.copyWith(
          decoration: defaultPinTheme.decoration!.copyWith(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: focusedBorderColor),
          ),
        ),
        submittedPinTheme: defaultPinTheme.copyWith(
          decoration: defaultPinTheme.decoration!.copyWith(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: focusedBorderColor),
          ),
        ),
        errorPinTheme: defaultPinTheme.copyBorderWith(
          border: Border.all(color: Colors.redAccent),
        ),
      ),
    );
  }
}
