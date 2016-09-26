unit f10;

interface
uses f1,f12;

(********************Prosedur Menghapus dari Kart*********************)
procedure removeFromCart(var cart: tCart; stokbaju:tstokbaju);
{I.S.: cart telah terdefinisi}
{F.S.: menghapus data barang pada cart dan menulis ulang cart.txt file of string}

implementation
(********************Prosedur Menghapus dari Kart*********************)
procedure removeFromCart(var cart: tCart; stokbaju:tstokbaju);
{I.S.: cart telah terdefinisi}
{F.S.: menghapus data barang pada cart dan menulis ulang cart.txt file of string}

{Kamus Lokal}
var
	j : integer;
	nB : integer;
	
{Algoritma}
begin
	if cart.Neff=0 then
	begin
		writeln('Cart Kosong');
	end else
	begin
		(*Menampilkan Barang yang dibeli*)
		writeln('Daftar barang yang akan dibeli :');
		showCart(cart,stokbaju);
		(*Input pengguna*)
		write('Masukkan nomor barang yang akan dibatalkan : ');
		readln(nB); {nomor barang yang akan dihapus}
		(*Cek Input*)
		if (nB<=cart.Neff) then
		begin
			for j:= nB to (cart.Neff-1) do {menghapus nama barang dan mengganti data array}
			begin
				cart.Nama[j] := cart.Nama[j+1];
				cart.Warna[j] := cart.Warna[j+1];
				cart.Berat[j] := cart.Berat[j+1];
				cart.Bahan[j] := cart.Bahan[j+1];
				cart.Harga[j] := cart.Harga[j+1];
				cart.nS[j] := cart.nS[j+1];
				cart.nM[j] := cart.nM[j+1];
				cart.nL[j] := cart.nL[j+1];
				cart.nXL[j] := cart.nXL[j+1];
			end;
			cart.Neff := cart.Neff - 1; 
		end else
		begin
			writeln('Masukan salah');
		end;
	end;
end;

end.
