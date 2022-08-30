unit UfrCadProduto;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls,
  Vcl.DBCtrls, Data.DB, Data.Win.ADODB, Vcl.Mask, Vcl.ComCtrls, Vcl.Menus;

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
    DBLookupComboBox1: TDBLookupComboBox;
    Label4: TLabel;
    Label9: TLabel;
    DBLookupComboBox2: TDBLookupComboBox;
    DBLookupComboBox3: TDBLookupComboBox;
    Label10: TLabel;
    DBLookupComboBox4: TDBLookupComboBox;
    Label11: TLabel;
    DsUni: TDataSource;
    QryUniUnidade: TStringField;
    QryUniDescricao: TStringField;
    procedure SpBtnCancelarClick(Sender: TObject);
    procedure SpBtnSalvarClick(Sender: TObject);
    procedure SpBtnAdicionarClick(Sender: TObject);
    procedure SpBtnPesquisarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmCadProduto: TFrmCadProduto;

implementation

{$R *.dfm}

uses Udados, UfrConsultaProduto;

procedure TFrmCadProduto.SpBtnAdicionarClick(Sender: TObject);
begin
  EdtNomePro.Enabled := True;
  EdtQuantidade.Enabled := True;
  MEditValor.Enabled:= True;
  EdtAltura.Enabled := True;
  EdtLargura.Enabled := True;
  DBLFornecedor.Enabled := True;
  DBUni.Enabled := True;
  QryFornecedor.Open;
  QryUni.Open;
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
      raise Exception.Create('Produto já cadastrado');
    QryProduto.Next;
  end;

  dimencoes := EdtAltura.Text +'x'+ EdtLargura.Text;

  if EdtNomePro.Text = '' then
    raise Exception.Create('Campo Nome do Produto Obrigatótio!!!')
  else
    CmdProduto.Parameters.ParamByName('prodesc').Value := EdtNomePro.Text;

  if EdtQuantidade.Text = '' then
    raise Exception.Create('Campo da Quantidade Obrigatótio!!!')
  else
    CmdProduto.Parameters.ParamByName('UNIDADE').Value := EdtQuantidade.Text;

  if (MEditValor.Text = 'R$') and (MEditValor.Text = '') then
    raise Exception.Create('Campo Valor Obrigatótio!!!')
  else
    CmdProduto.Parameters.ParamByName('VALOR').Value := StrToFloat(copy(MEditValor.Text,3,5));

  if EdtQuantidade.Text = '' then
    raise Exception.Create('Campo da Quantidade Obrigatótio!!!')
  else
    CmdProduto.Parameters.ParamByName('UNIDADE').Value := EdtQuantidade.Text;

  CmdProduto.Parameters.ParamByName('TAMANHO').Value := dimencoes;

  if DBLFornecedor.Text = '' then
    raise Exception.Create('Campo Fornecedor Obrigatótio!!!')
  else
    CmdProduto.Parameters.ParamByName('fornecedor').Value := DBLFornecedor.Text ;

  if DBUni.Text = '' then
    raise Exception.Create('Campo Conversão  de unidade Obrigatótio!!!')
  else
    CmdProduto.Parameters.ParamByName('coduni').Value := DBUni.Text ;

  CmdProduto.Execute;

  MessageDlg('Produto Cadastrado com Sucesso!!!', mtConfirmation, [mbOK], 0);
end;

end.
