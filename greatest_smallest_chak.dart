import'dart:io';
main()
{
    var num1,num2;
    
    print("\n\t Enter Number 1:->");
    num1 = int.parse(stdin.readLineSync()!);
     if(num1>35)
    {
        print("\n\t Greatest Nnumber");
    }
    else
    {
        print("\n\t Smallest number");
    }
    print("\n\t Enter Number 2:->");
    num2 = int.parse(stdin.readLineSync()!);
    if(num2>35)
    {
        print("\n\t Greatest Nnumber");
    }
    else
    {
        print("\n\t Smallest number");
    }
}
