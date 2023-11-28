import 'package:MyFinance/Constants/color.dart';
import 'package:MyFinance/Constants/default_categories.dart';
import 'package:MyFinance/Constants/limits.dart';
import 'package:MyFinance/data/utilty.dart';
import 'package:MyFinance/domain/models/category_model.dart';
import 'package:MyFinance/domain/models/transaction_model.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

// import '../Constants/categories.dart';

class AddScreen extends StatefulWidget {
  const AddScreen({super.key});

  @override
  State<AddScreen> createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
  List<CategoryModel> incomeCategories = defaultIncomeCategories;
  List<CategoryModel> expenseCategories = defaultExpenseCategories;

  final boxTransaction = Hive.box<Transaction>('transactions');
  DateTime date = DateTime.now();
  CategoryModel? selectedCategoryItem;
  String? selectedTypeItem;

  late Box<CategoryModel> box;
  List<CategoryModel> categories = [];

  final List<String> types = ['Pemasukan', 'Pengeluaran'];
  final TextEditingController explainC = TextEditingController();
  FocusNode explainFocus = FocusNode();
  final TextEditingController amountC = TextEditingController();
  FocusNode amountFocus = FocusNode();

  bool isAmountValid = true;

  @override
  void initState() {
    super.initState();
    explainFocus.addListener(() {
      setState(() {});
    });
    amountFocus.addListener(() {
      setState(() {});
    });

    openBox().then((_) {
      fetchCategories();
    });
  }

  Future<void> openBox() async {
    box = await Hive.openBox<CategoryModel>('categories');
  }

  Future<void> fetchCategories() async {
    categories = box.values.toList();
    setState(() {
      incomeCategories = [
        ...defaultIncomeCategories,
        ...box.values
            .where((category) => category.type == 'Pemasukan')
            .toList(),
      ];
      expenseCategories = [
        ...defaultExpenseCategories,
        ...box.values
            .where((category) => category.type == 'Pengeluaran')
            .toList(),
      ];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: SafeArea(
          child: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          backgroundAddContainer(context),
          Positioned(
            top: 120,
            child: mainAddContainer(),
          )
        ],
      )),
    );
  }

  SingleChildScrollView mainAddContainer() {
    return SingleChildScrollView(
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20), color: Colors.white),
        height: 680,
        width: 360,
        child: Column(children: [
          const SizedBox(
            height: 35,
          ),
          typeField(),
          const SizedBox(
            height: 35,
          ),
          noteField(),
          const SizedBox(
            height: 35,
          ),
          amountField(),
          const SizedBox(
            height: 35,
          ),
          categoryField(),
          const SizedBox(
            height: 35,
          ),
          timeField(),
          // const Spacer(),
          const SizedBox(
            height: 35,
          ),
          addTransaction(),
          const SizedBox(
            height: 20,
          )
        ]),
      ),
    );
  }

  GestureDetector addTransaction() {
    bool isWarningShown = false;
    return GestureDetector(
      onTap: () {
        if (selectedCategoryItem == null ||
            selectedTypeItem == null ||
            explainC.text.isEmpty ||
            amountC.text.isEmpty) {
          // Display an error message or show a snackbar indicating missing fields
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: const Text('Perhatian'),
              content: const Text('Tolong isikan data terlebih dahulu'),
              actions: [
                TextButton(
                  child: const Text('OK'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
          );
          return;
        }

        double amount = double.tryParse(amountC.text) ?? 0.0;
        if (selectedTypeItem == 'Pengeluaran' &&
            amount > limitPerExpense &&
            !isWarningShown) {
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: const Text('Perhatian'),
              content: Text(
                  'Jumlah melebihi batas pengeluaran(${formatCurrency(limitPerExpense)}).'),
              actions: [
                TextButton(
                  child: const Text('OK'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
          );
          isWarningShown =
              true; // Set the flag to true after showing the warning
          return;
        }
        var newTransaction = Transaction(selectedTypeItem!, amountC.text, date,
            explainC.text, selectedCategoryItem!);
        boxTransaction.add(newTransaction);
        Navigator.of(context).pop();

        if (selectedTypeItem == 'Pengeluaran' && totalBalance() < limitTotal) {
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: const Text('Perhatian'),
              content: Text(
                  'Total saldo kurang dari ${formatCurrency(limitTotal)}!'),
              actions: [
                TextButton(
                  child: const Text('OK'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
          );
          return;
        }
      },
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Color.fromRGBO(0, 151, 205, 1)),
        height: 50,
        width: 140,
        child: const Text(
          'Tambah',
          style: TextStyle(
              fontFamily: 'f',
              fontSize: 17,
              fontWeight: FontWeight.w600,
              color: Colors.white),
        ),
      ),
    );
  }

  Padding timeField() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
        alignment: Alignment.bottomLeft,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border:
                Border.all(width: 2, color: Color.fromRGBO(0, 151, 205, 1))),
        width: double.infinity,
        child: TextButton(
          onPressed: () async {
            DateTime? newDate = await showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime(2020, 1, 1),
                lastDate: DateTime(2030));
            if (newDate == null) return;
            setState(() {
              date = newDate;
            });
          },
          child: Text(
            'Tanggal : ${date.day}/${date.month}/${date.year}',
            style: const TextStyle(fontSize: 15, color: Colors.black),
          ),
        ),
      ),
    );
  }

  Padding amountField() {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
      ),
      child: TextField(
        keyboardType: TextInputType.number,
        focusNode: amountFocus,
        controller: amountC,
        decoration: InputDecoration(
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
          labelText: 'Nominal',
          labelStyle: TextStyle(fontSize: 17, color: Colors.grey),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(
                  width: 2, color: Color.fromRGBO(0, 151, 205, 1))),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(
                  width: 2, color: Color.fromRGBO(0, 151, 205, 1))),
          errorText: isAmountValid ? null : 'Amount must be greater than 0',
        ),
        onChanged: (value) {
          setState(() {
            if (value.isEmpty) {
              isAmountValid =
                  true; // Reset the validation if the field is empty
            } else {
              isAmountValid =
                  double.tryParse(value) != null && double.parse(value) > 0;
            }
          });
        },
      ),
    );
  }

  Padding typeField() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
          width: double.infinity,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                width: 2,
                color: Color.fromRGBO(0, 151, 205, 1),
              )),
          child: DropdownButton<String>(
            value: selectedTypeItem,
            items: types
                .map((e) => DropdownMenuItem(
                      value: e,
                      child: Row(children: [
                        SizedBox(
                          width: 40,
                          child: Image.asset('images/$e.png'),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          e,
                          style: const TextStyle(fontSize: 15),
                        )
                      ]),
                    ))
                .toList(),
            selectedItemBuilder: (BuildContext context) => types
                .map((e) => Row(
                      children: [
                        SizedBox(
                          width: 42,
                          child: Image.asset('images/$e.png'),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(e)
                      ],
                    ))
                .toList(),
            hint: const Text(
              'Tipe Catatan',
              style: TextStyle(color: Colors.grey),
            ),
            dropdownColor: Colors.white,
            isExpanded: true,
            underline: Container(),
            onChanged: ((value) {
              setState(() {
                selectedTypeItem = value!;
                selectedCategoryItem = null;
              });
            }),
          )),
    );
  }

  Padding noteField() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: TextField(
        focusNode: explainFocus,
        controller: explainC,
        decoration: InputDecoration(
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
          labelText: 'Catatan',
          labelStyle: TextStyle(fontSize: 17, color: Colors.grey),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(
                  width: 2, color: Color.fromRGBO(0, 151, 205, 1))),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(
                  width: 2, color: Color.fromRGBO(0, 151, 205, 1))),
        ),
      ),
    );
  }

  Padding categoryField() {
    final List<CategoryModel> currCategories =
        selectedTypeItem == 'Pemasukan' ? incomeCategories : expenseCategories;

    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 15,
      ),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            width: 2,
            color: Color.fromRGBO(0, 151, 205, 1),
          ),
        ),
        child: DropdownButton<CategoryModel>(
          value: selectedCategoryItem,
          items: currCategories
              .map(
                (e) => DropdownMenuItem<CategoryModel>(
                  value: e,
                  child: Row(
                    children: [
                      SizedBox(
                        width: 40,
                        child: Image.asset('images/${e.categoryImage}'),
                      ),
                      const SizedBox(width: 10),
                      Text(
                        e.title,
                        style: const TextStyle(fontSize: 15),
                      )
                    ],
                  ),
                ),
              )
              .toList(),
          selectedItemBuilder: (BuildContext context) => currCategories
              .map(
                (e) => Row(
                  children: [
                    SizedBox(
                      width: 42,
                      child: Image.asset('images/${e.categoryImage}'),
                    ),
                    const SizedBox(width: 5),
                    Text(e.title),
                  ],
                ),
              )
              .toList(),
          hint: const Text(
            'Pilih Kategori',
            style: TextStyle(color: Colors.grey),
          ),
          dropdownColor: Colors.white,
          isExpanded: true,
          underline: Container(),
          onChanged: (value) {
            setState(() {
              selectedCategoryItem = value;
            });
          },
        ),
      ),
    );
  }

  Column backgroundAddContainer(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          height: 100,
          decoration: const BoxDecoration(
              gradient: LinearGradient(colors: [
                Color.fromRGBO(0, 151, 205, 1),
                Color.fromRGBO(24, 165, 167, 1),
              ]),
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20))),
          child: Column(children: [
            const SizedBox(
              height: 40,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: const Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(
                    width: 80,
                  ),
                  const Text(
                    "Tambah Transaksi",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ],
              ),
            )
          ]),
        )
      ],
    );
  }
}