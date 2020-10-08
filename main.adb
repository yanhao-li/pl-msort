with Msort;
with Text_Io;

procedure Main is
  A : Msort.Arr := (2, 3, 5, 7, 11);

  task Printer is
    entry Print(A : Msort.Arr);
  end Printer;

  task body Printer is
  begin
    accept Print(A: Msort.Arr) do
      for I in A'Range loop
        Text_Io.Put(Msort.Int'Image(A(I)));
        Text_Io.Put(' ');
      end loop;
    end Print;
  end Printer;
  
begin
  Msort.Sort(A);
  Printer.Print(A);
end Main;