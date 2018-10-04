unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, ComCtrls, XPMan, jpeg, ExtCtrls;

type
  TForm1 = class(TForm)
    MainMenu1: TMainMenu;
    XPManifest1: TXPManifest;
    StatusBar1: TStatusBar;
    Financeiro1: TMenuItem;
    Drive1: TMenuItem;
    Oramentos1: TMenuItem;
    imes1: TMenuItem;
    Drive2: TMenuItem;
    Preferncias1: TMenuItem;
    Ajuda1: TMenuItem;
    Image1: TImage;
    imedasFinanas1: TMenuItem;
    imedoMercado1: TMenuItem;
    imedaMistura1: TMenuItem;
    imedaPiscina1: TMenuItem;
    Ajuda2: TMenuItem;
    Sobre1: TMenuItem;
    procedure Financeiro1Click(Sender: TObject);
    procedure Drive1Click(Sender: TObject);
    procedure Oramentos1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Drive2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses Unit2, Unit3, Unit4, Unit0, SHELLAPI;

{$R *.dfm}

procedure TForm1.Financeiro1Click(Sender: TObject);
begin
  Form2.Show;
end;

procedure TForm1.Drive1Click(Sender: TObject);
begin
  Form3.Show;
end;

procedure TForm1.Oramentos1Click(Sender: TObject);
begin
  Form4.Show;
end;
           
procedure TForm1.FormShow(Sender: TObject);
begin
  Form5.ShowModal;
end;

procedure TForm1.Drive2Click(Sender: TObject);
var
  Endereco: String;
begin
  Endereco := 'https://drive.google.com/open?id=1saSqmqMXzcxW2k3iLtGMR8E7SWTrtfB3';
  if ShellExecute(Handle, 'open', PChar(Endereco), nil, nil, SW_NORMAL) < 32 then
    MessageDlg('Não foi possível iniciar o navegador para carregar a página solicitada.', mtInformation, [mbOk], 0);
end;

end.
