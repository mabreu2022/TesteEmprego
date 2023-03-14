unit Dao.Inserir;

interface

uses
  System.SysUtils,
  System.Classes,
  FireDAC.Stan.Intf,
  FireDAC.Stan.Option,
  FireDAC.Stan.Error,
  FireDAC.UI.Intf,
  FireDAC.Phys.Intf,
  FireDAC.Stan.Def,
  FireDAC.Stan.Pool,
  FireDAC.Stan.Async,
  FireDAC.Phys,
  FireDAC.Phys.PG,
  FireDAC.Phys.PGDef,
  FireDAC.VCLUI.Wait,
  Data.DB,
  FireDAC.Comp.Client,
  DAO.Conexao,
  Vcl.Dialogs,
  Dao.Pessoas;

type
  TIncluir = class
  private
    FConn    : TFDConnection;
    FPessoa  : TPessoa;
    FDataSet : TDataSource;
    FQuery   : TFDQuery;

  public
     function PesquisaId(aTabela: String; aId: String): Integer;
     function PesquisaIdEndereco(aTabela: string; aIdEndereco: string): Integer;
     function Inserir(aPessoa: TPessoa): Boolean;

     constructor Create;
     destructor Destroy; override;
  end;

implementation

uses
  View.Cadastro.Pessoa;

{ TIncluir }

constructor TIncluir.Create;
begin
  FConn             := TConnection.CreateConnection;
  FPessoa           := TPessoa.Create;
  FQuery            := TFDQuery.Create(nil);
  FQuery.Connection := FConn;
end;

destructor TIncluir.Destroy;
begin

  inherited;
end;

Function TIncluir.Inserir(aPessoa: TPessoa): Boolean;
var
  QryAuxiliar: TFDQuery;
  FConexao: TFDConnection;
  Transacao: TFDTransaction;
begin

   FConexao:= TConnection.CreateConnection;
   QryAuxiliar := TFDQuery.Create(Nil);
   QryAuxiliar.Connection:= FConexao;

   Transacao:=  TFDTransaction.Create(nil);
   Transacao.Connection:= FConexao;
   Transacao.StartTransaction;
   try
     QryAuxiliar.SQL.Clear;
     QryAuxiliar.SQL.Add('INSERT INTO PESSOAS( NOME, DOCUMENTO, CEP, LOGRADOURO, NUMERO, COMPLEMENTO, BAIRRO, CIDADE, UF, DTREGISTRO) ');
     QryAuxiliar.SQL.Add('VALUES (:NOME, :DOCUMENTO, :CEP, :LOGRADOURO, :NUMERO, :COMPLEMENTO, :BAIRRO, :CIDADE, :UF, :DTREGISTRO )');

     QryAuxiliar.ParamByName('NOME').Value        := aPessoa.nmprimeiro;
     QryAuxiliar.ParamByName('DOCUMENTO').Value   := aPessoa.dsdocumento;
     QryAuxiliar.ParamByName('CEP').Value         := aPessoa.CEP;
     QryAuxiliar.ParamByName('LOGRADOURO').Value  := aPessoa.Logradouro;
     QryAuxiliar.ParamByName('NUMERO').Value      := aPessoa.Numero;
     QryAuxiliar.ParamByName('COMPLEMENTO').Value := aPessoa.Complemento;
     QryAuxiliar.ParamByName('BAIRRO').Value      := aPessoa.Bairro;
     QryAuxiliar.ParamByName('CIDADE').Value      := aPessoa.Cidade;
     QryAuxiliar.ParamByName('UF').Value          := aPessoa.uf;
     QryAuxiliar.ParamByName('DTREGISTRO').Value  := aPessoa.dtregistro;

     QryAuxiliar.ExecSQL;
     Result:=True;
     Transacao.Commit;

   Except on ex:exception do
   begin
     raise Exception.Create('Error ao gravar na tabela pessoa' + ex.Message);
     Result:=False;
     Transacao.Rollback;
     QryAuxiliar.Free;
     Exit;
   end;

   end;
   Transacao.Free;
end;

function TIncluir.PesquisaId(aTabela, aId: String): Integer;
var
  Qry: TFDQuery;
  Conexao: TConnection;
begin

  Qry:= TFDQuery.Create(nil);

  try

    Conexao:= TConnection.Create;
    Qry.Connection :=  Conexao.CreateConnection;
    Qry.SQL.Add('select max(idpessoa) from public.pessoa');
    Qry.Open;

    if Qry.Fields[0].IsNull then
      Result:=1
    else
      Result:= Qry.Fields[0].AsInteger + 1;

  finally
    Qry.Free;
  end;
end;

function TIncluir.PesquisaIdEndereco(aTabela, aIdEndereco: string): Integer;
var
  Qry: TFDQuery;
  Conexao: TConnection;
begin

  Qry:= TFDQuery.Create(nil);

  try

    Conexao:= TConnection.Create;
    Qry.Connection :=  Conexao.CreateConnection;
    Qry.SQL.Add('select max(idendereco) from endereco');
    Qry.SQL.SaveToFile('C:\SQLPesquiaIdEndereco.txt');
    Qry.Open;

    if Qry.Fields[0].IsNull then
      Result:=1
    else
      Result:= Qry.Fields[0].AsInteger + 1;

  finally
    Qry.Free;
  end;

end;

end.
