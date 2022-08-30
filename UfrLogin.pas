unit UfrLogin;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.Imaging.jpeg,
  Vcl.StdCtrls, Data.DB, Data.Win.ADODB, Vcl.Buttons, Vcl.ComCtrls ;

type
  TFrmLogin = class(TForm )
    Panel1: TPanel;
    EdtLogin: TEdit;
    EdtSenha: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    BtnLogar: TButton;
    BtnCadLogin: TButton;
    BtnRedSenha: TButton;
    QryLogin: TADOQuery;
    QryHistLogn: TADOQuery;
    qryultlogado: TStringField;
    ComdInser: TADOCommand;
    Panel2: TPanel;
    Label3: TLabel;
    Label4: TLabel;
    Image1: TImage;
    Image2: TImage;
    StatusBar1: TStatusBar;
    Timer1: TTimer;
    QryLoginID: TAutoIncField;
    QryLoginCPF: TLargeintField;
    QryLoginPSW: TIntegerField;
    QryLoginTIPFUNC: TStringField;
    procedure EdtLoginKeyPress(Sender: TObject; var Key: Char);
    procedure EdtSenhaKeyPress(Sender: TObject; var Key: Char);
    procedure BtnCadLoginClick(Sender: TObject);
    procedure BtnLogarClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    function ValidarLogin: String;
  end;

var
  FrmLogin: TFrmLogin;

implementation

{$R *.dfm}

uses  Udados, UfrCadLogin, UfrMenu, UnFunc, UfrControlUser;

procedure TFrmLogin.BtnCadLoginClick(Sender: TObject);
var
  ControlUser : TFrmControlUser;
begin
  ControlUser := TFrmControlUser.Create(Self);
  ControlUser.Show;
end;

procedure TFrmLogin.BtnLogarClick(Sender: TObject);
var
  menu : TFrmMenu;
begin
  ValidarLogin;
  menu := TFrmMenu.Create(Self);

  menu.ShowModal;
  FrmLogin.Close;
end;

procedure TFrmLogin.EdtLoginKeyPress(Sender: TObject; var Key: Char);
begin
  if not (Key in['0'..'9',#8,#9,#13]) then
    raise Exception.Create('Esse campo aceita apenas n�meross');
end;

procedure TFrmLogin.EdtSenhaKeyPress(Sender: TObject; var Key: Char);
begin
  if not (Key in['0'..'9',#8,#9,#13]) then
    raise Exception.Create('Esse campo aceita apenas n�meros');
end;


procedure TFrmLogin.Timer1Timer(Sender: TObject);
begin
  StatusBar1.Panels[0].Text := 'Date : ' + datetostr(date);
  StatusBar1.Panels[1].Text := 'Hora : ' + TimeToStr(Time);
end;

function TFrmLogin.ValidarLogin: String;
begin
  QryLogin.Close;
  QryLogin.Open;
  QryLogin.First;

  while (QryLoginCPF.Value <> StrToInt64(EdtLogin.Text)) or (QryLoginPSW.AsInteger <> StrToInt64(EdtSenha.Text)) do
  begin
   if (QryLogin.Eof)  then
   begin
     if (QryLoginCPF.Value <> StrToInt64(EdtLogin.Text)) or (QryLoginPSW.AsInteger <> StrToInt64(EdtSenha.Text))  then
     begin
       raise Exception.Create('Credenciais Incorretas');
     end;
   end;
  QryLogin.Next;
  ComdInser.Parameters.ParamByName('Login').Value := (EdtLogin.Text);
  ComdInser.Execute;
end;


end;

end.
