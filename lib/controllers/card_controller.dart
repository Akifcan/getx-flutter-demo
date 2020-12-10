import 'package:get/get.dart';
import 'package:get_app/models/product_model.dart';

class CartController extends GetxController {
  RxList cartItems = List<Product>().obs;
  int get totalItem => cartItems.length;
  double get totalPrice =>
      cartItems.fold(0, (sum, current) => sum + current.price);

  @override
  void onInit() {
    super.onInit();
  }

  addToCart(Product product) {
    cartItems.add(product);
  }
}
