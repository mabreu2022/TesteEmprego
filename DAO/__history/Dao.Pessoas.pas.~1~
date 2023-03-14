unit Classe.Pessoas;

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
  Vcl.Dialogs;

type
  TPessoa = class
    private
    Fnmprimeiro  : string;
    Fdtregistro  : TDateTime;
    Fnmsegundo   : string;
    Fdsdocumento : string;
    Fidpessoa    : int64;
    Fflnatureza  : smallint;
    FLogradouro  : string;
    FBairro      : string;
    FUF          : string;
    FComplemento : string;
    FCidade      : string;
    FidEndereco  : int64;
    FCEP         : String;

    procedure Setdsdocumento(const Value : string);
    procedure Setdtregistro(const Value  : TDateTime);
    procedure Setflnatureza(const Value  : smallint);
    procedure Setidpessoa(const Value    : int64);
    procedure Setnmprimeiro(const Value  : string);
    procedure Setnmsegundo(const Value   : string);
    procedure SetBairro(const Value      : string);
    procedure SetCidade(const Value      : string);
    procedure SetComplemento(const Value : string);
    procedure SetLogradouro(const Value  : string);
    procedure SetUF(const Value          : string);
    procedure SetidEndereco(const Value  : int64);
    procedure SetCEP(const Value         : String);


    public
       property idpessoa    : int64      read Fidpessoa    write Setidpessoa;
       property idEndereco  : int64      read FidEndereco  write SetidEndereco;
       property flnatureza  : smallint   read Fflnatureza  write Setflnatureza;
       property dsdocumento : string     read Fdsdocumento write Setdsdocumento;
       property nmprimeiro  : string     read Fnmprimeiro  write Setnmprimeiro;
       property nmsegundo   : string     read Fnmsegundo   write Setnmsegundo;
       property dtregistro  :  TDateTime read Fdtregistro  write Setdtregistro;
       property UF          : string     read FUF          write SetUF;
       property Cidade      : string     read FCidade      write SetCidade;
       property Bairro      : string     read FBairro      write SetBairro;
       property Logradouro  : string     read FLogradouro  write SetLogradouro;
       property Complemento : string     read FComplemento write SetComplemento;
       property CEP         : String     read FCEP         write SetCEP;

  end;

implementation

{ TPessoa }

procedure TPessoa.SetBairro(const Value: string);
begin
  FBairro := Value;
end;

procedure TPessoa.SetCEP(const Value: String);
begin
  FCEP := Value;
end;

procedure TPessoa.SetCidade(const Value: string);
begin
  FCidade := Value;
end;

procedure TPessoa.SetComplemento(const Value: string);
begin
  FComplemento := Value;
end;

procedure TPessoa.Setdsdocumento(const Value: string);
begin
  Fdsdocumento := Value;
end;

procedure TPessoa.Setdtregistro(const Value: TDateTime);
begin
  Fdtregistro := Value;
end;

procedure TPessoa.Setflnatureza(const Value: smallint);
begin
  Fflnatureza := Value;
end;

procedure TPessoa.SetidEndereco(const Value: int64);
begin
  FidEndereco := Value;
end;

procedure TPessoa.Setidpessoa(const Value: int64);
begin
  Fidpessoa := Value;
end;

procedure TPessoa.SetLogradouro(const Value: string);
begin
  FLogradouro := Value;
end;

procedure TPessoa.Setnmprimeiro(const Value: string);
begin
  Fnmprimeiro := Value;
end;

procedure TPessoa.Setnmsegundo(const Value: string);
begin
  Fnmsegundo := Value;
end;

procedure TPessoa.SetUF(const Value: string);
begin
  FUF := Value;
end;

end.
