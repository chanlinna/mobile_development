import 'package:flutter/material.dart';
import 'package:week8/EXERCISE-3/model/profile_tile_model.dart';

import '../theme/theme.dart';

class ProfileApp extends StatelessWidget {
  final ProfileData profileData;
  const ProfileApp({super.key, required this.profileData});

  // List<ProfileTile> getTiles(){
  //   return profileData.tiles.map((tile) => ProfileTile(tile: tile)).toList();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary.withAlpha(100),
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        title: const Text(
          'CADT student Profile',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 40),
            CircleAvatar(
              radius: 60,
              backgroundImage: AssetImage(
                  profileData.avatarUrl), 
            ),
            const SizedBox(height: 20),
            Text(
              profileData.name,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: const Color.fromARGB(255, 79, 78, 78),
              ),
            ),
            Text(
              profileData.position,
              style: TextStyle(
                fontSize: 16,
                color: const Color.fromARGB(255, 84, 83, 83),
              ),
            ),
            const SizedBox(height: 20),
            //...getTiles(),
            Expanded(child: ListView.builder(itemCount: profileData.tiles.length, itemBuilder: _buildTile))
          ],
        ),
      ),
    );
  }

  Widget _buildTile(BuildContext context, int index) {
    final tile = profileData.tiles[index];
    
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
        child: ListTile(
          leading: Icon(tile.icon, color: AppColors.primary),
          title: Text(tile.title),
          subtitle: Text(tile.value),
        ),
      ),
    );
  }
}

// class ProfileTile extends StatelessWidget {
//   const ProfileTile({
//     super.key,
//     required this.tile
//   });

//   final TileData tile;

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: Card(
//         margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
//         child: ListTile(
//           leading: Icon(tile.icon, color: AppColors.primary),
//           title: Text(tile.title),
//           subtitle: Text(tile.value),
//         ),
//       ),
//     );
//   }
// }
