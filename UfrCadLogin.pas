
unit UfrCadLogin;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls,
  Data.Win.ADODB, Udados, Data.DB, Vcl.DBCtrls;

type
  TFrmCadLogin = class(TForm)
    EdtCnfSenha: TEdit;
    EdtSenha: TEdit;
    Label3: TLabel;
    Label4: TLabel;
    BtnCadastra: TButton;
    ADOCmdLogin: TADOCommand;
    QryLogin: TADOQuery;
    QryLoginLogin: TStringField;
    QryLoginSenha: TStringField;
    QryRe: TADOQuery;
    QryReultimoLogin: TStringField;
    EdtCPF: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    dblTipfun: TDBLookupComboBox;
    qryTipFun: TADOQuery;
    qryTipFunTIPFUN: TStringField;
    DataSource1: TDataSource;
    procedure EdtREKeyPress(Sender: TObject; var Key: Char);
    procedure EdtContatoKeyPress(Sender: TObject; var Key: Char);
    procedure EdtCnfSenhaKeyPress(Sender: TObject; var Key: Char);
    procedure EdtSenhaKeyPress(Sender: TObject; var Key: Char);
    procedure BtnCadastraClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure EdtCPFKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public

    { Public declarations }
  end;

var
  FrmCadLogin: TFrmCadLogin;

implementation

{$R *.dfm}

uses  UfrLogin, UnFunc, UfrControlUser;

procedure TFrmCadLogin.BtnCadastraClick(Sender: TObject);
begin

  QryLogin.Close;
  QryLogin.SQL.Clear;
  QryLogin.SQL.Add('Select * from login');
  QryLogin.Open;
  QryLogin.First;



  while not QryLogin.eof do
  begin

    if QryLoginLogin.AsString = EdtCPF.Text then
    begin
      raise Exception.Create('CPF já cadastrado!');
    end;
    QryLogin.Next;
  end;

  if  EdtCPF.Text = '' then
  begin
    raise Exception.Create('Campo CPF não pode ser vazio');
  end
  else
  if EdtSenha.Text = '' then
  begin
    raise Exception.Create('Campo senha não pode ser vazio');
  end
  else
  if EdtCnfSenha.Text = '' then
  begin
    raise Exception.Create('Campo de confirmação de senha não pode ser vazio');

  end
  else
  if EdtCnfSenha.Text <> EdtSenha.Text then
  begin
    raise Exception.Create('Confirmação de senha está divergente a senha');
  end
  else
  if dblTipfun.text = '' then
  begin
    raise Exception.Create('Escolha Um tipo de funcionário');
  end
  else

  begin
    ADOCmdLogin.Parameters.ParamByName('Login').Value := EdtCPF.Text;
    ADOCmdLogin.Parameters.ParamByName('Senha').Value := StrToInt(EdtSenha.Text);
    ADOCmdLogin.Parameters.ParamByName('Tipfun').Value  := dblTipfun.text;

    ADOCmdLogin.Execute;
    MessageDlg('Cadastro Efetuado Com Sucesso', mtInformation, [mbOK], 0);
  end;
end;

procedure TFrmCadLogin.EdtCnfSenhaKeyPress(Sender: TObject; var Key: Char);
begin
  if not  (Key in['0'..'9']) then
    raise Exception.Create('Esse campo aceita apenas númeross');
end;

procedure TFrmCadLogin.EdtContatoKeyPress(Sender: TObject; var Key: Char);
begin
  if not  (Key in['0'..'9']) then
    raise Exception.Create('Esse campo aceita apenas númeross');
end;

procedure TFrmCadLogin.EdtCPFKeyPress(Sender: TObject; var Key: Char);
begin
  if not  (Key in['0'..'9']) then
    raise Exception.Create('Esse campo aceita apenas númeross');
end;

procedure TFrmCadLogin.EdtREKeyPress(Sender: TObject; var Key: Char);
begin
  if not  (Key in['0'..'9']) then
    raise Exception.Create('Esse campo aceita apenas númeross');
end;

procedure TFrmCadLogin.EdtSenhaKeyPress(Sender: TObject; var Key: Char);
begin
  if not  (Key in['0'..'9']) then
    raise Exception.Create('Esse campo aceita apenas númeross');
end;

procedure TFrmCadLogin.FormCreate(Sender: TObject);
var
  ultimologin : string;

begin
  qryTipFun.Close;
  qryTipFun.Open;
end;

end.
