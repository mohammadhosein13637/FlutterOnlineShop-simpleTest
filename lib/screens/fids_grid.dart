import 'package:flutter/material.dart';
import 'package:store_api_flutter_course/models/products_model.dart';

import '../widget/feeds_widget.dart';

class FeedsGridWidget extends StatelessWidget {
  const FeedsGridWidget({Key? key, required this.productsList}) : super(key: key);
  final List<productsModel> productsList;
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: 3,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 0.0,
            mainAxisSpacing: 0.0,
            childAspectRatio: 0.6),
        itemBuilder: (ctx, index) {
          return  FeedsWidget(
            imageUrl: productsList[index].images![0],
            title: productsList[index].title.toString(),
            
          );
        });
  }
}
