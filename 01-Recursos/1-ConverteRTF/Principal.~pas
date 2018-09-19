unit Principal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    OpenDialog1: TOpenDialog;
    SaveDialog1: TSaveDialog;
    RichEdit1: TRichEdit;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

var
  NomeArquivo: string;

procedure TForm1.Button1Click(Sender: TObject);
begin
  if OpenDialog1.Execute then
  begin
    RichEdit1.Lines.LoadFromFile(OpenDialog1.FileName);
    NomeArquivo := ExtractFileName(OpenDialog1.FileName);           //  Armazena nome do arquivo
  end;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  SaveDialog1.FileName := NomeArquivo;                              //  Usa nome armazenado
  if SaveDialog1.Execute then
  begin
    RichEdit1.Lines.SaveToFile(SaveDialog1.FileName);
    SaveDialog1.InitialDir := ExtractFilePath(SaveDialog1.FileName); // Armazena diretório para uso futuro
  end;
end;

end.
