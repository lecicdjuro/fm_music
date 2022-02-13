import 'package:equatable/equatable.dart';

abstract class TracksEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class SearchEvent extends TracksEvent {
  SearchEvent({required this.searchValue});

  final String searchValue;
}
