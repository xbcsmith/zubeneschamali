
/* Problem in the Universe program */

#include<stdio.h>
#include<foo.h>
void main()
{
    int a = 10, b = 32, c = 6, d = 9, num;
    printf("foo the program\n");
    printf("The Ultimate Question is 'what is %d x %d ?'\n", c, d);
    num = add(a, b);
    printf("The Answer is %d\n", num);
    printf("Dont Panic!\n");
}

