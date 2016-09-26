unit f1;
(*Unit yang berisi type data bentukan yang akan dipakai secara global*)
(*Tersedia prosedur F1-load*)
(*Tersedia prosedur tambahan seperti rubahtanggal,swapIndex, dan swapBaju*)

interface

(******************************KAMUS***********************************)
(*Konstanta Global*)
const
	Nmax=100;
	
(*Type Bentukan*)
type
	indeksing=record
	jumlahBeli:array[1..Nmax] of integer;
	Harga:array[1..Nmax] of real;
	indeks:array[1..Nmax] of integer;
	end;

  table=record
  isi:array[1..15]of array [1..Nmax] of string;
  Neff,Nisi:integer;
  end;

  tTanggal=record
  dd,mm,yy:integer;
  end;

  tStokBaju=record
  Nama, Kategori, Gender, Warna, Bahan      :array [1..Nmax] of string;
  Berat :array [1..Nmax] of real;
  nS,nM,nL,nXL,jumlahBeli, grosirDiskon: array [1..Nmax] of integer;
  Harga:array [1..Nmax] of real;
  Neff:integer;
  end;

  tEkspedisi=record
  NamaEks,JenisEks,Kota : array [1..Nmax] of string;
  Lama : array [1..Nmax] of integer;
  BiayaEks:array [1..Nmax] of longint;
  Neff :integer;
  end;

  tCart=record
  Nama, Warna, Bahan :array [1..Nmax] of string;
  Berat :array [1..Nmax] of real;
  nS,nM,nL,nXL :array [1..Nmax] of integer;
  Harga:array [1..Nmax] of real;
  Neff :integer;
  end;

  tHistory=record
  Nama, Warna, Bahan, NamaEks, JenisEks, Kota: array [1..Nmax] of string;
  Berat :array [1..Nmax] of real;
  nS, nM, nL, nXL, LamaPengiriman: array [1..Nmax] of integer;
  Harga, BiayaEks:array [1..Nmax] of real;
  Tanggal:array [1..Nmax] of tTanggal;
  Neff:integer;
  end;

(*Kumpulan prosedur F1*)

procedure load(namafile:string;var StokBaju:tStokBaju; var Ekspedisi:tEkspedisi; var Cart:tCart; var History:tHistory);
{I.S : nama file sudah didefinisikan, menyediakan sebuah database yang masih kosong sebelum diisi}
{F.S : database stokbaju, ekspedisi, cart, history akan terisi}

procedure rubahTanggal(kalimat:string; var tanggal:tTanggal);
{I.S : kalimat berisi tanggal dalam bentuk string}
{F.S : tanggal terdefinisi dan berisi tanggal seperti dalam kalimat}

procedure swapIndeks(var i:indeksing;a,b:integer);
{I.S : indeksing, dan indeks yang akan di swap}
{F.S : indeksing berganti nilainya}

procedure swapBaju(var StokBaju:tStokBaju;a,b:integer);
{I.S : StokBaju dan 2 indeks yang akan di swap terdefinisi}
{F.S : Baju di swap}

implementation

procedure load(namafile:string;var StokBaju:tStokBaju; var Ekspedisi:tEkspedisi; var Cart:tCart; var History:tHistory);
{I.S : nama file sudah didefinisikan, menyediakan sebuah database yang masih kosong sebelum diisi}
{F.S : database stokbaju, ekspedisi, cart, history akan terisi}
(*Kamus Lokal*)
var
  tempLine:string;
  f:text;
  Tab:table;
  i,j,posAwal,numberCopy:integer;
(*Algoritma*)  
begin
  Tab.Neff:=0;
  assign(f,namafile);
  reset(f);
  while(not(EOF(f))) do
  begin
    {Menambah line}
    Tab.Neff:=Tab.Neff+1;
    readln(f,tempLine);

    {Pemosesan perline}
    j:=1;
    posAwal:=1;
    for i:=1 to length(tempLine)do
    begin
      if((tempLine[i]='|')OR (i=length(tempLine)))then
      begin
        if(i<>length(tempLine)) then
          numberCopy:=(i-1)-posAwal
          else numberCopy:=i-posAwal+1;
        Tab.isi[j][Tab.Neff]:=copy(tempLine,posAwal,numberCopy);
        Tab.Nisi:=j;
        posAwal:=i+2;
        j:=j+1;
      end;
    end;
  end;
  close(f);

  {Merubah ke bentuk yang diinginkan}
  case (namafile) of
  'stokbaju.txt':
    begin
      for i:=1 to Tab.Neff do
      begin
        StokBaju.Nama[i]:=Tab.isi[1][i];
        StokBaju.Kategori[i]:=Tab.isi[2][i];
        StokBaju.Gender[i]:=Tab.isi[3][i];
        StokBaju.Warna[i]:=Tab.isi[4][i];
        val(Tab.isi[5][i],StokBaju.Berat[i]);
        StokBaju.Bahan[i]:=Tab.isi[6][i];
        val(Tab.isi[7][i],StokBaju.Harga[i]);
        val(Tab.isi[8][i],StokBaju.nS[i]);
        val(Tab.isi[9][i],StokBaju.nM[i]);
        val(Tab.isi[10][i],StokBaju.nL[i]);
        val(Tab.isi[11][i],StokBaju.nXL[i]);
        val(Tab.isi[12][i],StokBaju.jumlahBeli[i]);
        val(Tab.isi[13][i],StokBaju.grosirDiskon[i]);
      end;
      StokBaju.Neff:=Tab.Neff;
    end;
  'ekspedisi.txt':
    begin
      for i:=1 to Tab.Neff do
      begin
        Ekspedisi.NamaEks[i]:=Tab.isi[1][i];
        Ekspedisi.JenisEks[i]:=Tab.isi[2][i];
        Ekspedisi.Kota[i]:=Tab.isi[3][i];
        val(Tab.isi[4][i],Ekspedisi.BiayaEks[i]);
        val(Tab.isi[5][i],Ekspedisi.Lama[i]);
      end;
      Ekspedisi.Neff:=Tab.Neff;
    end;
  'cart.txt':
    begin
      for i:=1 to Tab.Neff do
      begin
        Cart.Nama[i]:=Tab.isi[1][i];
        Cart.Warna[i]:=Tab.isi[2][i];
        val(Tab.isi[3][i],Cart.Berat[i]);
        Cart.Bahan[i]:=Tab.isi[4][i];
        val(Tab.isi[5][i],Cart.Harga[i]);
        val(Tab.isi[6][i],Cart.nS[i]);
        val(Tab.isi[7][i],Cart.nM[i]);
        val(Tab.isi[8][i],Cart.nL[i]);
        val(Tab.isi[9][i],Cart.nXL[i]);
      end;
      Cart.Neff:=Tab.Neff;
    end;
  'history.txt':
    begin
      for i:=1 to Tab.Neff do
      begin
        History.Nama[i]:=Tab.isi[1][i];
        History.Warna[i]:=Tab.isi[2][i];
        val(Tab.isi[3][i],History.Berat[i]);
        History.Bahan[i]:=Tab.isi[4][i];
        val(Tab.isi[5][i],History.Harga[i]);
        val(Tab.isi[6][i],History.nS[i]);
        val(Tab.isi[7][i],History.nM[i]);
        val(Tab.isi[8][i],History.nL[i]);
        val(Tab.isi[9][i],History.nXL[i]);
        History.NamaEks[i]:=Tab.isi[10][i];
        History.JenisEks[i]:=Tab.isi[11][i];
        History.Kota[i]:=Tab.isi[12][i];
        val(Tab.isi[13][i],History.BiayaEks[i]);
        val(Tab.isi[14][i],History.LamaPengiriman[i]);
        rubahTanggal(Tab.isi[15][i],History.Tanggal[i]);
      end;
      History.Neff:=Tab.Neff;
    end;
  else writeln('Nama file eksternal salah!!');
  end;
end;

procedure rubahTanggal(kalimat:string; var tanggal:tTanggal);
{I.S : kalimat berisi tanggal dalam bentuk string}
{F.S : tanggal terdefinisi dan berisi tanggal seperti dalam kalimat}
(*Kamus Lokal*)
var
  i,posAwal,j:integer;
  temp:array[1..3] of string;
(*Algoritma*)
begin
  posAwal:=1;
  j:=1;
  for i:=1 to length(kalimat) do
  begin
    if((kalimat[i]='/')OR(i=length(kalimat))) then
    begin
      if (i<>length(kalimat)) then
        temp[j]:=copy(kalimat,posAwal,(i-posAwal)) else
        temp[j]:=copy(kalimat,posAwal,(i-posAwal+1));
      posAwal:=i+1;
      j:=j+1;
    end;
  end;

  val(temp[1],tanggal.dd);
  val(temp[2],tanggal.mm);
  val(temp[3],tanggal.yy);
end;

procedure swapIndeks(var i:indeksing;a,b:integer);
{I.S : indeksing, dan indeks yang akan di swap}
{F.S : indeksing berganti nilainya}
(*Kamus Lokal*)
var
	jumlahBeliTemp,indeksTemp:integer;
	HargaTemp:real;
(*Algoritma*)
begin
	jumlahBeliTemp:=i.jumlahBeli[a];
	indeksTemp:=i.indeks[a];
	HargaTemp:=i.Harga[a];

	i.jumlahBeli[a]:=i.jumlahBeli[b];
	i.indeks[a]:=i.indeks[b];
	i.Harga[a]:=i.Harga[b];

	i.jumlahBeli[b]:=jumlahBeliTemp;
	i.indeks[b]:=indeksTemp;
	i.Harga[b]:=HargaTemp;
end;

procedure swapBaju(var StokBaju:tStokBaju;a,b:integer);
{I.S : StokBaju dan 2 indeks yang akan di swap terdefinisi}
{F.S : Baju di swap}
var
	Nama, Kategori, Gender, Warna, Bahan  :string;
	Berat :real;
	nS,nM,nL,nXL,jumlahBeli, grosirDiskon	:integer;
	Harga :real;
begin
	Nama			:=StokBaju.Nama[a];
	Kategori	:=StokBaju.Kategori[a];
	Gender		:=StokBaju.Gender[a];
	Warna			:=StokBaju.Warna[a];
	Bahan			:=StokBaju.Bahan[a];
	Berat			:=StokBaju.Berat[a];
	nS				:=StokBaju.nS[a];
	nM				:=StokBaju.nM[a];
	nL				:=StokBaju.nL[a];
	nXL 			:=StokBaju.nXL[a];
	jumlahBeli	:=StokBaju.jumlahBeli[a];
	grosirDiskon:=StokBaju.grosirDiskon[a];
	Harga				:=StokBaju.Harga[a];

	StokBaju.Nama[a]			:=StokBaju.Nama[b];
	StokBaju.Kategori[a]	:=StokBaju.Kategori[b];
	StokBaju.Gender[a]		:=StokBaju.Gender[b];
	StokBaju.Warna[a]			:=StokBaju.Warna[b];
	StokBaju.Bahan[a]			:=StokBaju.Bahan[b];
	StokBaju.Berat[a]			:=StokBaju.Berat[b];
	StokBaju.nS[a]				:=StokBaju.nS[b];
	StokBaju.nM[a]				:=StokBaju.nM[b];
	StokBaju.nL[a]				:=StokBaju.nL[b];
	StokBaju.nXL[a] 			:=StokBaju.nXL[b];
	StokBaju.jumlahBeli[a]	:=StokBaju.jumlahBeli[b];
	StokBaju.grosirDiskon[a]:=StokBaju.grosirDiskon[b];
	StokBaju.Harga[a]				:=StokBaju.Harga[b];

	StokBaju.Nama[b]			:=Nama;
	StokBaju.Kategori[b]	:=Kategori;
	StokBaju.Gender[b]		:=Gender;
	StokBaju.Warna[b]			:=Warna;
	StokBaju.Bahan[b]			:=Bahan;
	StokBaju.Berat[b]			:=Berat;
	StokBaju.nS[b]				:=nS;
	StokBaju.nM[b]				:=nM;
	StokBaju.nL[b]				:=nL;
	StokBaju.nXL[b] 			:=nXL;
	StokBaju.jumlahBeli[b]	:=jumlahBeli;
	StokBaju.grosirDiskon[b]:=grosirDiskon;
	StokBaju.Harga[b]				:=Harga;
end;



end.
