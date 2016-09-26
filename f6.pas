unit f6;

interface
uses f1,f3;

procedure filterClothes(StokBaju:tStokBaju);
{I.S  :StokBaju terdefinisi}
{F.S  :menampilkan sesuai filter, memungkinkan multiple filter}

procedure showDetailFilter(StokBaju:tStokBaju;id:integer;ukuran:string);
{I.S  :StokBaju,indeks, ukuran yang di cari terdefinisi}
{F.S  :menampilkan sesuai filter, dengan menampilkan ukuran tertentu}

implementation
procedure filterClothes(StokBaju:tStokBaju);
{I.S  :StokBaju terdefinisi}
{F.S  :menampilkan sesuai filter, memungkinkan multiple filter}
var
  gender,kategori,ukuran,warna:string;
  i,no:integer;
begin
  write('>gender: ');readln(gender);
  write('>kategori: ');readln(kategori);
  write('>ukuran: ');readln(ukuran);
  write('>warna: ');readln(warna);
  write('>');
  lowercase(gender);
  lowercase(kategori);
  lowercase(ukuran);
  lowercase(warna);
  no:=0;
  for i:=1 to StokBaju.Neff do
  begin
      if ( ( (gender='semua') or (gender=lowercase(StokBaju.Gender[i])) ) and ((kategori='semua') or (kategori=lowercase(StokBaju.Kategori[i]))) and ((ukuran='semua') or (ukuran='s') or (ukuran='m') or (ukuran='l') or (ukuran='xl')) and ((warna='semua') or (warna=lowercase(StokBaju.Warna[i])))) then
      begin
        no:=no+1;
        write(no,'. ');
        if(ukuran='semua')then
          showDetailProduct(StokBaju,i,'filterClothes') else
          showDetailFilter(StokBaju,i,ukuran);
      end;
  end;

  if(no=0)then writeln('barang tidak ditemukan');

end;

procedure showDetailFilter(StokBaju:tStokBaju;id:integer;ukuran:string);
{I.S  :StokBaju,indeks, ukuran yang di cari terdefinisi}
{F.S  :menampilkan sesuai filter, dengan menampilkan ukuran tertentu}
begin
  writeln(StokBaju.Nama[id]);
  writeln('Warna : ',StokBaju.Warna[id]);
  case (ukuran) of
    's' :writeln('S : ',StokBaju.nS[id],' ');
    'm' :writeln('M : ',StokBaju.nM[id],' ');
    'l' :writeln('L : ',StokBaju.nL[id],' ');
    'xl':writeln('XL : ',StokBaju.nXL[id],' ');
  end;
  writeln('Rp',StokBaju.Harga[id]);
end;

end.
