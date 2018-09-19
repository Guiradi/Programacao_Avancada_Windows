program TesteSemaforo;

uses
  Forms,
  Unit1 in 'Unit1.pas' {Form1TesteSemaforo1234},
  Unit2 in 'Unit2.pas' {Form2},
  Unit3 in 'Unit3.pas' {Form3};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1TesteSemaforo1234, Form1TesteSemaforo1234);
  Application.CreateForm(TForm2, Form2);
  Application.CreateForm(TForm3, Form3);
  Application.Run;
end.
