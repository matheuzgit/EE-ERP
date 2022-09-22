unit UfrCadProduto;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls,
  Vcl.DBCtrls, Data.DB, Data.Win.ADODB, Vcl.Mask, Vcl.ComCtrls, Vcl.Menus,
  Vcl.Grids, Vcl.DBGrids;

type
  TFrmCadProduto = class(TForm)
    EdtNomePro: TEdit;
    DBLFornecedor: TDBLookupComboBox;
    Panel1: TPanel;
    EdtQuantidade: TEdit;
    SpBtnSalvar: TSpeedButton;
    SpBtnEditar: TSpeedButton;
    SpBtnExcluir: TSpeedButton;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    SpBtnPesquisar: TSpeedButton;
    QryFornecedor: TADOQuery;
    QryFornecedorNOMEFANTASIA: TStringField;
    QryFornecedorRAZAOSOCIAL: TStringField;
    QryFornecedorRUA: TStringField;
    QryFornecedorNUMERO: TIntegerField;
    QryFornecedorUF: TStringField;
    QryFornecedorCOMPLEMENTO: TStringField;
    QryFornecedorCIDADE: TStringField;
    QryFornecedorCEP: TIntegerField;
    QryFornecedorEMAIL: TStringField;
    QryFornecedorFIXO: TStringField;
    QryFornecedorMOVEL: TStringField;
    DsFornecedor: TDataSource;
    SpBtnCancelar: TSpeedButton;
    MEditValor: TMaskEdit;
    EdtAltura: TEdit;
    Label7: TLabel;
    EdtLargura: TEdit;
    Label8: TLabel;
    QryProduto: TADOQuery;
    QryProdutoprocodId: TAutoIncField;
    QryProdutoprodesc: TStringField;
    QryProdutoUNIDADE: TIntegerField;
    QryProdutoVALOR: TFloatField;
    QryProdutoPESO: TFloatField;
    QryProdutofornecedor: TStringField;
    QryProdutoTAMANHO: TStringField;
    CmdProduto: TADOCommand;
    SpBtnAdicionar: TSpeedButton;
    EdtMarca: TEdit;
    Marca: TLabel;
    DBUni: TDBLookupComboBox;
    QryUni: TADOQuery;
    QryFornecedorSegmento: TStringField;
    QryFornecedorCNPJ: TBCDField;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    DBcbGrupo: TDBLookupComboBox;
    Label4: TLabel;
    Label9: TLabel;
    DBcbSubGrupo: TDBLookupComboBox;
    DBcbFamilia: TDBLookupComboBox;
    Label10: TLabel;
    DBLookupComboBox4: TDBLookupComboBox;
    Label11: TLabel;
    DsUni: TDataSource;
    QryUniUnidade: TStringField;
    QryUniDescricao: TStringField;
    SbtnCadClasse: TSpeedButton;
    SbtnCadFamilia: TSpeedButton;
    SbtnCadGrupo: TSpeedButton;
    SbtnCadSubGrupo: TSpeedButton;
    SbtnCadMarca: TSpeedButton;
    SbtnCadFornecedor: TSpeedButton;
    SbtnCadUnidade: TSpeedButton;
    MaskEdit1: TMaskEdit;
    Label12: TLabel;
    MaskEdit2: TMaskEdit;
    Label13: TLabel;
    Edit1: TEdit;
    Entradas: TLabel;
    Edit2: TEdit;
    Sa�das: TLabel;
    Edit3: TEdit;
    Label16: TLabel;
    Edit4: TEdit;
    Label17: TLabel;
    DBGrid1: TDBGrid;
    Panel2: TPanel;
    QryGrupo: TADOQuery;
    DsGrupo: TDataSource;
    QryFamilia: TADOQuery;
    DsFamilia: TDataSource;
    QrySubGrupo: TADOQuery;
    DsSubGrupo: TDataSource;
    procedure SpBtnCancelarClick(Sender: TObject);
    procedure SpBtnSalvarClick(Sender: TObject);
    procedure SpBtnAdicionarClick(Sender: TObject);
    procedure SpBtnPesquisarClick(Sender: TObject);
    procedure SbtnCadFamiliaClick(Sender: TObject);
    procedure SbtnCadGrupoClick(Sender: TObject);
    procedure SbtnCadSubGrupoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmCadProduto: TFrmCadProduto;

implementation

{$R *.dfm}

uses Udados, UfrConsultaProduto, UfrCadGeralProd;

procedure TFrmCadProduto.SbtnCadFamiliaClick(Sender: TObject);
var Familia : TFrmCadGeralProd;
begin
  Familia := TFrmCadGeralProd.Create(Self);
  try
    Familia.Caption := 'Cadastro de Fam�lia de Produto';
    Familia.LblDesc.Caption := 'Descri��o Fam�lia';
    Familia.QryBuscaDados.SQL.Add('Select * from Familia');
    Familia.QryBuscaDados.open;
    Familia.DBConsutaCadGeralProd.Columns[0].Title.Caption := 'C�digo';
    Familia.DBConsutaCadGeralProd.Columns[1].Title.Caption := 'Descri��o';
    Familia.ShowModal;
  finally
    Familia.free;
  end;
end;

procedure TFrmCadProduto.SbtnCadGrupoClick(Sender: TObject);
var Grupo : TFrmCadGeralProd;
begin
  Grupo := TFrmCadGeralProd.Create(Self);
  try
    Grupo.Caption := 'Cadastro de Grupos de Produto';
    Grupo.LblDesc.Caption := 'Descri��o Grupo';
    Grupo.QryBuscaDados.SQL.Add('Select * from Grupo');
    Grupo.QryBuscaDados.open;
    Grupo.DBConsutaCadGeralProd.Columns[0].Title.Caption := 'C�digo';
    Grupo.DBConsutaCadGeralProd.Columns[1].Title.Caption := 'Descri��o';
    Grupo.ShowModal;
  finally
    Grupo.free;
  end;
end;

procedure TFrmCadProduto.SbtnCadSubGrupoClick(Sender: TObject);
var SubGrupos : TFrmCadGeralProd;
begin
  SubGrupos := TFrmCadGeralProd.Create(Self);
  try
    SubGrupos.Caption := 'Cadastro de SubGrupos de Produto';
    SubGrupos.LblDesc.Caption := 'Descri��o SubGrupo';
    SubGrupos.QryBuscaDados.SQL.Add('Select * from SubGrupo');
    SubGrupos.QryBuscaDados.open;
    SubGrupos.DBConsutaCadGeralProd.Columns[0].Title.Caption := 'C�digo';
    SubGrupos.DBConsutaCadGeralProd.Columns[1].Title.Caption := 'Descri��o';
    SubGrupos.ShowModal;
  finally
    SubGrupos.free;
  end;
end;

procedure TFrmCadProduto.SpBtnAdicionarClick(Sender: TObject);
begin
  EdtNomePro.Enabled := True;
  EdtQuantidade.Enabled := True;
  MEditValor.Enabled:= True;
  EdtAltura.Enabled := True;
  EdtLargura.Enabled := True;
  DBLFornecedor.Enabled := True;
  DBUni.Enabled := True;
  DBcbSubGrupo.Enabled := true;
  DBcbGrupo.Enabled := true;
  DBcbFamilia.Enabled := true;
  QryFornecedor.Open;
  QryUni.Open;
  QryGrupo.open;
  QryFamilia.open;
  QrySubGrupo.open;
end;

procedure TFrmCadProduto.SpBtnCancelarClick(Sender: TObject);
begin
  if MessageDlg('Deseja cancelar procedimento?', mtConfirmation, [mbYes, mbNo],0) = mrYes then
    EdtNomePro.Clear;
    EdtQuantidade.Clear;

    MEditValor.Text := 'R$';
    EdtAltura.Clear;
    EdtLargura.Clear;
    DBLFornecedor.Enabled :=  False;
    DBUni.Enabled := False;

    EdtNomePro.Enabled := False;
    EdtQuantidade.Enabled :=  False;

    MEditValor.Enabled :=  False;
    EdtAltura.Enabled :=  False;
    EdtLargura.Enabled := False;
    QryFornecedor.close;
    QryUni.close;
end;

procedure TFrmCadProduto.SpBtnPesquisarClick(Sender: TObject);
var
  consProduto : TFrmConsProduto;
begin
  consProduto := TFrmConsProduto.Create(Self);
  consProduto.ShowModal;
end;

procedure TFrmCadProduto.SpBtnSalvarClick(Sender: TObject);
var
  dimencoes : string;
begin

  QryProduto.Close;
  QryProduto.open;
  QryProduto.First;
  while not QryProduto.Eof do
  begin
    if EdtNomePro.Text = QryProdutoprodesc.AsString then
      raise Exception.Create('Produto j� cadastrado');
    QryProduto.Next;
  end;

  dimencoes := EdtAltura.Text +'x'+ EdtLargura.Text;

  if EdtNomePro.Text = '' then
    raise Exception.Create('Campo Nome do Produto Obrigat�tio!!!')
  else
    CmdProduto.Parameters.ParamByName('prodesc').Value := EdtNomePro.Text;

  if EdtQuantidade.Text = '' then
    raise Exception.Create('Campo da Quantidade Obrigat�tio!!!')
  else
    CmdProduto.Parameters.ParamByName('UNIDADE').Value := EdtQuantidade.Text;

  if (MEditValor.Text = 'R$') and (MEditValor.Text = '') then
    raise Exception.Create('Campo Valor Obrigat�tio!!!')
  else
    CmdProduto.Parameters.ParamByName('VALOR').Value := StrToFloat(copy(MEditValor.Text,3,5));

  if EdtQuantidade.Text = '' then
    raise Exception.Create('Campo da Quantidade Obrigat�tio!!!')
  else
    CmdProduto.Parameters.ParamByName('UNIDADE').Value := EdtQuantidade.Text;

  CmdProduto.Parameters.ParamByName('TAMANHO').Value := dimencoes;

  if DBLFornecedor.Text = '' then
    raise Exception.Create('Campo Fornecedor Obrigat�tio!!!')
  else
    CmdProduto.Parameters.ParamByName('fornecedor').Value := DBLFornecedor.Text ;

  if DBUni.Text = '' then
    raise Exception.Create('Campo Convers�o  de unidade Obrigat�tio!!!')
  else
    CmdProduto.Parameters.ParamByName('coduni').Value := DBUni.Text ;

  CmdProduto.Execute;

  MessageDlg('Produto Cadastrado com Sucesso!!!', mtConfirmation, [mbOK], 0);
end;

end.
