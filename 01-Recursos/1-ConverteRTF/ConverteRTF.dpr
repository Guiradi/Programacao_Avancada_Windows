program ConverteRTF;

uses
  Forms,
  Principal in 'Principal.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'Conversor de RTF';
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
