program TesteSemaforo;

uses
  Forms,
  Unit1 in 'Unit1.pas' {Form1TesteSemaforo1234},
  Unit2 in 'Unit2.pas' {Form2},
  Unit3 in 'Unit3.pas' {Form3},
  Windows {Para usar HWND, FindWindow, GetWindowLong, IsIconic, ShowWindow, ..., Create Semaphore, ...};

{$R *.res}

var
  Semaforo: THandle;

procedure RestoreWindow(aFormName : string);
var
  Janela, Aplicacao: HWND;
begin
  // Procura janela cuja f�rma tem o tipo TForm1TesteSemaforo1234 (usado na f�rma da Unit1)
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
  Semaforo := CreateSemaphore(nil, 0, 1, 'IdentificadorQueNinguemMaisVaiUsarParaTesteSemaforo');
  if((Semaforo <> 0) and (GetLastError = ERROR_ALREADY_EXISTS)) then
  begin
    // Se j� est� executando, traz a janela principal da inst�ncia que est� executando para frente
    RestoreWindow('TForm1TesteSemaforo1234');
    CloseHandle(Semaforo);
    Halt;
  end;
  
  Application.Initialize;
  Application.Title := 'Teste Semaforo - s� uma inst�ncia';
  Application.CreateForm(TForm1TesteSemaforo1234, Form1TesteSemaforo1234);
  Application.CreateForm(TForm2, Form2);
  Application.CreateForm(TForm3, Form3);
  Application.Run;

  CloseHandle(Semaforo);
end.
