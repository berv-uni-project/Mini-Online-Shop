unit f8;

interface

uses f1;

(**********************Prosedur Menampilkan Daftar Ekspedisi************************)
procedure showExpedition(Ekspedisi : tEkspedisi);
{I.S : database ekspedisi terdefinisi}
{F.S : Menampilkan daftar ekspedisi berdasarkan masukan nama kota}

implementation

(**********************Prosedur Menampilkan Daftar Ekspedisi************************)
procedure showExpedition(Ekspedisi : tEkspedisi);
{I.S : database ekspedisi terdefinisi}
{F.S : Menampilkan daftar ekspedisi berdasarkan masukan nama kota}
(*Kamus Lokal*)
var
nama  : string;
i     : integer;
found : boolean;

begin
	(*Inisialisai*)
	found:=False;
	writeln('Masukkan nama kota :');
	write('> '); readln(nama);
	if (nama='Semua Kota') then
	begin
		for i:=1 to Ekspedisi.Neff do
		begin
			found:=True;
			writeln;
			writeln('> Nama Ekspedisi : ', Ekspedisi.NamaEks[i]);
			writeln('> Jenis Ekspedisi : ',Ekspedisi.JenisEks[i]);
			writeln('> Biaya Ekspedisi per Kg: ',Ekspedisi.BiayaEks[i]);
			writeln('> Lama Pengiriman : ',Ekspedisi.Lama[i]);
		end;
	end else
	begin
		for i := 1 to Ekspedisi.Neff do
		begin
			if (nama = Ekspedisi.kota[i]) then
			begin
				found:=True;
				writeln;
				writeln('> Nama Ekspedisi : ', Ekspedisi.NamaEks[i]);
				writeln('> Jenis Ekspedisi : ',Ekspedisi.JenisEks[i]);
				writeln('> Biaya Ekspedisi per Kg: ',Ekspedisi.BiayaEks[i]);
				writeln('> Lama Pengiriman : ',Ekspedisi.Lama[i]);
			end;
		end;
		if (not(found)) then
		begin
			writeln('Tidak ditemukan');
		end;
	end;
end;

end.
