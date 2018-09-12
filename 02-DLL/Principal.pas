unit Principal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls;

type
  TFormPrincipal = class(TForm)
    Label1: TLabel;
    Edit1: TEdit;
    Label2: TLabel;
    Edit2: TEdit;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    RadioButton3: TRadioButton;
    RadioButton4: TRadioButton;
    RadioButton5: TRadioButton;
    RadioButton6: TRadioButton;
    RadioButton7: TRadioButton;
    Button1: TButton;
    RadioButton8: TRadioButton;
    Label3: TLabel;
    Edit3: TEdit;
    Bevel1: TBevel;
    Memo1: TMemo;
    Label4: TLabel;
    Edit4: TEdit;
    Label5: TLabel;
    Edit5: TEdit;
    Button2: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormPrincipal: TFormPrincipal;

implementation

{$R *.dfm}

var
  X, Y, Z: Real;

function Soma(X, Y: Real): Real; external 'Matematica.dll';
function Subtrai(X, Y: Real): Real; external 'Matematica.dll';
function Multiplica(X, Y: Real): Real; external 'Matematica.dll';
function Divide(X, Y: Real): Real; external 'Matematica.dll';
function Minimo(X, Y: Real): Real; external 'Matematica.dll';
function Maximo(X, Y: Real): Real; external 'Matematica.dll';
function Seno(X: Real): Real; external 'Matematica.dll';
function Cosseno(X: Real): Real; external 'Matematica.dll';
//function Seno(X, Y: Real): Real; external 'Matematica.dll';
//function Cosseno(X, Y: Real): Real; external 'Matematica.dll';
procedure TrocaLetras(Texto: PAnsiChar; Letra1, Letra2: Char); external 'Textos.dll';
//procedure TrocaLetras(Texto: PAnsiChar); external 'Textos.dll';

procedure TFormPrincipal.Button1Click(Sender: TObject);
begin
  X := StrToFloat(Edit1.Text);
  Y := StrToFloat(Edit2.Text);
  if RadioButton1.Checked then Z := Soma(X,Y);
  if RadioButton2.Checked then Z := Subtrai(X,Y);
  if RadioButton3.Checked then Z := Multiplica(X,Y);
  if RadioButton4.Checked then Z := Divide(X,Y);
  if RadioButton5.Checked then Z := Minimo(X,Y);
  if RadioButton6.Checked then Z := Maximo(X,Y);
  if RadioButton7.Checked then Z := Seno(X);
  if RadioButton8.Checked then Z := Cosseno(X);
//  if RadioButton7.Checked then Z := Seno(X,Y);
//  if RadioButton8.Checked then Z := Cosseno(X,Y);
  Edit3.Text := FloatToStr(Z);
end;

procedure TFormPrincipal.Button2Click(Sender: TObject);
var
  Texto: PAnsiChar;
  Letra1, Letra2: Char;
begin
  Texto := PAnsiChar(Memo1.Text);
  Letra1 := Edit4.Text[1];
  Letra2 := Edit5.Text[1];
  TrocaLetras(Texto, Letra1, Letra2);
//  TrocaLetras(Texto);
  MessageDlg(Texto, mtInformation, [mbOk], 0);
  Memo1.Text := Texto;
end;

end.
