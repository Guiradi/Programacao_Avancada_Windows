unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls;

type
  TForm1 = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    ScrollBar1: TScrollBar;
    ScrollBar2: TScrollBar;
    ScrollBar3: TScrollBar;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    CheckBox1: TCheckBox;
    Panel1: TPanel;
    ColorDialog1: TColorDialog;
    procedure FormShow(Sender: TObject);
    procedure ScrollBar1Change(Sender: TObject);
    procedure ScrollBar2Change(Sender: TObject);
    procedure ScrollBar3Change(Sender: TObject);
    procedure Panel1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.FormShow(Sender: TObject);
begin
  ScrollBar1Change(Self);
end;

procedure TForm1.ScrollBar1Change(Sender: TObject);
begin
  if CheckBox1.Checked then
  begin
    ScrollBar2.Position := ScrollBar1.Position;
    ScrollBar3.Position := ScrollBar1.Position;
  end;
  Label4.Caption := IntToStr(ScrollBar1.Position);
  Panel1.Color := RGB(ScrollBar1.Position, ScrollBar2.Position, ScrollBar3.Position);
end;

procedure TForm1.ScrollBar2Change(Sender: TObject);
begin
  if CheckBox1.Checked then
  begin
    ScrollBar1.Position := ScrollBar2.Position;
    ScrollBar3.Position := ScrollBar2.Position;
  end;
  Label5.Caption := IntToStr(ScrollBar2.Position);
  Panel1.Color := RGB(ScrollBar1.Position, ScrollBar2.Position, ScrollBar3.Position);

end;

procedure TForm1.ScrollBar3Change(Sender: TObject);
begin
  if CheckBox1.Checked then
  begin
    ScrollBar1.Position := ScrollBar3.Position;
    ScrollBar2.Position := ScrollBar3.Position;
  end;
  Label6.Caption := IntToStr(ScrollBar3.Position);
  Panel1.Color := RGB(ScrollBar1.Position, ScrollBar2.Position, ScrollBar3.Position);
end;

procedure TForm1.Panel1Click(Sender: TObject);
var
  Cor: TColor;
begin
  ColorDialog1.Color := Panel1.Color;
  if ColorDialog1.Execute then
  begin
  CheckBox1.Checked := False;
  Cor := ColorDialog1.Color;
  ScrollBar1.Position := GetRValue(Cor);
  ScrollBar2.Position := GetGValue(Cor);
  ScrollBar3.Position := GetBValue(Cor);
  end;
end;

end.
