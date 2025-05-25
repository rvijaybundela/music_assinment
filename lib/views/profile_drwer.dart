// import 'package:flutter/material.dart';
//
// class ProfileDrawer extends StatelessWidget {
//   final String userName = 'John Doe';
//   final String userEmail = 'john.doe@example.com';
//
//   @override
//   Widget build(BuildContext context) {
//     return Drawer(
//       backgroundColor: const Color.fromRGBO(20, 20, 20, 1),
//       child: SafeArea(
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               const CircleAvatar(
//                 radius: 40,
//                 backgroundColor: Colors.white24,
//                 child: Icon(Icons.person, size: 40, color: Colors.white),
//               ),
//               const SizedBox(height: 20),
//               Text(
//                 userName,
//                 style: const TextStyle(color: Colors.white, fontSize: 20),
//               ),
//               const SizedBox(height: 4),
//               Text(
//                 userEmail,
//                 style: const TextStyle(color: Colors.white70, fontSize: 14),
//               ),
//               const Spacer(),
//               ListTile(
//                 leading: const Icon(Icons.logout, color: Colors.white70),
//                 title: const Text('Logout', style: TextStyle(color: Colors.white)),
//                 onTap: () {
//                   Navigator.of(context).pop();
//                   ScaffoldMessenger.of(context).showSnackBar(
//                     const SnackBar(content: Text('Logged out (demo)')),
//                   );
//                 },
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
