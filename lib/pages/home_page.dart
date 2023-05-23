import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:getx/controllers/shopping_controller.dart';

import '../controllers/cart_controller.dart';

class HomePage extends StatelessWidget {
  final shoppingController = Get.put(ShoppingController());
  final cartController = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        title: Text("Items"),
      ),
      floatingActionButton: FloatingActionButton.extended(onPressed: (){

      },
      backgroundColor: Colors.amber,
      label: GetX<CartController>(
        builder: (controller) {
          return Text(controller.count.toString(),style: TextStyle(fontSize: 18,color: Colors.black),);
        }
      ),
      icon: Icon(Icons.add_shopping_cart,color: Colors.black,),

      ),
      body: Column(
        children: [
          Expanded(
            child: GetX<ShoppingController>(
              builder: (controller) {
                return ListView.builder(
                    itemCount: controller.products.length,
                    itemBuilder: (context,index){
                  return  Card(
                    color: Colors.grey,
                    margin: const EdgeInsets.all(12),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Row(
                            mainAxisAlignment:
                            MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment:
                                CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '${controller.products[index].productName}',
                                    style: TextStyle(fontSize: 24),
                                  ),
                                  Text(
                                      '${controller.products[index].productDescription}'),
                                ],
                              ),
                              Text('\$${controller.products[index].price}',
                                  style: TextStyle(fontSize: 24)),
                            ],
                          ),
                          ElevatedButton(
                            onPressed: () {
                              cartController
                                  .addToCart(controller.products[index]);
                            },

                            child: Text('Add to Cart'),
                           ),

                          Obx(() => IconButton(
                            icon: controller
                                .products[index].isFavorite.value
                                ? Icon(Icons.check_box_rounded)
                                : Icon(Icons
                                .check_box_outline_blank_outlined),
                            onPressed: () {
                              controller.products[index].isFavorite
                                  .toggle();
                            },
                          ))
                        ],
                      ),
                    ),
                  );
                });
              }
            ),
          ),
          GetX<CartController>(
            builder: (controller) {
              return Text('Total Price: \$${controller.totalPrice}',style: TextStyle(fontSize: 24,color: Colors.green,fontWeight: FontWeight.w800),);
            }
          ),
          SizedBox(height: 100,),
        ],
      ),
    );
  }
}
