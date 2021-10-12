// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../product_module/domain/repositories/product_repository.dart' as _i3;
import '../product_module/infra/repositories/product_repository.dart' as _i5;
import '../product_module/product_module.dart' as _i6;
import '../product_module/view/pages/product_controller.dart'
    as _i4; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// an extension to register the provided dependencies inside of [GetIt]
extension GetItInjectableX on _i1.GetIt {
  /// initializes the registration of provided dependencies inside of [GetIt]
  _i1.GetIt init(
      {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
    final gh = _i2.GetItHelper(this, environment, environmentFilter);
    final productModule = _$ProductModule();
    gh.factory<_i3.IProductRepository>(() => productModule.repo);
    gh.lazySingletonAsync<_i3.IProductRepository>(() => productModule.getRepo(),
        instanceName: 'ProductRepository');
    gh.factory<_i4.ProductController>(
        () => _i4.ProductController(get<_i3.IProductRepository>()));
    gh.factory<_i5.ProductRepository>(() => _i5.ProductRepository());
    gh.lazySingletonAsync<_i4.ProductController>(
        () => productModule.getProductController(get<_i5.ProductRepository>()),
        instanceName: 'ProductController');
    return this;
  }
}

class _$ProductModule extends _i6.ProductModule {
  @override
  _i5.ProductRepository get repo => _i5.ProductRepository();
}
