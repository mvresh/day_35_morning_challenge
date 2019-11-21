// Stack Calculator
// A stack machine processes instructions by pushing and popping values to an
// internal stack. A simple example of this is a calculator.
//
//  The argument passed to stackCalc(instructions) will always be a string containing a series of instructions.
//  The instruction set of the calculator will be this:
//
//  +: Pop the last 2 values from the stack, add them, and push the result onto the stack.
//  -: Pop the last 2 values from the stack, subtract the lower one from the
//     topmost one, and push the result.
//  *: Pop the last 2 values, multiply, and push the result.
//  /: Pop the last 2 values, divide the topmost one by the lower one, and push the result.
//  DUP: Duplicate (not double) the top value on the stack.
//  POP: Pop the last value from the stack and discard it.
//  PSH: Performed whenever a number appears as an instruction. Push the number to the stack.
//  Any other instruction (for example, a letter) should result in the value
//  "Invalid instruction: [instruction]"

/// Examples
//  stackCalc("") ➞ 0
//  stackCalc("5 6 +") ➞ 11
//  stackCalc("3 DUP +") ➞ 6
//  stackCalc("6 5 5 7 * - /") ➞ 5
//  stackCalc("x y +") ➞ Invalid instruction: x
import 'dart:collection';

class Stack{

}

stackCalc(String series){
  ListQueue stack = ListQueue.from(series.split(" "));

  print(stack);
  ListQueue<int> tempStack = ListQueue();
  bool loop = true;
  if(series == ''){
    return 0;
  }
  while(loop){
    if(stack.isNotEmpty){
      int item;
      try{
        item = int.parse(stack.first);
      }catch(e){
//        print(e);
      }
      if(item is int){
        int number = int.parse(stack.first);
        tempStack.addFirst(number);
        stack.removeFirst();
      }
      else if(stack.first == '+'){
        if(tempStack.length >= 2){
          stackOperation(stack, tempStack,'+');
        }
        else{
          return 'Invalid instruction: Missing Number';
        }
      }
      else if(stack.first == '-'){
        if(tempStack.length >= 2){
          stackOperation(stack, tempStack,'-');
        }
        else{
          return 'Invalid instruction: Missing Number';
        }
      }
      else if(stack.first == '*'){
        if(tempStack.length >= 2){
          stackOperation(stack, tempStack,'*');
        }
        else{
          return 'Invalid instruction: Missing Number';
        }
      }
      else if(stack.first == 'DUP'){
        stack.removeFirst();
        int a = tempStack.first;
        tempStack.addFirst(a);
      }
      else if(stack.first == '/'){
        if(tempStack.length >= 2){
          stack.removeFirst();
          int a = tempStack.first;
          tempStack.removeFirst();
          int b = tempStack.first;
          tempStack.removeFirst();
          if(b != 0){
            tempStack.addFirst(a ~/ b);
          }
          else{
            return 'error';
          }
        }
        else{
          return 'Invalid instruction: Missing Number';
        }
      }

      else if(tempStack.length == 1){
        loop = false;
      }
      else{
        return 'Invalid instruction: ${stack.removeFirst()}';
      }
    }
    else{
      loop = false;
    }
  }
  print(tempStack);
  return tempStack.first;
}

void stackOperation(ListQueue stack, ListQueue<int> tempStack,String operation) {
  stack.removeFirst();
  int a = tempStack.first;
  tempStack.removeFirst();
  int b = tempStack.first;
  tempStack.removeFirst();

  if(operation == '+'){
    tempStack.addFirst(a + b);
  }
  if(operation == '-'){
    tempStack.addFirst(a - b);
  }
  if(operation == '*'){
    tempStack.addFirst(a * b);
  }
}


main() {
  print(stackCalc("5 6 +"));
  print(stackCalc("5 6 8 9 + -"));
}
