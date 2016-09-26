unit f7;

interface
uses f1,f5,f3;

procedure filterByPrice(var StokBaju:tStokBaju);
{I.S :StokBaju terdefinisi}
{F.S :StokBaju terurut dari kecil ke besar dan menampilkan
harga baju yang paling murah dan paling mahal}

implementation

procedure filterByPrice(var StokBaju:tStokBaju);
{I.S :StokBaju terdefinisi}
{F.S :StokBaju terurut dari kecil ke besar dan menampilkan
harga baju yang paling murah dan paling mahal}
(*Kamus Lokal*)
var
	pilihan:string;
begin
  sortPrice(StokBaju,'tidak');
  if(StokBaju.Neff=0) then writeln('Tidak ada Baju') else
  if(StokBaju.Neff=1) then
  begin
    writeln('Harga Baju yang paling murah dan paling mahal adalah : ');
    showDetailProduct(StokBaju,1,'sortPrice');
  end else
  begin
	writeln('1. Tampilkan barang paling murah');
	writeln('2. Tampilkan barang paling mahal');
	writeln('3. Tampilkan barang paling murah dan mahal');
	write('Pilihan : '); readln(pilihan);
	if (pilihan='1') then
	begin
		writeln('Harga Baju yang paling murah adalah : ');
		showDetailProduct(StokBaju,1,'sortPrice');
	end else
	if (pilihan='2') then
	begin
		writeln('Harga Baju yang paling mahal adalah : ');
		showDetailProduct(StokBaju,StokBaju.Neff,'sortPrice');
	end else
	if (pilihan='3') then
	begin
		writeln('Harga Baju yang paling murah adalah : ');
		showDetailProduct(StokBaju,1,'sortPrice');
		writeln('Harga Baju yang paling mahal adalah : ');
		showDetailProduct(StokBaju,StokBaju.Neff,'sortPrice');
	end else
	begin
		writeln('Pilihan salah');
	end;
  end;

end;

end.
