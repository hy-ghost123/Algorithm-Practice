/*
 * =====================================================================================
 *
 *       Filename:  full_permutation.cpp
 *
 *    Description:  输出n个元素的全排列（递归解决)
 *
 *        Version:  1.0
 *        Created:  2014/05/30 06时52分59秒
 *       Revision:  none
 *       Compiler:  g++
 *
 *         Author:  Alex 
 *   Organization:  
 *
 * =====================================================================================
 */
#include <iostream>
using namespace std;

void recursion_Perm(int [], int, int);//递归实现
void nonrecursion_Perm(int [], int, int);//非递归实现
void swap(int [],int, int);
int str[100], str_copy[100], string_Length, operate_begin, operate_end, sum;
typedef struct{
	int Pos1, Pos2;
}ExchangePoint;

int main(){	
	cin >> string_Length;
	for(int i=0; i<string_Length; i++){
		cin >> str[i];
		str_copy[i]=str[i];
	}
	cin >> operate_begin >> operate_end;	
	recursion_Perm(str, operate_begin, operate_end);
	//cout << sum << endl;
	//sum=0;
	cout << endl;
	nonrecursion_Perm(str_copy, operate_begin, operate_end);
	//cout << sum << endl;
	return 0;
}

void recursion_Perm(int str[], int begin, int end){
	if(begin>end){
		return;
	}
	else if(begin==end){
		for(int i=operate_begin; i<=operate_end; i++)
			cout << str[i] << " ";
		cout << endl;
		//sum++;
	}
	else{
		for(int i=begin; i<=end; i++){
			swap(str, begin, i);
			recursion_Perm(str, begin+1, end);
			swap(str, begin, i);
		}
	}
}

void nonrecursion_Perm(int str[], int begin, int end){
	if(begin>end){
		return;
	}
	else{
		ExchangePoint stack[1000];
		int currentPos=end-begin; 
		for(int i=0; i<=end-begin; i++){
			stack[i].Pos1=stack[i].Pos2=begin+i;
		}
		while(true){
			if(currentPos<0){
				break;
			}
			else if(currentPos==end-begin){
				for(int i=begin; i<=end; i++)
					cout << str[i] << " ";
				cout << endl;
				//sum++;
			}
			if(stack[currentPos].Pos2==end){
				swap(str, stack[currentPos].Pos1, stack[currentPos].Pos2);
				currentPos--;
			}
			else{
				swap(str, stack[currentPos].Pos1, stack[currentPos].Pos2);
				stack[currentPos].Pos2++;
				swap(str, stack[currentPos].Pos1, stack[currentPos].Pos2);
				while(currentPos!=end-begin){
					currentPos++;
					stack[currentPos].Pos1=stack[currentPos].Pos2=begin+currentPos;
				}
			}
		}
	}

}

void swap(int str[], int i, int j){
	int tmp=str[i];
	str[i]=str[j];
	str[j]=tmp;
}


