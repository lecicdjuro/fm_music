abstract class TracksEvent {}

class HandleErrorEvent extends TracksEvent {
  HandleErrorEvent({required this.error});

  dynamic error;
}

class SearchEvent extends TracksEvent {
  SearchEvent({required this.searchValue});

  String searchValue;
}

