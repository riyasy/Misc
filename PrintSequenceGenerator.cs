using System;
					
public class Program
{
	public static void Main()
	{
		int pagesToPrint = 10;
		int pagesPerPage = 2;
		int pageToStart = 1;
		int numberOfPagesPrinted = 0;
		while (numberOfPagesPrinted < pagesToPrint)
		{
			int counter = 0;
			while (counter < pagesPerPage)
			{
				Console.Write(pageToStart);
				Console.Write(",");				
				pageToStart++;
				counter++;
			}
			counter = 0;
			while (counter < pagesPerPage)
			{		
				pageToStart++;
				counter++;
			}
			numberOfPagesPrinted++;
		}
		
	}
}