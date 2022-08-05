import'dart:io';
main()
{
    print("\t\t --------------------------------------------------\n");
    print("\n\t\t>>> Welcome to Amazing Pizza and Pasta Pizzeria <<<");
    print("\n\t\t --------------------------------------------------");
    double t1_price=0,t2_price=0,net_amount=0;
    final pizza_p=10.99;
    final pasta_p=9.5;
    String? name,yn;
    var i,a=0,b=0,c=0;
    var status=true;
    int menu=0,pizza=0,pasta=0,p=0;

    print("\n Press 1 For Menu:-->");
    print("Press 2 for Exit:::");
    menu=int.parse(stdin.readLineSync()!);
    while(status)
    {
        if(menu == 1)
        {
            print("\n\t\t >>>> PIZZA MENU <<<<");
            print("\t\t *********************");
            print("\t Press 1 large pizza = 10.99 AUD ");
            print("\t Press 2 large Pizzas = 20.99 AUD ");
            print("\t Press 3 Large Pizzas = 29.99 AUD");
            print("\t ***Buy 4 or more pizza and get 1.5lt of soft drink free***");
            print("\t--------------------------------------\n");
            print("\n\t\t >>> PASTA MENU <<<");
            print("\t\t *******************");
            print("\t Press 1 large pasta = 9.5 AUD ");
            print("\t Press 2 large pastas = 17.00 AUD ");
            print("\t Press 3 large pastas = 27.50 AUD");
            print("\t ***Buy 4 or more pastas and get 2 bruschetta free.***");
            print("\t ***Buy 4 or more pizzas and pastas and get 2 chocco brownies ice cream free.");
            print("\t--------------------------------------");
            
            print("\n Enter Your Name:-->");
            name=stdin.readLineSync()!;
            print("\t WELCOME ${name}");
            print("\nEnter number or pizza order you want :-->");
            pizza=int.parse(stdin.readLineSync()!);
            if(pizza < 4)
            {
                p += pizza;
                t1_price=pizza_p*pizza;
                print("\n\t your pizza order amount is:-->$t1_price");
                net_amount += t1_price;
            }
            else if(pizza >= 4)
            {
                p += pizza;
                t1_price=pizza_p*pizza;
                print("\t your pizza order amount is:-->$t1_price");
                print("\t  *** Congratulations !! 1.5lt softdrink free ***");
                net_amount += t1_price;
                a++;
            }
            else
            {
                print("\t::: INVALIDE ORDER:::");
            }
            print("\n Enter number or pasta order you want :-->");
            pasta=int.parse(stdin.readLineSync()!);
            if(pasta < 4)
            {
                p += pasta;
                t2_price=pasta_p*pasta;
                print("\n\t your pasta order amount is:-->$t2_price\n\n");
                net_amount += t2_price;
            }
            else if(pasta >= 4)
            {
                p += pasta;
                t2_price=pasta_p*pasta;
                print("\t your pizza order amount is:-->$t2_price");
                print("\t  *** Congratulations !! get 2 bruschetta free *** ");
                print("\n\t*** Congratulations !! get 2 chocco brownies ice cream free ***");
                net_amount += t2_price;
                b++;
                c++;
            }   
            
        }
        else
        {
            print("\t::: INVALIDE ORDER:::");
        }
       print(" want to enter order from another customer (Y/N) :");
       var choice=stdin.readLineSync()!;
       if(choice=='n'||choice=='N')
       {
            status=false;
       }
       
    }
    print("\t payment received from pizza ::$t1_price");
    print("\t payment received from pasta ::$t2_price");
    print("\t your total order is :-->$net_amount");
    print("\t Number of pizza and pasta sold in one shift :$p");
    print("\t Number of 1.5lt soft drink bottles given :$a");
    print("\t Number of bruschetta given to customer : $b");
    print("\t Number of chocco brownies ice cream given to customer :$c");
    print("\t >>>>> BYE BYE THX <<<<<");
    print("\t ***********************");
}