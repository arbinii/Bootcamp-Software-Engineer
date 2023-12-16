import 'package:myfinance/domain/models/category_model.dart';

final List<CategoryModel> defaultIncomeCategories = [
  CategoryModel('Gaji', 'Salary.png', 'Pemasukan'),
  CategoryModel('Hadiah', 'Gifts.png', 'Pemasukan'),
  CategoryModel('Investasi', 'Investments.png', 'Pemasukan'),
  CategoryModel('Rental', 'Rentals.png', 'Pemasukan'),
  CategoryModel('Tabungan', 'Savings.png', 'Pemasukan'),
  CategoryModel('Lainnya', 'Others.png', 'Pemasukan'),
];
final List<CategoryModel> defaultExpenseCategories = [
  CategoryModel('Makanan', 'Food.png', 'Pengeluaran'),
  CategoryModel('Transportasi', 'Transportation.png', 'Pengeluaran'),
  CategoryModel('Pendidikan', 'Education.png', 'Pengeluaran'),
  CategoryModel('Pembayaran', 'Bills.png', 'Pengeluaran'),
  CategoryModel('Travel', 'Travels.png', 'Pengeluaran'),
  CategoryModel('Peliharaan', 'Pets.png', 'Pengeluaran'),
  CategoryModel('Pakaian', 'pakaian.png', 'Pengeluaran'),
  CategoryModel('Lainnya', 'Others.png', 'Pengeluaran'),
];
