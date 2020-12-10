import 'package:get/get.dart';
import 'package:get_app/models/product_model.dart';

class ShoppingController extends GetxController {
  RxList products = List<Product>().obs;
  RxBool loader = true.obs;

  @override
  void onInit() {
    super.onInit();
    print(loader);
    fetchProducts();
  }

  void fetchProducts() async {
    await Future.delayed(Duration(seconds: 1));

    var productResult = [
      Product(
          id: 1,
          price: 30,
          productDescription: 'some description about product',
          productImage: 'abd',
          productName: 'FirstProd'),
      Product(
          id: 2,
          price: 40,
          productDescription: 'some description about product',
          productImage: 'abd',
          productName: 'SecProd'),
      Product(
          id: 3,
          price: 49.5,
          productDescription: 'some description about product',
          productImage: 'abd',
          productName: 'ThirdProd'),
    ];

    products.value = productResult;
    loader.value = false;
  }
}
