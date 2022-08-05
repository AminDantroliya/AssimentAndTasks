import'dart:io';
main()
{   
    bool status=true;
    int choice;

    while(status)
    {
    que7();
    print(" want to enter order from another customer (Y/N) :");
       var choice=stdin.readLineSync()!;
       if(choice=='n'||choice=='N')
       {
        print("\n\t :::::::EXIT::::::");
            status=false;
            
       }
       
    }
}
void que1()
{
    int a=0;
    String? ans;
    print("QUE 1:-->");
    print("A:-->");
    print("B:-->");
    print("C:-->");
    print("D:-->");
    ans=stdin.readLineSync()!;
    print("\t Your ANS IS $ans ");
    if(ans=="a")
    {
        print(" \t your Ans is true ");
    }
    else
    {
        print("\t khoto javab ");
    }
}
void que2()
{
    int a=0;
    String? ans;
    print("QUE 2:-->");
    print("A:-->");
    print("B:-->");
    print("C:-->");
    print("D:-->");
    ans=stdin.readLineSync()!;
    print("\t Your ANS IS $ans ");
    if(ans=="b")
    {
        print(" \t your Ans is true ${a+=5}");
    }
}
void que3()
{
    int a=0;
    String? ans;
    print("QUE 3:-->");
    print("A:-->");
    print("B:-->");
    print("C:-->");
    print("D:-->");
    ans=stdin.readLineSync()!;
    print("\t Your ANS IS $ans ");
    if(ans=="c")
    {
        print(" \t your Ans is true ${a+=5}");
    }
}
void que4()
{
    int a=0;
    String? ans;
    print("QUE 4:-->");
    print("A:-->");
    print("B:-->");
    print("C:-->");
    print("D:-->");
    ans=stdin.readLineSync()!;
    print("\t Your ANS IS $ans ");
    if(ans=="d")
    {
        print(" \t your Ans is true ${a+=5}");
    }
}
void que5()
{
    int a=0;
    String? ans;
    print("QUE 5:-->");
    print("A:-->");
    print("B:-->");
    print("C:-->");
    print("D:-->");
    ans=stdin.readLineSync()!;
    print("\t Your ANS IS $ans ");
    if(ans=="a")
    {
        print(" \t your Ans is true ${a+=5}");
    }
}
void que6()
{
    int a=0;
    String? ans;
    print("QUE 6:-->");
    print("A:-->");
    print("B:-->");
    print("C:-->");
    print("D:-->");
    ans=stdin.readLineSync()!;
    print("\t Your ANS IS $ans ");
    if(ans=="b")
    {
        print(" \t your Ans is true ${a+=5}");
    }
}
void que7()
{
    int a=0;
    String? ans;
    print("QUE 7:--> what is the khatu fruit");
    print("A:-->apple");
    print("B:-->banana");
    print("C:-->mango");
    print("D:-->ananas");
    ans=stdin.readLineSync()!;
    print("\t Your ANS IS $ans ");
    if(ans=="c")
    {
        print(" \t your Ans is true  $ans");
    }
     else
    {
        print("\t khoto javab $ans ");
    }
}
void que8()
{
    int a=0;
    String? ans;
    print("QUE 8:-->");
    print("A:-->");
    print("B:-->");
    print("C:-->");
    print("D:-->");
    ans=stdin.readLineSync()!;
    print("\t Your ANS IS $ans ");
    if(ans=="d")
    {
        print(" \t your Ans is true ${a+=5}");
    }
}
void que9()
{
    int a=0;
    String? ans;
    print("QUE 9:-->");
    print("A:-->");
    print("B:-->");
    print("C:-->");
    print("D:-->");
    ans=stdin.readLineSync()!;
    print("\t Your ANS IS $ans ");
    if(ans=="a")
    {
        print(" \t your Ans is true ${a+=5}");
    }
}
void que10()
{
    int a=0;
    String? ans;
    print("QUE 10:-->");
    print("A:-->");
    print("B:-->");
    print("C:-->");
    print("D:-->");
    ans=stdin.readLineSync()!;
    print("\t Your ANS IS $ans ");
    if(ans=="b")
    {
        print(" \t your Ans is true ${a+=5}");
    }
}