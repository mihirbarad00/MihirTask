import 'dart:io';
void main(){

  print("Enter Your number :");
  var number=0;
  var sum=0;
  var check=0;
  
  number=int.parse(stdin.readLineSync()!);
  var temp =number;
  
  while (number>0) {
   
    check=number % 10;
    print("--loopCheck-$check");
   
    sum=(sum*10)+check;
    print("--loopSum-$sum");

    number=number ~/10;
    print("--loopNumber-$number");
  }

  if (sum==temp) {
    print("Your Number Is Pelidrom");
    
  }else
  {
    print("Your Number Is not Pelidrom");
  }
   print("--$sum-");
    print("--$check-");
     print("--$number-");

  
}