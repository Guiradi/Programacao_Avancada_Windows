program IMC;

uses
  Forms,
  Principal in 'Principal.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := '�ndice de massa corp�rea';
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
