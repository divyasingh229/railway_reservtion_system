#include<stdio.h>

int main()
{
int choice;

while(1)
{
printf("\n===== Railway Reservation System =====\n");

printf("1. Passenger Details\n");
printf("2. Train Details\n");
printf("3. Reservation Details\n");
printf("4. Booking Details\n");
printf("5. Exit\n");

printf("Enter Choice: ");
scanf("%d",&choice);

switch(choice)
{
case 1:

printf("\nPassenger Records\n");
printf("1 Divya Female 20\n");
printf("2 Rahul Male 24\n");
break;

case 2:

printf("\nTrain Records\n");
printf("101 Shatabdi Express\n");
printf("102 Jan Shatabdi\n");
break;

case 3:

printf("\nReservation Records\n");
printf("1001 Confirmed\n");
printf("1002 Waiting\n");
break;

case 4:

printf("\nBooking Records\n");
printf("Booking ID 1 Amount 850\n");
break;

case 5:

printf("Thank You\n");
return 0;

default:

printf("Invalid Choice\n");
}
}

return 0;
}
