package Msort is
  LENGTH : constant := 100; 
  type Int is range -300..300;
  type Arr is array (1..LENGTH) of Int;
  procedure Sort(A : in out Arr);
end Msort;