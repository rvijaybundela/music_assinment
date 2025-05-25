// import 'package:flutter/material.dart';
// import '../repositories/music_repository.dart';
// import '../viewmodels/songs_viewmodel.dart';
//
// class SongsView extends StatelessWidget {
//   const SongsView({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     final viewModel = SongsViewModel(MusicRepository());
//
//     return Scaffold(
//       backgroundColor: Colors.black,
//       appBar: AppBar(
//         title: const Text('Music Production Songs'),
//         backgroundColor: const Color.fromRGBO(169, 1, 64, 1),
//       ),
//       body: ListView.separated(
//         padding: const EdgeInsets.all(16),
//         itemCount: viewModel.songs.length,
//         separatorBuilder: (_, __) => const Divider(color: Colors.white24),
//         itemBuilder: (context, index) {
//           final song = viewModel.songs[index];
//           return ListTile(
//             leading: const Icon(Icons.music_note, color: Colors.white),
//             title: Text(song, style: const TextStyle(color: Colors.white)),
//             onTap: () {
//               ScaffoldMessenger.of(context).showSnackBar(
//                 SnackBar(content: Text('Playing: $song (demo)')),
//               );
//             },
//           );
//         },
//       ),
//     );
//   }
// }
