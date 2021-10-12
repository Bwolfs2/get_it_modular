import 'package:get_it_modular/product_module/domain/entities/product_entity.dart';
import 'package:get_it_modular/product_module/domain/repositories/product_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class ProductRepository extends IProductRepository {
  @override
  Future<List<ProductEntity>> getAll() async {
    await Future.delayed(Duration(seconds: 2));
    return List.generate(10, (index) => ProductEntity(index, 'Product $index')).toList();
  }
}
