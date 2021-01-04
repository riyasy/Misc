// Random number addition
using System;
					
public class Program
{
	public static void Main()
	{
		Random r = new Random();
		
		int count = 0;
		for (int i = 0; i < 1000; i ++)
		{
			int rInt1 = r.Next(10, 100);
			int rInt2 = r.Next(10, 100);
			if (rInt1 + rInt2 < 110){
				if (count %2 == 0 && rInt1 % 10 + rInt2 % 10 > 10) {				
					Console.WriteLine("{0} + {1} = ", rInt1, rInt2);
					count++;
				}
				if (count %2 != 0 && rInt1 % 10 + rInt2 % 10 <= 10) {				
					Console.WriteLine("{0} + {1} = ", rInt1, rInt2);
					count++;
				}
			}
			if (count > 19) {
				break;
			}
		}
	}
}