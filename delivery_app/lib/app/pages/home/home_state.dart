// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:delivery_app/app/dto/order_product_dto.dart';
import 'package:delivery_app/app/models/product_model.dart';
import 'package:equatable/equatable.dart';
import 'package:match/match.dart';

part 'home_state.g.dart';

@match
enum HomeStateStatus {
  initial,
  loading,
  loaded,
  error,
}

class HomeState extends Equatable {
  final String? errorMessage;
  final HomeStateStatus status;
  final List<ProductModel> products;
  final List<OrderProductDto> shoppingBag;

  const HomeState({
    this.errorMessage,
    required this.status,
    required this.products,
    required this.shoppingBag,
  });

  const HomeState.initial()
      : status = HomeStateStatus.initial,
        products = const [],
        shoppingBag = const [],
        errorMessage = null;

  @override
  List<Object?> get props => [status, products, errorMessage, shoppingBag];

  HomeState copyWith({
    String? errorMessage,
    HomeStateStatus? status,
    List<ProductModel>? products,
    List<OrderProductDto>? shoppingBag,
  }) {
    return HomeState(
      errorMessage: errorMessage ?? this.errorMessage,
      status: status ?? this.status,
      products: products ?? this.products,
      shoppingBag: shoppingBag ?? this.shoppingBag,
    );
  }
}
