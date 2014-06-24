/*
 * =====================================================================================
 *
 *       Filename:  integer_divide.cpp
 *
 *    Description:  输出整数n的所有划分（递归）
 *
 *        Version:  1.0
 *        Created:  2014/05/30 19时19分20秒
 *       Compiler:  gcc
 *
 *         Author:  Alex
 *
 * =====================================================================================
 */
#include <iostream>
using namespace std;

#define MAX 100
int Ans[MAX][MAX];
int recursion_DivideNumber(int, int);//递归计算划分数量
void nonrecursion_DivideNumber(int);//非递归计算划分数量
void PrintDivideResult(int, int);//输出所有划分

int main(){
	int n;
	cin >> n;
	nonrecursion_DivideNumber(n);
	cout << Ans[n][n] << " " << recursion_DivideNumber(n, n) << "\n\n";
	PrintDivideResult(n, n);
	return 0;
}

int recursion_DivideNumber(int number, int UpperBound){
	if(number<=0){
		return 1;
	} 
	else if(number==1||UpperBound==1){
		return 1;
	}	
	else if(number<UpperBound){ 
		return recursion_DivideNumber(number, number);
	}
	else{ 
		return recursion_DivideNumber(number, UpperBound-1)+recursion_DivideNumber(number-UpperBound,UpperBound);
	}
}

void nonrecursion_DivideNumber(int number){
	for(int i=1; i<=number; i++) Ans[0][i]=1;
	for(int i=1; i<=number; i++){
		for(int j=1; j<=number; j++){
			if(i==1||j==1){ 
				Ans[i][j]=1;
			}
			else if(i<j){ 
				Ans[i][j]=Ans[i][i];
			}
			else{
				Ans[i][j]=Ans[i-j][j]+Ans[i][j-1];
			}
		}
	}
}

void PrintDivideResult(int number, int UpperBound){
	static int AnsString[1000];
	static int currentPos=0;

	if(number==0){
		for(int i=0; i<currentPos; i++)
			cout << AnsString[i] << " ";
		cout << endl;
	}
	else if(number==1||UpperBound==1){
		for(int i=0; i<currentPos; i++)
			cout << AnsString[i] << " ";
		while(number--)
			cout << "1" << " ";
		cout << endl;
	}
	else if(number<UpperBound){
		PrintDivideResult(number, number);
	}
	else{
		AnsString[currentPos++]=UpperBound;
		PrintDivideResult(number-UpperBound, UpperBound);
		currentPos--;
		PrintDivideResult(number, UpperBound-1);
	}
}
















