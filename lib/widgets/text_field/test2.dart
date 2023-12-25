// import 'package:flutter/material.dart';
// import 'package:graduated_project/widgets/custom_elvated_button.dart';

// import 'custom_textfield_pass.dart';

// class test2 extends StatelessWidget {
//   test2({super.key});
//   final TextEditingController _passwordController = TextEditingController();
//   final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Form(
//             key: _formKey,
//             child: CustomeTextFieldPAss(
//                 textInputType: TextInputType.visiblePassword,
//                 controller: _passwordController,
//                 prefixIcons: Icons.lock_outline_rounded,
//                 suffixIcons: Icons.visibility_off,
//                 hintext: "Password",
//                 isPass: true),
//           ),
//           SizedBox(
//             height: 20,
//           ),
//           CustomElvatedButton(
//               onpress: () {
//                 if (!_formKey.currentState!.validate()) {
//                   return;
//                 }
//               },
//               color: Colors.transparent)
//         ],
//       ),
//     );
//   }
// }
