with Msort;
with Text_Io;

procedure Main is
  A : Msort.Arr := (2, 3, 5, 7, 11);
  Count : Integer := 0;
  task Printer is
    entry Print;
  end Printer;

  task Sum;

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

  task body Sum is
  begin
    for Ele of A loop
      Count := Count + Integer(Ele);
    end loop;
  end Sum;
  
begin
  Msort.Sort(A);
  Printer.Print;
end Main;