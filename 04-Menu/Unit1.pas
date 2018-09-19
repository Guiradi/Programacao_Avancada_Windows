unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, StdCtrls, ComCtrls, ExtCtrls, XPMan;

type
  TForm1 = class(TForm)
    MainMenu1: TMainMenu;
    Arquivos1: TMenuItem;
    Editar1: TMenuItem;
    Ajuda1: TMenuItem;
    Abrir1: TMenuItem;
    Salvar1: TMenuItem;
    Salvarcomo1: TMenuItem;
    Fechar1: TMenuItem;
    Sobre1: TMenuItem;
    Item11: TMenuItem;
    Item21: TMenuItem;
    Item31: TMenuItem;
    N1: TMenuItem;
    Item41: TMenuItem;
    Item51: TMenuItem;
    Item61: TMenuItem;
    Ajuda2: TMenuItem;
    PopupMenu1: TPopupMenu;
    Contarcaracteres1: TMenuItem;
    Contarpalavras1: TMenuItem;
    Contarlinhas1: TMenuItem;
    Memo1: TMemo;
    StatusBar1: TStatusBar;
    OpenDialog1: TOpenDialog;
    SaveDialog1: TSaveDialog;
    Timer1: TTimer;
    XPManifest1: TXPManifest;
    procedure FormShow(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure Arquivos1Click(Sender: TObject);
    procedure Abrir1Click(Sender: TObject);
    procedure Salvar1Click(Sender: TObject);
    procedure Salvarcomo1Click(Sender: TObject);
    procedure Fechar1Click(Sender: TObject);
    procedure Memo1Change(Sender: TObject);
    procedure Item11Click(Sender: TObject);
    procedure Item21Click(Sender: TObject);
    procedure Item31Click(Sender: TObject);
    procedure Item41Click(Sender: TObject);
    procedure Item51Click(Sender: TObject);
    procedure Item61Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses
  Unit2;

{$R *.dfm}

var
  ExisteArquivo: Boolean;
  ModificouArquivo: Boolean;

procedure TForm1.FormShow(Sender: TObject);
begin
  ExisteArquivo := False;
  ModificouArquivo := False;
  StatusBar1.Panels[0].Text := '';
  StatusBar1.Panels[1].Text := '';
  StatusBar1.Panels[2].Text := DateTimeToStr(Now);
end;

procedure TForm1.FormResize(Sender: TObject);
begin
  StatusBar1.Panels[0].Width := (StatusBar1.Width-125) div 2;
  StatusBar1.Panels[1].Width := (StatusBar1.Width-125) div 2;
end;

procedure TForm1.Timer1Timer(Sender: TObject);
begin
  StatusBar1.Panels[2].Text := DateTimeToStr(Now);
end;

procedure TForm1.Arquivos1Click(Sender: TObject);
begin
  // Verificar se tem texto no Memo1
  ExisteArquivo := Memo1.Text <> '';

  // Habilitar ou desabilitar itens no menu
  Salvar1.Enabled := ExisteArquivo;
  Salvarcomo1.Enabled := ExisteArquivo;
  Fechar1.Enabled := ExisteArquivo;
end;

procedure TForm1.Abrir1Click(Sender: TObject);
begin
  if OpenDialog1.Execute then
  begin
    Memo1.Lines.LoadFromFile(OpenDialog1.FileName);
    // Atribuir nome de arquivo aberto para salvar com mesmo nome
    SaveDialog1.FileName := OpenDialog1.FileName;
    StatusBar1.Panels[0].Text := ExtractFilePath(OpenDialog1.FileName);
    StatusBar1.Panels[1].Text := ExtractFileName(OpenDialog1.FileName);
    ModificouArquivo := False;
  end;
end;

procedure TForm1.Salvar1Click(Sender: TObject);
begin
  if SaveDialog1.FileName <> '' then
    Memo1.Lines.SaveToFile(SaveDialog1.FileName)
  else
    Salvarcomo1.Click;
end;

procedure TForm1.Salvarcomo1Click(Sender: TObject);
begin
  if SaveDialog1.Execute then
  begin
    Memo1.Lines.SaveToFile(SaveDialog1.FileName);
    StatusBar1.Panels[0].Text := ExtractFilePath(SaveDialog1.FileName);
    StatusBar1.Panels[1].Text := ExtractFileName(SaveDialog1.FileName);
  end;
end;

procedure TForm1.Fechar1Click(Sender: TObject);
var
  Resposta: Word;
begin
  if ModificouArquivo then
  begin
    Resposta := MessageDlg('Arquivo modificado.'+#10+'Deseja salvar?', mtConfirmation, [mbYes, mbNo, mbCancel], 0);
    if Resposta = mrYes then
      Salvar1.Click;
    if Resposta = mrCancel then
      Exit;
    end;
    Memo1.Lines.Clear;
    ExisteArquivo := False;
    SaveDialog1.FileName := '';
    StatusBar1.Panels[0].Text := '';
    StatusBar1.Panels[1].Text := '';
end;

procedure TForm1.Memo1Change(Sender: TObject);
begin
  ModificouArquivo := True;
end;

procedure TForm1.Item11Click(Sender: TObject);
begin
  Item11.Checked := True;
  MessageDlg('Item 1 marcado', mtInformation, [mbOk], 0);
end;

procedure TForm1.Item21Click(Sender: TObject);
begin
  Item21.Checked := True;
  MessageDlg('Item 2 marcado', mtInformation, [mbOk], 0);
end;

procedure TForm1.Item31Click(Sender: TObject);
begin
  Item31.Checked := True;
  MessageDlg('Item 3 marcado', mtInformation, [mbOk], 0);
end;

procedure TForm1.Item41Click(Sender: TObject);
begin
  if Item41.Checked then
  begin
    Item41.Checked := False;
    MessageDlg('Item 4 desmarcado', mtInformation, [mbOk], 0);
  end
  else
  begin
    Item41.Checked := True;
    MessageDlg('Item 4 marcado', mtInformation, [mbOk], 0);
  end;
end;

procedure TForm1.Item51Click(Sender: TObject);
begin
  if Item51.Checked then
  begin
    Item51.Checked := False;
    MessageDlg('Item 5 desmarcado', mtInformation, [mbOk], 0);
  end
  else
  begin
    Item51.Checked := True;
    MessageDlg('Item 5 marcado', mtInformation, [mbOk], 0);
  end;

end;

procedure TForm1.Item61Click(Sender: TObject);
begin
  if Item61.Checked then
  begin
    Item61.Checked := False;
    MessageDlg('Item 6 desmarcado', mtInformation, [mbOk], 0);
  end
  else
  begin
    Item61.Checked := True;
    MessageDlg('Item 6 marcado', mtInformation, [mbOk], 0);
  end;
end;

end.
