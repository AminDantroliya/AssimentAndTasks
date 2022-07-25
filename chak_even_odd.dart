import'dart:io';
main()
{   
    int num;
    print("\n\t Enter A Number:-->");
    num = int.parse(stdin.readLineSync()!);
    
    if (num %2 == 0)
    {

        print("\n Even number");
    }
    else
    {
        print("\n\t Odd Number");
    }
}