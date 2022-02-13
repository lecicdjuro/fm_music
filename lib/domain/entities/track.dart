import 'package:equatable/equatable.dart';
import 'package:fm_music/data/models/image_model.dart';

class Track extends Equatable {
  const Track(this.id, this.name, this.artist, this.images);

  final int? id;
  final String name;
  final String artist;
  final List<ImageModel> images;

  @override
  List<Object?> get props => [name, artist, images];

  @override
  bool? get stringify => true;

  String get thumbnailImage =>
      images.firstWhere((image) => image.size == 'small').url ?? "";
}
