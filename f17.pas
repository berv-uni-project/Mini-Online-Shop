unit f17;

interface

uses f1;
(*Prosedur save and exit*)
procedure saveandexit(var StokBaju:tStokBaju; var Ekspedisi:tEkspedisi;var Cart:tCart;var History:tHistory;var selesai:Boolean);
{I.S : StokBaju,Ekspedisi,Cart, History terdefinisi, selesai bernilai False}
{F.S : semua file yang terupdate ditulis ulang dan ditutup, mungkin kecuali ekspedisi yang akan
tidak diupdate sehingga cukup ditutup, selesai bernilai True }

implementation

(*Prosedur save and exit*)
procedure saveandexit(var StokBaju:tStokBaju; var Ekspedisi:tEkspedisi;var Cart:tCart;var History:tHistory;var selesai:Boolean);
{I.S : StokBaju,Ekspedisi,Cart, History terdefinisi, selesai bernilai False}
{F.S : semua file yang terupdate ditulis ulang dan ditutup, mungkin kecuali ekspedisi yang akan
tidak diupdate sehingga cukup ditutup, selesai bernilai True }
var
  tempLine,tempKata:string;
  f:text;
  i:integer;
begin
  Ekspedisi.Neff:=0;

  {Menulis ulang history.txt}
  assign(f,'history.txt');
  rewrite(f);
  for i:=1 to History.Neff do
    begin
      tempLine:='';
      tempLine:=tempLine+History.Nama[i]+' | ';
      tempLine:=tempLine+History.Warna[i]+' | ';
      str(History.Berat[i]:0:2,tempKata);
      tempLine:=tempLine+tempKata+' | ';
      tempLine:=tempLine+History.Bahan[i]+' | ';
      str(History.Harga[i]:0:0,tempKata);
      tempLine:=tempLine+tempKata+' | ';
      str(History.nS[i],tempKata);
      tempLine:=tempLine+tempKata+' | ';
      str(History.nM[i],tempKata);
      tempLine:=tempLine+tempKata+' | ';
      str(History.nL[i],tempKata);
      tempLine:=tempLine+tempKata+' | ';
      str(History.nXL[i],tempKata);
      tempLine:=tempLine+tempKata+' | ';
      tempLine:=tempLine+History.NamaEks[i]+' | ';
      tempLine:=tempLine+History.JenisEks[i]+' | ';
      tempLine:=tempLine+History.Kota[i]+' | ';
      str(History.BiayaEks[i]:0:0,tempKata);
      tempLine:=tempLine+tempKata+' | ';
      str(History.LamaPengiriman[i],tempKata);
      tempLine:=tempLine+tempKata+' | ';
      str(History.Tanggal[i].dd,tempKata);
      tempLine:=tempLine+tempKata+'/';
      str(History.Tanggal[i].mm,tempKata);
      tempLine:=tempLine+tempKata+'/';
      str(History.Tanggal[i].yy,tempKata);
      tempLine:=tempLine+tempKata;
      writeln(f,tempLine);
    end;
  close(f);

  {Menulis ulang stokbaju.txt}
  assign(f,'stokbaju.txt');
  rewrite(f);
  for i:=1 to StokBaju.Neff do
    begin
      tempLine:='';
      tempLine:=tempLine+StokBaju.Nama[i]+' | ';
      tempLine:=tempLine+StokBaju.Kategori[i]+' | ';
      tempLine:=tempLine+StokBaju.Gender[i]+' | ';
      tempLine:=tempLine+StokBaju.Warna[i]+' | ';
      str(StokBaju.Berat[i]:0:2,tempKata);
      tempLine:=tempLine+tempKata+' | ';
      tempLine:=tempLine+StokBaju.Bahan[i]+' | ';
      str(StokBaju.Harga[i]:0:0,tempKata);
      tempLine:=tempLine+tempKata+' | ';
      str(StokBaju.nS[i],tempKata);
      tempLine:=tempLine+tempKata+' | ';
      str(StokBaju.nM[i],tempKata);
      tempLine:=tempLine+tempKata+' | ';
      str(StokBaju.nL[i],tempKata);
      tempLine:=tempLine+tempKata+' | ';
      str(StokBaju.nXL[i],tempKata);
      tempLine:=tempLine+tempKata+' | ';
      str(StokBaju.jumlahBeli[i],tempKata);
      tempLine:=tempLine+tempKata+' | ';
      str(StokBaju.grosirDiskon[i],tempKata);
      tempLine:=tempLine+tempKata;
      writeln(f,tempLine);
    end;
  close(f);


  {Menulis ulang stokbaju.txt}
  assign(f,'cart.txt');
  rewrite(f);
  for i:=1 to Cart.Neff do
    begin
      tempLine:='';
      tempLine:=tempLine+Cart.Nama[i]+' | ';
      tempLine:=tempLine+Cart.Warna[i]+' | ';
      str(Cart.Berat[i]:0:2,tempKata);
      tempLine:=tempLine+tempKata+' | ';
      tempLine:=tempLine+Cart.Bahan[i]+' | ';
      str(Cart.Harga[i]:0:0,tempKata);
      tempLine:=tempLine+tempKata+' | ';
      str(Cart.nS[i],tempKata);
      tempLine:=tempLine+tempKata+' | ';
      str(Cart.nM[i],tempKata);
      tempLine:=tempLine+tempKata+' | ';
      str(Cart.nL[i],tempKata);
      tempLine:=tempLine+tempKata+' | ';
      str(Cart.nXL[i],tempKata);
      tempLine:=tempLine+tempKata;
      writeln(f,tempLine);
    end;
  close(f);

  selesai:=True;
end;

end.
