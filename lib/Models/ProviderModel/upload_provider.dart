import 'package:flutter/material.dart';
import 'dart:convert';

import 'package:file_picker/file_picker.dart';

import '../../Services/api.dart';
import '../ObjectModels/upload_response.dart';
import '../../constants.dart';

enum TypeOfFile {
  document,
  image,
}

enum TypeOfTable {
  users,
  teams,
  clubs,
  config,
}

extension PareseToStringFile on TypeOfFile {
  String toShortString() {
    return this.toString().split(".").last;
  }
}

extension PareseToStringTable on TypeOfTable {
  String toShortString() {
    return this.toString().split(".").last;
  }
}

String _makeFileUrl(String uploadUrl) {
  return "https://$BASE_URL${uploadUrl.substring(1)}";
}

class UploadProvider with ChangeNotifier {
  bool _isLoading = false;
  UploadResponse _response;
  String _fileUrl;
  String _fileName;

  Future<String> _pickFile(bool isImage) async {
    List<PlatformFile> _files;

    _files = (await FilePicker.platform.pickFiles(
      allowMultiple: false,
      type: isImage ? FileType.image : FileType.any,
      allowedExtensions: null,
    ))
        .files;

    print("picked file path is: ${_files.first.path}");
    return _files.first.path;
  }

  Future<void> _upload({
    @required String userToken,
    @required TypeOfFile typeOfFile,
    @required TypeOfTable typeOfTable,
    id,
  }) async {
    _isLoading = true;

    var filePath = await _pickFile(typeOfFile == TypeOfFile.image);

    String uploadResultString = await Api().uploadFile(filePath, userToken,
        typeOfFile.toShortString(), typeOfTable.toShortString(), id);

    // TODO: DELTE PRINT
    print(uploadResultString);

    _response = UploadResponse.fromJson(json.decode(uploadResultString));

    _fileUrl = _makeFileUrl(_response.path);
    print("in upload, file url is: $_fileUrl");
    _fileName = _response.fileName;
    print("in upload, file name is: $_fileName");

    _isLoading = false;
    notifyListeners();
  }

  Future uploadUserPhoto(String userToken) async {
    _upload(
      userToken: userToken,
      typeOfFile: TypeOfFile.image,
      typeOfTable: TypeOfTable.users,
    );
    notifyListeners();
  }

  Future<void> uploadTeamFile(String userToken, String teamId) async {
    _upload(
      userToken: userToken,
      typeOfFile: TypeOfFile.document,
      typeOfTable: TypeOfTable.teams,
      id: teamId,
    );
  }

  Future<void> uploadClubFile(String userToken, String clubeId) async {
    _upload(
      userToken: userToken,
      typeOfFile: TypeOfFile.document,
      typeOfTable: TypeOfTable.clubs,
      id: clubeId,
    );
  }

  void emptyUploadItems() {
    _isLoading = false;
    _response = null;
    _fileName = null;
    _fileUrl = null;
  }

  bool get isLoading => _isLoading;

  UploadResponse get uploadResponse => _response;

  String get fileUrl => _fileUrl;

  String get fileName => _fileName;
}
