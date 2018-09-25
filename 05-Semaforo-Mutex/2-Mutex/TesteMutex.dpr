program TesteMutex;

uses
  Forms,
  Unit1 in 'Unit1.pas' {Form1TesteMutex1234},
  Unit2 in 'Unit2.pas' {Form2},
  Unit3 in 'Unit3.pas' {Form3},
  Windows {Para usar HWND, FindWindow, GetWindowLong, IsIconic, ShowWindow, ..., CreateMutex, ...};

// Veja o nome incomum dado � f�rma principal na Unit1 (Form1TesteMutex1234)
// Isto n�o � necess�rio para o Mutex
// � necess�rio para restaurar a janela da inst�ncia que j� est� executando
// Caso queira apenas emitir um beep, sem restaurar a janela, a forma principal pode se chamar Form1

{$R *.res}

procedure RestoreWindow(aFormName : string);
var
  Janela, Aplicacao: HWND;
begin
  // Procura janela cuja f�rma tem o tipo TForm1TesteMutex1234 (usado na f�rma da Unit1)
  Janela := FindWindow(PChar(aFormName), nil);
  // Se j� existe programa com esta janela sendo executada
  if (Janela <> 0) then
  begin
    // Ret�m a aplica��o que tem a janela em quest�o
    Aplicacao := GetWindowLong(Janela, GWL_HWNDPARENT);
    // Se estiver minimizada na barra de bot�es
    if IsIconic(Aplicacao) then
      // Mostra a janela
      ShowWindow(Aplicacao, SW_RESTORE);
      // Coloca a janela na frente dos outros programas
      SetForegroundwindow(Aplicacao);
      // Emite beep (n�o � necess�rio)
      //Valores padr�o do beep: 0 Default, 16 Critical, 32 Question, 48 Exclamation, 64 Asterisc
      MessageBeep(64);
    end;
end;

begin
  // N�o iniciar duas vezes
  // � claro que o programa inicia, mas deve ser interrompido se outra inst�ncia estiver executando
  // Esta interrup��o deve ser antes de apresentar qualquer janela da segunda inst�ncia
  SetLastError(NO_ERROR);
  CreateMutex(nil, False, 'IdentificadorQueNinguemMaisVaiUsarParaTesteMutex');
  if GetLastError = ERROR_ALREADY_EXISTS then
  begin
    // Se j� est� executando, traz a janela principal da inst�ncia que est� executando para frente
    RestoreWindow('TForm1TesteMutex1234');
    MessageBeep(64);
    Exit;
  end;

  Application.Initialize;
  Application.Title := 'Teste Mutex - s� uma inst�ncia';
  Application.CreateForm(TForm1TesteMutex1234, Form1TesteMutex1234);
  Application.CreateForm(TForm2, Form2);
  Application.CreateForm(TForm3, Form3);
  Application.Run;

end.
