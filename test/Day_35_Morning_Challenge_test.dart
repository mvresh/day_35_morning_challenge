import 'package:test/test.dart';
import '../bin/main.dart';

void main() {
  test('Test Case 1', (){
    expect(stackCalc(''), equals(0));
  });

  test('Test Case 2', (){
    expect(stackCalc('5 -'), equals('Invalid instruction: Missing Number'));
  });

  test('Test Case 3', (){
    expect(stackCalc("6 5 5 7 * - /"), equals(5));
  });

  test('Test Case 4', (){
    expect(stackCalc(" "), equals('Invalid instruction: '));
  });

  test('Test Case 5', (){
    expect(stackCalc("0 5 5 7 * - /"), equals('error'));
  });


}
