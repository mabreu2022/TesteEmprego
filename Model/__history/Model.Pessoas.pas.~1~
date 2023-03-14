unit Model.Pessoas;

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
  FireDAC.VCLUI.Wait,
  Data.DB,
  FireDAC.Comp.Client;

type
  TRegrasDeNegocio = class
    private

    public
      class function TestaseTemEndereco(aCEP, aIdEndereco, auf, aCidade, aBairro,
  aLogradouro: string): Boolean;

  end;

implementation

{TRegrasDeNegocio}

class function TRegrasDeNegocio.TestaseTemEndereco(aCEP, aIdEndereco, auf, aCidade, aBairro,
  aLogradouro: string): Boolean;
begin

  if aCEP.Length < 8  then
  begin
    raise Exception.Create('O CEP não pode ser menor que 8 caracteres.');
    Result:= False;
    exit;
  end;

  if Trim(aIdEndereco) = '' then
  begin
    raise Exception.Create('É necessário prencher o Id Endereço.');
    Result:= False;
    exit;
  end;

  if Trim(auf) = '' then
  begin
    raise Exception.Create('É necessário preencher a UF.');
    Result:= False;
    exit;
  end;

  if Trim(aCidade) = '' then
  begin
    raise Exception.Create('É necessário preencher a Cidade.');
    Result:= False;
    exit;
  end;

  if Trim(aBairro) = '' then
  begin
    raise Exception.Create('É necessário preencher o Bairro.');
    Result:= False;
    exit;
  end;

  if Trim(aLogradouro) = '' then
  begin
    raise Exception.Create('É necessário preencher o Logradouro.');
    Result:= False;
    exit;
  end;

  Result:= True;

end;


end.
