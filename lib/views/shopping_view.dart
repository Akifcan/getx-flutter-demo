import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_app/controllers/card_controller.dart';
import 'package:get_app/controllers/shopping_controller.dart';
import 'package:get_app/theme/theme.dart';
import 'package:get_app/views/cart_view.dart';

class ShoppingView extends StatelessWidget {
  final ShoppingController shoppingController = Get.put(ShoppingController());
  final CartController cartController = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.changeTheme(
              Get.isDarkMode ? ThemeData.light() : ThemeData.dark());
        },
        child: Icon(Icons.charging_station_rounded),
      ),
      body: Column(
        children: [
          Expanded(child: GetX<ShoppingController>(
            builder: (controller) {
              return controller.loader == true
                  ? Center(child: CircularProgressIndicator())
                  : ListView.builder(
                      itemCount: controller.products.length,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 10),
                          padding: const EdgeInsets.all(20),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    controller.products[index].productName,
                                    style:
                                        Theme.of(context).textTheme.headline5,
                                  ),
                                  Text(
                                    controller
                                        .products[index].productDescription,
                                    style:
                                        Theme.of(context).textTheme.subtitle1,
                                  )
                                ],
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                      '\$${controller.products[index].price.toStringAsFixed(2)}',
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline6),
                                  RaisedButton(
                                      color: Colors.blue,
                                      onPressed: () {
                                        Get.snackbar(
                                            'okey'.tr, 'addedToBasket'.tr);

                                        cartController.addToCart(
                                            controller.products[index]);
                                      },
                                      child: Text('Add To Cart',
                                          style:
                                              TextStyle(color: Colors.white)))
                                ],
                              )
                            ],
                          ),
                        );
                      },
                    );
            },
          )),
          GetX<CartController>(
            builder: (controller) {
              return Column(
                children: [
                  Wrap(
                    spacing: 5,
                    children: [
                      Text('totalAmount'.tr),
                      Text(controller.totalPrice.toString())
                    ],
                  ),
                  Wrap(
                    spacing: 5,
                    children: [
                      Text('totalProduct'.tr),
                      Text(controller.totalPrice.toString())
                    ],
                  ),
                ],
              );
            },
          ),
          RaisedButton(
              onPressed: () {
                Get.toNamed('/cart');
              },
              child: Text('go to cart')),
          SizedBox(height: MediaQuery.of(context).size.height * 0.1)
        ],
      ),
    );
  }
}
