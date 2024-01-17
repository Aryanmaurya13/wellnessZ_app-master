import 'dart:io';

abstract class Services {
  // Future<Map<String, String>> getHeaders();

  Future<dynamic> getHttpMethod({header, required String? url});

  Future<dynamic> postHttpMethod({String? url, Map<String, dynamic>? data});

  Future<dynamic> patchHttpMethod({String? url, Map<String, dynamic>? data});

  Future<dynamic> putHttpMethod({String? url, Map<String, dynamic>? data});

  Future<dynamic> deleteHttpMethod({String? url});

  Future<dynamic> formHttpMethod(
      {String? methodType,
      String? url,
      Map<String, String>? data,
      File? singleFile,
      // File? singleFile2,
      String? singleFileKey,
      // String? singleFileKey2,
      List<File>? multipleFile,
      List<String>? multipleFileKeysList,
      String? multipleFileKey});
}
