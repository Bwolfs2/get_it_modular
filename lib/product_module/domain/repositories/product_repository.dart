import 'package:get_it_modular/product_module/domain/entities/product_entity.dart';

abstract class IProductRepository {
  Future<List<ProductEntity>> getAll();
}
