unit f2;

interface
uses f1,f3;

(***********Prosedur Menampilkan yang Populer****************************)
procedure showPopulars(StokBaju:tStokBaju);
{I.S : Daftar baju sudah ada dan terdefinisi}
{F.S : Menampilkan 3 buah baju yang populer berdasarkan jumlah baju yang dibeli}

implementation

(**********Prosedur Menampilkan yang Populer****************************)
procedure showPopulars(StokBaju:tStokBaju);
{I.S : Daftar baju sudah ada dan terdefinisi}
{F.S : Menampilkan 3 buah baju yang populer berdasarkan jumlah baju yang dibeli}
(*Kamus Lokal*)
var
	i:integer;
	urut:Boolean;
	ind:indeksing;
(*Algoritma*)
begin
	{Inisialisasi}
	for i:=1 to StokBaju.Neff do
	begin
		ind.indeks[i]:=i;
    ind.jumlahBeli[i]:=StokBaju.jumlahBeli[i];
    ind.Harga[i]:=StokBaju.Harga[i];
	end;

	{Mencari yang Popular berdasarkan jumlah pembelian}
	repeat
		urut:=True;
		for i:=1 to (StokBaju.Neff-1) do
			if ((ind.jumlahBeli[i]) < (ind.jumlahBeli[i+1])) then
			begin
				urut:=False;
				{Swap}
				swapIndeks(ind,i,(i+1));
			end;
	until(urut);

	{Penulisan Setelah di Sorting}
	for i:=1 to 3 do
	begin
	   writeln;
	   write(i,'. '); showDetailProduct(StokBaju,ind.indeks[i],'showPopulars');
	end;
end;

end.
