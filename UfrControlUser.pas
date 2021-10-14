unit UfrControlUser;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Data.DB, Data.Win.ADODB;

type
  TFrmControlUser = class(TForm)
    EdtLogin: TEdit;
    Edtsenha: TEdit;
    BtnConfirmar: TButton;
    Label1: TLabel;
    Label2: TLabel;
    QryLogin: TADOQuery;
    QryLoginLogin: TStringField;
    QryLoginSenha: TStringField;
    QryLoginTipFun: TStringField;
    procedure BtnConfirmarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmControlUser: TFrmControlUser;

implementation

{$R *.dfm}

uses Udados, UfrCadLogin, UfrLogin;

procedure TFrmControlUser.BtnConfirmarClick(Sender: TObject);
var
  cadlogin : TFrmCadLogin;
begin
  QryLogin.Close;
  QryLogin.SQL.Clear;
  QryLogin.SQL.Add('Select * from [dbo].[LOGIN] WHERE login = '+''''+EdtLogin.Text+ ''' and Senha = '''+Edtsenha.Text+'''');
  QryLogin.Open;
  if (QryLoginLogin.AsString = '') and (QryLoginSenha.AsString = '') then
    raise Exception.Create('Usúario não cadastrado no sistema')
  else
  if QryLoginTipFun.AsString <> 'ADM' then
    raise Exception.Create('Cadastro só pode ser feito com Usúario Administrador')
  else
    CadLogin := TFrmCadLogin.Create(Self);
    CadLogin.BtnCadastra.Enabled := true;
    CadLogin.ShowModal;


end;

end.
