import 'dart:io';

void main() {
  List<int> numbers = [];

  // Meminta pengguna untuk memasukkan angka ke dalam daftar
  while (true) {
    stdout.write('Masukkan angka (atau ketik "selesai" untuk mengakhiri): ');
    String input = stdin.readLineSync() ?? '';
    if (input.toLowerCase() == 'selesai') {
      break;
    }
    int? number = int.tryParse(input);
    if (number != null) {
      numbers.add(number);
    } else {
      print('Input tidak valid. Masukkan angka.');
    }
  }

  if (numbers.isEmpty) {
    print('Daftar kosong.');
  } else {
    // Mengurutkan daftar bilangan
    sortNumbers(numbers);

    // Mencari nilai maksimum dan minimum
    int max = findMax(numbers);
    int min = findMin(numbers);

    // Menampilkan nilai maksimum dan minimum
    print('Daftar bilangan setelah diurutkan: $numbers');
    print('Nilai maksimum: $max');
    print('Nilai minimum: $min');

    // Menampilkan angka prima, ganjil, dan genap
    List<int> primes = findPrimes(numbers);
    List<int> odds = findOdds(numbers);
    List<int> evens = findEvens(numbers);

    print('Angka prima: $primes');
    print('Angka ganjil: $odds');
    print('Angka genap: $evens');
  }
}

void sortNumbers(List<int> numbers) {
  // Menggunakan metode sort() untuk mengurutkan daftar bilangan
  numbers.sort();
}

int findMax(List<int> numbers) {
  // Menggunakan metode reduce() untuk mencari nilai maksimum
  return numbers.reduce((max, number) => number > max ? number : max);
}

int findMin(List<int> numbers) {
  // Menggunakan metode reduce() untuk mencari nilai minimum
  return numbers.reduce((min, number) => number < min ? number : min);
}

bool isPrime(int number) {
  if (number <= 1) return false;
  if (number == 2) return true;
  if (number % 2 == 0) return false;
  for (int i = 3; i * i <= number; i += 2) {
    if (number % i == 0) return false;
  }
  return true;
}

List<int> findPrimes(List<int> numbers) {
  return numbers.where((number) => isPrime(number)).toList();
}

List<int> findOdds(List<int> numbers) {
  return numbers.where((number) => number % 2 != 0).toList();
}

List<int> findEvens(List<int> numbers) {
  return numbers.where((number) => number % 2 == 0).toList();
}