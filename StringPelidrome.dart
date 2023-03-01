import 'dart:io';

void main() {
  print("Enter a text");
  String? text = stdin.readLineSync();
  print("0)-Your text-$text".toUpperCase());
  String? checkstring;
  checkstring = text!.split('').reversed.join();
  print("1)-Reversname-$checkstring".toUpperCase());
  ;

  if (checkstring == text) {
    print("Your Number Is Pelidrom");
  } else {
    print("Your Number Is  not Pelidrom");
  }
}
