void main() {
  String myString = 'abc';
  try {
    double myStringAsADouble = double.parse(myString);
    print(myStringAsADouble);
  } catch (e) {
    print(e);
  }
}
