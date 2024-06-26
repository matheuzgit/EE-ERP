unit UfrCadGeralProd;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Data.DB, Data.Win.ADODB,
  Vcl.Buttons, Vcl.Grids, Vcl.DBGrids;

type
  TFrmCadGeralProd = class(TForm)
    EdtDescricao: TEdit;
    LblDesc: TLabel;
    QryInsertDados: TADOQuery;
    SpeedButton1: TSpeedButton;
    QryBuscaDados: TADOQuery;
    DBConsutaCadGeralProd: TDBGrid;
    DsBuscaDados: TDataSource;
    QryInsertDadosC�digo: TIntegerField;
    procedure SpeedButton1Click(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
    TipCad : string;
    function InserirDados: string;
  end;

var
  FrmCadGeralProd: TFrmCadGeralProd;

implementation

{$R *.dfm}

uses Udados;

function TFrmCadGeralProd.InserirDados: string;
begin

  if LblDesc.Caption = 'Descri��o Grupo' then
  begin
    QryInsertDados.SQL.Add('insert into Grupo(DescGrupo) values(:DescGrupo)');
    QryInsertDados.Parameters.ParamByName('DescGrupo').Value := EdtDescricao.Text;
    QryInsertDados.ExecSQL;
    QryInsertDados.SQL.Clear;
    QryInsertDados.Close;
    QryBuscaDados.SQL.Clear;
    QryBuscaDados.SQL.Add('Select * from Grupo');
    QryBuscaDados.open;
    DBConsutaCadGeralProd.Columns[0].Title.Caption := 'C�digo';
    DBConsutaCadGeralProd.Columns[1].Title.Caption := 'Descri��o';
    EdtDescricao.Clear;
    MessageDlg('Grupo de Produtos Cadastrado Com Sucesso.', mtInformation, [mbOK], 0);
  end
  else
  if LblDesc.Caption = 'Descri��o SubGrupo' then
  begin
    QryInsertDados.SQL.Add('insert into SubGrupo(DescSubGrupo) values(:DescSubGrupo)');
    QryInsertDados.Parameters.ParamByName('DescSubGrupo').Value := EdtDescricao.Text;
    QryInsertDados.ExecSQL;
    QryInsertDados.SQL.Clear;
    QryInsertDados.Close;
    QryBuscaDados.SQL.Clear;
    QryBuscaDados.SQL.Add('Select * from SubGrupo');
    QryBuscaDados.open;
    DBConsutaCadGeralProd.Columns[0].Title.Caption := 'C�digo';
    DBConsutaCadGeralProd.Columns[1].Title.Caption := 'Descri��o';
    EdtDescricao.Clear;
    MessageDlg('SubGrupo de Produtos Cadastrado Com Sucesso.', mtInformation, [mbOK], 0);
  end
  else
  if LblDesc.Caption = 'Descri��o Fam�lia' then
  begin
    QryInsertDados.SQL.Add('insert into Familia(DescFamilia) values(:DescFamilia)');
    QryInsertDados.Parameters.ParamByName('DescFamilia').Value := EdtDescricao.Text;
    QryInsertDados.ExecSQL;
    QryInsertDados.SQL.Clear;
    QryInsertDados.Close;
    QryBuscaDados.SQL.Clear;
    QryBuscaDados.SQL.Add('Select * from Familia');
    QryBuscaDados.open;
    DBConsutaCadGeralProd.Columns[0].Title.Caption := 'C�digo';
    DBConsutaCadGeralProd.Columns[1].Title.Caption := 'Descri��o';
    EdtDescricao.Clear;
    MessageDlg('Fam�lia de Produtos Cadastrada Com Sucesso.', mtInformation, [mbOK], 0);
  end;
end;

procedure TFrmCadGeralProd.SpeedButton1Click(Sender: TObject);
begin
  InserirDados;
end;


end.
