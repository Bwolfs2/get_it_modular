import 'package:flutter/foundation.dart';
import 'package:get_it_modular/product_module/domain/entities/product_entity.dart';
import 'package:get_it_modular/product_module/domain/repositories/product_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class ProductController extends ChangeNotifier {
  final IProductRepository _productRepository;

  ProductController(this._productRepository) {
    loadData();
  }

  List<ProductEntity>? products;

  Future<void> loadData() async {
    products = await _productRepository.getAll();
    notifyListeners();

    remove();
  }

  void remove() async {
    if (products?.isNotEmpty ?? false) {
      products!.removeLast();
      notifyListeners();
      await Future.delayed(const Duration(seconds: 1));
      remove();
    }
  }
}
