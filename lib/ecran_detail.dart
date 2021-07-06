import 'package:flutter/material.dart';
import 'package:yuka/app_colors.dart';
import 'package:yuka/app_icons.dart';
import 'package:yuka/res/app_product.dart';
import 'package:yuka/res/resources.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color primaryColor = Theme.of(context).primaryColor;
    Product product = Product(
      barcode: '12345678',
      name: 'Petits pois et carotes',
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
                ProductInfo(),
                const SizedBox(
                  height: 10.0,
                ),
                ProductFields(),
                ButtonsVeg(),
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
          height: 14.0,
        ),
        Text(
          'Petits pois et carottes à l\'étuvés avec garniture',
          style: TextStyle(
            fontSize: 20,
            color: Colors.grey,
          ),
        ),
        const SizedBox(
          height: 25.0,
        ),
      ],
    );
  }
}

class ProductInfo extends StatelessWidget {
  const ProductInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: AppColors.gray1,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ProductInfoLine1(),
          Divider(),
          ProductInfoLine2(),
        ],
      ),
    );
  }
}

class ProductInfoLine1 extends StatelessWidget {
  const ProductInfoLine1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Expanded(
            flex: 45,
            child: ProductInfoNutriScore(),
          ),
          Divider(),
          Expanded(
            flex: 55,
            child: ProductInfoNova(),
          ),
        ],
      ),
    );
  }
}

class ProductInfoNutriScore extends StatelessWidget {
  const ProductInfoNutriScore({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            'Nutri-Score',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: AppColors.blue,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset(
            AppImages.nutriscoreA,
            width: 90,
          ),
        ),
      ],
    );
  }
}

class ProductInfoNova extends StatelessWidget {
  const ProductInfoNova({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            'Groupe Nova',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: AppColors.blue,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            'Produits alimentaires et boissons ultra-transformées ',
            style: TextStyle(
              fontSize: 15,
              color: AppColors.gray2,
            ),
          ),
        ),
      ],
    );
  }
}

class ProductInfoLine2 extends StatelessWidget {
  const ProductInfoLine2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'EcoScore',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: AppColors.blue,
              ),
            ),
          ),
          Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(
                  AppIcons.ecoscoreD,
                  color: AppColors.nutriscoreD,
                ),
              ),
              const SizedBox(
                width: 10.0,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Impact environnemental élevé',
                    style: TextStyle(
                      fontSize: 15,
                      color: AppColors.gray2,
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class ProductFields extends StatelessWidget {
  const ProductFields({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ProductField(
            label: 'Quantité',
            value: '200g (égoutté 130g)',
            divider: true,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ProductField(
            label: 'Vendu',
            value: 'France',
            divider: false,
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
                // flex: 1,
                child: Text(
                  label,
                  style: TextStyle(
                    fontSize: 18,
                    color: AppColors.blue,
                  ),
                ),
              ),
              Expanded(
                // flex: 1,
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
        Divider(),
      ],
    );
  }
}

class ButtonsVeg extends StatelessWidget {
  const ButtonsVeg({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Expanded(
          child: VegetalienButton(),
        ),
        const SizedBox(
          width: 100.0,
        ),
        Expanded(
          child: VegetarienButton(),
        ),
      ],
    );
  }
}

class VegetalienButton extends StatelessWidget {
  const VegetalienButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {},
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 10.0,
          vertical: 0.0,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const Icon(
              Icons.check,
              color: AppColors.white,
            ),
            const SizedBox(
              width: 10.0,
            ),
            Text(
              'Végétalien',
              style: TextStyle(color: AppColors.white),
            ),
          ],
        ),
      ),
      style: OutlinedButton.styleFrom(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(12.0),
          ),
        ),
        backgroundColor: AppColors.blueLight,
      ),
    );
  }
}

class VegetarienButton extends StatelessWidget {
  const VegetarienButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {},
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 10.0,
          vertical: 0.0,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const Icon(
              Icons.close,
              color: AppColors.white,
            ),
            const SizedBox(
              width: 10.0,
            ),
            Text(
              'Végétarien',
              style: TextStyle(color: AppColors.white),
            ),
          ],
        ),
      ),
      style: OutlinedButton.styleFrom(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(12.0),
          ),
        ),
        backgroundColor: AppColors.blueLight,
      ),
    );
  }
}
