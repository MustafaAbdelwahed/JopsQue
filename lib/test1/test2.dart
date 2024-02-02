// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:graduated_project/provider/provider.dart';
// import 'package:riverpod/riverpod.dart';

// // final myVariableProvider = Provider<String>((ref) {
// //   String email = ref.watch(providerr).user!.email;
// //   return email;
// // });

// class MyWidget extends ConsumerWidget {
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     // Access the value provided by myVariableProvider
//     final myVariable = ref.watch(providerr).user!.email;

//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Using WidgetRef'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text('My Variable Value: $myVariable'),
//             ElevatedButton(
//               onPressed: () {
//                 // Use WidgetRef to perform additional operations
//                 // final length = ref.read(myVariableProvider).length;
//                 print('Length of myVariable: $length');
//               },
//               child: Text('Print Length'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// void main() {
//   runApp(
//     ProviderScope(
//       child: MaterialApp(
//         home: MyWidget(),
//       ),
//     ),
//   );
// }
