program AppBuscaCep;

uses
  Vcl.Forms,
  MenuPrincipal in 'MenuPrincipal.pas' {FBuscarCep},
  uManagerAPIRestFull in 'Core\Http\uManagerAPIRestFull.pas',
  uEntidadeBase in 'Infra\Cep\Entidades\uEntidadeBase.pas',
  uICEP in 'Infra\Cep\Contratos\uICEP.pas',
  uCep in 'Infra\Cep\Entidades\uCep.pas',
  uCepConsumidor in 'Infra\Cep\Consumidor\uCepConsumidor.pas',
  uApiCep in 'Infra\Cep\Api\uApiCep.pas',
  uManipuladorDados in 'Core\Dados\uManipuladorDados.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFBuscarCep, FBuscarCep);
  Application.Run;
end.
