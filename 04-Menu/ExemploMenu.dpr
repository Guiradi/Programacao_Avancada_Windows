program ExemploMenu;

uses
  Forms,
  Unit1 in 'Unit1.pas' {Form1},
  Unit2 in 'fig\Unit2.pas' {Form2};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'Exemplo de Menu';
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TForm2, Form2);
  Application.Run;
end.
