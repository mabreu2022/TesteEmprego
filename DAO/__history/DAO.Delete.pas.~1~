unit DAO.Delete;

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
  Classe.Pessoas;

type
  TDAODelete = class
    private
       FConn: TFDConnection;
       FQuery: TFDQuery;

    public
      Function Excluir(aPessoa: TPessoa): Boolean;
      constructor Create;
      destructor Destroy; override;
  end;

implementation

{ TExcluir }

constructor TDAODelete.Create;
begin
  FConn:= TConnection.CreateConnection;
  FQuery:= TFDQuery.Create(nil);
  FQuery.Connection:= FConn;
end;

destructor TDAODelete.Destroy;
begin
  if Assigned(FConn) then
    Fconn.Free;
  FQuery.DisposeOf;
  inherited;
end;

function TDAODelete.Excluir(aPessoa: TPessoa): Boolean;
begin
  {DELETE FROM "public"."pessoa" WHERE "idpessoa" = 995}

  Result:= True;

  FConn.StartTransaction;
  try

    FQuery.Active := False;
    FQuery.SQL.Clear;
    FQuery.SQL.Add('DELETE FROM ENDERECO_INTEGRACAO');
    FQuery.SQL.Add('WHERE IDENDERECO= :IDENDERECO');
    FQuery.ParamByName('IDENDERECO').Value := aPessoa.idEndereco;
    FQuery.ExecSQL;


  except on ex:exception do
    begin
      raise Exception.Create('Error ao deletar na tabela endereco_integração' + ex.Message);
      Result := False;
      FConn.Rollback;
      //FQuery.Free;
    end;

  end;

  //FQuery:= TFDQuery.Create(nil);
  try

    FQuery.Active := False;
    FQuery.SQL.Clear;
    FQuery.SQL.Add('DELETE FROM ENDERECO');
    FQuery.SQL.Add('WHERE IDENDERECO= :IDENDERECO');
    FQuery.ParamByName('IDENDERECO').Value := aPessoa.idpessoa;
    FQuery.ExecSQL;


  except on ex:exception do
    begin
      raise Exception.Create('Error ao deletar na tabela endereco' + ex.Message);
      Result := False;
      FConn.Rollback;
      //FQuery.Free;
    end;

  end;

  //FQuery:= TFDQuery.Create(nil);
  try
    FQuery.Active := False;
    FQuery.SQL.Clear;
    FQuery.SQL.Add('DELETE FROM PESSOA');
    FQuery.SQL.Add('WHERE IDPESSOA = :IDPESSOA');
    FQuery.ParamByName('IDPESSOA').Value := aPessoa.idpessoa;
    FQuery.ExecSQL;


  except on ex:exception do
    begin
      raise Exception.Create('Error ao deletar na tabela endereco' + ex.Message);
      Result := False;
      FConn.Rollback;
      //FQuery.Free;
    end;

  end;
  FConn.Commit;
end;

end.
