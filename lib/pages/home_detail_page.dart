import 'package:flutter/material.dart';
import 'package:flutter_catalog/models/catalog.dart';
import 'package:flutter_catalog/widgets/home_widgets/add_to_cart.dart';
import 'package:velocity_x/velocity_x.dart';

class HomeDetailPage extends StatelessWidget {
  const HomeDetailPage({super.key, required this.catalog});

  final Item catalog;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: context.canvasColor,
      bottomNavigationBar: Container(
        color: context.cardColor,
        child: ButtonBar(
          alignment: MainAxisAlignment.spaceBetween,
          buttonPadding: EdgeInsets.zero,
          children: [
            "\$${catalog.price}".text.bold.xl4.red800.make(),
            AddToCart(
              catalog: catalog,
            ).wh(120, 50),
          ],
        ).p32(),
      ),
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Hero(
              tag: Key(catalog.id.toString()),
              child: Image.network(catalog.image),
            ).h32(context),
            Expanded(
              child: VxArc(
                height: 30.0,
                arcType: VxArcType.convey,
                edge: VxEdge.top,
                child: Container(
                  color: context.cardColor,
                  width: context.screenWidth,
                  child: Column(
                    children: [
                      catalog.name.text.xl4
                          .color(context.theme.primaryColor)
                          .bold
                          .make(),
                      catalog.desc.text
                          .textStyle(context.captionStyle)
                          .xl
                          .make(),
                      "Sadipscing amet ipsum erat rebum aliquyam labore. Gubergren dolore ut gubergren stet lorem stet, et duo no et at clita rebum, et labore et stet et takimata. Ipsum dolores nonumy elitr justo sadipscing dolor sed clita amet, sanctus kasd est ea dolore amet lorem sadipscing dolores. Dolor ea accusam magna".text.textStyle(context.captionStyle).make().p16(),
                    ],
                  ).py64(),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
