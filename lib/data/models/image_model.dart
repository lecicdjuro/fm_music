import 'package:fm_music/domain/entities/image.dart';


class ImageModel extends Image {
  const ImageModel({required String? url, required String? size})
      : super(url: url, size: size);

  factory ImageModel.fromJson(Map<String, dynamic> json) {
    return ImageModel(
      url: json['#text'] as String?,
      size: json['size'] as String?,
    );
  }
}
