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
                  height: 10.0,
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

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          product.name ?? '',
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 40, color: AppColors.blue),
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
          height: 30.0,
        ),
      ],
    );
  }
}

class Tableau extends StatelessWidget {
  const Tableau({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        TitleColumn(),
        Tableau2(
          label: 'Énergie',
          value100: '293 kj',
          value: '?',
          divider: true,
        ),
        Tableau2(
          label: 'Matières grasses',
          value100: '0,8 g',
          value: '?',
          divider: true,
        ),
        Tableau2(
          label: 'dont Acides gras saturés',
          value100: '0,1 g',
          value: '?',
          divider: true,
        ),
        Tableau2(
          label: 'Glucides',
          value100: '8,4 g',
          value: '?',
          divider: true,
        ),
        Tableau2(
          label: 'dont Sucres',
          value100: '5,2 g',
          value: '?',
          divider: true,
        ),
        Tableau2(
          label: 'Fibres alimentaires',
          value100: '5,2 g',
          value: '?',
          divider: true,
        ),
        Tableau2(
          label: 'Protéines',
          value100: '4,2 g',
          value: '?',
          divider: true,
        ),
        Tableau2(
          label: 'Sel',
          value100: '0,75 g',
          value: '?',
          divider: true,
        ),
        Tableau2(
          label: 'Sodium',
          value100: '0,295 g',
          value: '?',
          divider: false,
        ),
      ],
    );
  }
}

class Tableau2 extends StatelessWidget {
  final String label;
  final String value;
  final String value100;
  final bool divider;

  Tableau2({
    required this.label,
    required this.value,
    required this.value100,
    this.divider = true,
  });

  @override
  Widget build(BuildContext context) {
    if (divider == true) {
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
                  flex: 44,
                  child: Text(
                    label,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                VerticalDivider(),
                Expanded(
                  flex: 28,
                  child: Text(
                    value100,
                    textAlign: TextAlign.center,
                  ),
                ),
                VerticalDivider(),
                Expanded(
                  flex: 28,
                  child: Text(
                    value,
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
    } else {
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
                  flex: 44,
                  child: Text(
                    label,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                VerticalDivider(),
                Expanded(
                  flex: 28,
                  child: Text(
                    value100,
                    textAlign: TextAlign.center,
                  ),
                ),
                VerticalDivider(),
                Expanded(
                  flex: 28,
                  child: Text(
                    value,
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
        ],
      );
    }
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
                flex: 46,
                child: Text(
                  '',
                ),
              ),
              VerticalDivider(),
              Expanded(
                flex: 27,
                child: Text(
                  'Pour 100g',
                  style: TextStyle(fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ),
              VerticalDivider(),
              Expanded(
                flex: 27,
                child: Text(
                  'Par part',
                  style: TextStyle(fontWeight: FontWeight.bold),
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
