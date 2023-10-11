void main() {
var tampil = sum([1, 2, 3, 4, 5]);
print(tampil);
}

int sum(List<int> numbers) {
  var total = 0;
  for (var value in numbers) {
    total += value;
  }
  return total;
}
