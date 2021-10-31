unit MenuPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,  Data.DB,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, IdBaseComponent, REST.Client, Data.Bind.Components, Data.Bind.ObjectScope,
  IdComponent, IdTCPConnection, IdTCPClient, IdHTTP, uApiCep, uCep, Datasnap.DBClient, Vcl.Grids, Vcl.DBGrids, uManipuladorDados;


type
  TFBuscarCep = class(TForm)
    btn_buscar: TButton;
    edt_cep: TEdit;
    db_info: TDBGrid;
    procedure btn_buscarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    FCds: TClientDataSet;
    FDS: TDataSource;
    { Private declarations }
    function ObterDadosDoCep(Cep: string): TCep;
    procedure Inicializar;
    procedure InicializarCds;
    procedure ConfigurarCds;
    procedure FinalizarCds;
    procedure BuscarDados(Cep: string);
    function ValidarDados: Boolean;
  public
    { Public declarations }

  end;

var
  FBuscarCep: TFBuscarCep;

implementation

uses
  System.Rtti, System.Generics.Collections;

{$R *.dfm}

procedure TFBuscarCep.BuscarDados(Cep: string);
var
  oCep: TCep;
begin
  try
    oCep := ObterDadosDoCep(Cep);
    TManipuladorDeDados.PopularDados(FCds, oCep);
  finally
    FreeAndNil(oCep);
  end;
end;

procedure TFBuscarCep.btn_buscarClick(Sender: TObject);
begin
  if not ValidarDados then
  begin
    ShowMessage('Atenção, Cep Inválido Verifique!');
    Exit;
  end;

  BuscarDados(edt_cep.Text);
end;

procedure TFBuscarCep.ConfigurarCds;
begin
  FDS.DataSet := FCds;
  TManipuladorDeDados.CriarFields(FCds, TCep);
  db_info.DataSource := FDS;
end;

procedure TFBuscarCep.FinalizarCds;
begin
  FreeAndNil(FCds);
  FreeAndNil(FDS);
end;

procedure TFBuscarCep.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FinalizarCds;
end;

procedure TFBuscarCep.FormCreate(Sender: TObject);
begin
  Inicializar;
end;

procedure TFBuscarCep.Inicializar;
begin
  InicializarCds;
  ConfigurarCds;
end;

procedure TFBuscarCep.InicializarCds;
begin
  FCds := TClientDataSet.Create(nil);
  FDS := TDataSource.Create(nil);
end;

function TFBuscarCep.ObterDadosDoCep(Cep: string): TCep;
var
  oApiCep: TApiCep;
begin
  oApiCep := TApiCep.Create;
  try
    Result := oApiCep.Cep.Obter(Cep);
  finally
    FreeAndNil(oApiCep);
  end;
end;

function TFBuscarCep.ValidarDados: Boolean;
begin
  Result := True;

  if (edt_cep.Text = EmptyStr) or (Length(edt_cep.Text) < 8) or (Length(edt_cep.Text) > 8) then
    Result := False;
end;

end.
