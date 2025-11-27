import 'package:flutter/material.dart';

import 'EXERCISE-3/ui/screens/profile.dart';
import 'EXERCISE-3/data/profile_data.dart';
 
void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: ProfileApp(profileData: ronanProfile),
  ));
}
