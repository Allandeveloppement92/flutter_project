import 'package:flutter/material.dart';
import 'package:yuka/app_colors.dart';
import 'package:yuka/res/app_product.dart';

class TableauScreen extends StatelessWidget {
  const TableauScreen({Key? key}) : super(key: key);

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
                const SizedBox(
                  height: 5.0,
                ),
                Tableau(),
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
      padding: const EdgeInsets.all(20.0),
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
        ],
      ),
    );
  }
}

class Tableau extends StatelessWidget {
  const Tableau({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          TitleColumn(),
          Line(
            label: 'Énergie',
            gramme: '293 kj',
            part: '?',
            divider: true,
          ),
          Line(
            label: 'Matières grasses',
            gramme: '0,8 g',
            part: '?',
            divider: true,
          ),
          Line(
            label: 'dont Acides gras saturés',
            gramme: '0,1 g',
            part: '?',
            divider: true,
          ),
          Line(
            label: 'Glucides',
            gramme: '8,4 g',
            part: '?',
            divider: true,
          ),
          Line(
            label: 'dont Sucres',
            gramme: '5,2 g',
            part: '?',
            divider: true,
          ),
          Line(
            label: 'Fibres alimentaires',
            gramme: '5,2 g',
            part: '?',
            divider: true,
          ),
          Line(
            label: 'Protéines',
            gramme: '4,2 g',
            part: '?',
            divider: true,
          ),
          Line(
            label: 'Sel',
            gramme: '0,75 g',
            part: '?',
            divider: true,
          ),
          Line(
            label: 'Sodium',
            gramme: '0,295 g',
            part: '?',
            divider: false,
          ),
        ],
      ),
    );
  }
}

class Line extends StatelessWidget {
  final String label;
  final String gramme;
  final String part;
  final bool divider;

  Line({
    required this.label,
    required this.gramme,
    required this.part,
    this.divider = true,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        IntrinsicHeight(
          child: Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 15.0),
              ),
              Expanded(
                flex: 60,
                child: Text(
                  label,
                  style: TextStyle(fontSize: 18, color: AppColors.blue),
                ),
              ),
              VerticalDivider(),
              Expanded(
                flex: 20,
                child: Text(
                  gramme,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 18),
                ),
              ),
              VerticalDivider(),
              Expanded(
                flex: 20,
                child: Text(
                  part,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ],
          ),
        ),
        this.divider
            ? Divider(
                indent: 10,
                endIndent: 10,
              )
            : SizedBox(),
      ],
    );
  }
}

class TitleColumn extends StatelessWidget {
  const TitleColumn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        IntrinsicHeight(
          child: Row(
            children: <Widget>[
              Expanded(
                flex: 60,
                child: Text(
                  '',
                ),
              ),
              VerticalDivider(),
              Expanded(
                flex: 20,
                child: Text(
                  'Pour 100g',
                  style: TextStyle(fontSize: 18, color: AppColors.blue),
                  textAlign: TextAlign.center,
                ),
              ),
              VerticalDivider(),
              Expanded(
                flex: 20,
                child: Text(
                  'Par part',
                  style: TextStyle(fontSize: 18, color: AppColors.blue),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
        Divider(
          indent: 10,
          endIndent: 10,
        ),
      ],
    );
  }
}
