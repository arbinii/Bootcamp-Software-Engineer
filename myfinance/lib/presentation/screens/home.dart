import 'package:myfinance/Constants/days.dart';
import 'package:myfinance/data/utilty.dart';
import 'package:flutter/material.dart';
import 'package:myfinance/presentation/screens/add_transaction.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:myfinance/domain/models/transaction_model.dart';

class Home extends StatefulWidget {
  const Home({Key? key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late Transaction transactionHistory;
  final box = Hive.box<Transaction>('transactions');

  @override
  Widget build(BuildContext context) {
    final List<Transaction> sortedTransactions = box.values.toList()
      ..sort((a, b) => b.createAt.compareTo(a.createAt));

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => const AddScreen()));
        },
        backgroundColor: Color.fromRGBO(24, 165, 167, 1),
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
        shape: const CircleBorder(),
      ),
      body: SafeArea(
        child: ValueListenableBuilder(
          valueListenable: box.listenable(),
          builder: (context, value, child) {
            return CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: SizedBox(height: 270, child: _head()),
                ),
                const SliverToBoxAdapter(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Riwayat Catatan',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 19,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SliverList(
                  delegate: SliverChildBuilderDelegate((context, index) {
                    transactionHistory = sortedTransactions[index];
                    return listTransaction(transactionHistory, index);
                  }, childCount: sortedTransactions.length),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  // ... (Widget dan metode lainnya tetap sama)

  Widget listTransaction(Transaction transactionHistory, int index) {
    return Dismissible(
      key: UniqueKey(),
      confirmDismiss: (direction) async {
        return await showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text("Konfirmasi"),
              content: const Text("Anda yakin ingin menghapus transaksi ini?"),
              actions: [
                TextButton(
                  onPressed: () => Navigator.of(context).pop(false),
                  child: const Text("Batal"),
                ),
                TextButton(
                  onPressed: () => Navigator.of(context).pop(true),
                  child: const Text("Hapus"),
                ),
              ],
            );
          },
        );
      },
      onDismissed: (direction) {
        transactionHistory.delete();
      },
      child: getTransaction(index, transactionHistory),
    );
  }

  ListTile getTransaction(int index, Transaction transactionHistory) {
    return ListTile(
      leading: ClipRRect(
        borderRadius: BorderRadius.circular(5),
        child: Image.asset(
            'images/${transactionHistory.category.categoryImage}',
            height: 40),
      ),
      title: Text(
        transactionHistory.notes,
        style: const TextStyle(
          fontSize: 17,
          fontWeight: FontWeight.w600,
        ),
      ),
      subtitle: Text(
        '${days[transactionHistory.createAt.weekday - 1]}  ${transactionHistory.createAt.day}/${transactionHistory.createAt.month}/${transactionHistory.createAt.year}',
        style: const TextStyle(
          fontWeight: FontWeight.w600,
        ),
      ),
      trailing: Text(
        formatCurrency(int.parse(transactionHistory.amount)),
        style: TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 17,
          color: transactionHistory.type == 'Pengeluaran'
              ? Colors.red
              : Colors.green,
        ),
      ),
    );
  }
}

Stack _head() {
  return Stack(
    children: [
      Column(
        children: [
          Container(
            width: double.infinity,
            height: 200,
            decoration: const BoxDecoration(
              gradient: LinearGradient(colors: [
                Color.fromRGBO(0, 151, 205, 1),
                Color.fromRGBO(24, 165, 167, 1),
              ]),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(25),
                bottomRight: Radius.circular(25),
              ),
            ),
            child: const Stack(
              children: [
                Column(
                  children: [
                    Center(
                        child: Padding(
                      padding: EdgeInsets.only(top: 25),
                      child: Text(
                        "My Finance",
                        style: TextStyle(
                          fontWeight: FontWeight.w900,
                          fontSize: 25,
                          color: Colors.white,
                        ),
                      ),
                    ))
                  ],
                )
              ],
            ),
          ),
        ],
      ),
      Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 60),
          child: Container(
            height: 180,
            width: 360,
            decoration: BoxDecoration(
              boxShadow: const [
                BoxShadow(
                    color: Colors.grey,
                    spreadRadius: 1,
                    blurRadius: 3,
                    offset: Offset(0, 0.5))
              ],
              gradient: LinearGradient(colors: [
                Color.fromRGBO(24, 165, 167, 1),
                Color.fromRGBO(0, 151, 205, 1),
              ]),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Column(
              children: [
                const SizedBox(height: 10),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Saldo',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 7),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        formatCurrency(totalBalance()),
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 25),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                            radius: 15,
                            backgroundColor: Colors.green,
                            child: Icon(
                              Icons.arrow_upward,
                              color: Colors.black,
                              size: 19,
                            ),
                          ),
                          SizedBox(width: 7),
                          Text(
                            'Pemasukan',
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                              color: Color.fromARGB(255, 216, 216, 216),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          CircleAvatar(
                            radius: 15,
                            backgroundColor: Colors.red,
                            child: Icon(
                              Icons.arrow_downward,
                              color: Colors.black,
                              size: 19,
                            ),
                          ),
                          SizedBox(width: 7),
                          Text(
                            'Pengeluaran',
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                              color: Color.fromARGB(255, 216, 216, 216),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 8),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        formatCurrency(totalIncome()),
                        style: const TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        formatCurrency(totalExpense()),
                        style: const TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      )
    ],
  );
}
