import 'package:flutter/material.dart';
import 'package:yuka/app_colors.dart';
import 'package:yuka/res/app_product.dart';

class CaracteristiquesScreen extends StatelessWidget {
  const CaracteristiquesScreen({Key? key}) : super(key: key);

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
        ColoredBox(
          color: AppColors.gray1,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Text(
                'Ingrédients',
                style: TextStyle(
                    fontSize: 20,
                    color: AppColors.blue,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class ProductFields extends StatelessWidget {
  const ProductFields({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      //mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ProductField(
            label: 'Légumes',
            value: 'petits pois 41%, carottes 22%',
            divider: true,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ProductField(
            label: 'Eau',
            value: '',
            divider: true,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ProductField(
            label: 'Sucre',
            value: '',
            divider: true,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ProductField(
            label: 'Garniture (2,5%)',
            value: 'Salade, oignon grelot',
            divider: true,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ProductField(
            label: 'Sel',
            value: '',
            divider: true,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ProductField(
            label: 'Arômes naturels',
            value: '',
            divider: false,
          ),
        ),
        const SizedBox(
          height: 40,
        ),
        ColoredBox(
          color: AppColors.gray1,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Text(
                'Substances allergènes',
                style: TextStyle(
                    //backgroundColor: AppColors.blue,
                    fontSize: 20,
                    color: AppColors.blue,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
        Padding(
          padding:
              const EdgeInsets.only(left: 8, right: 8, top: 25, bottom: 25),
          child: ProductField(
            label: 'Aucune',
            value: '',
            divider: false,
          ),
        ),
        ColoredBox(
          color: AppColors.gray1,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Text(
                'Additifs',
                style: TextStyle(
                    fontSize: 20,
                    color: AppColors.blue,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8, right: 8, top: 25, bottom: 8),
          child: ProductField(
            label: 'Aucune',
            value: '',
            divider: true,
          ),
        ),
      ],
    );
  }
}

class ProductField extends StatelessWidget {
  final String label;
  final String value;
  final bool divider;

  ProductField({
    required this.label,
    required this.value,
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
                flex: 40,
                child: Text(
                  label,
                  style: TextStyle(
                    fontSize: 18,
                    color: AppColors.blue,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Expanded(
                flex: 60,
                child: Text(
                  value,
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
