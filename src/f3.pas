unit f3;

interface
uses f1;

(***************Prosedur Menampilkan Detail Baju***********************)
procedure showDetailProduct(StokBaju:tStokBaju; id:integer; perintah:string);
{I.S : Daftarbaju, perintah dan indeks yang dimaksud sudah terdefinisi}
{F.S : Menampilkan detail dari nama baju tersebut beserta kondisi perintah,berdasarkan indeks}

(***************Prosedur Menampilkan Detail Berdasarkan Baju***********************)
procedure filterByName(StokBaju:tStokBaju; namabaju:string; perintah:string);
{I.S : Daftarbaju, perintah dan nama yang dimaksud sudah terdefinisi}
{F.S : Menampilkan detail dari nama baju tersebut beserta kondisi perintah,berdasarkan indeks}

implementation

(***************Prosedur Menampilkan Detail Baju***********************)
procedure showDetailProduct(StokBaju:tStokBaju; id:integer; perintah:string);
{I.S : Daftarbaju, perintah dan nama yang dimaksud sudah terdefinisi}
{F.S : Menampilkan detail dari nama baju tersebut beserta kondisi perintah,berdasarkan indeks}

begin

	if (perintah='showPopulars') then
	begin
		writeln(StokBaju.Nama[id]);
		writeln('Warna : ',StokBaju.Warna[id]);
		write('S : ',StokBaju.nS[id],' ');
		write('M : ',StokBaju.nM[id],' ');
		write('L : ',StokBaju.nL[id],' ');
		writeln('XL : ',StokBaju.nXL[id],' ');
		writeln('Rp',StokBaju.Harga[id]:0:2);
		writeln('Jumlah pembelian : ',StokBaju.jumlahBeli[id],' buah');
	end else
	if (perintah='filterClothes') then
	begin
		writeln(StokBaju.Nama[id]);
		writeln('Warna : ',StokBaju.Warna[id]);
		write('S : ',StokBaju.nS[id],' ');
		write('M : ',StokBaju.nM[id],' ');
		write('L : ',StokBaju.nL[id],' ');
		writeln('XL : ',StokBaju.nXL[id],' ');
		writeln('Rp',StokBaju.Harga[id]:0:2);
	end else
	if (perintah='sortPrice') then
	begin
		writeln(StokBaju.Nama[id]);
		writeln('Rp',StokBaju.Harga[id]:0:2);
	end else
	if (perintah='all') then
	begin
		{Menampilkan detail produk berdasarkan ID tersebut}
		writeln('Nama Baju : ',StokBaju.Nama[id]);
		writeln('Kategori : ',StokBaju.Kategori[id]);
		writeln('Gender : ',StokBaju.Gender[id]);
		writeln('Warna : ',StokBaju.Warna[id]);
		writeln('Berat baju : ',StokBaju.Berat[id]:0:2,' kg');
		writeln('Bahan : ',StokBaju.Bahan[id]);
		writeln('Harga : Rp',StokBaju.Harga[id]:0:2);
		writeln('Stok S : ',StokBaju.nS[id],' buah');
		writeln('Stok M : ',StokBaju.nM[id],' buah');
		writeln('Stok L : ',StokBaju.nL[id],' buah');
		writeln('Stok XL : ',StokBaju.nXL[id],' buah');
		writeln('Jumlah pembelian : ',StokBaju.jumlahBeli[id],' buah');
		writeln('Diskon Grosir : ',StokBaju.grosirDiskon[id],'% per 10 buah');
	end;
	writeln;
end;

(***************Prosedur Menampilkan Detail Berdasarkan Baju***********************)
procedure filterByName(StokBaju:tStokBaju; namabaju:string; perintah:string);
{I.S : Daftarbaju, perintah dan nama yang dimaksud sudah terdefinisi}
{F.S : Menampilkan detail dari nama baju tersebut beserta kondisi perintah,berdasarkan indeks}
var
	i:integer;
begin
	for i:=1 to StokBaju.Neff do
	begin
		if(pos(StokBaju.Nama[i],namabaju)<>0) then
			showDetailProduct(StokBaju,i,perintah);
	end;
end;

end.
