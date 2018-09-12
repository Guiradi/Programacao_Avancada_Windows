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
    procedure CarregaRTF(Indice: Byte);
  end;

var
  Form1: TForm1;

implementation

uses
  SHELLAPI; // Para usar a rotina ShellExecute

{$R *.dfm}

const
  Figura_x = 65;  // Tamanho padr�o das figuras
  Figura_y = 165;
var
  Altura, Peso, IMC: Real;
  TextoRTF: Array[1..8] of WideString;

procedure TForm1.CarregaRTF(Indice: Byte);
begin
  RichEdit1.Text := TextoRTF[Indice];
end;

procedure TForm1.CalculaIMC(Altura, Peso: Real);
begin
  if Altura = 0 then
    Exit;
  IMC := Peso/(Altura*Altura);
  Label3.Caption := Format('%3.2f',[IMC]);
  if (IMC <= 20) then
    CarregaRTF(1);
  if (IMC > 20) and (IMC <= 25) then
    CarregaRTF(2);
  if (IMC > 25) and (IMC <= 30) then
    CarregaRTF(3);
  if (IMC > 30) and (IMC <= 35) then
    CarregaRTF(4);
  if (IMC > 35) and (IMC <= 40) then
    CarregaRTF(5);
  if (IMC > 40) then
    CarregaRTF(6);
  Image2.Width := Round(Figura_x*IMC/22.5);
end;

procedure TForm1.FormShow(Sender: TObject);
begin
  // C�pia de Image2 de Image1
  Image2.Picture := Image1.Picture;
  //Textos dos arquivos RTF
  TextoRTF[1] :=
    '{\rtf1\fbidis\ansi\ansicpg1252\deff0\deflang1046\deflangfe1046\deftab708{\fonttbl{\f0\fswiss\fprq2\fcharset0 Verdana;}}' +
    '\viewkind4\uc1\pard\ltrpar\nowidctlpar\b\f0\fs16 IMC abaixo de 20' +
    '\par \b0' +
    '\par Seu peso est� abaixo da faixa considerada normal.' +
    '\par � poss�vel que seu biotipo seja do tipo longil�neo e, nesse caso, seu percentual de gordura corporal pode estar normal.' +
    '\par Em todo caso, procure um Nutricionista para uma orienta��o mais espec�fica.' +
    '\par }';
  TextoRTF[2] :=
    '{\rtf1\fbidis\ansi\ansicpg1252\deff0\deflang1046\deflangfe1046\deftab708{\fonttbl{\f0\fswiss\fprq2\fcharset0 Verdana;}}' +
    '\viewkind4\uc1\pard\ltrpar\nowidctlpar\b\f0\fs16 IMC entre 20 e 25' +
    '\par \b0' +
    '\par Seu peso est� dentro da faixa considerada normal.' +
    '\par Normalmente isto corresponde �s mais baixas taxas de mortalidade em rela��o ao peso.' +
    '\par Se voc� n�o sofre de diabetes, hipertens�o arterial ou excesso de colesterol e triglicer�deos e ainda assim deseja emagrecer, provavelmente o motivo � de ordem est�tica.' +
    '\par Cuidado, portanto, para n�o submeter-se a riscos desnecess�rios.' +
    '\par }';
  TextoRTF[3] :=
    '{\rtf1\fbidis\ansi\ansicpg1252\deff0\deflang1046\deflangfe1046\deftab708{\fonttbl{\f0\fswiss\fprq2\fcharset0 Verdana;}}' +
    '\viewkind4\uc1\pard\ltrpar\nowidctlpar\b\f0\fs16 IMC entre 25 e 30 com cintura at� 89 cm\b0' +
    '\par' +
    '\par Voc� est� na faixa chamada de "excesso de peso".' +
    '\par Como sua medida de cintura est� abaixo de 90 cm, voc� provavelmente n�o apresenta um excesso de tecido adiposo no interior do abdome.' +
    '\par Este tecido adiposo, chamado de gordura visceral, � o que mais acarreta riscos para a sa�de.' +
    '\par Portanto voc� se situa em um grupo de menor probabilidade de complica��es como diabetes, hipertens�o arterial e hipercolesterolemia.' +
    '\par Mesmo assim � aconselh�vel que procure seu Nutricionista.' +
    '\par' +
    '\par \b IMC entre 25 e 30 com cintura igual ou maior que 90 cm\b0' +
    '\par' +
    '\par Voc� est� na faixa chamada de "excesso de peso". Como sua medida de cintura est� acima dos 90 cent�metros, provavelmente voc� est� acumulando um excesso de tecido adiposo no interior do abdome.' +
    '\par Este tecido adiposo, chamado de gordura visceral, � o que mais acarreta riscos para a sa�de.' +
    '\par Portanto voc� se situa em um grupo de maior probabilidade de complica��es como diabetes, hipertens�o arterial e hipercolesterolemia.' +
    '\par }';
  TextoRTF[4] :=
    '{\rtf1\fbidis\ansi\ansicpg1252\deff0\deflang1046\deflangfe1046\deftab708{\fonttbl{\f0\fswiss\fprq2\fcharset0 Verdana;}}' +
    '\viewkind4\uc1\pard\ltrpar\nowidctlpar\b\f0\fs16 IMC entre 30 e 35\b0' +
    '\par' +
    '\par Voc� est� na faixa chamada de obesidade leve.' +
    '\par Voc� se situa, portanto, em um grupo de maior probabilidade de complica��es como diabetes, hipertens�o arterial e hipercolesterolemia.' +
    '\par Procure seu Nutricionista para que ele o ajude a perder peso.' +
    '\par Mesmo perdas moderadas, como 10% do seu peso atual, podem reduzir significativamente seu risco de complica��es metab�licas.' +
    '\par }';
  TextoRTF[5] :=
    '{\rtf1\fbidis\ansi\ansicpg1252\deff0\deflang1046\deflangfe1046\deftab708{\fonttbl{\f0\fswiss\fprq2\fcharset0 Verdana;}}' +
    '\viewkind4\uc1\pard\ltrpar\nowidctlpar\b\f0\fs16 IMC entre 35 e 40\b0' +
    '\par' +
    '\par Voc� est� na faixa chamada de obesidade moderada.' +
    '\par Seu excesso de peso j� pode estar provocando um risco muito elevado de complica��es metab�licas, como diabetes, hipertens�o arterial e hipercolesterolemia, al�m de predispor a doen�as osteoarticulares diversas.' +
    '\par Procure logo seu m�dico e inicie um tratamento s�rio para emagrecer.' +
    '\par Mesmo perdas moderadas, como 10% do seu peso atual, podem reduzir significativamente seu risco de complica��es metab�licas.' +
    '\par Se voc� n�o conseguir emagrecer com uma orienta��o adequada sobre modifica��es diet�ticas e pr�tica de atividades f�sicas, justifica-se o uso de medicamentos, desde que devidamente supervisionado por um Nutricionista.' +
    '\par }';
  TextoRTF[6] :=
    '{\rtf1\fbidis\ansi\ansicpg1252\deff0\deflang1046\deflangfe1046\deftab708{\fonttbl{\f0\fswiss\fprq2\fcharset0 Verdana;}}' +
    '\viewkind4\uc1\pard\ltrpar\nowidctlpar\b\f0\fs16 IMC maior que 40' +
    '\par \b0' +
    '\par Voc� est� na faixa chamada de obesidade m�rbida.' +
    '\par Ela corresponde a um risco muito aumentado de diversas doen�as.' +
    '\par Seu tratamento em geral � muito dif�cil, mas assim mesmo qualquer esfor�o � v�lido.' +
    '\par Mesmo perdas moderadas, como 10% do seu peso atual, podem reduzir significativamente seu risco de complica��es metab�licas.' +
    '\par Se voc� n�o conseguir emagrecer com uma orienta��o adequada sobre modifica��es diet�ticas e pr�tica de atividades f�sicas, justifica-se o uso de medicamentos, desde que devidamente supervisionado por um m�dico.' +
    '\par Procure urgentemente o seu Nutricionista ou seu m�dico.' +
    '\par }';
  TextoRTF[7] :=
    '{\rtf1\fbidis\ansi\ansicpg1252\deff0\deflang1046\deflangfe1046\deftab708{\fonttbl{\f0\fswiss\fprq2\fcharset0 Verdana;}}' +
    '\viewkind4\uc1\pard\ltrpar\nowidctlpar\b\f0\fs16 Ajuda' +
    '\par \b0' +
    '\par Ent�o voc� precisa ajuda para usar este programa?' +
    '\par' +
    '\par � melhor voc� n�o us�-lo.' +
    '\par' +
    '\par Mas como hoje estou extremamente de bom humor, vou lhe dar algumas informa��es preciosas:' +
    '\par \pard\ltrpar\nowidctlpar\fi-142\li142\tx142 -\tab mova o cursor Altura e Peso e veja o resultado do IMC;' +
    '\par -\tab o movimento pode ser com o mouse ou com as teclas Tab (acesso) e Home, End, PgUp, PgDn ou setas (movimento).' +
    '\par \pard\ltrpar\nowidctlpar' +
    '\par O bot�o Ajuda mostra este texto. Claro que voc� j� percebeu isto.' +
    '\par' +
    '\par O bot�o Sobre mostra os cr�ditos e direitos autorais.' +
    '\par' +
    '\par O bot�o Busca Google, inicia seu navegador de Internet e busca textos relativos �s palavras-chave "�ndice massa corp�rea" com o buscador Google.' +
    '\par' +
    '\par O bot�o culin�ria � pura maldade.' +
    '\par }';
  TextoRTF[8] :=
    '{\rtf1\fbidis\ansi\ansicpg1252\deff0\deflang1046\deflangfe1046\deftab708{\fonttbl{\f0\fswiss\fprq2\fcharset0 Verdana;}{\f1\fmodern\fprq1\fcharset0 Courier New;}{\f2\froman\fprq2\fcharset0 Times New Roman;}}' +
    '\viewkind4\uc1\pard\ltrpar\nowidctlpar\b\f0\fs16 Sobre o IMC' +
    '\par \b0' +
    '\par Mais um programa da S�rie Programas Passatempo.' +
    '\par' +
    '\par S�rie Programas Passatempo significa:' +
    '\par \pard\ltrpar\nowidctlpar\fi-142\li142\tx142 -\tab Fa�a um novo programa todo dia, mesmo que t�o simples como este.' +
    '\par -\tab Fazendo isto, um dia voc� saber� programar.' +
    '\par \pard\ltrpar\nowidctlpar' +
    '\par \b S�rie Programas Passatempo' +
    '\par \b0' +
    '\par Uma atividade ocupacional do Marco Ant�nio Rahal Sacoman.' +
    '\par' +
    '\par Um dia ele tamb�m vai acabar aprendendo a programar. \b\f1\fs24 :-)\b0\f2' +
    '\par }';
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
  CarregaRTF(7);
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  CarregaRTF(8);
end;

// Nas rotinas que seguem, se o endere�o fosse o Caption de um Label,
// poder-se-ia obter o endere�o do Caption e enviar para o navegador
// Exemplo:
//  Considere Label1.Caption = 'www.fc.unesp.br'
//  Na rotina Label1Click atrelada ao evento OnClick do Label1, escrever
//  Endereco := 'http://'+(Sender as TLabel).Caption;

procedure TForm1.Button3Click(Sender: TObject);
var
  Endereco: String;
begin
  Endereco := 'http://www.google.com.br/search?q=�ndice+massa+corp�rea';
  if ShellExecute(Handle, 'open', PChar(Endereco), nil, nil, SW_NORMAL) < 32 then
    MessageDlg('N�o foi poss�vel iniciar o navegador para carregar a p�gina solicitada.', mtInformation, [mbOk], 0);
end;

procedure TForm1.Button4Click(Sender: TObject);
var
  Endereco: String;
begin
  Endereco := 'https://www.google.com.br/search?q=comidas+que+engordam';
  if ShellExecute(Handle, 'open', PChar(Endereco), nil, nil, SW_NORMAL) < 32 then
    MessageDlg('N�o foi poss�vel iniciar o navegador para carregar a p�gina solicitada.', mtInformation, [mbOk], 0);
end;

end.
