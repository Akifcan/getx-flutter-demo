import 'package:get/get.dart';

class Messages extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': {
          'totalAmount': 'Total Amount',
          'totalProduct': 'Total Item',
          'addedToBasket': 'Added to basket! 🛒 ',
          'okey': 'Okey'
        },
        'tr_TR': {
          'totalAmount': 'Toplam Bakiye',
          'totalProduct': 'Toplam ürün',
          'addedToBasket': 'sepete eklendi! 🛒',
          'okey': 'Tamam!'
        }
      };
}
