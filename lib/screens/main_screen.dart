import 'package:firebase_quiz/blocs/transaction_bloc/get_transaction_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

// In building the transaction feature for our Flutter app, Firebase
// initialization is crucial for data retrieval. Utilizing either Bloc or
// Riverpod for state management ensures a streamlined
// development process, while incorporating loaders enhances the
// user experience during data loading. Adhering to clean code
// principles, we format dates from Firebase as "Today" or
// "Yesterday" for user-friendly presentation.

class _MainScreenState extends State<MainScreen> {
  final String currentYear = DateFormat('yyyy').format(DateTime.now());
  final String currentMonth = DateFormat('MMMM').format(DateTime.now());
  final String currentDate = DateFormat('dd').format(DateTime.now());
  final String currentDay = DateFormat('EEEE').format(DateTime.now());
  final String yesterday =
      DateFormat('dd').format(DateTime.now().subtract(const Duration(days: 1)));

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: const Icon(Icons.more_horiz),
            onPressed: () {},
          ),
        ],
      ),
      body: Center(
        child: Column(
          children: [
            Text(currentDay),
            Row(
              children: [
                Text(currentDate),
                Text(currentMonth.substring(0, 3)), //first three letters?
              ],
            ),
          ],
        ), //day of the week
        BlocBuilder<GetTransactionBloc, GetTransactionState>(
          builder: (context, state) {
            if (state is GetTransactionLoading) {
              return const CircularProgressIndicator();
            } else if (state is GetTransactionError) {
              return Text(state.error);
            } else if (state is GetTransactionLoaded) {
              final transactions = state.transactions;
                          return ListView.builder(
              itemCount: ,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text('Transaction $index'),
                  subtitle: Text('Details of transaction $index'),
                );
              },
            );
            }
          },
        ),
      ),
    ));
  }
}
