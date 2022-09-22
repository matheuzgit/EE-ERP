program EasyEstoque;

uses
  Vcl.Forms,
  UfrLogin in 'UfrLogin.pas' {FrmLogin},
  UfrCadLogin in 'UfrCadLogin.pas' {FrmCadLogin},
  UfrMenu in 'UfrMenu.pas' {FrmMenu},
  Udados in 'Dados\Udados.pas' {DMDados: TDataModule},
  UfrCadFornecedor in 'Cadastros\UfrCadFornecedor.pas' {FrmFornecedor},
  Pkg.Json.DTO in 'Pkg.Json.DTO.pas',
  Ucep in 'Ucep.pas',
  GetCnpj in 'GetCnpj.pas',
  UfrCadProduto in 'Cadastros\UfrCadProduto.pas' {FrmCadProduto},
  UfrConsultaProduto in 'Consultas\UfrConsultaProduto.pas' {FrmConsProduto},
  UnFunc in 'UnFunc.pas',
  UfrControlUser in 'UfrControlUser.pas' {FrmControlUser},
  UfrCadGeralProd in 'cadastros\UfrCadGeralProd.pas' {FrmCadGeralProd};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFrmLogin, FrmLogin);
  Application.CreateForm(TDMDados, DMDados);
  Application.CreateForm(TFrmMenu, FrmMenu);
  Application.CreateForm(TFrmControlUser, FrmControlUser);
  Application.Run;
end.
