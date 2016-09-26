unit f4;

interface
uses f1,f3;

procedure searchClothesByKeyword(StokBaju:tStokBaju;keyword:string);
{I.S  :StokBaju dan keyword terdefinisi}
{F.S  :menampilkan yang secara detail dengan keyword}

implementation
procedure searchClothesByKeyword(StokBaju:tStokBaju;keyword:string);
{I.S  :StokBaju dan keyword terdefinisi}
{F.S  :menampilkan yang secara detail dengan keyword}
var
  i,no :integer;
begin
  no:=0;
  write('>');

  for i:=1 to StokBaju.Neff do
  begin
    if(pos(keyword,lowercase(StokBaju.Nama[i]))<>0)or(pos(keyword,lowercase(StokBaju.Kategori[i]))<>0)or(pos(keyword,lowercase(StokBaju.Warna[i]))<>0)then
    begin
      no:=no+1;
      write(no,'. ');
      showDetailProduct(StokBaju,i,'all');
    end;
  end;

  if(no=0)then writeln('Tidak ada kata kunci yang cocok.');
end;
end.
