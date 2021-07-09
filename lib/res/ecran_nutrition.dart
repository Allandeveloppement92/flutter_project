import 'package:flutter/material.dart';
import 'package:yuka/app_colors.dart';
import 'package:yuka/res/app_product.dart';

class NutritionScreen extends StatelessWidget {
  const NutritionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color primaryColor = Theme.of(context).primaryColor;
    Product product = Product(
      barcode: '12345678',
      name: 'Petits pois et carottes',
      brands: <String>['Cassegrain'],
    );

    return Scaffold(
      body: SizedBox.expand(
        child: ProductHolder(
          product: product,
          child: Stack(
            children: <Widget>[
              ProductImage(),
              AppBar(
                elevation: 0.0,
                backgroundColor: AppColors.trans,
              ),
              Positioned(
                left: 0.0,
                right: 0.0,
                top: 250.0,
                bottom: 0.0,
                child: ProductDetails(),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ProductImage extends StatelessWidget {
  const ProductImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 500.0,
      child: Image.network(
        'https://images.unsplash.com/photo-1506084868230-bb9d95c24759?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=334&q=80',
        fit: BoxFit.cover,
      ),
    );
  }
}

class ProductDetails extends StatelessWidget {
  const ProductDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const BorderRadius borderRadius = BorderRadius.only(
      topLeft: Radius.circular(16.0),
      topRight: Radius.circular(16.0),
    );

    return Container(
      decoration: const BoxDecoration(
        color: AppColors.white,
        borderRadius: borderRadius,
      ),
      child: SingleChildScrollView(
        child: ClipRRect(
          borderRadius: borderRadius,
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 10.0,
              vertical: 20.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                ProductTitle(),
                const SizedBox(
                  height: 10.0,
                ),
                ProductFields(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ProductHolder extends InheritedWidget {
  final Product product;

  const ProductHolder({
    required this.product,
    required Widget child,
    Key? key,
  }) : super(key: key, child: child);

  static ProductHolder? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<ProductHolder>();
  }

  @override
  bool updateShouldNotify(ProductHolder old) => product != old.product;
}

class ProductTitle extends StatelessWidget {
  const ProductTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Product? product = ProductHolder.of(context)?.product;

    if (product == null) {
      return SizedBox();
    }

    return Padding(
      padding: const EdgeInsets.only(right: 20, left: 20, top: 20, bottom: 12),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            product.name ?? '',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 40,
                color: AppColors.blue),
          ),
          const SizedBox(
            height: 8.0,
          ),
          Text(
            product.brands?.join(',') ?? '',
            style: TextStyle(
              color: AppColors.gray2,
              fontSize: 20,
            ),
          ),
          const SizedBox(
            height: 14.0,
          ),
          Center(
            child: Text(
              'Repères nutritionnels pour 100g',
              style: TextStyle(
                fontSize: 20,
                color: Colors.grey,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ProductFields extends StatelessWidget {
  const ProductFields({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20, left: 20, top: 0, bottom: 0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ProductField(
              label: 'Matières grasses / lipides',
              gramme: '0,8g',
              texte: 'Faible quantité',
              divider: true,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ProductField(
              label: 'Acides gras saturés',
              gramme: '0,1g',
              texte: 'Faible quantité',
              divider: true,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ProductField(
              label: 'Sucres',
              gramme: '5,2g',
              texte: 'Quantité modérée',
              divider: true,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ProductField(
              label: 'Sel',
              gramme: '0,75g',
              texte: 'Quantité élevée',
              divider: false,
            ),
          ),
        ],
      ),
    );
  }
}

class ProductField extends StatelessWidget {
  final String label;
  final String gramme;
  final String texte;
  final bool divider;

  ProductField({
    required this.label,
    required this.gramme,
    required this.texte,
    this.divider = true,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: <Widget>[
              Expanded(
                flex: 50,
                child: Text(
                  label,
                  style: TextStyle(
                    fontSize: 18,
                    color: AppColors.blue,
                  ),
                ),
              ),
              Expanded(
                flex: 25,
                child: Text(
                  gramme,
                  textAlign: TextAlign.end,
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.grey,
                  ),
                ),
              ),
              Expanded(
                flex: 25,
                child: Text(
                  texte,
                  textAlign: TextAlign.end,
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.grey,
                  ),
                ),
              ),
            ],
          ),
        ),
        this.divider ? Divider() : SizedBox(),
      ],
    );
  }
}
