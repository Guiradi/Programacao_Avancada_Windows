program TesteMutex;

uses
  Forms,
  Unit1 in 'Unit1.pas' {Form1TesteMutex1234},
  Unit2 in 'Unit2.pas' {Form2},
  Unit3 in 'Unit3.pas' {Form3},
  Windows {Para usar HWND, FindWindow, GetWindowLong, IsIconic, ShowWindow, ..., CreateMutex, ...};

// Veja o nome incomum dado à fôrma principal na Unit1 (Form1TesteMutex1234)
// Isto não é necessário para o Mutex
// É necessário para restaurar a janela da instância que já está executando
// Caso queira apenas emitir um beep, sem restaurar a janela, a forma principal pode se chamar Form1

{$R *.res}

procedure RestoreWindow(aFormName : string);
var
  Janela, Aplicacao: HWND;
begin
  // Procura janela cuja fôrma tem o tipo TForm1TesteMutex1234 (usado na fôrma da Unit1)
  Janela := FindWindow(PChar(aFormName), nil);
  // Se já existe programa com esta janela sendo executada
  if (Janela <> 0) then
  begin
    // Retém a aplicação que tem a janela em questão
    Aplicacao := GetWindowLong(Janela, GWL_HWNDPARENT);
    // Se estiver minimizada na barra de botões
    if IsIconic(Aplicacao) then
      // Mostra a janela
      ShowWindow(Aplicacao, SW_RESTORE);
      // Coloca a janela na frente dos outros programas
      SetForegroundwindow(Aplicacao);
      // Emite beep (não é necessário)
      //Valores padrão do beep: 0 Default, 16 Critical, 32 Question, 48 Exclamation, 64 Asterisc
      MessageBeep(64);
    end;
end;

begin
  // Não iniciar duas vezes
  // É claro que o programa inicia, mas deve ser interrompido se outra instância estiver executando
  // Esta interrupção deve ser antes de apresentar qualquer janela da segunda instância
  SetLastError(NO_ERROR);
  CreateMutex(nil, False, 'IdentificadorQueNinguemMaisVaiUsarParaTesteMutex');
  if GetLastError = ERROR_ALREADY_EXISTS then
  begin
    // Se já está executando, traz a janela principal da instância que está executando para frente
    RestoreWindow('TForm1TesteMutex1234');
    MessageBeep(64);
    Exit;
  end;

  Application.Initialize;
  Application.Title := 'Teste Mutex - só uma instância';
  Application.CreateForm(TForm1TesteMutex1234, Form1TesteMutex1234);
  Application.CreateForm(TForm2, Form2);
  Application.CreateForm(TForm3, Form3);
  Application.Run;

end.
