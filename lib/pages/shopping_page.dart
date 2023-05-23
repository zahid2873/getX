import 'package:flutter/material.dart';

class ShoppingHomePage extends StatelessWidget {
  const ShoppingHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: (){},
          icon: Icon(Icons.arrow_back_ios,color: Colors.black,),
        ),
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.shopping_cart,color: Colors.black,)),
        ],
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('ShopZ',style: TextStyle(fontSize: 32,fontFamily: 'avenir',fontWeight: FontWeight.w900),),
                Row(
                  children: [
                    IconButton(onPressed: (){}, icon: Icon(Icons.view_list_rounded)),
                    IconButton(onPressed: (){}, icon: Icon(Icons.grid_view)),
                  ],
                )
              ],
            ),
            Expanded(
              child: GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 4,
                crossAxisSpacing: 4,
                childAspectRatio: 1,
              ),
                  itemCount: 20,
                  itemBuilder: (context,index){
                return Container(
                  color: Colors.green,
                );
              }),
            )
          ],
        ),
      ),
    );
  }
}
