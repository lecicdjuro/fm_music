import 'package:fm_music/domain/entities/wki.dart';

class WikiModel extends Wiki {
  const WikiModel({required String published}) : super(published: published);

  factory WikiModel.fromJson(Map<String, dynamic> json) {
    return WikiModel(
      published: json['published'] as String,
    );
  }
}
