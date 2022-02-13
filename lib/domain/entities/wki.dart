import 'package:equatable/equatable.dart';

class Wiki extends Equatable {
  const Wiki({required this.published});

  final String published;

  @override
  List<Object?> get props => [published];

  @override
  bool? get stringify => true;
}
