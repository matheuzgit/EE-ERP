unit UfrMenu;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.ExtCtrls, Vcl.Menus,
  Vcl.Imaging.jpeg;

type
  TFrmMenu = class(TForm)
    Timer1: TTimer;
    StatusBar1: TStatusBar;
    MainMenu1: TMainMenu;
    Sistema1: TMenuItem;
    Cadastro1: TMenuItem;
    Produtos1: TMenuItem;
    Fornecedor1: TMenuItem;
    Relatrio1: TMenuItem;
    ransporte1: TMenuItem;
    Image1: TImage;
    Movimentao1: TMenuItem;
    Entregas1: TMenuItem;
    Rotas1: TMenuItem;
    PrepararEntrega1: TMenuItem;
    procedure Timer1Timer(Sender: TObject);
    procedure Fornecedor1Click(Sender: TObject);
    procedure Produtos1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmMenu: TFrmMenu;

implementation

{$R *.dfm}

uses UfrCadFornecedor, UfrCadProduto;

procedure TFrmMenu.Fornecedor1Click(Sender: TObject);
var
  Fornecedor : TFrmFornecedor;
begin
  Fornecedor := TFrmFornecedor.Create(Self);
  Fornecedor.ShowModal;

end;

procedure TFrmMenu.Produtos1Click(Sender: TObject);
var
  Produto : TFrmCadProduto;
begin
  Produto := TFrmCadProduto.Create(Self);
  Produto.ShowModal;
end;

procedure TFrmMenu.Timer1Timer(Sender: TObject);
begin
  StatusBar1.Panels[1].Text := 'Date : ' + datetostr(date);
  StatusBar1.Panels[2].Text := 'Hora : ' + TimeToStr(Time);
end;

end.
