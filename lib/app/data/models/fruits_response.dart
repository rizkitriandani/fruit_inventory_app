import 'fruit.dart';

class FruitsResponse {
  ImagesReferences? imagesReferences;
  List<Fruit>? fruits;

  FruitsResponse({this.imagesReferences, this.fruits});

  FruitsResponse.fromJson(Map<String, dynamic> json) {
    imagesReferences = json['imagesReferences'] != null
        ? ImagesReferences.fromJson(json['imagesReferences'])
        : null;
    if (json['fruits'] != null) {
      fruits = <Fruit>[];
      json['fruits'].forEach((v) {
        fruits!.add(Fruit.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (imagesReferences != null) {
      data['imagesReferences'] = imagesReferences!.toJson();
    }
    if (fruits != null) {
      data['fruits'] = fruits!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ImagesReferences {
  String? apple;
  String? manggo;
  String? banana;
  String? avocado;
  String? melon;

  ImagesReferences(
      {this.apple, this.manggo, this.banana, this.avocado, this.melon});

  ImagesReferences.fromJson(Map<String, dynamic> json) {
    apple = json['apple'];
    manggo = json['manggo'];
    banana = json['banana'];
    avocado = json['avocado'];
    melon = json['melon'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['apple'] = apple;
    data['manggo'] = manggo;
    data['banana'] = banana;
    data['avocado'] = avocado;
    data['melon'] = melon;
    return data;
  }
}


