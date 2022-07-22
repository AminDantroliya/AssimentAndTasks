import'dart:io';
main()
{
    int month,year;
    print("\n\t Enter Year:-->");
    year=int.parse(stdin.readLineSync()!);
    print("\n\t Your Month Is :-->${month=year*12}");
}