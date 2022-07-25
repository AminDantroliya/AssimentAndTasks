import'dart:io';
main(){
    int tamp;
    print("\n\t Enter Tamp:-->");
    tamp=int.parse(stdin.readLineSync()!);
    if(tamp >=100)
    {
        print("\n\t:-->* AIR *<--:");
    }
    else if(tamp >= 0 && tamp <  100)
    {
        print("\n\t:-->* WATER *<--:");
    }
    else
    {
        print("\n\t:-->* ICE *<--:");
    }
}