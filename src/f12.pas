unit f12;

interface
uses f1,f16;

(*****************************Fungsi Diskon Grosir***************************)
function discountGrosir(cart:tCart; i:integer; stokbaju:tStokBaju; id:integer):real;
{discountGrosir akan menerima database cart beserta indeks i yang akan dihitung diskonnya
dan juga membaca stok baju beserta id baju tersebut lalu dihitung diskonnya}

(*****************Prosedur Menampilkan Cart*******************)
procedure showCart(cart:tCart; stokbaju:tStokBaju);
{I.S : cart dan stok baju terdefinisi}
{F.S : menampilkan cart}

(****************Prosedur Update Stok Baju************************)
procedure updateClothes(var StokBaju : tStokBaju; cart:tCart);
{I.S : cart dan stok baju yang akan diupdate terdefinisi}
{F.S : stokbaju akan berubah sesuai dengan pembelian sebelumnya}

(**********Prosedur Menghitung Harga Total dan Berat Total Shopping Cart**********)
procedure calculatePrice(cart:tCart; stokbaju:tStokBaju; var hargatotal: real; var berattotal : real);
{I.S : cart, stok baju terdefinisi, hargatotal dan berattotal sembarang}
{F.S : harga total dan berat total akan berisi sesuai dengan pembelian}

(*******************Prosedur Check Out*************************)
procedure checkout (var cart : tCart; var stokbaju:tstokbaju; var history:tHistory; ekspedisi : tEkspedisi; berattotal,hargatotal:real);
{I.S : checkout, stokbaju, history sembarang, ekspedisi, hargatotal, berattotal terdefinisi}
{F.S : cart akan dikosongkan, stokbaju akan diupdate, history akan terisi}

implementation

(****************************Fungsi Diskon Grosir***************************)
function discountGrosir(cart:tCart; i:integer; stokbaju:tStokBaju; id:integer):real;
begin
	if (((cart.nS[i]+cart.nM[i]+cart.nL[i]+cart.nXL[i]) div 10) * (stokbaju.grosirDiskon[id]))>50 then
	begin
		discountGrosir:=50;
	end else
	begin
		discountGrosir:=((cart.nS[i]+cart.nM[i]+cart.nL[i]+cart.nXL[i]) div 10) * (stokbaju.grosirDiskon[id])
	end;
end;

(*****************Prosedur Menampilkan Cart*******************)
procedure showCart(cart:tCart; stokbaju:tStokBaju);
var
	i:integer;
	j,id:integer;
	found:boolean;
	hargatotal,hargasetelahdiskon:real;
	jumlahTotal:integer;
begin
	for i:=1 to cart.Neff do
	begin
		writeln(i,'.',cart.Nama[i]);
		writeln('   Warna : ',cart.Warna[i]);
		if (cart.nS[i]<>0) then
		begin
			write('   S : ',cart.nS[i]);
		end;
		if (cart.nM[i]<>0) then
		begin
			write('   M : ',cart.nM[i]);
		end;
		if (cart.nL[i]<>0) then
		begin
			write('   L : ',cart.nL[i]);
		end;
		if (cart.nXL[i]<>0) then
		begin
			write('   XL : ',cart.nXL[i]);
		end;
		(*Pencarian*)
		(*Ganti dengan pencarian id berdasarkan nama*)
		j:=1;
		found:=False;
		while (not(found)) do 
		begin
			if stokbaju.Nama[j]=cart.Nama[i] then
			begin
				found:=True;
				id:=j;
			end else
			begin
				j:=j+1;
			end;
		end;
		JumlahTotal:=cart.nS[i]+cart.nM[i]+cart.nL[i]+cart.nXL[i];
		HargaTotal:=(cart.Harga[i])*(JumlahTotal);
		HargaSetelahDiskon:=(HargaTotal-(HargaTotal*(discountGrosir(cart,i,stokbaju,id)/100)));
		writeln;
		writeln('   Berat : ',cart.Berat[i]:0:2);
		writeln('   Rp ',cart.Harga[i]:0:2,' x ',JumlahTotal,' x ', (discountGrosir(cart,i,stokbaju,id)):0:2 ,'% = Rp ',HargaSetelahDiskon:0:2);
		writeln;
	end;
end;

(****************Prosedur Update Stok Baju************************)
procedure updateClothes(var StokBaju : tStokBaju; cart:tCart);
var
	i, j : integer;

begin
	for i := 1 to Cart.Neff do
	begin
		for j:= 1 to StokBaju.Neff do
		begin
			if StokBaju.nama[j] = cart.nama[i] then
			begin
					StokBaju.ns[j] := Stokbaju.ns[j] - cart.Ns[i];
					StokBaju.nM[j] := Stokbaju.nM[j] - cart.Nm[i];
					StokBaju.nL[j] := Stokbaju.nL[j] - cart.NL[i];
					StokBaju.nXL[j] := Stokbaju.nXL[j] - cart.NXL[i];
			end;
		end;
	end;
end;

(**********Prosedur Menghitung Harga Total dan Berat Total Shopping Cart**********)
procedure calculatePrice(cart:tCart; stokbaju:tStokBaju; var hargatotal: real; var berattotal : real);
var {kamus lokal}
	i: integer;
	id:integer;
	j: integer;
	found:boolean;
	totalsementara,setelahdiskon:real;
	banyak:integer;
begin
	showCart(cart,stokbaju);
	hargatotal:=0;
	berattotal:=0;
	for i:=1 to cart.Neff do
	begin
		(*Ganti dengan pencarian id berdasarkan nama*)
		j:=1;
		found:=False;
		while (not(found)) do 
		begin
			if stokbaju.Nama[j]=cart.Nama[i] then
			begin
				found:=True;
				id:=j;
			end else
			begin
				j:=j+1;
			end;
		end;
		banyak:=(cart.nS[i]+cart.nM[i]+cart.nL[i]+cart.nXL[i]);
		totalsementara:=(cart.Harga[i]*banyak);
		setelahdiskon:=(totalsementara-(totalsementara*((discountGrosir(cart,i,stokbaju,id)/100))));
		hargatotal := hargatotal + setelahdiskon;
		berattotal := berattotal + cart.Berat[i];
	end;
	writeln('> Harga Total : Rp',hargatotal:0:2);
	writeln('> Berat Total : ',berattotal:0:2,' kg');
end;

(*******************Prosedur Check Out*************************)
procedure checkout (var cart : tCart; var stokbaju:tstokbaju; var history:tHistory; ekspedisi : tEkspedisi; berattotal,hargatotal:real);
{Kamus lokal}
var
jenislayanan, kotatujuan, namaekspedisi : string;
i,j,id: integer;
input:string;
tanggal:tTanggal;
harga,berat:real;
found:boolean;
Ongkir:real;
Total:real;

begin
	if (cart.Neff=0) then
	begin
		writeln('Cart kosong');
	end else
	begin
		write('Kota Tujuan : '); readln(kotatujuan);
		write('Nama Ekspedisi : '); readln(namaekspedisi);
		write('Jenis Layanan : '); readln(jenislayanan);
		write('Tanggal Kirim : '); readln(input);
		rubahTanggal(input,tanggal);
		(*Tampil isi cart*)
		i:=1;
		found:=false;
		while (i<=ekspedisi.Neff) and (not(found)) do
		begin
			if (ekspedisi.NamaEks[i]=namaekspedisi) and (ekspedisi.JenisEks[i]=jenislayanan) and (ekspedisi.Kota[i]=kotatujuan) then
			begin
				found:=True;
				id:=i;
			end else
			begin
			i:=i+1;
			end;
		end;
		(* Tampil Total*)
		calculatePrice(cart, stokbaju, harga, berat);
		Ongkir:=ekspedisi.BiayaEks[id]*berat;
		writeln('Ongkos Kirim : Rp', Ongkir);
		Total:=harga+ongkir;
		writeln('Total : Rp',Total);
		write('> Tanggal sampai : '); 
		(* i : index ekspedisi*)
		for j:=1 to ekspedisi.Lama[id] do
		begin
			hariSelanjutnya(tanggal);
		end;
		writeln(tanggal.dd,'/',tanggal.mm,'/',tanggal.yy);
		
		history.Neff:=history.Neff+cart.Neff;
		{Program untuk menulis ulang datatransaksi.txt}
		for i:= 1 to (history.Neff + cart.Neff) do
		begin
			
			//algoritma nya pokoknya isi history ditumpuk sama isi kart
			history.Nama[i]:= cart.Nama[i];
			history.Warna[i]:= cart.Warna[i];
			history.Berat[i]:= cart.Berat[i];
			history.Bahan[i]:= cart.Bahan[i];
			history.Harga[i]:= cart.Harga[i];
			history.nS[i]:= cart.nS[i];
			history.nM[i]:= cart.nM[i];
			history.nL[i]:= cart.nL[i];
			history.nXL[i]:= cart.nXL[i];
			history.NamaEks[i]:= namaekspedisi;
			history.JenisEks[i]:= jenislayanan;
			history.Kota[i]:= kotatujuan;
			history.BiayaEks[i]:= ekspedisi.biayaEks[id];
			history.LamaPengiriman[i]:= ekspedisi.Lama[id];
			history.Tanggal[i]:= tanggal;
		end;
		
		//menghapus isi shoppingcart.txt
		updateClothes(stokbaju,cart);
		cart.Neff := 0;
	end;
end;

end.
