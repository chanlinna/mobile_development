import 'package:flutter/material.dart';

import 'ui/screens/profile.dart';
import 'data/profile_data.dart';
 
void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: ProfileApp(profileData: ronanProfile),
  ));
}
