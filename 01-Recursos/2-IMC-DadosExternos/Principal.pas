unit Principal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, ExtCtrls;

type
  TForm1 = class(TForm)
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    GroupBox3: TGroupBox;
    GroupBox4: TGroupBox;
    RichEdit1: TRichEdit;
    TrackBar1: TTrackBar;
    Label1: TLabel;
    TrackBar2: TTrackBar;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Image1: TImage;
    Image2: TImage;
    Label5: TLabel;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    procedure FormShow(Sender: TObject);
    procedure TrackBar1Change(Sender: TObject);
    procedure TrackBar2Change(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure CalculaIMC(Altura, Peso: Real);
  end;

var
  Form1: TForm1;

implementation

uses
  SHELLAPI; // Para usar a rotina ShellExecute

{$R *.dfm}

const
  Figura_x = 65;  // Tamanho padrão das figuras
  Figura_y = 165;
var
  Altura, Peso, IMC: Real;

// A rotina que segue, simplesmente carrega o texto do arquivo rtf no componente RichEdit1
// Se não existir o arquivo rtf, ocorrerá um exceção
// Para resolver isto, deve-se modificar a rotina que segue, testando a existência do arquivo
// Isto pode ser feito com uma function, passando os parâmetros Nome do Arquivo e Nome do RichEdit

procedure CarregaRTF(NomeArquivo: string; RichEdit: TRichEdit);
begin
  // Rotina para carregar arquivo
  if FileExists(NomeArquivo) then
    RichEdit.Lines.LoadFromFile(NomeArquivo)
  else
  begin
    RichEdit.Lines.Clear;
    RichEdit.SelAttributes.Name := 'Verdana';
    RichEdit.SelAttributes.Size := 8;
    RichEdit.SelAttributes.Style := RichEdit.Font.Style+[fsBold];
    RichEdit.Lines.Add('Não foi possível carregar o arquivo '+NomeArquivo+'.');
    RichEdit.SelAttributes.Name := 'Verdana';
    RichEdit.SelAttributes.Size := 8;
    RichEdit.Lines.Add('');
    RichEdit.Lines.Add('Entre em contato com o fornecedor do programa.');
  end;
end;

procedure TForm1.CalculaIMC(Altura, Peso: Real);
begin
  if Altura = 0 then
    Exit;
  IMC := Peso/(Altura*Altura);
  Label3.Caption := Format('%3.2f',[IMC]);
  if (IMC <= 20) then
    CarregaRTF('IMC-1.rtf', RichEdit1);
  if (IMC > 20) and (IMC <= 25) then
    CarregaRTF('IMC-2.rtf', RichEdit1);
  if (IMC > 25) and (IMC <= 30) then
    CarregaRTF('IMC-3.rtf', RichEdit1);
  if (IMC > 30) and (IMC <= 35) then
    CarregaRTF('IMC-4.rtf', RichEdit1);
  if (IMC > 35) and (IMC <= 40) then
    CarregaRTF('IMC-5.rtf', RichEdit1);
  if (IMC > 40) then
    CarregaRTF('IMC-6.rtf', RichEdit1);
  Image2.Width := Round(Figura_x*IMC/22.5);
end;

procedure TForm1.FormShow(Sender: TObject);
begin
  // Antes de apresentar a forma, deve-se carregar a figura
  // Boneco.bmp em Image1 e em Image2
  Image1.Picture.LoadFromFile('Boneco.bmp');
  Image2.Picture.LoadFromFile('Boneco.bmp');
  // Para começar com peso e altura diferentes do mínimo,
  // atribui-se Position para cada componente, no Object Inspector ou,
  // remove-se os comentários das duas linhas abaixo
  // TrackBar1.Position := 180;
  // TrackBar2.Position := 75;
  TrackBar1Change(TrackBar1);
  TrackBar2Change(TrackBar2);
  Label3.Caption := '';
  RichEdit1.Clear;
  Image2.Width := Round(Figura_x);
  CalculaIMC(Altura, Peso);
end;

procedure TForm1.TrackBar1Change(Sender: TObject);
begin
  // Mexendo na trackbar 1
  TrackBar1.SelEnd := TrackBar1.Position;
  Altura := TrackBar1.Position/100;
  Label1.Caption := Format('%3.2f m', [Altura]);
  CalculaIMC(Altura, Peso);
end;

procedure TForm1.TrackBar2Change(Sender: TObject);
begin
  //// Mexendo na trackbar 2
  TrackBar2.SelEnd := TrackBar2.Position;
  Peso := TrackBar2.Position;
  Label2.Caption := Format('%3.1f kg', [Peso]);
  CalculaIMC(Altura, Peso);
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  CarregaRTF('IMC-Ajuda.rtf', RichEdit1);
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  CarregaRTF('IMC-Sobre.rtf', RichEdit1);
end;

// Nas rotinas que seguem, se o endereço fosse o Caption de um Label,
// poder-se-ia obter o endereço do Caption e enviar para o navegador
// Exemplo:
//  Considere Label1.Caption = 'www.fc.unesp.br'
//  Na rotina Label1Click atrelada ao evento OnClick do Label1, escrever
//  Endereco := 'http://'+(Sender as TLabel).Caption;

procedure TForm1.Button3Click(Sender: TObject);
var
  Endereco: String;
begin
  Endereco := 'http://www.google.com.br/search?q=índice+massa+corpórea';
  if ShellExecute(Handle, 'open', PChar(Endereco), nil, nil, SW_NORMAL) < 32 then
    MessageDlg('Não foi possível iniciar o navegador para carregar a página solicitada.', mtInformation, [mbOk], 0);
end;

procedure TForm1.Button4Click(Sender: TObject);
var
  Endereco: String;
begin
  Endereco := 'https://www.google.com.br/search?q=comidas+que+engordam';
  if ShellExecute(Handle, 'open', PChar(Endereco), nil, nil, SW_NORMAL) < 32 then
    MessageDlg('Não foi possível iniciar o navegador para carregar a página solicitada.', mtInformation, [mbOk], 0);
end;

end.
