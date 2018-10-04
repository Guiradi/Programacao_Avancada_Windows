unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

// ========== Constantes, Tipos e Variávais para o Balloon (Início) ========== //

const
  NIF_INFO = $10;
  NIF_MESSAGE = 1;
  NIF_ICON = 2;
  NOTIFYICON_VERSION = 3;
  NIF_TIP = 4;
  NIM_SETVERSION = $00000004;
  NIM_SETFOCUS = $00000003;
  NIIF_INFO = $00000001;
  NIIF_WARNING = $00000002;
  NIIF_ERROR = $00000003;
  NIN_BALLOONSHOW = WM_USER + 2;
  NIN_BALLOONHIDE = WM_USER + 3;
  NIN_BALLOONTIMEOUT = WM_USER + 4;
  NIN_BALLOONUSERCLICK = WM_USER + 5;
  NIN_SELECT = WM_USER + 0;
  NINF_KEY = $1;
  NIN_KEYSELECT = NIN_SELECT or NINF_KEY;
  TRAY_CALLBACK = WM_USER + $7258;

type
  PNewNotifyIconData = ^TNewNotifyIconData;
  TDUMMYUNIONNAME    = record
    case Integer of
      0: (uTimeout: UINT);
      1: (uVersion: UINT);
  end;
  TNewNotifyIconData = record
    cbSize: DWORD;
    Wnd: HWND;
    uID: UINT;
    uFlags: UINT;
    uCallbackMessage: UINT;
    hIcon: HICON;
    szTip: array [0..127] of Char;
    dwState: DWORD;
    dwStateMask: DWORD;
    szInfo: array [0..255] of Char;
    DUMMYUNIONNAME: TDUMMYUNIONNAME;
    szInfoTitle: array [0..63] of Char;
    dwInfoFlags: DWORD;
  end;

// ========== Constantes, Tipos e Variávais para o Balloon (Fim) ========== //

type
  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Label1: TLabel;
    Memo1: TMemo;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    { Private declarations }
    IconData: TNewNotifyIconData;
    procedure SysTrayIconMsgHandler(var Msg: TMessage); message TRAY_CALLBACK;
    procedure AddSysTrayIcon;
    //procedure ShowBalloonTips;
    procedure ShowBalloonTips(TipInfo, TipTitle: string);
    procedure DeleteSysTrayIcon;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

uses
  ShellAPI;

procedure TForm1.SysTrayIconMsgHandler(var Msg: TMessage);
begin
  case Msg.lParam of
    WM_MOUSEMOVE:
      Memo1.Lines.Add('WM_MOUSEMOVE');         // Mouse moveu sobre o ícone
    WM_LBUTTONDOWN:
      Memo1.Lines.Add('WM_LBUTTONDOWN');       // Pressionou botão esquerdo do mouse sobre o ícone
    WM_LBUTTONUP:
      Memo1.Lines.Add('WM_LBUTTONUP');         // Levantou botão esquerdo do mouse sobre o ícone
    WM_LBUTTONDBLCLK:
      Memo1.Lines.Add('WM_LBUTTONDBLCLK');     // Duplo toque no botão esquerdo do mouse sobre o ícone
    WM_RBUTTONDOWN:
      Memo1.Lines.Add('WM_RBUTTONDOWN');       // Pressionou botão direito do mouse sobre o ícone
    WM_RBUTTONUP:
      Memo1.Lines.Add('WM_RBUTTONUP');         // Levantou botão direito do mouse sobre o ícone
    WM_RBUTTONDBLCLK:
      Memo1.Lines.Add('WM_RBUTTONDBLCLK');     // Duplo toque no botão direito do mouse sobre o ícone
    NIN_BALLOONSHOW:
      Memo1.Lines.Add('NIN_BALLOONSHOW');      // Informa que balão foi apresentado
    NIN_BALLOONHIDE:
      Memo1.Lines.Add('NIN_BALLOONHIDE');      // Informa que balão foi escondido
    NIN_BALLOONTIMEOUT:
      Memo1.Lines.Add('NIN_BALLOONTIMEOUT');   // Informa que balão foi escondido por timeout
    NIN_BALLOONUSERCLICK:
      Memo1.Lines.Add('NIN_BALLOONUSERCLICK'); // Informa que balão foi escondido por toque do mouse
  end;
end;

procedure TForm1.AddSysTrayIcon;
begin
  IconData.cbSize := SizeOf(IconData);
  IconData.Wnd := AllocateHWnd(SysTrayIconMsgHandler);
  IconData.uID := 0;
  IconData.uFlags := NIF_ICON or NIF_MESSAGE or NIF_TIP;
  IconData.uCallbackMessage := TRAY_CALLBACK;
  IconData.hIcon := Application.Icon.Handle;
  IconData.szTip := 'Balloon está aqui'+#10+'Quando precisar, cutuque-me'+#10+'com o botão direito do mouse.';
  if not Shell_NotifyIcon(NIM_ADD, @IconData) then
    ShowMessage('NIM_ADD: Adição do ícone na bandeja falhou.');
end;

(*
procedure TForm1.ShowBalloonTips;
var
  TipInfo, TipTitle: string;
begin
  IconData.cbSize := SizeOf(IconData);
  IconData.uFlags := NIF_INFO;
  TipInfo := 'Quando precisar, cutuque-me'+#10+'com o botão direito do mouse.';
  strPLCopy(IconData.szInfo, TipInfo, SizeOf(IconData.szInfo) - 1);
  IconData.DUMMYUNIONNAME.uTimeout := 3000;
  TipTitle := 'Balloon está aqui';
  strPLCopy(IconData.szInfoTitle, TipTitle, SizeOf(IconData.szInfoTitle) - 1);
  IconData.dwInfoFlags := NIIF_INFO;     //NIIF_ERROR;  //NIIF_WARNING;
  Shell_NotifyIcon(NIM_MODIFY, @IconData);
  {in my testing, the following code has no use}
  IconData.DUMMYUNIONNAME.uVersion := NOTIFYICON_VERSION;
  if not Shell_NotifyIcon(NIM_SETVERSION, @IconData) then
    ShowMessage('NIM_SETVERSION: Atribuição de versão falhou.');
end;
*)

procedure TForm1.ShowBalloonTips(TipInfo, TipTitle: string);
begin
  IconData.cbSize := SizeOf(IconData);
  IconData.uFlags := NIF_INFO;
  //TipInfo := 'Quando precisar, cutuque-me'+#10+'com o botão direito do mouse.';
  strPLCopy(IconData.szInfo, TipInfo, SizeOf(IconData.szInfo) - 1);
  IconData.DUMMYUNIONNAME.uTimeout := 3000;
  //TipTitle := 'Balloon está aqui';
  strPLCopy(IconData.szInfoTitle, TipTitle, SizeOf(IconData.szInfoTitle) - 1);
  IconData.dwInfoFlags := NIIF_INFO;     //NIIF_ERROR;  //NIIF_WARNING;
  Shell_NotifyIcon(NIM_MODIFY, @IconData);
  {No teste, o que segue não é utilizado}
  IconData.DUMMYUNIONNAME.uVersion := NOTIFYICON_VERSION;
  if not Shell_NotifyIcon(NIM_SETVERSION, @IconData) then
    ShowMessage('NIM_SETVERSION: Atribuição de versão falhou.');
end;

procedure TForm1.DeleteSysTrayIcon;
begin
  DeallocateHWnd(IconData.Wnd);
  if not Shell_NotifyIcon(NIM_DELETE, @IconData) then
    ShowMessage('NIM_DELETE: Remoção do ícone falhou.');
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  AddSysTrayIcon;
  //ShowBalloonTips;
  ShowBalloonTips('Quando precisar, cutuque-me'+#10+'com o botão direito do mouse.', 'Balloon está aqui');
end;

procedure TForm1.FormDestroy(Sender: TObject);
begin
  DeleteSysTrayIcon;
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  //ShowBalloonTips;
  ShowBalloonTips('Você cutucou o botão e eu voltei'+#10+'Quando precisar, cutuque-me'+#10+'com o botão direito do mouse.', 'Balloon está aqui outra vez');
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  //ShowBalloonTips;
  ShowBalloonTips('0123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789'+#10+
                  '0123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789'+#10+
                  '0123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789'+#10,
                  '01234567890123456789012345678901234567890123456789012345678901234567890123456789');
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
  //ShowBalloonTips;
  ShowBalloonTips('Texto informativo.'+#10+'Texto informativo.'+#10+'Texto informativo.', 'Título');
end;

end.
