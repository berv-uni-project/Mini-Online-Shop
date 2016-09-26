unit f9;

interface

uses f1;

(*************************Prosedur Pembelian**************************)
procedure beli(C: String; Jumlah: integer; var JumlahBeli : integer);
{I.S.: C,Jumlah telah terdefinisi, JumlahBeli sembarang}
{F.S.: Menerima masukkan JumlahBeli 
	Jika sum diantara 0 s.d. Jumlah, nilai JumlahBeli = Sum
	Jika tidak, akan diulangi hingga masukkan benar.}

(***********************Prosedur Menambahkan Cart*********************)
procedure addToCart(stokbaju:tstokbaju; var cart : tCart);
{I.S.: cart sembarang}
{F.S.: Menerima masukkan namaBarang, jumlah barang yang akan dibeli, dan mengeluarkan hasil berupa file eksternal cart.txt
	jumlah barang harus kurang dari sama dengan jumlah stock yang tersedia sesuai ukuran} 

implementation

(*************************Prosedur Pembelian**************************)
procedure beli(C: String; Jumlah: integer; var JumlahBeli : integer);
{I.S.: C,Jumlah telah terdefinisi, JumlahBeli sembarang}
{F.S.: Menerima masukkan JumlahBeli 
	Jika sum diantara 0 s.d. Jumlah, nilai JumlahBeli = Sum
	Jika tidak, akan diulangi hingga masukkan benar.}

{Kamus Lokal}
var
	sum : integer;	
{Algoritma}
begin
	writeln('Jumlah Stok Ukuran ',C,' : ',Jumlah,' buah');
	write('Ukuran ',C,' (tulis 0 bila tidak membeli) : ');
	readln(sum);
	while (sum+JumlahBeli < 0) or (sum+JumlahBeli > Jumlah) do {data salah, melebihi stock}
	begin
		writeln('Jumlah barang tidak tersedia. Ulangi.');
		write('Ukuran ',C,' (tulis 0 bila tidak membeli) : ');
		readln(sum);
	end;
	JumlahBeli := sum+JumlahBeli;
end;

(***********************Prosedur Menambahkan Cart*********************)
procedure addToCart(stokbaju:tstokbaju; var cart : tCart);
{I.S.: cart sembarang}
{F.S.: Menerima masukkan namaBarang, jumlah barang yang akan dibeli, dan mengeluarkan hasil berupa file eksternal cart.txt
	jumlah barang harus kurang dari sama dengan jumlah stock yang tersedia sesuai ukuran} 

{Kamus Lokal}
var
	i,id : integer;
	namaBarang : string;
	JumlahBeliS, JumlahBeliM, JumlahBeliL, JumlahBeliXL : integer;
    found : boolean;
{Algoritma}	
begin
	write('Masukkan nama barang yang akan anda beli : '); {Menerima input namaBarang}
	readln(namaBarang);
	
	found:= false; {inisialisasi}
	i:=1; {inisialisasi}
	while (i<=stokbaju.Neff) and (not found) do		{Mencari namaBarang pada stockBarang}
	begin
	if (stokbaju.Nama[i] = namaBarang) then
	begin
		id:= i; {Menyimpan indeks letak barang}
		found:= true;	{barang ditemukan}
	end else
	begin
		i:=i+1;
	end;
	end;
	if found then
		begin	{jika barang ditemukan}
			if cart.Neff=0 then	(*Jika belum ada isi tidak perlu cek dalam cart*)
			begin
				writeln('Masukkan jumlah barang yang akan anda beli : '); {Menerima input jumlah barang yg akan dibeli sesui ukuran}
				beli('S',stokbaju.nS[id],JumlahBeliS);
				beli('M',stokbaju.nM[id],JumlahBeliM);
				beli('L',stokbaju.nL[id],JumlahBeliL);
				beli('XL',stokbaju.nXL[id],JumlahBeliXL);
				
				i := cart.Neff + 1;	{Menambahan barang yang baru saja dibeli pada cart}
				cart.Nama[i] := namaBarang;
				cart.Warna[i] := stokbaju.Warna[id];
				cart.Berat[i] := stokbaju.Berat[id];
				cart.Bahan[i] := stokbaju.Bahan[id];
				cart.Harga[i] := stokbaju.Harga[id];
				cart.nS[i] := JumlahBeliS;
				cart.nM[i] := JumlahBeliM;
				cart.nL[i] := JumlahBeliL;
				cart.nXL[i] := JumlahBeliXL;
				cart.Neff := i;
			end else (*Jika cart ada isi perlu cek apakah ada yang sama*)
			begin
				i:=1;
				found:=False;
				while (i<=cart.Neff) and (not(Found)) do
				begin
					if (cart.Nama[i] = namaBarang) then
					begin
						found:= true;	{barang ditemukan}
					end else
					begin
						i:=i+1;
					end; 
				end;
				
				if found then
				begin
					writeln('Masukkan jumlah barang yang akan anda beli : '); {Menerima input jumlah barang yg akan dibeli sesui ukuran}
					beli('S',stokbaju.nS[id],cart.nS[i]);
					beli('M',stokbaju.nM[id],cart.nM[i]);
					beli('L',stokbaju.nL[id],cart.nL[i]);
					beli('XL',stokbaju.nXL[id],cart.nXL[i]);
				end else
				begin
					writeln('Masukkan jumlah barang yang akan anda beli : '); {Menerima input jumlah barang yg akan dibeli sesui ukuran}
					beli('S',stokbaju.nS[id],JumlahBeliS);
					beli('M',stokbaju.nM[id],JumlahBeliM);
					beli('L',stokbaju.nL[id],JumlahBeliL);
					beli('XL',stokbaju.nXL[id],JumlahBeliXL);
					
					i := cart.Neff + 1;	{Menambahan barang yang baru saja dibeli pada cart}
					cart.Nama[i] := namaBarang;
					cart.Warna[i] := stokbaju.Warna[id];
					cart.Berat[i] := stokbaju.Berat[id];
					cart.Bahan[i] := stokbaju.Bahan[id];
					cart.Harga[i] := stokbaju.Harga[id];
					cart.nS[i] := JumlahBeliS;
					cart.nM[i] := JumlahBeliM;
					cart.nL[i] := JumlahBeliL;
					cart.nXL[i] := JumlahBeliXL;
					cart.Neff := i;
				end;
			end;	
		end else
		begin	{barang tidak ditemukan}
			writeln('Maaf nama barang tidak tersedia. Ulangi.');
		end;
end;

end.
