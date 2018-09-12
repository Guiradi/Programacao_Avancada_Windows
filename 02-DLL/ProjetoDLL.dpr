program ProjetoDLL;

uses
  Forms,
  Principal in 'Principal.pas' {FormPrincipal};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'Matemática e Texto';
  Application.CreateForm(TFormPrincipal, FormPrincipal);
  Application.Run;
end.
