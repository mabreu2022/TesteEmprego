unit Login;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.StdCtrls,
  Vcl.Imaging.jpeg,
  Vcl.ExtCtrls,
  View.Cadastro.Pessoa,
  Dao.Conexao,
  Dao.Login,
  FireDAC.Stan.Intf,
  FireDAC.Stan.Option,
  FireDAC.Stan.Error,
  FireDAC.UI.Intf,
  FireDAC.Phys.Intf,
  FireDAC.Stan.Def,
  FireDAC.Stan.Pool,
  FireDAC.Stan.Async,
  FireDAC.Phys,
  FireDAC.VCLUI.Wait,
  Data.DB,
  FireDAC.Comp.Client,
  System.IniFiles,
  FireDAC.Phys.PGDef,
  FireDAC.Phys.PG,
  FireDAC.Comp.UI;

type
  TFrmLogin = class(TForm)
    Panel1: TPanel;
    Button1: TButton;
    Button2: TButton;
    Image1: TImage;
    EdtUsuario: TEdit;
    EdtSenha: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    FConexao: TFDConnection;
  public
    { Public declarations }
    constructor create;
    destructor destroy; override;
  end;

var
  FrmLogin: TFrmLogin;

implementation

{$R *.dfm}

procedure TFrmLogin.Button1Click(Sender: TObject);
Var
  Login: TLogin;
begin

  Login := TLogin.Create;
  try
    if Login.Login(EdtUsuario.Text, EdtSenha.Text) then
    FrmCadastroPessoas.ShowModal
  else
  begin
    ShowMessage('usuario ou senha n�o encontrado');
    EdtUsuario.SetFocus;
  end;
  finally
    Login.Free;
  end;

end;

procedure TFrmLogin.Button2Click(Sender: TObject);
begin
  EdtUsuario.Text:= '';
  EdtSenha.Text:='';
  EdtUsuario.SetFocus;
end;

constructor TFrmLogin.create;
begin
  FConexao := TConnection.CreateConnection;
end;

destructor TFrmLogin.destroy;
begin

  inherited;
end;

procedure TFrmLogin.FormShow(Sender: TObject);
begin
  EdtUsuario.SetFocus;
end;

end.
