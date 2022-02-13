import 'package:equatable/equatable.dart';

class Artist extends Equatable {
  const Artist({required this.name, required this.url});

  final String name;
  final String url;

  @override
  List<Object?> get props => [name, url];

  @override
  bool? get stringify => true;
}
