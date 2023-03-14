program TesteEmprego;

uses
  Vcl.Forms,
  Login in 'Login.pas' {FrmLogin},
  View.Cadastro.Pessoa in 'View\View.Cadastro.Pessoa.pas' {FrmCadastroPessoas},
  Dao.Conexao in 'DAO\Dao.Conexao.pas',
  Dao.Pessoas in 'DAO\Dao.Pessoas.pas',
  Dao.Inserir in 'DAO\Dao.Inserir.pas',
  Dao.Login in 'DAO\Dao.Login.pas',
  DAO.Delete in 'DAO\DAO.Delete.pas',
  Dao.Pessoas2 in 'DAO\Dao.Pessoas2.pas',
  Controller.Pessoas in 'Controller\Controller.Pessoas.pas',
  Model.Pessoas in 'Model\Model.Pessoas.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFrmLogin, FrmLogin);
  Application.CreateForm(TFrmCadastroPessoas, FrmCadastroPessoas);
  Application.Run;
end.
