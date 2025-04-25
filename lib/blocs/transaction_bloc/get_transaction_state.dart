part of 'get_transaction_bloc.dart';

@immutable
class GetTransactionState {}

final class GetTransactionInitial extends GetTransactionState {}

final class GetTransactionLoading extends GetTransactionState {}

final class GetTransactionLoaded extends GetTransactionState {
  final List<Transactions> transactions;

  GetTransactionLoaded(this.transactions);
}

final class GetTransactionError extends GetTransactionState {
  final String error;

  GetTransactionError(this.error);
}
