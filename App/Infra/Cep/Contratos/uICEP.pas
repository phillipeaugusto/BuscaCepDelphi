unit uICEP;

interface

uses uCep;

type
  ICep = interface
  ['{9187DD60-8E2B-4DDB-82D1-B6901E4BEA1D}']
    function Obter(Cep: string): TCep;
  end;

implementation

end.
