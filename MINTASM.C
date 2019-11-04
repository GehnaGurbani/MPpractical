#include<stdio.h>
#include<conio.h>
void main()
{
int arr[20],min,size,i,x;
printf("Enter the no. of elements in the array: ");
scanf("%d",&size);
printf("Enter %d intergers",size) ;
asm mov cx,size;

for(i=0;i<size;i++)
{
	scanf("%d",&arr[i]);

}
for(i=0;i<size;i++)
{
printf("%d	", arr[i]);
}

min = arr[0];
x=arr[size-1];
minsearch:
asm mov bx,x;
asm cmp min,bx;
asm jc decreament;
asm mov min,bx;
decreament:
asm dec bx;
asm loop minsearch;
printf("The minimum no. is: %d\n",min);
getch();


}