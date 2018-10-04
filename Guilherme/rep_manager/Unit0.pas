unit Unit0;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm5 = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Button1: TButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form5: TForm5;
  login: Boolean;

implementation

uses Unit1;

{$R *.dfm}

procedure TForm5.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  //Se o login n�o estiver validado, fecha o programa todo.
  if not (login) then
    Form1.Close;
end;



procedure TForm5.Button1Click(Sender: TObject);
begin
  //Valida��o do Login:
  login := true;
  //Fecha Forma de Login
  Form5.Close;
end;

end.
