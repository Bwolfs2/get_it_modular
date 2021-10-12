import 'package:get_it_modular/product_module/view/pages/product_controller.dart';
import 'package:injectable/injectable.dart';

import 'domain/repositories/product_repository.dart';
import 'infra/repositories/product_repository.dart';

@module
abstract class ProductModule {
  @Injectable(as: IProductRepository)
  ProductRepository get repo;

  @Named("ProductRepository")
  @LazySingleton(as: IProductRepository)
  Future<ProductRepository> getRepo() async {
    return ProductRepository();
  }

  @Named("ProductController")
  @LazySingleton()
  Future<ProductController> getProductController(ProductRepository productRepository) async {
    return ProductController(productRepository);
  }
}
