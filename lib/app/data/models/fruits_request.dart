class FruitsRequest {
  Data? data;

  FruitsRequest({this.data});

  FruitsRequest.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  bool? imageReferences;
  String? referenceId;

  Data({this.imageReferences, this.referenceId});

  Data.fromJson(Map<String, dynamic> json) {
    imageReferences = json['imageReferences'];
    referenceId = json['referenceId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['imageReferences'] = imageReferences;
    data['referenceId'] = referenceId;
    return data;
  }
}
