import 'package:flutter/material.dart';
import 'package:product_scoped_model_app/models/product.dart';
import 'package:product_scoped_model_app/models/rating_box.dart';
import 'package:scoped_model/scoped_model.dart';

class ProductBox extends StatelessWidget {
  ProductBox({Key key, this.item}) : super(key: key);
  final Product item;
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(2),
        height: 140,
        child: Card(
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                //Image.asset("assets/appimages/" + this.item.image),
                Expanded(
                    child: Container(
                        padding: EdgeInsets.all(5),
                        child: ScopedModel<Product>(
                            model: this.item,
                            child: Column(
                              mainAxisAlignment:
                              MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                Text(this.item.name,
                                    style:
                                    TextStyle(fontWeight:
                                    FontWeight.bold)),
                                Text(this.item.description),
                                Text("Price: " +
                                    this.item.price.toString()),
                                ScopedModelDescendant<Product>(
                                    builder: (context, child, item) {
                                      return RatingBox(item: item);
                                    })
                              ],
                            ))))
              ]),
        ));
  }
}