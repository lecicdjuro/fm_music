import 'package:flutter_test/flutter_test.dart';
import 'package:fm_music/utils/format_utils.dart';

void main() {
  test('test  track duration format', () {
    const int trackDurationInMilliseconds = 71700;
    String trackDuration =
        FormatUtils.formatTrackDurationString(trackDurationInMilliseconds);

    expect(trackDuration, '1:11');
  });
  test('test listeners number format', () {
    const int listeners = 757200;
    String trackDuration =
        FormatUtils.formatNumber(listeners);

    expect(trackDuration, '757.2k');
  });
}
