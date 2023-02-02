import 'dart:developer';

import 'package:delivery_app/app/core/rest_client/custom_dio.dart';
import 'package:delivery_app/app/models/product_model.dart';
import 'package:dio/dio.dart';

import './products_repository.dart';
import '../../core/exceptions/repository_exception.dart';

class ProductsRepositoryImpl implements ProductsRepository {
  final CustomDio dio;

  ProductsRepositoryImpl({
    required this.dio,
  });

  @override
  Future<List<ProductModel>> findAllProducts() async {
    try {
      final result = await dio.unauth().get('/products');

      return result.data
          .map<ProductModel>((product) => ProductModel.fromMap(product))
          .toList();
    } on DioError catch (e, s) {
      log('Error', error: e, stackTrace: s);
      throw RepositoryException(message: 'Erro ao buscar produtos.');
    }
  }
}
