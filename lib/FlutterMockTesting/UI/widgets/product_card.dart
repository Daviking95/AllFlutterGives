import 'package:all_flutter_gives/FlutterMockTesting/UI/widgets/product_image.dart';
import 'package:all_flutter_gives/FlutterMockTesting/core/models/product.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  const ProductCard(this.product);

  final Product product;

  List<Widget> _getProductDetails(BuildContext context) {
    return [
      Text(product.name, maxLines: 2, style: Theme.of(context).textTheme.headline1),
      Row(
        children: <Widget>[
          Text('\$${product.price.toString()}.00',
              style: Theme.of(context).textTheme.subtitle1),
          IconButton(
            icon: Icon(Icons.add_shopping_cart),
            color: Colors.grey,
            onPressed: () {},
          )
        ],
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 6.0),
      child: Container(
        height: 150.0,
        decoration: BoxDecoration(color: Colors.white),
        child: ListTile(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: _getProductDetails(context)),
                ),
              ),
              VerticalDivider(),
              ProductImage(product.imageUrl)
            ],
          ),
        ),
      ),
    );
  }
}
