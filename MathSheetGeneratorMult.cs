// Random number multiplication
using System;
using System.Collections.Generic;
					
public class Program
{
	public static void Main()
	{
		Random r = new Random();
		
		int count = 0;
		List<string> eqList = new List<string>();
		for (int i = 0; i < 1000; i ++)
		{
			int rInt1 = r.Next(2, 10);
			int rInt2 = r.Next(2, 7);
			string equation = string.Format("{0} x {1} = ", rInt1, rInt2);
			
			if (!eqList.Contains(equation)) {
			    eqList.Add(equation);
			    Console.WriteLine(equation);
			    if (count++ > 60) {
				    break;
			    }
			}
		}
	}
}