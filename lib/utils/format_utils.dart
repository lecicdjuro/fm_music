const int oneThousand = 1000;
const int oneMillion = 1000000;

class FormatUtils {
  ///format number over one thousand to be displayed with 'k' suffix
  static String formatLikesAndRepliesCount(int? value) {
    if (value == null) {
      return '/';
    }
    String number = '';
   if (value >= oneThousand) {
      final int mod = value % oneThousand;
      if (mod == 0) {
        number = '${(value / oneThousand).toStringAsFixed(0)}k';
      } else if (mod < 99) {
        number = '${(value / oneThousand).round().toStringAsFixed(0)}k';
      } else {
        final List<String> numbers =
            (value / oneThousand).toString().split('.');
        String decimal = '';
        if (numbers.length > 1) {
          decimal = numbers.elementAt(1)[0];
        }
        if (decimal != '0') {
          number = '${numbers.elementAt(0)}.${decimal}k';
        } else {
          number = '${numbers.elementAt(0)}k';
        }
      }
    } else {
      number = value.toString();
    }
    return number;
  }
}
