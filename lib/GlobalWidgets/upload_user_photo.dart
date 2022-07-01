import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'user_circle_avatar.dart';
import '../Models/ProviderModel/user_provider.dart';
import '../Models/ProviderModel/upload_provider.dart';

class UploadUserPhoto extends StatefulWidget {
  final String currentUserPhotoUrl;

  UploadUserPhoto(this.currentUserPhotoUrl);
  @override
  State<UploadUserPhoto> createState() => _UploadUserPhotoState();
}

class _UploadUserPhotoState extends State<UploadUserPhoto> {
  // String userPhotoPath;
  String userToken;
  UploadProvider uploadProvider;

  @override
  void initState() {
    userToken = Provider.of<UserProvider>(context, listen: false).token;
    Provider.of<UploadProvider>(context, listen: false).emptyUploadItems();
    super.initState();
  }

  @override
  void didChangeDependencies() {
    uploadProvider = Provider.of<UploadProvider>(context);
    print("in upload photo for register, did change dependencies rebuild");
    super.didChangeDependencies();
  }

  void _chosePhoto() {
    print("in registering, upload photo started");
    uploadProvider.uploadUserPhoto(userToken);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          child: uploadProvider.isLoading
              ? Center(child: CircularProgressIndicator())
              : UserCirlceAvatar(
                  uploadProvider.fileUrl ?? widget.currentUserPhotoUrl),
          width: 130,
          height: 130,
        ),
        Positioned(
          bottom: 0,
          right: 0,
          child: Container(
            decoration:
                BoxDecoration(shape: BoxShape.circle, color: Colors.red),
            child: IconButton(
              icon: Icon(
                Icons.camera_alt_outlined,
                color: Colors.white,
                size: 25,
              ),
              onPressed: _chosePhoto,
            ),
          ),
        ),
      ],
    );

    // return Container(
    //   height: 100,
    //   child: Row(
    //     mainAxisAlignment: MainAxisAlignment.spaceAround,
    //     children: [
    //       uploadProvider.isLoading
    //           ? Center(child: CircularProgressIndicator())
    //           : SekoButton(
    //               buttonString: "وێنەکەت هەڵبژێرە",
    //               backgroundColor: Colors.blue,
    //               buttonIcon: Icons.photo_camera_front_outlined,
    //               textColor: Colors.white,
    //               textSize: 18,
    //               iconSize: 25,
    //               onPressed: _uploadPhoto,
    //             ),
    //       const SizedBox(width: 10),
    //       Container(
    //           child: Center(child: UserCirlceAvatar(uploadProvider.fileUrl))),
    //     ],
    //   ),
    // );
  }
}
