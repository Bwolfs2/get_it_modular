import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:get_it_modular/product_module/view/pages/product_controller.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({Key? key}) : super(key: key);

  @override
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  ProductController controller = GetIt.instance.get();

  @override
  void initState() {
    super.initState();
    controller.addListener(update);
  }

  @override
  void dispose() {
    controller.removeListener(update);
    super.dispose();
  }

  void update() => setState(() => {});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: controller.products == null
          ? const Center(child: CircularProgressIndicator.adaptive())
          : ListView.builder(
              itemCount: controller.products!.length,
              itemBuilder: (context, index) => ListTile(
                title: Text(controller.products![index].name),
              ),
            ),
    );
  }
}
