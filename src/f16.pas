unit f16;



interface


uses f1;

(*****************Prosedur menghasilkan tanggal selanjutnya**********************)
procedure hariSelanjutnya(var H:tTanggal);
{I.S : H terdefinisi}
{F.S : H menjadi hari selanjutnya}

procedure return(var History:tHistory; tanggalKembali,tanggalBeli:tTanggal; nama:string; nS,nM,nL,nXL:integer);
{I.S : history terdefinisi,hari kembali dd/mm/yyyy,nama,jumlah}
{F.S : menampilkan jumlah uang yang akan dikembalikan jika telah sesuai spek}

(*************Fungsi Mengecek Apakah Hari Sama************************)
function isHariSama(H1,H2:tTanggal):Boolean;
{I.S : H1 dan H2 terdefinisi}
{F.S : mengembalikan nilai True jika hari sama, False jika hari tak sama}

(*************Fungsi Mengecek Kabisat*******************)
function isKabisat(H1:tTanggal):Boolean;
{I.S : H1 terdefinisi}
{F.S : mengembalikan nilai True jika hari berada tahun kabisat, False jika tidak}

(**************Fungsi Menghasilkan Selisih Hari************************)
function selisihHari(awal,akhir:tTanggal):integer;
{I.S : hari awal lebih kecil dari hari ahir dan terdefinisi}
{F.S : menggembalikan selisih hari antara hari awal dan ahir}
{mudah kalau bentuknya dd/mm/yyyy tapi dalam contoh spek 1/4/2015 nanti aku betulin lagi,
belum lagi dalam tahun kabisat atau tidak}

implementation

(*****************Prosedur menghasilkan tanggal selanjutnya**********************)
procedure hariSelanjutnya(var H:tTanggal);
{I.S : H terdefinisi}
{F.S : H menjadi hari selanjutnya}
begin
  case (H.mm) of
    1,3,5,7,8,10  : begin
						if(H.dd=31) then
						begin
							H.dd := 1;
							H.mm := H.mm+1;
						end else
						begin
						H.dd:=H.dd+1;
						end;
					end;

    4,6,9,11      : begin
						if (H.dd=30) then
						begin
							H.dd := 1;
							H.mm := H.mm+1;
						end else
						begin
							H.dd:=H.dd+1;
						end;
					end;

    2             : begin
						if ((isKabisat(H)) and (H.dd=29)) or ((not(isKabisat(H))) and (H.dd=28)) then
						begin
							H.dd:=1;
							H.mm:=3;
						end else
						begin
							H.dd:=H.dd+1;
						end;
					end;

    12            : begin
						if(H.dd=31) then
						begin
							H.dd:=1;
							H.mm:=1;
							H.yy:=H.yy+1;
						end else
						begin
						H.dd:=H.dd+1;
						end;
					end;
  end;
end;

(*************************************Prosedur pengembalian(return)*********************************)
procedure return(var History:tHistory; tanggalKembali,tanggalBeli:tTanggal; nama:string; nS,nM,nL,nXL:integer);
{I.S : history terdefinisi,hari kembali dd/mm/yyyy,nama,jumlah}
{F.S : menampilkan jumlah uang yang akan dikembalikan jika telah sesuai spek}
var
  selisih,i:integer;
  found:Boolean;

begin
  i:=0;
  found:=False;

  while ((not(found)) and (i<=History.Neff)) do
  begin
    i:=i+1;
    if ((nama=History.Nama[i]) and (isHariSama(tanggalBeli,History.Tanggal[i])) and (nS<History.nS[i]) and (nM<History.nM[i]) and (nL<History.nL[i]) and (nXL<History.nXL[i])) then
    begin
      found:=True;
    end;
  end;

  if(found) then
  begin
  selisih:=selisihHari(History.Tanggal[i],tanggalKembali);
  if(selisih>14)then writeln('Maaf batas pengembalian sudah lewat.') else
    begin
      writeln('Uang yang dikembalikan oleh toko sebesar : Rp. ',(nS+nM+nL+nXL)*History.Harga[i]);
      History.nS[i]:=History.nS[i]-nS;
      History.nS[i]:=History.nM[i]-nM;
      History.nS[i]:=History.nL[i]-nL;
      History.nS[i]:=History.nXL[i]-nXL;
    end;
  end else writeln('Barang tidak ada yang cocok.');

end;

(*************Fungsi Mengecek Apakah Hari Sama************************)
function isHariSama(H1,H2:tTanggal):Boolean;
{I.S : H1 dan H2 terdefinisi}
{F.S : mengembalikan nilai True jika hari sama, False jika hari tak sama}
begin
	isHariSama:= ((H1.dd=H2.dd) and (H1.mm=H2.mm) and (H1.yy=H2.yy));
end;

(*************Fungsi Mengecek Kabisat*******************)
function isKabisat(H1:tTanggal):Boolean;
{I.S : H1 terdefinisi}
{F.S : mengembalikan nilai True jika hari berada tahun kabisat, False jika tidak}
begin
	isKabisat:=(((H1.yy mod 4 = 0) and (H1.yy mod 100 <> 0)) or (H1.yy mod 400 = 0));
end;

(**************Fungsi Menghasilkan Selisih Hari************************)
function selisihHari(awal,akhir:tTanggal):integer;
{I.S : hari awal lebih kecil dari hari ahir dan terdefinisi}
{F.S : menggembalikan selisih hari antara hari awal dan ahir}
{mudah kalau bentuknya dd/mm/yyyy tapi dalam contoh spek 1/4/2015 nanti aku betulin lagi,
belum lagi dalam tahun kabisat atau tidak}
var
	hitung:integer; {counter selisih hari}
begin
	hitung:=0;
	while(not(isHariSama(awal,akhir))) do
	begin
		hitung:=hitung+1;
		hariSelanjutnya(awal);
	end;
  selisihHari:=hitung;
end;

end.
