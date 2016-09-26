unit f15;

interface
uses f1;
procedure swap(var History:tHistory;a,b:integer);
{I.S : StokBaju dan 2 indeks yang akan di swap terdefinisi}
{F.S : Baju di swap}

procedure showTransaction(var History:tHistory; tampil:string);
{I.S :StokBaju dan tampil terdefinsi}
{F.S :StokBaju terurut secara berdasarkan harga dari besar ke kecil}

implementation
procedure swap(var History:tHistory;a,b:integer);
{I.S : StokBaju dan 2 indeks yang akan di swap terdefinisi}
{F.S : Baju di swap}

var
	Nama, Warna, Bahan, NamaEks, JenisLayanan, KotaTujuan:string;
	Berat 								:real;
	nS,nM,nL,nXL, lamapengiriman		:integer;
	Harga,BiayaPerKg					:real;
	tanggalkirim						:tTanggal;

begin
	Nama			:=History.Nama[a];
	Warna			:=History.Warna[a];
	Bahan			:=History.Bahan[a];
	Berat			:=History.Berat[a];
	nS				:=History.nS[a];
	nM				:=History.nM[a];
	nL				:=History.nL[a];
	nXL 			:=History.nXL[a];
	biayaPerKG		:= History.BiayaEks[a];
	tanggalkirim 	:= History.Tanggal[a];
	NamaEks			:=History.NamaEks[a];
	JenisLayanan	:=History.JenisEks[a];
	KotaTujuan		:=History.Kota[a];
	lamapengiriman 	:=History.lamapengiriman[a];
	Harga			:=History.Harga[a];

	History.Nama[a]				:=History.Nama[b];
	History.Warna[a]			:=History.Warna[b];
	History.Bahan[a]			:=History.Bahan[b];
	History.Berat[a]			:=History.Berat[b];
	History.nS[a]				:=History.nS[b];
	History.nM[a]				:=History.nM[b];
	History.nL[a]				:=History.nL[b];
	History.nXL[a]				:=History.nXL[b];
	History.BiayaEks[a]			:=History.BiayaEks[b];
	History.Tanggal[a]			:=History.Tanggal[b];
	History.NamaEks[a]			:=History.NamaEks[b];
	History.JenisEks[a]			:=History.JenisEks[b];
	History.Kota[a]				:=History.Kota[b];
	History.lamapengiriman[a]	:=History.lamapengiriman[b];
	History.Harga[a]			:=History.Harga[b];

	History.Nama[b]:=Nama;
	History.Warna[b]:=Warna;
	History.Bahan[b]:=Bahan;
	History.Berat[b]:=Berat;
	History.nS[b]:=nS;
	History.nM[b]:=nM;
	History.nL[b]:=nL;
	History.nXL[b]:=nXL;
	History.BiayaEks[b]:=BiayaPerKG;
	History.Tanggal[b]:=tanggalkirim;
	History.NamaEks[b]:=NamaEks;
	History.JenisEks[b]:=JenisLayanan;
	History.Kota[b]:=kotatujuan;
	History.lamapengiriman[b]:=lamapengiriman;
	History.Harga[b]:=Harga;
end;


procedure showTransaction(var History:tHistory; tampil:string);
{I.S :StokBaju dan tampil terdefinsi}
{F.S :StokBaju terurut secara berdasarkan harga dari besar ke kecil}
var
  i,j,indeks:integer;
  Hari1,Hari2:integer;
begin
  {insert sort}
  for i:=1 to History.Neff do
    begin
      indeks:=i;
      for j:=i+1 to History.Neff do
        begin
			Hari1:=(History.Tanggal[indeks].dd+History.Tanggal[indeks].mm*30+History.Tanggal[indeks].yy*354);
			Hari2:=(History.Tanggal[j].dd+History.Tanggal[j].mm*30+History.Tanggal[j].yy*354);
          if (Hari1>Hari2) then
            indeks:=j;
        end;

      {swap}
      swap(History,i,indeks);
    end;

  {output}
  if(tampil='tampil')then
  for i:=1 to History.Neff do
  begin
    writeln(i,'. ',History.Nama[i]);
    writeln('Warna : ',History.Warna[i]);
	writeln('Bahan : ',History.Bahan[i]);
	writeln('Berat : ',History.Berat[i]:0:2,' kg');
	writeln('S : ',History.nS[i],' M : ',History.nM[i]);
	writeln('L : ',History.nL[i],' L : ',History.nXL[i]);
	writeln('Biaya Per KG : Rp',History.BiayaEks[i]:0:2);
	writeln('Tanggal transaksi : ',History.Tanggal[i].dd,'/',History.Tanggal[i].mm,'/',History.Tanggal[i].yy);
	writeln('Nama Ekspedisi : ',History.NamaEks[i]);
	writeln('JenisLayanan : ',History.JenisEks[i]);
	writeln('Kota Tujuan : ',History.Kota[i]);
	writeln('Lama Kirim : ',History.lamapengiriman[i]);
	writeln('Harga : Rp',History.Harga[i]:0:2);
	writeln;
  end;
end;

end.
