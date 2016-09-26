unit antarmuka;
{Unit ini berisi antarmuka yang akan me'load' prosedur yang tersedia.
* Unit ini sebagai interaksi utama dengan pengguna.}

interface
uses f1,f2,f3,f4,f5,f6,f7,f8,f9,f10,f12,f15,f16,f17;

(************************Prosedur Bantuan*****************************)
procedure showHelp();
{I.S: Pengguna memanggil showHelp}
{F.S: Menampilkan beberapa perintah yang dapat digunakan}

(******************Prosedur Tampilan Utama*****************************)
procedure Menu(var StokBaju:tStokBaju; var Ekspedisi:tEkspedisi; var Cart:tCart; var History:tHistory);
{I.S : database stokbaju, ekspedisi, cart, dan history dimasukan dalam menu}
{F.S : Menampilkan interaksi atau antarmuka}

implementation

(************************Prosedur Bantuan*****************************)
procedure showHelp();
{I.S: Pengguna memanggil showHelp}
{F.S: Menampilkan beberapa perintah yang dapat digunakan}
begin
	writeln('Berikut ini daftar perintah yang tersimpan dan dapat dipakai.');
	writeln('1. showPopulars');
	writeln('2. showdetailproduct');
	writeln('3. searchClothesByKeyword');
	writeln('4. sortPrice');
	writeln('5. filterClothes');
	writeln('6. filterByPrices');
	writeln('7. showExpedition');
	writeln('8. addToCart');
	writeln('9. removeFromCart');
	writeln('10. calculatePrice');
	writeln('11. checkout');
	writeln('12. showTransaction');
	writeln('13. return');
	writeln('14. exit');
	writeln('15. help');
end;

(******************Prosedur Tampilan Utama*****************************)
procedure Menu(var StokBaju:tStokBaju; var Ekspedisi:tEkspedisi; var Cart:tCart; var History:tHistory);
{I.S : database stokbaju, ekspedisi, cart, dan history dimasukan dalam menu}
{F.S : Menampilkan interaksi atau antarmuka}
var
	masukan:string;
	selesai:boolean;
	(*Variabel Khusus*)

	namabaju,keyword:string;
	tanggalString:string;
	tanggalBeli,tanggalKembali:tTanggal;
	nS,nM,nL,nXL:integer;
	beratTotal:real;
	hargaTotal:real;

Begin
	{Inisialisasi}
	selesai:=False;
	load('stokbaju.txt',StokBaju,Ekspedisi,Cart,History);
	load('ekspedisi.txt',StokBaju,Ekspedisi,Cart,History);
	load('cart.txt',StokBaju,Ekspedisi,Cart,History);
	load('history.txt',StokBaju,Ekspedisi,Cart,History);
	{Header}
	writeln('> Selamat datang di Toko Baju Indah Semua.');
	writeln('> Selamat berbelanja.');
	{Menu / Antarmuka}
	repeat
		writeln;
		writeln('> Untuk bantuan gunakan perintah "help" tanpa tanda kutip.');
		write('> ');
		readln(masukan);
		write('> ');
		if (masukan='help') then
		begin
			showHelp();
		end else
		if (masukan='exit') then
		begin
			writeln('Terima kasih ');
			saveandexit(StokBaju,Ekspedisi,Cart,History,selesai);
		end else
		if (masukan='showPopulars') then
		begin
			showPopulars(StokBaju);
		end else
		if (masukan='showdetailproduct') then
		begin
			write('Masukan nama baju yang anda inginkan untuk melihat detailnya : ');
			readln(namabaju);
			filterByName(StokBaju,namabaju,'all');
		end else
		if (masukan='return') then
		begin
			write('Masukkan tanggal kembalian(dd/mm/yy): '); readln(tanggalString);
			rubahTanggal(tanggalString,tanggalKembali);
			write('> Masukkan tanggal beli(dd/mm/yy): '); readln(tanggalString);
			rubahTanggal(tanggalString,tanggalBeli);
			write('> Masukkan jumlah(nS nM nL nXL): '); readln(nS,nM,nL,nXL);
			write('> Masukkan nama barang: '); readln(namabaju);
			write('>'); return(History,tanggalKembali,tanggalBeli,namabaju,ns,nM,nL,nXL);
		end else
		if (masukan='showExpedition') then
		begin
			showExpedition(Ekspedisi);
		end else
		if (masukan='sortPrice') then
		begin
			sortPrice(StokBaju,'tampil');
		end else
		if (masukan='filterByPrices') then
		begin
			filterByPrice(StokBaju);
		end else
		if (masukan='filterClothes') then
		begin
			filterClothes(StokBaju);
		end else
		if (masukan='searchClothesByKeyword')then
		begin
			write('Masukkan keyword: ');
			readln(keyword);
			searchClothesByKeyword(StokBaju,keyword);
		end else
		if (masukan='addToCart') then
		begin
			addToCart(StokBaju,Cart);
		end else
		if (masukan='removeFromCart') then
		begin
			removeFromCart(cart,stokbaju);
		end else
		if (masukan='calculatePrice') then
		begin
			calculatePrice(Cart,stokbaju,hargaTotal,beratTotal);
		end else
		if (masukan='checkout') then
		begin
			checkout(cart,stokbaju,history,ekspedisi,berattotal,hargatotal);
		end else
		if (masukan='showTransaction') then
		begin
			showTransaction(history,'tampil');
		end else
		begin
			writeln('Perintah salah');
		end;
	until selesai;
end;

end.
