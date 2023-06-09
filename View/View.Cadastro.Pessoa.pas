unit View.Cadastro.Pessoa;

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
  Data.DB,
  Vcl.Grids,
  Vcl.DBGrids,
  Vcl.StdCtrls,
  Vcl.ComCtrls,
  Vcl.ExtCtrls,
  REST.Types,
  FireDAC.Stan.Intf,
  FireDAC.Stan.Option,
  FireDAC.Stan.Param,
  FireDAC.Stan.Error,
  FireDAC.DatS,
  FireDAC.Phys.Intf,
  FireDAC.DApt.Intf,
  FireDAC.Comp.DataSet,
  FireDAC.Comp.Client,
  REST.Client,
  REST.Response.Adapter,
  Data.Bind.Components,
  Data.Bind.ObjectScope,
  Vcl.DBCtrls,
  Vcl.Menus,
  Dao.Conexao,
  Dao.Pessoas,
  Dao.Pessoas2,
  Dao.Inserir,
  DAO.Delete,
  Controller.Pessoas,
  Model.Pessoas;

type
  TFrmCadastroPessoas = class(TForm)
    Panel1: TPanel;
    BtnIncluir: TButton;
    BtnAlterar: TButton;
    BtnExlcuir: TButton;
    BtnGravar: TButton;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Panel2: TPanel;
    EdtPesquisa: TEdit;
    Label1: TLabel;
    DbGridPessoas: TDBGrid;
    EdtIdPessoa: TEdit;
    EdtNome: TEdit;
    EdtDocumento: TEdit;
    EdtCEP: TEdit;
    EdtLogradouro: TEdit;
    EdtNumero: TEdit;
    EdtComplemento: TEdit;
    EdtUF: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    EdtBairro: TEdit;
    EdtCidade: TEdit;
    RESTResponse1: TRESTResponse;
    RESTResponseDataSetAdapter1: TRESTResponseDataSetAdapter;
    RESTRequest1: TRESTRequest;
    RESTClient1: TRESTClient;
    MemTable: TFDMemTable;
    DataSource1: TDataSource;
    BtnDBNav: TDBNavigator;
    MainMenu1: TMainMenu;
    Sair1: TMenuItem;
    BtnNovo: TButton;
    procedure EdtCEPExit(Sender: TObject);
    procedure Sair1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BtnIncluirClick(Sender: TObject);
    procedure BtnGravarClick(Sender: TObject);
    procedure BtnAlterarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BtnExlcuirClick(Sender: TObject);
    procedure EdtPesquisaKeyPress(Sender: TObject; var Key: Char);
    procedure BtnNovoClick(Sender: TObject);
    procedure DbGridPessoasCellClick(Column: TColumn);
  private
    { Private declarations }
     FTipo: string;
     FPessoa: TPessoa;
     FDelete: TDAODelete;
     QryPessoa: TFDQuery;

    Procedure LimpaCampos;
    procedure PopularPessoa(var Pessoa: TPessoa);

  public
    { Public declarations }
    procedure QryPessoaAfterScroll(DataSet: TDataSet);
    procedure CarregaClassePessoa;
  end;

var
  FrmCadastroPessoas: TFrmCadastroPessoas;

implementation

{$R *.dfm}

procedure TFrmCadastroPessoas.BtnAlterarClick(Sender: TObject);
begin
  FTipo:='A';
  BtnGravar.SetFocus;
end;

procedure TFrmCadastroPessoas.BtnExlcuirClick(Sender: TObject);
begin
  FTipo:='E';
  if MessageDlg('Tem certeza que deseja excluir este Registro ?' + FPessoa.nmprimeiro,
     mtConfirmation,[mbYes, mbNo], 0) = mrYes then
  begin
    try
       FDelete            := TDAODelete.Create;
       FPessoa            := TPessoa.Create;
       FPessoa.idpessoa   := QryPessoa.FieldValues['idpessoas'];
       FDelete.Excluir(FPessoa);
       QryPessoa.First;
       QryPessoa.Refresh;

    finally
      FDelete.Free;
      //FPessoa.Free;
    end;
  end;
end;

procedure TFrmCadastroPessoas.BtnGravarClick(Sender: TObject);
var
  Inserir: TIncluir;
  Alterar: TUpdate;
  Pessoa: TPessoa;
  Regras : TRegrasDeNegocio;
begin

  if FTipo = 'I' then
  begin

   try

     PopularPessoa(Pessoa);

     if not Regras.TestaseTemEndereco(Pessoa) then
     begin
       ShowMessage('� encess�rio preencher os campos');
       EdtNome.SetFocus;
       Exit;
     end;

     if inserir.Inserir(Pessoa) then
     begin
       ShowMessage('Cadastro efetuado com sucesso');
       QryPessoa.Refresh;
       QryPessoa.Last;
       exit;
     end
     else
     begin
       raise Exception.Create('Houve um erro ao tentar efetuar o cadastro.');
       LimpaCampos;
       EdtNome.SetFocus;
     end;

   finally
     Pessoa.Free;
   end;
  end
  else
  if FTIpo='A' then
  begin
    try

      PopularPessoa(Pessoa);
      //Alterar.Create;
      if Alterar.Alterar(Pessoa) then
      begin
        ShowMessage('Registro alterado com sucesso!');
        QryPessoa.Refresh;
        QryPessoa.Last;
        exit;
      end
      else
      begin
        raise Exception.Create('Houve um erro ao tentar alterar o cadastro.');
        LimpaCampos;
        EdtNome.SetFocus;
      end;

    finally

    end;
  end
  else
  if FTipo='E' then
  begin
    try

      PopularPessoa(Pessoa);

      if Alterar.Alterar(Pessoa) then
      begin
        ShowMessage('Registro apagado com sucesso!');
        QryPessoa.Refresh;
        QryPessoa.Last;
        exit;
      end
      else
      begin
        raise Exception.Create('Houve um erro ao tentar alterar o cadastro.');
        LimpaCampos;
        EdtNome.SetFocus;
      end;
    finally

    end;
  end;

end;

procedure TFrmCadastroPessoas.BtnIncluirClick(Sender: TObject);
begin
   FTipo := 'I';
   BtnGravar.SetFocus;

end;

procedure TFrmCadastroPessoas.BtnNovoClick(Sender: TObject);
begin
  FTipo:= 'I';
  LimpaCampos;
  EdtNome.SetFocus;
end;

procedure TFrmCadastroPessoas.CarregaClassePessoa;
begin

  FPessoa.idpessoa    := StrToInt64(QryPessoa.FieldByName('idpessoas').Value);
  FPessoa.dsdocumento := QryPessoa.FieldByName('documento').Value;
  FPessoa.nmprimeiro  := QryPessoa.FieldByName('nome').Value;
  FPessoa.UF          := QryPessoa.FieldByName('uf').Value;
  FPessoa.Cidade      := QryPessoa.FieldByName('Cidade').Value;
  FPessoa.Bairro      := QryPessoa.FieldByName('Bairro').Value;
  FPessoa.Logradouro  := QryPessoa.FieldByName('Logradouro').Value;
  FPessoa.Numero      := QryPessoa.FieldByName('numero').Value;
  FPessoa.Complemento := QryPessoa.FieldByName('Complemento').Value;
  FPessoa.dtregistro  := QryPessoa.FieldByName('dtregistro').Value;
  FPessoa.CEP         := QryPessoa.FieldByName('CEP').Value;

end;

procedure TFrmCadastroPessoas.DbGridPessoasCellClick(Column: TColumn);
begin
  QryPessoaAfterScroll(QryPessoa);
end;

procedure TFrmCadastroPessoas.EdtCEPExit(Sender: TObject);
var
  Incluir: TIncluir;
begin

  TThread.CreateAnonymousThread(procedure
  begin

      if Length(EdtCEP.Text)<5 then
      Exit;

      if EdtCEP.MaxLength > 8 then
      begin
        ShowMessage('O CEP deve conter somente 8 numeros');
        EdtCEP.SetFocus;
      end;

      RestRequest1.Resource := EdtCep.Text + '/json';
      RestRequest1.Execute;

      if RestRequest1.Response.StatusCode = 200 then
      begin
          if RestRequest1.Response.Content.IndexOf('erro')  > 0 then
            Showmessage('O CEP n�o foi encontrado')
          else
          begin
            with MemTable do
            begin

              EdtLogradouro.Text  := FieldByName('logradouro').AsString;
              EdtComplemento.Text := FieldByName('complemento').AsString;
              EdtBairro.Text      := FieldByName('bairro').AsString;
              EdtCidade.Text      := FieldByName('localidade').AsString;
              EdtUF.Text          := FieldByName('uf').AsString;

            end;
          end;
      end
      else
        ShowMessage('Erro ao consultar o CEP');

  end).Start

end;

procedure TFrmCadastroPessoas.EdtPesquisaKeyPress(Sender: TObject; var Key: Char);
begin
  QryPessoa.Locate('nome', EdtPesquisa.Text, [loCaseInsensitive,loPartialKey]);
end;

procedure TFrmCadastroPessoas.FormCreate(Sender: TObject);
begin
  PageControl1.ActivePageIndex := 0;
end;

procedure TFrmCadastroPessoas.FormShow(Sender: TObject);
var
  //Pessoa : TPopularGrid;
  FConexao: TFDConnection;

begin

  FPessoa:= TPessoa.Create;
  //Ligabotoes;
  EdtNome.SetFocus;

  try
    FConexao:= TConnection.CreateConnection;
    QryPessoa:= TFDQuery.Create(Self);
    QryPessoa.Connection:= FConexao;
    QryPessoa.Active:=False;
    QryPessoa.SQL.Clear;
    QryPessoa.SQL.Add('Select * from pessoas ');
    QryPessoa.SQL.Add(' Order By idPessoas');
    QryPessoa.Active:=True;

    BtnDBNav.DataSource:= DataSource1;
    QryPessoa.First;
    QryPessoa.AfterScroll:= QryPessoaAfterScroll;
    DataSource1.DataSet:= QryPessoa;
    DbGridPessoas.DataSource:= DataSource1;


  finally

  end;

end;

procedure TFrmCadastroPessoas.LimpaCampos;
var
  i  : Integer;
begin
   For i := 0 to ComponentCount -1 do
   begin
     if Components[i] is TEdit then
      begin
       TEdit(Components[i]).ReadOnly:=false;
       TEdit(Components[i]).Text:='';
      end;
     if Components[i] is TComboBox then
      begin
       TComboBox(Components[i]).Enabled:= false;
      end;
     if Components[i] is TMemo then
      begin
       TMemo(Components[i]).ReadOnly:= false;
      end;
   end;

   EdtIdPessoa.ReadOnly:=True;

end;

procedure TFrmCadastroPessoas.PopularPessoa(var Pessoa: TPessoa);
begin
  Pessoa:= TPessoa.Create;
  Pessoa.nmprimeiro  := EdtNome.Text;
  Pessoa.dsdocumento := EdtDocumento.Text;
  Pessoa.dtregistro  := Now;
  Pessoa.CEP         := EdtCEP.Text;
  Pessoa.Logradouro  := EdtLogradouro.Text;
  Pessoa.Numero      := StrTOInt(EdtNumero.Text);
  Pessoa.Complemento := EdtComplemento.Text;
  Pessoa.Bairro      := EdtBairro.Text;
  Pessoa.Cidade      := EdtCidade.Text;
  Pessoa.UF          := EdtUf.Text;

end;

procedure TFrmCadastroPessoas.QryPessoaAfterScroll(DataSet: TDataSet);
begin
  EdtIdPessoa.Text   := QryPessoa.FieldByName('idpessoas').Value;
  EdtDocumento.Text  := QryPessoa.FieldByName('Documento').Value;
  EdtNome.Text       := QryPessoa.FieldByName('nome').Value;
  //EdtDTREGISTRO.Text := QryPessoa.FieldByName('dtregistro').Value;
  EdtCEP.Text        := QryPessoa.FieldByName('CEP').Value;
  EdtUF.Text         := QryPessoa.FieldByName('UF').Value;
  EdtCidade.Text     := QryPessoa.FieldByName('Cidade').Value;
  EdtBairro.Text     := QryPessoa.FieldByName('Bairro').Value;
  EdtLogradouro.Text := QryPessoa.FieldByName('Logradouro').Value;
  EdtComplemento.Text:= QryPessoa.FieldByName('Complemento').Value;

  CarregaClassePessoa;
end;

procedure TFrmCadastroPessoas.Sair1Click(Sender: TObject);
begin
  Close;
end;

end.
