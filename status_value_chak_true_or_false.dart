import'dart:io';
main()
{
    bool status = false;
    String? name;
   
    
    print ("\n Enter ON OR OFF:->");
    name = stdin.readLineSync();   
if(name =="on")
{
    status=true;
    print("\n\t :-->*ON*<--:");
}
else{
    status=false;
    print("\n\t :-->*OFF*<--:");

    }
    
}