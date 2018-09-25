unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ToolWin, ActnMan, ActnCtrls, StdCtrls, XPMan;

type
  TForm1TesteMutex1234 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    XPManifest1: TXPManifest;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1TesteMutex1234: TForm1TesteMutex1234;

implementation

uses Unit2, Unit3;

{$R *.dfm}

procedure TForm1TesteMutex1234.Button1Click(Sender: TObject);
begin
  Form2.Show;
end;

procedure TForm1TesteMutex1234.Button2Click(Sender: TObject);
begin
  Form3.ShowModal;
end;

end.
