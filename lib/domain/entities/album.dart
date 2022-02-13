import 'package:equatable/equatable.dart';
import 'package:fm_music/domain/entities/image.dart';

class Album extends Equatable {
  const Album(
      {required this.name, required this.artistName, required this.images});

  final String name;
  final String artistName;
  final List<Image> images;

//assume that all albums have medium images
  String get coverImage =>
      images.firstWhere((image) => image.size == 'medium').url ?? "https://upload.wikimedia.org/wikipedia/commons/thumb/a/ac/No_image_available.svg/600px-No_image_available.svg.png?20190827162820";

  @override
  List<Object?> get props => [name, artistName, images];

  @override
  bool? get stringify => true;
}
