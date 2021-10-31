unit uManipuladorDados;

interface

uses
  Datasnap.DBClient, System.Generics.Collections;

type
  TManipuladorDeDados = class
  private
    class function RetornarTipoDado(const TipoDado: string): Integer;
  public
    class procedure CriarFields(Cds: TClientDataSet; AClass: TClass);
    class procedure PopularDados(Cds: TClientDataSet; AClass: TObject);
end;

implementation

uses
  System.Rtti, Data.DB, System.SysUtils;

class procedure TManipuladorDeDados.CriarFields(Cds: TClientDataSet; AClass: TClass);
var
  Contexto: TRttiContext;
  Tipo: TRttiType;
  Propriedade: TRttiProperty;
  TipoCampo: Integer;
begin
  Contexto := TRttiContext.Create;
  try
    Tipo := Contexto.GetType(AClass);
    Cds.FieldDefs.Clear;
    for Propriedade in Tipo.GetProperties do
    begin
      TipoCampo := RetornarTipoDado(Propriedade.PropertyType.ToString);
      if TipoCampo = 1 then
        Cds.FieldDefs.Add(Propriedade.Name, TFieldType(TipoCampo), 40)
      else
        Cds.FieldDefs.Add(Propriedade.Name, TFieldType(TipoCampo));
    end;
    Cds.CreateDataSet;
  finally
    Contexto.Free;
  end;
end;

class procedure TManipuladorDeDados.PopularDados(Cds: TClientDataSet; AClass: TObject);
var
  Contexto: TRttiContext;
  Tipo: TRttiType;
  Propriedade: TRttiProperty;
begin
  try
    Cds.EmptyDataSet;
    Tipo := Contexto.GetType(AClass.ClassInfo);
    Cds.Append;
    for Propriedade in Tipo.GetProperties do
      Cds.FieldByName(Propriedade.Name).AsVariant := Propriedade.GetValue(AClass).AsVariant;

    Cds.Post;
  finally
    Contexto.Free;
  end;
end;

class function TManipuladorDeDados.RetornarTipoDado(const TipoDado: string): Integer;
begin
  Result := 32;

  if (UpperCase(TipoDado) = 'DOUBLE') then
    Result := 6
  else if (UpperCase(TipoDado) = 'INTEGER') then
    Result := 3
  else if (UpperCase(TipoDado) = 'STRING') then
    Result := 1
  else if (UpperCase(TipoDado) = 'TDATETIME') then
    Result := 11;
end;

end.
