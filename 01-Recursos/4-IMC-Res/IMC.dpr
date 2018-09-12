program IMC;

uses
  Forms,
  Principal in 'Principal.pas' {Form1};

{$R *.res}

{$R Recursos.res}

begin
  Application.Initialize;                   
  Application.Title := 'Índice de massa corpórea';
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
