import'dart:io';
main()
{
    bool status = false;
    String? name;
   
    
    print ("\n Enter ON OR OFF:->");
    name = stdin.readLineSync();   
if(name =="on"||name=="ON")
{
    status=true;
    print("\n\t :-->*ON*<--:");
}
else if(name =="off"||name=="OFF")
{
    status=false;
    print("\n\t :-->*OFF*<--:");

}
else{
    print("\n\t INVILIDE SWITCH");
}
    
}