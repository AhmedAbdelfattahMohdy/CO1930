#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int search_word_or_character(char string1[],char word[]){

int i=0,number_char=0,j=0,c=0;

//the while loop to size with word to search
while(word[j]!='\0'){
    j++;
    c=j;
}
int s=0;

//the nested loop to compare word in paragraph
for(j=0;word[j]!='\0';j++){
        for(i=0;string1[i]!='\0';i++){
            if(string1[i]==word[j]){
                s++;
                j++;
            }
            if(s==c){
                number_char++;
                j=0;
                s=0;
                continue;
            }
        }
}


return number_char;



}

void getSubstring(char arr[100],int f,int l){


        char sub[100];
        int c=0;
        int i=f;


        for(i;i<=l;i++){

               sub[c]=arr[i];
               c++;
             }
         sub[c]='\0'; // terminate string "that mean set it NULL"

       printf("Required substring is \"%s\"\n", sub);



}

char* tostring(char* p, char* j){
   return strcat(p,j);
 }
void Capitalize_First_Letter(char data[500])
{
    int i;
    for(i=0 ; data[i]!='\0'; ++i)
	{
		//check first character is lowercase alphabet
		if(i==0)
		{
			if((data[i]>='a' && data[i]<='z'))
				{
				    data[i]=data[i]-32; /*this will make lower case into upper case
				    because  ASCII of a=97 &  ASCII of A=65 */
			    }
            continue; //continue to the loop
		}
		else if(data[i]==' ')//check space
		{
			//if space is found, check next character
			i++;
			//check next character is lowercase alphabet
			if(data[i]>='a' && data[i]<='z')
			{
				data[i]=data[i]-32; //subtract 32 to make it capital
			}
            continue; //continue to the loop

		}
		else
		{
			//all other uppercase characters should be in lowercase
			if(data[i]>='A' && data[i]<='Z')
				data[i]=data[i]+32; /*subtract 32 to make it small/lowercase
				because ASCII of A=65 & ASCII of a=97 */
		}
	}
}
// convert the whole paragraph to UPPER case
char upper (char paragraph[100]){
    // initializing the iterator variable
    int i = 0;
    // iterate loop until
    // the end of the string
    while( paragraph[i] != '\0' )
    {
        // if character is in lowercase
        // then subtract 32
        if( paragraph[i] >= 'a' && paragraph[i] <= 'z' )
        {
           paragraph[i] = paragraph[i] - 32;
        }

        // increase iterator variable
        i++;
     }

     // display result
     printf("In Upper Case is:%s \n",paragraph);
}

// convert the whole paragraph to lower case
char lower(char paragraph[100]){
    // initializing the iterator variable
    int i = 0;
    // iterate loop until
    // the end of the string
    while( paragraph[i] != '\0' )
    {
        // if character is in lowercase
        // then add 32
        if( paragraph[i] >= 'A' && paragraph[i] <= 'Z' )
        {
           paragraph[i] = paragraph[i] + 32;
        }
        // increase iterator variable
        i++;
     }

     // display result
     printf("In lower Case is:%s \n ",paragraph);
}

int main()
{
    printf("\t***********************\n\t********welcome********\n\t***********************\n");
    char paragraph[100];

     // take the paragraph
     printf("Enter the paragraph: ");
     scanf("%[^\n]", paragraph);

     printf("what you want to do ?\n");
     printf("=============================\n");
     printf("1. Search on a specific word/character.\n");
     printf("2. substring.\n");
     printf("3. Join to strings.\n");
     printf("4. Capitalize first letter in each word.\n");
     printf("5. Convert all characters in the paragraph to Lower/upper case.\n");
     printf("=============================\n");
     int h,f,l;
     printf("Enter number of operation:");
     scanf("%d",&h);
     printf("=============================\n");

     char word[10];
     char join[200];


     if (h==1){
        printf("Enter The Word or Character To Search:\n");
        scanf("%s",word);
        printf("The Word Or Character  %s Is Found %d Item ",word, search_word_or_character(paragraph,word));
     }
     else if(h==2){
        printf("\nEnter The first  Index in substring : ");
            scanf("%d",&f);

            printf("Enter The last  Index in substring : ");
            scanf("%d",&l);
            if (f<=l){
            // if statement to handle the Error that can occur

                getSubstring(paragraph,f,l); //calling the function to get substring

            }
            else{
                printf("Error : the first index must be more than the last index");
            }

     }
     else if (h==3){
            printf("Enter the paragraph you want to join:");
            scanf("%[^\n]", join);
            printf(tostring(paragraph,join));
            printf(paragraph);
     }

     else if (h==4){
            Capitalize_First_Letter(paragraph);
            printf("the Capitalization of first letter in this paragraph is : %s",paragraph);

     }
     else if (h==5){
        upper(paragraph);
        lower(paragraph);
     }
     else{
        printf("wrong choice!!!");
     }


    return 0;
}
