// ignore_for_file: public_member_api_docs, sort_constructors_first
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

  const HomeState({
    this.errorMessage,
    required this.status,
    required this.products,
  });

  const HomeState.initial()
      : status = HomeStateStatus.initial,
        products = const [],
        errorMessage = null;

  @override
  List<Object?> get props => [status, products, errorMessage];

  HomeState copyWith({
    String? errorMessage,
    HomeStateStatus? status,
    List<ProductModel>? products,
  }) {
    return HomeState(
      errorMessage: errorMessage ?? this.errorMessage,
      status: status ?? this.status,
      products: products ?? this.products,
    );
  }
}
