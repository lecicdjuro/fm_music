class TrackRequestParams {
  const TrackRequestParams({
    required this.method,
    this.track,
    this.artist,
  });

  final String method;
  final String? track;
  final String? artist;
}
