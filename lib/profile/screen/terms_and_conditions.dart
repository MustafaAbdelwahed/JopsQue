import 'package:flutter/material.dart';

class TermsAndConditionsScreen extends StatelessWidget {
  const TermsAndConditionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Terms & Conditions "),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                "Thank you very much",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              const Text(
                "The customer is very important, the customer will be followed by the customer. In fact, even if it's advertising, it's important to have a cartoon employee. Now who should drink the medicine? Donec feugiat massa mi, at hendrerit mauris rutrum at The customer is very important, the customer will be followed by the customer. In fact, even if it's advertising, it's important to have a cartoon employee. Now who should drink the medicine? Donec feugiat massa mi, at hendrerit mauris rutrum at The customer is very important, the customer will be followed by the customer. In fact, even if it's advertising, it's important to have a cartoon employee. Now who should drink the medicine? Donec feugiat massa mi, at hendrerit mauris rutrum at",
                style: TextStyle(
                  fontSize: 14,
                  color: Color(0xff6B7280),
                ),
                strutStyle: StrutStyle(height: 1.3),
              ),
              const SizedBox(
                height: 17,
              ),
              const Text(
                "Lorem ipsum dolor",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              const Text(
                "Now who should drink the medicine? Donec feugiat massa mi, at hendrerit mauris rutrum at The customer is very important, the customer will be followed by the customer.",
                style: TextStyle(
                  fontSize: 14,
                  color: Color(0xff6B7280),
                ),
                strutStyle: StrutStyle(height: 1.3),
              ),
              const SizedBox(
                height: 17,
              ),
              Container(
                padding: const EdgeInsets.all(10),
                color: const Color(0xffF4F4F5),
                child: const Text(
                  "Nunc quis bibendum orci. Donec feugiat massa mi, at hendrerit mauris rutrum at. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam vel augue sit amet est molestie viverra. Nunc quis bibendum orci. Donec feugiat massa mi, at hendrerit mauris rutrum at. ",
                  style: TextStyle(
                    fontSize: 14,
                    color: Color(0xff6B7280),
                  ),
                  strutStyle: StrutStyle(height: 1.3),
                ),
              ),
              const Text(
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam vel augue sit amet est molestie viverra. Nunc quis bibendum orci. Donec feugiat massa mi, at hendrerit mauris rutrum at. ",
                style: TextStyle(
                  fontSize: 14,
                  color: Color(0xff6B7280),
                ),
                strutStyle: StrutStyle(height: 1.3),
              )
            ],
          ),
        ),
      ),
    );
  }
}
