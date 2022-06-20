import 'package:flutter/material.dart';

import 'image_with_progress.dart';

class UserCirlceAvatar extends StatelessWidget {
  final String userImagePath;
  // final double size;

  const UserCirlceAvatar(this.userImagePath);

  bool _isMemberImageEmpty() {
    if (userImagePath == null || userImagePath == "") {
      return true;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(200)),
      child: _isMemberImageEmpty()
          ? Icon(
              Icons.person,
              color: Colors.blue,
            )
          : ImageWithProgress(userImagePath),
    );
  }
}
