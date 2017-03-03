program Delo;

uses
  Forms,
  Windows,
  Main in 'Main.pas' {FormMain} ,
  Logo in 'Logo.pas' {FormLogo} ,
  FirmInfo in 'FirmInfo.pas' {FormFirmInfo} ,
  Search in 'Search.pas' {FormSearch} ,
  Notebook in 'Notebook.pas' {FormNoteBook} ,
  NotebookAdd in 'NotebookAdd.pas' {FormNotebookAdd} ,
  MailSend in 'MailSend.pas' {FormMailSend} ,
  Docs in 'Docs.pas' {FormDocs};

{$R *.res}

var
  k: Cardinal;

begin

  CreateMutex(nil, false, '1E92A90A-AD8B-47E2-AAA5-7459253CD342');
  k := GetLastError();
  if (k = ERROR_ALREADY_EXISTS) or (k = ERROR_ACCESS_DENIED) then
  begin
    Application.Terminate;
    Exit;
  end;

  Application.Title := 'Швейное Дело и Мода';
  Application.Initialize;
  FormLogo := TFormLogo.Create(Application);
  FormLogo.Show;
  FormLogo.Update;
  Application.CreateForm(TFormMain, FormMain);
  Application.CreateForm(TFormFirmInfo, FormFirmInfo);
  Application.CreateForm(TFormSearch, FormSearch);
  Application.CreateForm(TFormNoteBook, FormNoteBook);
  Application.CreateForm(TFormNotebookAdd, FormNotebookAdd);
  Application.CreateForm(TFormMailSend, FormMailSend);
  Application.CreateForm(TFormDocs, FormDocs);
  FormLogo.Hide;
  FormLogo.Free;
  Application.Run;

end.
