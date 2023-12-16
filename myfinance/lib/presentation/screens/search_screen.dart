import 'package:myfinance/Constants/color.dart';
import 'package:myfinance/data/utilty.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:myfinance/domain/models/transaction_model.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  SearchScreenState createState() => SearchScreenState();
}

class SearchScreenState extends State<SearchScreen> {
  late List<Transaction> filteredTransactions;
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    filterTransactions('');
  }

  void filterTransactions(String query) {
    final box = Hive.box<Transaction>('transactions');
    filteredTransactions = box.values
        .where((transaction) =>
            transaction.notes.toLowerCase().contains(query.toLowerCase()))
        .toList();

    // Sort transactions by date in descending order (from newest to oldest)
    filteredTransactions.sort((a, b) => b.createAt.compareTo(a.createAt));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromRGBO(0, 151, 205, 1),
                Color.fromRGBO(24, 165, 167, 1),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
        title: Text(
          'Pencarian',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              cursorColor: primaryColor,
              controller: searchController,
              decoration: InputDecoration(
                labelText: 'Cari berdasarkan catatan',
                labelStyle: const TextStyle(
                  color: Color.fromRGBO(0, 151, 205, 1),
                ),
                focusedBorder: const OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Color.fromRGBO(0, 151, 205, 1))),
                suffixIcon: IconButton(
                  icon: const Icon(Icons.clear),
                  color: Color.fromRGBO(0, 151, 205, 1),
                  onPressed: () {
                    searchController.clear();
                    filterTransactions('');
                    setState(() {});
                  },
                ),
              ),
              onChanged: (value) {
                filterTransactions(value);
                setState(() {});
              },
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredTransactions.length,
              itemBuilder: (context, index) {
                final transaction = filteredTransactions[index];
                return ListTile(
                  leading: ClipRRect(
                    borderRadius: BorderRadius.circular(5),
                    child: Image.asset(
                      'images/${transaction.category.categoryImage}',
                      height: 40,
                    ),
                  ),
                  title: Text(
                    transaction.notes,
                    style: const TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  subtitle: Text(
                    '${transaction.createAt.day}/${transaction.createAt.month}/${transaction.createAt.year}',
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  trailing: Text(
                    formatCurrency(int.parse(transaction.amount)),
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 17,
                      color: transaction.type == 'Pengeluaran'
                          ? Colors.red
                          : Colors.green,
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
