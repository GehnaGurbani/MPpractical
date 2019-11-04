#include<stdio.h>
#include<conio.h>
void main()
{
int  choice,num1,num2,a,s,m,dq;
clrscr();
menu:
printf("1,ADDITION \n 2.SUBTRACTION\n 3.MULTIPLICATION\n 4.DIVISION\n ");
printf("Enter your choice");
scanf("%d",&choice);
printf("enter the first no:\n");
scanf("%d",&num1);
printf("enter the second no:\n");
scanf("%d",&num2);
asm mov ax,num1;
asm mov bx,num2;

asm cmp choice,01;
asm jne labsub;
asm add ax,bx;
asm mov a,ax;
printf("result is %d",a);
labsub:
asm cmp choice,02;
asm jne labmul;
asm mov ax,num1;
asm mov bx,num2;
asm sub ax,bx;
asm mov s,ax;
printf("result is %d",s);

labmul:
asm cmp choice,03;
asm jne labdiv;
asm mov ax,num1;
asm mov bx,num2;
asm mul bx;
asm mov m,ax;
printf("Result is %d",m);
labdiv:
asm cmp choice,04;
asm mov ax,num1;
asm mov bx,num2;
asm div bx;
asm mov dq,ax;
printf("qoutient is %d:",dq);

getch();
}
