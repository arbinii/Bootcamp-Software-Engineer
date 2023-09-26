void main(){
  var inputString = '1000';

  //konversi string ke int
  var inputInt = int.parse(inputString);
  //konversi string ke double
  var inputDouble = double.parse(inputString);
  print(inputString);
  print(inputInt);
  print(inputDouble);

  //konversi int to double
  var intToDouble = inputInt.toDouble();
  //konversi double to int
  var doubleToInt = inputDouble.toInt();
  print(intToDouble);
  print(doubleToInt);

  //konversi int to string
  var intToString = inputInt.toString();
  //konversi double to string
  var doubleToString = inputDouble.toString();
  print(intToString);
  print(doubleToString);
}