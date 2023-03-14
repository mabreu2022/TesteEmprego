unit DAO.Update;

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
  TUpdate = class
    private
      FQuery: TFDQuery;
      FConn: TFDConnection;
      FPessoa: TPessoa;
    public
      function Alterar(aPessoa: TPessoa): Boolean;
      constructor Create;
      destructor Destroy; override;
  end;

implementation

{ TUpdate }

function TUpdate.Alterar(aPessoa: TPessoa): Boolean;
begin

  Result:= True;

  try
    FQuery.Active := False;
    FQuery.SQL.Clear;
    FQuery.SQL.Add('UPDATE PESSOA SET FLNATUREZA=:FLNATUREZA, DSDOCUMENTO=:DSDOCUMENTO, NMPRIMEIRO=:NMPRIMEIRO, NMSEGUNDO=:NMSEGUNDO, DTREGISTRO=:DTREGISTRO');
    FQuery.SQL.Add('WHERE IDPESSOA =:IDPESSOA');
    FQuery.ParamByName('FLNATUREZA').Value  := aPessoa.flnatureza;
    FQuery.ParamByName('DSDOCUMENTO').Value := aPessoa.dsdocumento;
    FQuery.ParamByName('NMPRIMEIRO').Value  := aPessoa.nmprimeiro;
    FQuery.ParamByName('NMSEGUNDO').Value   := aPessoa.nmsegundo;
    FQuery.ParamByName('DTREGISTRO').Value  := aPessoa.dtregistro;

    FQuery.ParamByName('IDPESSOA').Value    := aPessoa.idpessoa;
    FQuery.ExecSQL;


  except on ex:exception do
    begin
      raise Exception.Create('Error ao deletar na tabela endereco' + ex.Message);
      Result := False;
    end;

  end;

  try

    FQuery.Active := False;
    FQuery.SQL.Clear;
    FQuery.SQL.Add('UPDATE ENDERECO SET DSCEP=:DSCEP');
    FQuery.SQL.Add('WHERE IDPESSOA=:IDPESSOA');
    //FQuery.SQL.Add('  AND IDENDERECO =:IDENDERECO');
    FQuery.ParamByName('DSCEP').Value      := aPessoa.CEP;

    FQuery.ParamByName('IDPESSOA').Value := aPessoa.idpessoa;
    FQuery.ExecSQL;


  except on ex:exception do
    begin
      raise Exception.Create('Error ao deletar na tabela endereco' + ex.Message);
      Result := False;
    end;

  end;

  try

    FQuery.Active := False;
    FQuery.SQL.Clear;
    FQuery.SQL.Add('UPDATE ENDERECO_INTEGRACAO SET DSUF=:DSUF, NMCIDADE=:NMCIDADE, NMBAIRRO=:NMBAIRRO, NMLOGRADOURO=:NMLOGRADOURO, DSCOMPLEMENTO=:DSCOMPLEMENTO');
    FQuery.SQL.Add('WHERE IDENDERECO =:IDENDERECO');
    FQuery.ParamByName('DSUF').Value          := aPessoa.UF;
    FQuery.ParamByName('NMCIDADE').Value      := aPessoa.Cidade;
    FQuery.ParamByName('NMBAIRRO').Value      := aPessoa.Bairro;
    FQuery.ParamByName('NMLOGRADOURO').Value  := aPessoa.Logradouro;
    FQuery.ParamByName('DSCOMPLEMENTO').Value := aPessoa.Complemento;

    FQuery.ParamByName('IDENDERECO').Value    := aPessoa.idEndereco;
    FQuery.ExecSQL;


  except on ex:exception do
    begin
      raise Exception.Create('Error ao alterar na tabela endereco_integração' + ex.Message);
      Result := False;
    end;

  end;


end;

constructor TUpdate.Create;
begin
  FConn:= TConnection.CreateConnection;
  FPessoa:= TPessoa.Create;
  FQuery:=TFDQuery.Create(nil);
  FQuery.Connection:= FConn;
end;

destructor TUpdate.Destroy;
begin
  if Assigned(FConn) then
    Fconn.Free;
  FQuery.DisposeOf;
  inherited;
end;

end.
