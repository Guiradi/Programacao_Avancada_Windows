unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, ShellAPI, ExtCtrls, ImgList, StdCtrls, ComCtrls, XPMan;

type
  TForm1 = class(TForm)
    PopupMenu1: TPopupMenu;
    Restaurar1: TMenuItem;
    Fechar1: TMenuItem;
    Sair1: TMenuItem;
    N1: TMenuItem;
    Sobreoprograma1: TMenuItem;
    N2: TMenuItem;
    Icone11: TMenuItem;
    Icone21: TMenuItem;
    Icone31: TMenuItem;
    Image1: TImage;
    Image2: TImage;
    Image3: TImage;
    XPManifest1: TXPManifest;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Restaurar1Click(Sender: TObject);
    procedure Fechar1Click(Sender: TObject);
    procedure Sair1Click(Sender: TObject);
    procedure Sobreoprograma1Click(Sender: TObject);
    procedure Image1Click(Sender: TObject);
    procedure Image2Click(Sender: TObject);
    procedure Image3Click(Sender: TObject);
    procedure TrayIcon;
    procedure Icone11Click(Sender: TObject);
    procedure Icone21Click(Sender: TObject);
    procedure Icone31Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    TrayIconData: TNotifyIconData;
  protected
    procedure WndProc(var Msg: TMessage); override;
  end;

var
  Form1: TForm1;

const
  WM_ICONTRAY = WM_USER + 1;

implementation

uses
  Unit2;

{$R *.dfm}

procedure TForm1.WndProc(var Msg: TMessage);
var
  p: TPoint;
begin
  case Msg.Msg of
  WM_USER + 1:
    case Msg.lParam of
      WM_RBUTTONDOWN:
      begin
        SetForegroundWindow(Handle);
        GetCursorPos(p);
        PopupMenu1.Popup(p.x,p.y);
        PostMessage(Handle, WM_NULL, 0, 0);
      end;
      WM_LBUTTONDBLCLK:
        begin
          Form1.Show;
          ShowWindow(Application.Handle, SW_RESTORE);
          // Pode-se substituir asduas linhas acima por esta
          // Restaurar1.Click;
        end;
    end;
  end;
  inherited;
end;

procedure TForm1.TrayIcon;
begin
  with TrayIconData do
  begin
    cbSize := Sizeof(TrayIconData);
    Wnd := Handle;
    uID := 0;
    uFlags := NIF_MESSAGE + NIF_ICON + NIF_TIP;
    uCallbackMessage := WM_ICONTRAY;
    hIcon := Application.Icon.Handle;
    StrPCopy(SzTip, Application.Title);
  end;
  Shell_NotifyIcon(NIM_ADD, @TrayIconData);
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  TrayIcon;
end;

procedure TForm1.FormDestroy(Sender: TObject);
begin
  Shell_NotifyIcon(NIM_DELETE, @TrayIconData);
end;

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caNone;
  Form1.Hide;
end;

procedure TForm1.Restaurar1Click(Sender: TObject);
begin
  Form1.Show;
  ShowWindow(Application.Handle, SW_RESTORE);
end;

procedure TForm1.Fechar1Click(Sender: TObject);
begin
  Form1.Close;
end;

procedure TForm1.Sair1Click(Sender: TObject);
begin
  Application.ProcessMessages;
  Application.Terminate;
end;

procedure TForm1.Sobreoprograma1Click(Sender: TObject);
begin
  Form2.Show;
  // Caso queira mostrar a Fôrma Principal antes da Fôrma Sobre, remova o comentário da próxima linha
  // ShowWindow(Application.Handle, SW_RESTORE);
end;

procedure TForm1.Icone11Click(Sender: TObject);
begin
  Image1Click(Self);
end;

procedure TForm1.Icone21Click(Sender: TObject);
begin
  Image2Click(Self);
end;

procedure TForm1.Icone31Click(Sender: TObject);
begin
  Image3Click(Self);
end;

procedure TForm1.Image1Click(Sender: TObject);
begin
  Application.Icon := Image1.Picture.Icon;
  Shell_NotifyIcon(NIM_DELETE, @TrayIconData);
  TrayIcon;
  Form2.Image1.Picture.Icon := Application.Icon;
end;

procedure TForm1.Image2Click(Sender: TObject);
begin
  Application.Icon := Image2.Picture.Icon;
  Shell_NotifyIcon(NIM_DELETE, @TrayIconData);
  TrayIcon;
  Form2.Image1.Picture.Icon := Application.Icon;
end;

procedure TForm1.Image3Click(Sender: TObject);
begin
  Application.Icon := Image3.Picture.Icon;
  Shell_NotifyIcon(NIM_DELETE, @TrayIconData);
  TrayIcon;
  Form2.Image1.Picture.Icon := Application.Icon;
end;

end.
