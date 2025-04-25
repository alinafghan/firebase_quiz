import 'package:firebase_quiz/models/transaction.dart';
import 'package:firebase_quiz/repositories/transaction_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'get_transaction_event.dart';
part 'get_transaction_state.dart';

class GetTransactionBloc
    extends Bloc<GetTransactionEvent, GetTransactionState> {
  TransactionRepository transactionRepository = TransactionRepository();
  GetTransactionBloc() : super(GetTransactionInitial()) {
    on<GetAllTransactions>((event, emit) async {
      emit(GetTransactionLoading());
      try {
        final transactions = await transactionRepository.fetchAllTransactions();
        emit(GetTransactionLoaded(transactions));
      } catch (e) {
        emit(GetTransactionError(e.toString()));
      }
    });
  }
}
