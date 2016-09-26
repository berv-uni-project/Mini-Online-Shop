program OnlineShop;
(*Program utama yang akan memanggil menu atau antarmuka*)
(*Memakai beberapa prosedur yang tersedia*)

uses f1,f2,f3,f5,f8,f9,f10,f12,f15,f16,f17,antarmuka;

(*Variabel Global*)
var
	StokBaju	:tStokBaju;
	Ekspedisi   :tEkspedisi;
	Cart        :tCart;
	History     :tHistory;

Begin
	(******Program******)
	menu(StokBaju,Ekspedisi,Cart,History);
End.
