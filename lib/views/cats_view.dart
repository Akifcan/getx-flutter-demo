import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_app/controllers/cat_controller.dart';

class CatsView extends StatelessWidget {
  final CatController catController = Get.put(CatController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
          child: Obx(() {
            return catController.cats.length > 0
                ? ListView.builder(
                    itemCount: catController.cats.length,
                    itemBuilder: (context, index) => ExpansionTile(
                      title: Align(
                          alignment: Alignment.centerLeft,
                          child: Chip(
                              label: Text(catController.cats[index].type))),
                      children: [
                        Text(catController.cats[index].text),
                        Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                                'From: ${catController.cats[index].user.name.first}'))
                      ],
                    ),
                  )
                : Center(child: CircularProgressIndicator());
          })),
    );
  }
}
