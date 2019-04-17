using System;

public class Setup
{
    public static bool is_prime(double n)
    {
        if (n <= 1)
        {
            //Console.WriteLine("This is false\n");
            return false;
        }
        if (n == 2)
        {
            //Console.WriteLine("This is a 2\n");
            return true;
        }
        double sqrtOfN = Math.Sqrt(n) + 1;
        //Console.WriteLine("Here is the sqrt of N + 1 ==> " + sqrtOfN );//+ "\nThe rounded version ==> " + Math.Round(sqrtOfN,0));
        for (int x = 2; x < sqrtOfN; x++)
        {
            if (n % x == 0)
            {
                //Console.WriteLine("This is false\n");
                return false;
            }
        }
        //Console.WriteLine("This is true\n");
        return true;
    }


    public static int[] primes(int a, int b)
    { // get length of array
        int[] prime_array;
        int count = 0;
        for (int i = a; b >= i; i++)
        {
            if (is_prime(i))
            {
                count += 1;
            }
        }

        prime_array = new int[count]; // set array size	

        int array_count = 0;
        for (int j = a; b >= j; j++)
        { // fill array up
          //Console.WriteLine("Here is J => " + j);
            if (is_prime(j) == true)
            {
                prime_array[array_count] = j;
                array_count++;

            }
        }
        return prime_array;
    }


    public static void prime_partitions(int n, int k, int[] lst)
    {
        /*Console.WriteLine("this is n: "+n+"\nThis is k: "+k+"\nThis is lst:");
		for(int i = 0; lst.Length > i ; i++){
			Console.WriteLine("    Here is "+i+" element of lst "+lst[i]);
		}*/
        if (n == 0)
        {
            //Console.WriteLine("n == 0");
            for (int i = 0; i < lst.Length; i++)
            {
                if (i != 0)
                {
                    Console.Write(" + ");
                }
                Console.Write(lst[i]);
            }
            Console.WriteLine("\n");
        }

        else if (n > k)
        {
            //Console.WriteLine("here");
            int[] lst_of_primes = primes(k + 1, n);
            for (int i = 0; i < lst_of_primes.Length; i++)
            {
                int p = lst_of_primes[i];
                int[] temp_list = new int[lst.Length + 1];

                for (int j = 0; j < lst.Length; j++)
                { // copy lst to temp_list
                    temp_list[j] = lst[j];
                }

                temp_list[lst.Length] = p;

                /*for (int j = 0; j < temp_list.Length; j++){ //print list 
					Console.WriteLine("This is "+j+" item of lst "+temp_list[j]);
				}
				Console.WriteLine("\n");*/
                prime_partitions(n - p, p, temp_list);


            }
        }
    }

    public static void Main()
    { //prime_partitions but C# is stup so we need a Main function
      //is_prime(29); //Prime nubmers: 2 3 5 7 9 11 13 17 19 23 29
      //primes(0,5);
      //int[] testArray = primes(0,5);
        Console.Write("Enter a number (non-number to quit): ");
        string input_text = Console.ReadLine();
        if (input_text.Length == 0)
        {
            System.Environment.Exit(0);
        }
        int numVal = Int32.Parse(input_text);

        int[] emptyArray = new int[0];
        int k = 1;
        prime_partitions(numVal, k, emptyArray);
    }
}