with Msort;
with Text_Io;
with Ada.Integer_Text_IO;

procedure Main is
  A : Msort.Arr;
  Count : Integer := 0;

  task Reader is
    entry Read;
  end Reader;
  task Sum is
    entry Start;
  end Sum;
  task Printer is
    entry Print;
  end Printer;


  task body Reader is
  X : Integer;
  begin
    accept Read do
      for I in 1..Msort.LENGTH loop
        Ada.Integer_Text_IO.Get(X);
        A(I) := Msort.Int(X);
      end loop;
    end Read;
  end Reader;

  task body Sum is
  begin
    accept Start do
      for Ele of A loop
        Count := Count + Integer(Ele);
      end loop;
    end Start;
  end Sum;

  task body Printer is
  begin
    accept Print do
      for I in A'Range loop
        Text_Io.Put(Msort.Int'Image(A(I)));
        Text_Io.Put(' ');
      end loop;
      Text_Io.New_Line;

      -- Print Sum
      Text_Io.Put_Line("Sum:" & Integer'Image(Count)); 
    end Print;
  end Printer;
  
begin
  Reader.Read;
  Sum.Start;
  Msort.Sort(A);
  Printer.Print;
end Main;