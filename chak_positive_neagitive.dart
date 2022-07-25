import'dart:io';
main()
{   
    int num;
    print("\n\t Enter A Number:-->");
    num = int.parse(stdin.readLineSync()!);
    
    if (num >= 0)
    {

        print("\n positive number");
    }
    else
    {
        print("\n\t Negative Number");
    }
}