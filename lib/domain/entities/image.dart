import 'package:equatable/equatable.dart';

class Image extends Equatable {
  const Image({required this.url, required this.size});

  final String? url;
  final String? size;

  @override
  List<Object?> get props => [url, size];
}
