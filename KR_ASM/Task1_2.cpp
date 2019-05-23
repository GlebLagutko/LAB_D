#include <vector>
#include <iostream>
#include <ctime>
#include <iomanip>

struct Point
{
	int x;
	int y;
};

extern "C"
{

	void __cdecl FindNOD(int* x, int* y);
	void __cdecl MultMatrix(int** x, int y, int z);
}

class Program
{
public:
	void Run()
	{
		//Task1
		int p;
		int q;
		std::wcout << L"Input p and q : " << std::endl;
		std::wcin >> p;
		std::wcin >> q;

		FindNOD(&p, &q);
		std::wcout << p << L" / " << q << std::endl;
	
		//Task2
		int N, M;
		std::wcout << L"Input N and M : ";
		std::wcin >> N >> M;
		srand(time(NULL));
		int** matrix = new int*[N];
		for (int i = 0; i < N; i++)
		{
			matrix[i] = new int[N];
			for (int j = 0; j < M; j++)
			{
				matrix[i][j] = rand() % 2000;
			}
		}

		for (int i = 0; i < N; i++)
		{
			for (int j = 0; j < M; j++)
			{
				std::wcout << std::setw(6) << matrix[i][j] << ' ';
			}
			std::wcout << std::endl;
		}

		MultMatrix(matrix, N, M);
		std::wcout << L"After : " << std::endl;
		for (int i = 0; i < N; i++)
		{
			for (int j = 0; j < M; j++)
			{
				std::wcout << std::setw(8) << matrix[i][j] << ' ';
			}
			std::wcout << std::endl;
		}
	}
};

int main(int argc, char* argv[])
{
	Program().Run();

	std::wcout << L"Press any key to continue...";
	std::wcin.get();
	system("pause");
	return 0;
}
