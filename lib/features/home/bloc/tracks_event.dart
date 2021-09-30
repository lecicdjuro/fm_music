abstract class TracksEvent {}

class SearchEvent extends TracksEvent {
  SearchEvent({required this.searchValue});

  String searchValue;
}

