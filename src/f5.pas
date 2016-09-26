unit f5;

interface
uses f1,f3;

procedure sortPrice(var StokBaju:tStokBaju;tampil:string);
{I.S :StokBaju dan tampil terdefinsi}
{F.S :StokBaju terurut secara berdasarkan harga dari besar ke kecil}

implementation

procedure sortPrice(var StokBaju:tStokBaju;tampil:string);
{I.S :StokBaju dan tampil terdefinsi}
{F.S :StokBaju terurut secara berdasarkan harga dari besar ke kecil}
var
  i,j,indeks:integer;
begin
  {insert sort}
  for i:=1 to StokBaju.Neff do
    begin
      indeks:=i;
      for j:=i+1 to StokBaju.Neff do
        begin
          if(StokBaju.Harga[indeks]<StokBaju.Harga[j]) then
            indeks:=j;
        end;

      {swap}
      swapBaju(StokBaju,i,indeks);
    end;

  {output}
  if(tampil='tampil')then
  for i:=1 to StokBaju.Neff do
  begin
    write(i,'. ');
    showDetailProduct(StokBaju,i,'sortPrice');
  end;
end;

end.
