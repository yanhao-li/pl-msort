with Text_Io;

package body Msort is
  procedure Sort(A : in out Arr) is
    procedure MergeSort(L: in Integer; R: in Integer) is
    T : Arr; 
    Mid : Integer := (L + R) / 2;

    task First;
    task Second;
    task Merge is
      entry FirstDone;
      entry SecondDone;
    end Merge;

    -- first half
    task body First is
    begin
      if L < Mid then 
        MergeSort(L, Mid);
      end if;
      Merge.FirstDone;
    end First;

    -- second half
    task body Second is
    begin
      if Mid + 1 < R then 
        MergeSort(Mid + 1, R);
      end if;
      Merge.SecondDone;
    end Second;

    task body Merge is
      I : Integer := L;
      J : Integer := Mid + 1;
      K : Integer := L;
    begin
      accept FirstDone;
      accept SecondDone;

      while K <= R loop
        if I > Mid or else (J <= R and then A(I) > A(J)) then
          T(K) := A(J);
          J := J + 1;
          K := K + 1;
        else
          T(K) := A(I);
          I := I + 1;
          K := K + 1;
        end if;
      end loop;

      for X in L .. R loop
        A(X) := T(X);
      end loop;
    end Merge;

    begin
      null;
    end MergeSort;

  begin
    MergeSort(1, A'Length);
  end Sort;
end Msort;