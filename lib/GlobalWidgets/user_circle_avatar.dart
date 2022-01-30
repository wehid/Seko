import 'package:flutter/material.dart';

class UserCirlceAvatar extends StatelessWidget {
  final String userImagePath;
  final double size;

  const UserCirlceAvatar(this.userImagePath, this.size);

  bool _isMemberImageEmpty() {
    if (userImagePath == null || userImagePath == "") {
      return true;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
        radius: 8 * size,
        backgroundImage:
            !_isMemberImageEmpty() ? NetworkImage(userImagePath) : null,
        backgroundColor: Colors.transparent,
        child: _isMemberImageEmpty()
            ? Icon(
                Icons.person,
                size: 11 * size,
                color: Colors.blue,
              )
            : null);
  }
}
