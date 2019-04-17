
-- Run with gnatmkae hello.adb
-- then .\hello.exe

With Ada.Text_IO; use Ada.Text_IO;
with Ada.Numerics.Elementary_Functions;
with Ada.Containers.Vectors;
with Ada.Integer_Text_IO;

procedure ada_primes is
   function is_prime(n : Integer) return Boolean is
      x : Integer := 2;
      SqrtOfN : Float := Ada.Numerics.Elementary_Functions.Sqrt(Float(n));
      intSqrtOfN : Integer := Integer(SqrtOfN);
      begin
         if n <= 1 then
            -- Put_Line("n == 1");
            return FALSE;
         end if;
         if n = 2 then
            return TRUE;
         end if;

         loop
            if n mod x = 0 then
               return FALSE;
            end if;
            x := x + 1;
            exit when x > intSqrtOfN;
         end loop;
         return TRUE;
      end is_prime;



      package VectInt is new Ada.Containers.Vectors
     (Index_Type   => Natural,
      Element_Type => Natural);

      function primes(a,b : Integer) return VectInt.Vector is
         i : Integer := a;
         lst : VectInt.Vector;
      begin
         loop
            if is_prime(i) then
               VectInt.Append (lst, i);
            end if;
            i := i +1;
         exit when i > b;
         end loop;
         return lst;
      end primes;


      function find_a_num(num : Integer; list : VectInt.Vector) return Boolean is
      begin
         for i in 0 .. list.Last_Index loop
            if num = list.Element(i) then
               return TRUE;
            end if;
         end loop;

         return FALSE;
      end find_a_num;


   procedure prime_partitions(n, k : Integer; lst : VectInt.Vector) is
      tmpLst : VectInt.Vector; -- temp_list
      lstOfPrimes : VectInt.Vector; -- lst_of_primes
      p : Integer;
      lstIndx : Integer;
      lstOfPrimesInt : Integer;
      tmpLstInt : Integer;
      deepCopy : Integer;

   begin
      lstIndx := lst.Last_Index;
      if lstIndx = -1 then
         lstIndx := 0;
      end if;

      if n = 0 then
         for i in 0 .. lstIndx loop
            if i /= 0 then
               Put(" +");
            end if;
            Put(lst.Element(i)'Img);
         end loop;
         Put_Line("");
      
      elsif n > k then
         lstOfPrimes := primes(k+1,n);
         lstOfPrimesInt := lstOfPrimes.Last_Index;

         for j in 0 .. lstOfPrimesInt loop
            tmpLstInt := lst.Last_Index;
            p := lstOfPrimes.Element(j);
            VectInt.clear(tmpLst);

            for k in 0 .. tmpLstInt loop -- list copy
               if lst.Last_Index /= -1 then
                  -- Put_Line("3");
                  deepCopy := lst.Element(k);
                  VectInt.Append(tmpLst,deepCopy);
               end if;
            end loop;

            if find_a_num(p, tmpLst) = FALSE then
               VectInt.Append(tmpLst,p);
               prime_partitions(n-p,p,tmpLst);
            end if;
         end loop;
      end if;
   end prime_partitions;


emptyVect : VectInt.Vector;
InputNum : Integer;

begin
   Ada.Text_IO.Put ("Enter an integer: ");
   Ada.Integer_Text_IO.Get(InputNum);
   prime_partitions(InputNum,1,emptyVect);
end ada_primes;