unit Main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, sSkinManager, jpeg, ExtCtrls, sPanel, ComCtrls, sToolBar,
  StdCtrls, sComboBox, sCheckBox, sPageControl, Grids, JvBehaviorLabel,
  sButton, Buttons, sSpeedButton, Mask, sMaskEdit, sCustomComboEdit,
  sComboEdit, sFileCtrl, ImgList, Registry, IniFiles, DateUtils, sEdit,
  JvComponentBase, JvExStdCtrls, JvComputerInfoEx, Menus, sBitBtn, NxColumns,
  NxColumnClasses, NxScrollControl, NxCustomGridControl, NxCustomGrid,
  NxGrid, sGauge, sStatusBar, ShellApi, StrUtils, sTreeView, CommCtrl,
  frxClass, frxDBSet, sSkinProvider, acAlphaImageList, sGroupBox, ToolWin,
  acCoolBar, psAPI, NxEdit, sRichEdit, MidasLib, acPNG, DBAccess, IBC,
  MemDS, DB;

function QueryCreate: TIBCQuery;

type
  TFormMain = class(TForm)
    TimerReklamaPic: TTimer;
    sPanel4: TsPanel;
    ImageReklama: TImage;
    ImageList1: TImageList;
    JvComputerInfoEx1: TJvComputerInfoEx;
    PopupMenu1: TPopupMenu;
    NBtnFirmOpenInfo: TMenuItem;
    NBtnNBAddRec: TMenuItem;
    N3: TMenuItem;
    NBtnResetData: TMenuItem;
    NBtnPrint: TMenuItem;
    sStatusBar1: TsStatusBar;
    sGauge: TsGauge;
    BtnImagePrev: TsSpeedButton;
    BtnImageNext: TsSpeedButton;
    BtnImageStop: TsSpeedButton;
    TimerReklamaText: TTimer;
    TimerMemory: TTimer;
    sSkinManager1: TsSkinManager;
    sSkinProvider1: TsSkinProvider;
    ImageList16: TsAlphaImageList;
    ImageList24: TsAlphaImageList;
    ImgList_MultiState: TsAlphaImageList;
    ImgList_Multi16: TsAlphaImageList;
    sPanel1: TsPanel;
    sPanel2: TsPanel;
    sPanel5: TsPanel;
    BtnFirmOpenInfo: TsSpeedButton;
    sPageControl1: TsPageControl;
    sTabSheet1: TsTabSheet;
    SGFirm: TNextGrid;
    NxTextColumn1: TNxTextColumn;
    NxTextColumn2: TNxTextColumn;
    sTabSheet2: TsTabSheet;
    SGNapr: TNextGrid;
    NxTextColumn4: TNxTextColumn;
    NxTextColumn5: TNxTextColumn;
    sPanel3: TsPanel;
    editGorod: TsComboBox;
    editType: TsComboBox;
    sComboBox1: TsComboBox;
    editRubrikator: TsComboBox;
    panelToolBar: TsPanel;
    BtnResetData: TsSpeedButton;
    BtnPrint: TsSpeedButton;
    BtnNotebook: TsSpeedButton;
    ImageReklama_TEXT: TImage;
    editSearch: TNxEdit;
    NBtnSendEmail: TMenuItem;
    btnSendEmail: TsSpeedButton;
    ImageList32: TsAlphaImageList;
    btnDocs: TsSpeedButton;
    BtnSearch: TsSpeedButton;
    PopupMenu2: TPopupMenu;
    NBtnSendEmailCurrent: TMenuItem;
    NBtnSendEmailAll: TMenuItem;
    NNBtnSendEmailCurrent: TMenuItem;
    NNBtnSendEmailAll: TMenuItem;
    sPanel6: TsPanel;
    ImageLogo: TImage;
    IBQuery1: TIBCQuery;
    IBDatabase1: TIBCConnection;
    function CurrentProcessMemory: Cardinal;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure InitUserSettings;
    function CreateNBDT(FileName: string): Boolean;
    function SearchNode(component: TsTreeView; id: integer): TTreeNode;
    procedure IniCreate;
    procedure IniLoad;
    procedure IniSave;
    procedure GetData;
    procedure GetRubrikList;
    procedure GetGorodList;
    procedure GetOfficeTypeList;
    procedure GetNaprList;
    procedure OpenFirmByID(ID: string; ShowForm: Boolean);
    function GetNameByID(table, id: string): string;
    procedure SGAfterSort(Sender: TObject; ACol: Integer);
    procedure editRubrikatorChange(Sender: TObject);
    procedure SGFirmDblClick(Sender: TObject);
    procedure BtnResetDataClick(Sender: TObject);
    procedure editSearchChange(Sender: TObject);
    procedure BtnSearchClick(Sender: TObject);
    procedure SGNaprDblClick(Sender: TObject);
    procedure sPageControl1PageChanging(Sender: TObject;
      NewPage: TsTabSheet; var AllowChange: Boolean);
    procedure TimerReklamaPicTimer(Sender: TObject);
    procedure BtnImagePrevClick(Sender: TObject);
    procedure BtnImageNextClick(Sender: TObject);
    procedure BtnImageStopClick(Sender: TObject);
    procedure TimerMemoryTimer(Sender: TObject);
    procedure TimerReklamaTextTimer(Sender: TObject);
    procedure ImageReklama_TEXTClick(Sender: TObject);
    procedure ImageReklamaClick(Sender: TObject);
    procedure CreateRekalamForm(Pic: string);
    procedure PicReklamaClick(Sender: TObject);
    procedure BtnPrintClick(Sender: TObject);
    procedure BtnNotebookClick(Sender: TObject);
    procedure NBtnNBAddRecClick(Sender: TObject);
    procedure btnDocsClick(Sender: TObject);
    procedure sSkinProvider1TitleButtons0MouseUp(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure NBtnSendEmailCurrentClick(Sender: TObject);
    procedure NBtnSendEmailAllClick(Sender: TObject);
    procedure editGorodChange(Sender: TObject);
    procedure ImageLogoClick(Sender: TObject);
    procedure BtnFirmOpenInfoClick(Sender: TObject);
  private
    { Private declarations }
  public
    procedure WMGetMinMaxInfo(var M: TWMGetMinMaxInfo); message WM_GetMinMaxInfo;
    { Public declarations }
  end;

const
  FBUserName: string = 'SYSDBA';
  FBUserPassword: string = 'masterkey';
  MainDB: string = 'usrdt.msq';
  NotebookDB: string = 'nbdt.msq';
  IniFile: string = 'delo.ini';
  ReklamaPic_Interval: DWord = 4000;

var
  FormMain: TFormMain;
  AppPath, AppData, AppPic, AppDoc: string;
  Ini: TIniFile;
  REKLAMA_PIC_ListALL, REKLAMA_TEXT_ListALL, REKLAMA_DOC_ListALL: TStringList;
  ReklamaPic_CurrentNO: Integer = 0;
  ReklamaText_CurrentNO: Integer = 0;
  ReklamaText_CurentText: string = '';
  tX: integer = 0;
  isReklamaListAssigned: Boolean = False;

implementation

uses Logo, FirmInfo, Search, Notebook, NotebookAdd, MailSend, Docs, Math;

{$R *.dfm}
{#BACKUP [changes].txt}
{#BACKUP report.dat}
{#BACKUP MapiEmail.pas}

function QueryCreate: TIBCQuery;
var
  Query: TIBCQuery;
begin
  Query := TIBCQuery.Create(nil);
  Query.Connection := FormMain.IBDatabase1;
  Query.AutoCommit := True;
  Query.FetchRows := 1;
  result := Query;
end;

procedure TFormMain.WMGetMinMaxInfo(var M: TWMGetMinMaxInfo);
begin
  M.MinMaxInfo^.PTMaxPosition.X := 0;
  M.MinMaxInfo^.PTMinTrackSize.X := 800;
  M.MinMaxInfo^.PTMaxPosition.Y := 0;
  M.MinMaxInfo^.PTMinTrackSize.Y := 600;
end;

function TFormMain.CurrentProcessMemory: Cardinal;
var
  MemCounters: TProcessMemoryCounters;
begin
  MemCounters.cb := SizeOf(MemCounters);
  if GetProcessMemoryInfo(GetCurrentProcess, @MemCounters, SizeOf(MemCounters)) then
    Result := MemCounters.WorkingSetSize
  else
  begin
    RaiseLastOSError;
    Result := 0
  end;
end;

procedure TFormMain.TimerMemoryTimer(Sender: TObject);
var
  e: extended;
begin
  e := CurrentProcessMemory / 1024;
  sStatusBar1.Panels[0].Text := FloatToStr(e) + 'kb';
end;

function TFormMain.SearchNode(component: TsTreeView;
  id: integer): TTreeNode;
var
  Searching: boolean;
  Noddy: TTreeNode;
begin
  Result := nil;
  if component.Items.Count = 0 then
    exit;
  Noddy := component.Items[0];
  Searching := true;
  while (Searching) and (Noddy <> nil) do
    if integer(Noddy.Data) = id then
    begin
      Searching := False;
      Result := Noddy;
    end
    else
      Noddy := Noddy.GetNext
end;

function TFormMain.CreateNBDT(FileName: string): Boolean;
var
  DataBase: TIBCConnection;
  Query: TIBCQuery;

  procedure ExecSQL(s: string);
  begin
    Query.Close;
    Query.SQL.Clear;
    Query.SQL.Text := s;
    Query.Execute;
  end;

begin
  Result := True;
  DataBase := TIBCConnection.Create(self);
  DataBase.LoginPrompt := False;
  Query := TIBCQuery.Create(self);
  Query.Connection := DataBase;
  try
    try
      with DataBase do
      begin
        Params.Clear;
        Params.Add('USER ''SYSDBA''');
        Params.Add('PASSWORD ''masterkey''');
        Params.Add('PAGE_SIZE 4096');
        Params.Add('DEFAULT CHARACTER SET CYRL');
        Database := FileName;
        SQLDialect := 3;
        CreateDataBase;
      end;
      ExecSQL('CREATE TABLE NOTE_BASE ( ID INTEGER NOT NULL, ID_BASE INTEGER NOT NULL, ID_RUBRIKA INTEGER NOT NULL, NOTE_DATA VARCHAR(1000) )');
      ExecSQL('CREATE TABLE NOTE_RUBR ( ID INTEGER NOT NULL, NAME VARCHAR(255) NOT NULL )');
      ExecSQL('CREATE GENERATOR GEN_NOTE_BASE_ID');
      ExecSQL('SET GENERATOR GEN_NOTE_BASE_ID TO 0');
      ExecSQL('CREATE GENERATOR GEN_NOTE_RUBR_ID');
      ExecSQL('SET GENERATOR GEN_NOTE_RUBR_ID TO 0');
      Query.Close;
      Query.SQL.Clear;
      Query.SQL.Add('CREATE TRIGGER NOTE_BASE_BI FOR NOTE_BASE');
      Query.SQL.Add('ACTIVE BEFORE INSERT POSITION 0');
      Query.SQL.Add('as begin');
      Query.SQL.Add('if (new.id is null) then');
      Query.SQL.Add('new.id = gen_id(gen_note_base_id,1);');
      Query.SQL.Add('end');
      Query.Execute;
      Query.Close;
      Query.SQL.Clear;
      Query.SQL.Add('CREATE TRIGGER NOTE_RUBR_BI FOR NOTE_RUBR');
      Query.SQL.Add('ACTIVE BEFORE INSERT POSITION 0');
      Query.SQL.Add('as begin');
      Query.SQL.Add('if (new.id is null) then');
      Query.SQL.Add('new.id = gen_id(gen_note_rubr_id,1);');
      Query.SQL.Add('end');
      Query.Execute;
      Query.Close;
      Query.SQL.Clear;
      Query.SQL.Text := 'insert into NOTE_RUBR (NAME) values (:NAME)';
      Query.ParamByName('NAME').AsString := 'Общие';
      Query.Execute;
    except
      DataBase.Close;
      DeleteFile(FileName);
      Result := False;
    end;
  finally
    Query.Close;
    DataBase.Close;
    Query.Free;
    DataBase.Free;
  end;
end;

procedure TFormMain.InitUserSettings;
var
  C: HCURSOR;
  user_NBFile: PAnsiChar;
begin
  C := LoadCursor(0, IDC_HAND);
  if C <> 0 then
    Screen.Cursors[crHandPoint] := C;
  AppData := JvComputerInfoEx1.Folders.AppData + 'Delo\';
  AppPath := ExtractFilePath(Application.ExeName);
  AppPic := AppPath + 'Pic\';
  AppDoc := AppPath + 'Doc\';
  if not DirectoryExists(AppData) then
  begin
    if not CreateDirectory(PChar(AppData), nil) then
    begin
      FormLogo.Close;
      MessageBox(handle, 'Ошибка при создании рабочих директорий программы.' + #13 + 'Завершение работы.', 'Ошибка', MB_OK or MB_ICONERROR);
      FormMain.Free;
      Halt;
    end;
  end;
  user_NBFile := PAnsiChar(AppData + NotebookDB);
  if not FileExists(user_NBFile) then
  begin
    if not CreateNBDT(user_NBFile) then
    begin
      FormLogo.Close;
      MessageBox(handle, 'Ошибка при создании рабочих файлов записной книги.' + #13 + 'Завершение работы.', 'Ошибка', MB_OK or
        MB_ICONERROR);
      FormMain.Free;
      Halt;
    end;
  end
  else
  begin
    //  if GetFileAttributes(user_NBFile) > 32 then {не уверен какие значения вернет на разных windows}
    if not SetFileAttributes(user_NBFile, FILE_ATTRIBUTE_NORMAL) then
    begin
      FormLogo.Close;
      MessageBox(handle, 'Ошибка при настройке рабочих файлов записной книги.' + #13 + 'Завершение работы.', 'Ошибка', MB_OK or
        MB_ICONERROR);
      FormMain.Free;
      Halt;
    end;
  end;
end;

procedure TFormMain.FormCreate(Sender: TObject);
begin
  REKLAMA_PIC_ListALL := TStringList.Create;
  REKLAMA_TEXT_ListALL := TStringList.Create;
  REKLAMA_DOC_ListALL := TStringList.Create;
  FormLogo.sGauge1.Visible := True;
  FormLogo.Loading('Настройки пользователя...');
  InitUserSettings;
  IniCreate;
  IniLoad;
  IBDatabase1.Database := AppPath + MainDB;
  IBDatabase1.Params.Clear;
  IBDatabase1.Params.Add('user_name=' + FBUserName);
  IBDatabase1.Params.Add('password=' + FBUserPassword);
  IBQuery1.Connection := IBDatabase1;
  try
    IBDatabase1.Connected := True;
  except on E: Exception do
    begin
      FormLogo.Close;
      MessageBox(handle, PChar('Ошибка при подключении файлов баз данных.' + #13 + E.Message), 'Ошибка', MB_OK or MB_ICONERROR);
      FormMain.Free;
      Halt;
    end;
  end;
  FormLogo.Loading('Подключение баз данных...');
  GetRubrikList;
  GetGorodList;
  GetOfficeTypeList;
  GetNaprList;
  FormLogo.Loading('Загрузка информации...');
  GetData;
  FormLogo.Loading('Рекламные модули...');
  TimerReklamaPic.Enabled := REKLAMA_PIC_ListALL.Count > 0;
  TimerReklamaPicTimer(TimerReklamaPic);
  TimerReklamaText.Enabled := REKLAMA_TEXT_ListALL.Count > 0;
  tX := ImageReklama_TEXT.Width;
  ImageReklama_TEXT.Canvas.Font.Name := 'Tahoma';
  ImageReklama_TEXT.Canvas.Font.Size := 12;
  ImageReklama_TEXT.Canvas.Font.Style := [fsBold];
  ImageReklama_TEXT.Canvas.Font.Color := clNavy;
  ImageReklama_TEXT.Canvas.FillRect(ImageReklama_TEXT.ClientRect);
  FormLogo.Loading('Инициализация...');
end;

procedure TFormMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FormNoteBook.IniSave;
  FormNotebookAdd.IniSave;
  IniSave;
  REKLAMA_PIC_ListALL.Free;
  REKLAMA_TEXT_ListALL.Free;
  REKLAMA_DOC_ListALL.Free;
  FormNoteBook.IBDatabase1.Connected := False;
  IBDatabase1.Connected := False;
end;

procedure TFormMain.IniCreate;
begin
  if not FileExists(AppData + IniFile) then
  begin
    Ini := TIniFile.Create(AppData + IniFile);
    {---------------------MAIN---------------------}
    Ini.WriteInteger('params', 'wndstate', 0);
    Ini.WriteInteger('params', 'wndwidth', 922);
    Ini.WriteInteger('params', 'wndheight', 701);
    FormMain.Position := poDesktopCenter;
    {-------------------NOTEBOOK-------------------}
    Ini.WriteInteger('params', 'nb_wndstate', 0);
    Ini.WriteInteger('params', 'nb_wndwidth', 800);
    Ini.WriteInteger('params', 'nb_wndheight', 480);
    Ini.WriteInteger('params', 'nb_panel1_width', 180);
    Ini.WriteInteger('params', 'nb_sg1_col2', 376);
    Ini.WriteInteger('params', 'nb_sg1_col3', 230);
    {-----------------NOTEBOOK ADD-----------------}
    Ini.WriteInteger('params', 'nbadd_cb1', 1);
    Ini.Free;
  end;
end;

procedure TFormMain.IniLoad;
begin
  Ini := TIniFile.Create(AppData + IniFile);
  FormMain.Left := Ini.ReadInteger('params', 'wndleft', 0);
  FormMain.Top := Ini.ReadInteger('params', 'wndtop', 0);
  FormMain.Width := Ini.ReadInteger('params', 'wndwidth', 0);
  FormMain.Height := Ini.ReadInteger('params', 'wndheight', 0);
  case Ini.ReadInteger('params', 'wndstate', 0) of
    0: FormMain.WindowState := wsNormal;
    1: FormMain.WindowState := wsMaximized;
  end;
  Ini.Free;
end;

procedure TFormMain.IniSave;
begin
  Ini := TIniFile.Create(AppData + IniFile);
  case FormMain.WindowState of
    wsNormal:
      begin
        Ini.WriteInteger('params', 'wndstate', 0);
        Ini.WriteInteger('params', 'wndleft', FormMain.Left);
        Ini.WriteInteger('params', 'wndtop', FormMain.Top);
        Ini.WriteInteger('params', 'wndwidth', FormMain.Width);
        Ini.WriteInteger('params', 'wndheight', FormMain.Height);
      end;
    wsMaximized: Ini.WriteInteger('params', 'wndstate', 1);
  end;
  Ini.Free;
end;

procedure TFormMain.GetData;
var
  i: integer;
  Req1, Req2, Req3, Req4, ReqMain: string;
  ReklamaStr, tmp, ID: string;

  procedure ReklamaListRandomize(List: TStringList);
  var
    c, x, old_id, new_id: integer;
  begin
    Randomize;
    c := List.Count;
    for x := 1 to c * 5 do
    begin
      old_id := Random(c);
      new_id := Random(c);
      List.Exchange(old_id, new_id);
    end;
  end;

  procedure BuildRequest;
  begin
    Req1 := '';
    if editRubrikator.ItemIndex > 0 then
    begin
      ID := IntToStr(Integer(editRubrikator.Items.Objects[editRubrikator.ItemIndex]));
      Req1 := ' RUBR like ''%#' + ID + '$%'' and';
    end;
    Req2 := '';
    if editGorod.ItemIndex > 0 then
    begin
      ID := IntToStr(Integer(editGorod.Items.Objects[editGorod.ItemIndex]));
      Req2 := ' ADRES like ''%#^' + ID + '$%'' and';
    end;
    Req3 := '';
    if editType.ItemIndex > 0 then
    begin
      ID := IntToStr(Integer(editType.Items.Objects[editType.ItemIndex]));
      Req3 := ' TYPE like ''%#' + ID + '$%'' and';
    end;
    Req4 := ' ACTIVITY = 1 and';
  end;

begin
  SGFirm.BeginUpdate;
  SGFirm.ClearRows;
  IBQuery1.Close;
  BuildRequest;
  ReqMain := 'select ID,NAME,REKLAMA from BASE where' + Req1 + Req2 + Req3 + Req4;
  delete(ReqMain, Length(ReqMain) - 3, 4);
  IBQuery1.SQL.Text := ReqMain;
  // showmessage(reqmain); exit;
  IBQuery1.Open;
  IBQuery1.FetchAll := True;
  if IBQuery1.RecordCount = 0 then
  begin
    IBQuery1.Close;
    IBDatabase1.Close;
    SGFirm.EndUpdate;
    exit;
  end;
  sGauge.Visible := True;
  sGauge.MaxValue := IBQuery1.RecordCount;
  for i := 1 to IBQuery1.RecordCount do
  begin
    SGFirm.AddRow;
    SGFirm.Cells[0, SGFirm.LastAddedRow] := IBQuery1.FieldValues['ID'];
    SGFirm.Cells[1, SGFirm.LastAddedRow] := IBQuery1.FieldValues['NAME'];

    {#bannerright=1<[>тексика.jpg<]>$#bannermain=1<[>тексика.jpg<]>$#text=1<[>бегущая строка<]>$#site=1<[>www.google.com<]>$}
    if not isReklamaListAssigned then
    begin
      ReklamaStr := '';
      if IBQuery1.FieldValues['REKLAMA'] <> null then
      begin
        ReklamaStr := IBQuery1.FieldByName('REKLAMA').AsString;
        if pos('bannerright=1', ReklamaStr) > 0 then
        begin // баннер ротации
          tmp := ReklamaStr;
          delete(tmp, 1, pos('bannerright=1', ReklamaStr) + 12);
          delete(tmp, pos('$', tmp), length(tmp));
          tmp := AnsiReplaceStr(tmp, '<[>', '');
          tmp := AnsiReplaceStr(tmp, '<]>', '');
          if FileExists(AppPic + tmp) then
            REKLAMA_PIC_ListALL.Add(tmp + '*' + IBQuery1.FieldByName('ID').AsString);
        end;
        if pos('text=1', ReklamaStr) > 0 then
        begin // бегущая строка
          tmp := ReklamaStr;
          delete(tmp, 1, pos('text=1', ReklamaStr) + 5);
          delete(tmp, pos('$', tmp), length(tmp));
          tmp := AnsiReplaceStr(tmp, '<[>', '');
          tmp := AnsiReplaceStr(tmp, '<]>', '');
          if Trim(tmp) <> '' then
            REKLAMA_TEXT_ListALL.Add(Trim(tmp) + '#ID$' + IBQuery1.FieldByName('ID').AsString);
        end;
        if pos('doc=1', ReklamaStr) > 0 then
        begin // статья
          tmp := ReklamaStr;
          delete(tmp, 1, pos('doc=1', ReklamaStr) + 4);
          delete(tmp, pos('$', tmp), length(tmp));
          tmp := AnsiReplaceStr(tmp, '<[>', '');
          tmp := AnsiReplaceStr(tmp, '<]>', '');
          if Trim(tmp) <> '' then
            REKLAMA_DOC_ListALL.Add('<' + IBQuery1.FieldByName('ID').AsString + '><' + IBQuery1.FieldByName('NAME').AsString + '><' +
              Trim(tmp) + '>');
        end;
      end;
    end;

    sGauge.Progress := i;
    sGauge.Update;
    IBQuery1.Next;
  end;
  if not isReklamaListAssigned then
  begin
    ReklamaListRandomize(REKLAMA_PIC_ListALL);
    ReklamaListRandomize(REKLAMA_TEXT_ListALL);
    if REKLAMA_TEXT_ListALL.Count > 0 then
      ReklamaText_CurentText := REKLAMA_TEXT_ListALL[0];
    sStatusBar1.Panels[1].Text := 'Фирм в каталоге: ' + IntToStr(IBQuery1.RecordCount);
  end;
  sGauge.Visible := False;
  IBQuery1.Close;
  IBDatabase1.Close;
  if Trim(editSearch.Text) <> '' then
    editSearchChange(editSearch);
  SGFirm.Resort;
  SGFirm.EndUpdate;
  isReklamaListAssigned := True;
end;

procedure TFormMain.GetRubrikList;
var
  i: integer;
begin
  editRubrikator.Clear;
  editRubrikator.Items.Add('Все рубрики');
  editRubrikator.ItemIndex := 0;
  IBQuery1.Close;
  IBQuery1.SQL.Text := 'select * from RUBRIKATOR order by lower(NAME)';
  IBQuery1.Open;
  IBQuery1.FetchAll := True;
  if IBQuery1.RecordCount = 0 then
    exit;
  for i := 1 to IBQuery1.RecordCount do
  begin
    editRubrikator.AddItem(IBQuery1.FieldValues['NAME'], Pointer(Integer(IBQuery1.FieldValues['ID'])));
    IBQuery1.Next;
  end;
  IBQuery1.Close;
  // IBDatabase1.Close;
end;

procedure TFormMain.GetGorodList;
var
  i: integer;
begin
  editGorod.Clear;
  editGorod.Items.Add('Все города');
  editGorod.ItemIndex := 0;
  IBQuery1.Close;
  IBQuery1.SQL.Text := 'select * from GOROD order by lower(NAME)';
  IBQuery1.Open;
  IBQuery1.FetchAll := True;
  if IBQuery1.RecordCount = 0 then
    exit;
  for i := 1 to IBQuery1.RecordCount do
  begin
    editGorod.AddItem(IBQuery1.FieldValues['NAME'], Pointer(Integer(IBQuery1.FieldValues['ID'])));
    IBQuery1.Next;
  end;
  IBQuery1.Close;
  // IBDatabase1.Close;
end;

procedure TFormMain.GetOfficeTypeList;
var
  i: integer;
begin
  editType.Clear;
  editType.Items.Add('Все фирмы');
  editType.ItemIndex := 0;
  IBQuery1.Close;
  IBQuery1.SQL.Text := 'select * from TYPE order by lower(NAME)';
  IBQuery1.Open;
  IBQuery1.FetchAll := True;
  if IBQuery1.RecordCount = 0 then
    exit;
  for i := 1 to IBQuery1.RecordCount do
  begin
    editType.AddItem(IBQuery1.FieldValues['NAME'], Pointer(Integer(IBQuery1.FieldValues['ID'])));
    IBQuery1.Next;
  end;
  IBQuery1.Close;
  // IBDatabase1.Close;
end;

procedure TFormMain.GetNaprList;
var
  i: integer;
begin
  SGNapr.ClearRows;
  IBQuery1.Close;
  IBQuery1.SQL.Text := 'select * from NAPRAVLENIE where ACTIVITY = 1';
  IBQuery1.Open;
  IBQuery1.FetchAll := True;
  if IBQuery1.RecordCount = 0 then
    exit;
  SGNapr.BeginUpdate;
  for i := 1 to IBQuery1.RecordCount do
  begin
    SGNapr.AddRow;
    SGNapr.Cells[0, SGNapr.LastAddedRow] := IBQuery1.FieldValues['ID'];
    SGNapr.Cells[1, SGNapr.LastAddedRow] := IBQuery1.FieldValues['NAME'];
    IBQuery1.Next;
  end;
  SGNapr.Resort;
  SGNapr.EndUpdate;
  IBQuery1.Close;
  // IBDatabase1.Close;
end;

procedure TFormMain.editRubrikatorChange(Sender: TObject);
var
  BannerMain, ID: string;
begin
  if editRubrikator.Tag <> editRubrikator.ItemIndex then
  begin
    GetData;
    if sPageControl1.ActivePageIndex = 0 then
      SGFirm.SetFocus;
    if sPageControl1.ActivePageIndex = 1 then
      SGNapr.SetFocus;
    ID := IntToStr(Integer(editRubrikator.Items.Objects[editRubrikator.ItemIndex]));
    IBQuery1.Close;
    IBQuery1.SQL.Text := 'select REKLAMA from RUBRIKATOR where ID = :ID';
    IBQuery1.Params[0].AsString := ID;
    IBQuery1.Open;
    IBQuery1.FetchAll := True;
    if IBQuery1.RecordCount > 0 then
      if Trim(IBQuery1.FieldByName('REKLAMA').AsString) <> '' then
      begin
        BannerMain := IBQuery1.FieldByName('REKLAMA').AsString;
        if pos('bannermainrubr=1', BannerMain) > 0 then
        begin
          delete(BannerMain, 1, pos('bannermainrubr=1', BannerMain) + 15);
          delete(BannerMain, pos('$', BannerMain), length(BannerMain));
          BannerMain := AnsiReplaceStr(BannerMain, '<[>', '');
          BannerMain := AnsiReplaceStr(BannerMain, '<]>', '');
          if FileExists(AppPic + BannerMain) then
            CreateRekalamForm(BannerMain);
        end;
      end;
    IBQuery1.Close;
    IBDatabase1.Close;
  end;
  editRubrikator.Tag := editRubrikator.ItemIndex;
end;

procedure TFormMain.editGorodChange(Sender: TObject);
begin
  if (Sender as TsComboBox).Tag <> (Sender as TsComboBox).ItemIndex then
  begin
    if sPageControl1.ActivePageIndex = 0 then
      SGFirm.SetFocus;
    if sPageControl1.ActivePageIndex = 1 then
      SGNapr.SetFocus;
    GetData;
  end;
  (Sender as TsComboBox).Tag := (Sender as TsComboBox).ItemIndex;
end;

procedure TFormMain.OpenFirmByID(ID: string; ShowForm: Boolean);
var
  EmailAll, EmailCurrent, WebAll, WebCurrent, AdresAll, AdresCurrent: string;
  PhonesAll, PhonesCurrent, NaprAll, NaprCurrent: string;
  city_str, country_str, ofType, zip_str, adres: string;
  ReklamaStr, BannerMain, Site: string;
  List1, List2: TStrings;
  i: integer;

  procedure AddColoredLine(AText: string; AColor: TColor; AFontSize: integer;
    AFontName: TFontName; AFontStyle: TFontStyles);
  begin
    {  RE_TextLength := RE_TextLength + Length(AText) + 2;
      RE.SelStart := RE_TextLength - Length(AText) - 2;}
    FormFirmInfo.reFirmInfo.SelStart := Length(FormFirmInfo.reFirmInfo.Text);
    FormFirmInfo.reFirmInfo.SelAttributes.Color := AColor;
    FormFirmInfo.reFirmInfo.SelAttributes.Size := AFontSize;
    FormFirmInfo.reFirmInfo.SelAttributes.Name := AFontName;
    FormFirmInfo.reFirmInfo.SelAttributes.Style := AFontStyle;
    FormFirmInfo.reFirmInfo.Lines.Add(AText);
  end;

begin
  FormFirmInfo.lblID.Caption := '';
  if Trim(ID) = '' then
    exit;
  IBQuery1.Close;
  IBQuery1.SQL.Text := 'select * from BASE where ID = :ID';
  IBQuery1.ParamByName('ID').AsString := ID;
  IBQuery1.Open;
  IBQuery1.FetchAll := True;
  if IBQuery1.RecordCount = 0 then
    exit;
  FormFirmInfo.reFirmInfo.Lines.BeginUpdate;
  FormFirmInfo.reFirmInfo.Clear;

  FormFirmInfo.lblID.Caption := ID;

  if IBQuery1.FieldValues['NAME'] <> null then
  begin
    FormFirmInfo.lblFirmName.Caption := IBQuery1.FieldValues['NAME'];
  end;

  AddColoredLine('Адреса:', clMaroon, 10, 'Tahoma', [fsBold]);
  List1 := TStringList.Create;
  List2 := TStringList.Create;
  List1.Text := IBQuery1.FieldValues['ADRES'];
  PhonesAll := IBQuery1.FieldValues['PHONES'];
  for i := 0 to List1.Count - 1 do
  begin
    AdresAll := List1[i];
    { AdresAll = #CBAdres$#NUM$#OfficeType$#ZIP$#Street$#Country$#City$ }
    List2.Clear;
    while pos('$', AdresAll) > 0 do
    begin
      AdresCurrent := copy(AdresAll, 0, pos('$', AdresAll));
      delete(AdresAll, 1, length(AdresCurrent));
      delete(AdresCurrent, 1, 1);
      delete(AdresCurrent, length(AdresCurrent), 1);
      List2.Add(AdresCurrent);
      // list2[0] = CBAdres; list2[1] = NO; list2[2] = OfficeType; list2[3] = ZIP;
      // list2[4] = Street; list2[5] = Country; list2[6] = City;
    end;

    PhonesCurrent := copy(PhonesAll, 0, pos('$', PhonesAll));
    delete(PhonesAll, 1, length(PhonesCurrent));
    PhonesCurrent := copy(PhonesAll, 0, pos('$', PhonesAll));
    delete(PhonesAll, 1, length(PhonesCurrent));
    delete(PhonesCurrent, 1, 1);
    delete(PhonesCurrent, length(PhonesCurrent), 1);
    PhonesCurrent := StringReplace(PhonesCurrent, '(', '', [rfReplaceAll]);
    PhonesCurrent := StringReplace(PhonesCurrent, ')', '', [rfReplaceAll]);
    // в PhonesCurrent сейчас хранятся все телефоны в формате МЕМО

    if list2[0] = '1' then
    begin
      city_str := list2[6];
      if city_str[1] = '^' then
        delete(city_str, 1, 1);
      country_str := list2[5];
      if country_str[1] = '&' then
        delete(country_str, 1, 1);
      ofType := list2[2];
      if ofType[1] = '@' then
        delete(ofType, 1, 1);
      zip_str := list2[3];
      if Trim(ofType) <> '' then
        ofType := GetNameByID('OFFICETYPE', ofType) + ' - ';
      if Trim(zip_str) <> '' then
        zip_str := zip_str + ', ';
      if Trim(country_str) <> '' then
        country_str := GetNameByID('COUNTRY', country_str) + ', ';
      if Trim(city_str) <> '' then
        city_str := GetNameByID('GOROD', city_str) + ', ';
      adres := ofType + zip_str + country_str + city_str + list2[4];
      {officetype - zip, country, city, street}
      if Trim(adres) <> '' then
        AddColoredLine(adres, clBlack, 10, 'Tahoma', []);
      if Trim(PhonesCurrent) <> '' then
        AddColoredLine(PhonesCurrent, clNavy, 10, 'Tahoma', []);
    end;
  end; // for i := 0 to List1.Count - 1 do
  AddColoredLine('', clNone, 8, 'Tahoma', []);
  List1.Free;
  List2.Free;

  if (IBQuery1.FieldValues['NAPRAVLENIE'] <> null) and (Trim(IBQuery1.FieldValues['NAPRAVLENIE']) <> '') then
  begin
    AddColoredLine('Деятельность:', clMaroon, 10, 'Tahoma', [fsBold]);
    NaprAll := IBQuery1.FieldValues['NAPRAVLENIE'];
    while pos('$', NaprAll) > 0 do
    begin
      NaprCurrent := copy(NaprAll, 0, pos('$', NaprAll));
      delete(NaprAll, 1, length(NaprCurrent));
      delete(NaprCurrent, 1, 1);
      delete(NaprCurrent, length(NaprCurrent), 1);
      AddColoredLine(GetNameByID('NAPRAVLENIE', NaprCurrent), clBlack, 10, 'Tahoma', []);
    end;
    AddColoredLine('', clNone, 8, 'Times New Roman', [fsBold]);
  end;

  if (IBQuery1.FieldValues['FIO'] <> null) and (Trim(IBQuery1.FieldValues['FIO']) <> '') then
  begin
    AddColoredLine('Руководитель:', clMaroon, 10, 'Tahoma', [fsBold]);
    AddColoredLine(IBQuery1.FieldValues['FIO'], clBlack, 10, 'Tahoma', []);
    AddColoredLine('', clNone, 8, 'Tahoma', []);
  end;

  if (IBQuery1.FieldValues['WEB'] <> null) and (Trim(IBQuery1.FieldValues['WEB']) <> '') then
  begin
    AddColoredLine('Электронный адрес:', clMaroon, 10, 'Tahoma', [fsBold]);
    WebAll := IBQuery1.FieldValues['WEB'];
    if Length(WebAll) > 0 then
    begin
      if WebAll[Length(WebAll)] <> ',' then
        WebAll := WebAll + ',';
      while pos(',', WebAll) > 0 do
      begin
        WebCurrent := copy(WebAll, 0, pos(',', WebAll));
        delete(WebAll, 1, length(WebCurrent));
        WebCurrent := Trim(WebCurrent);
        delete(WebCurrent, length(WebCurrent), 1);
        AddColoredLine(WebCurrent, clBlack, 10, 'Tahoma', []);
      end;
    end;
    AddColoredLine('', clNone, 8, 'Tahoma', []);
  end;

  if (IBQuery1.FieldValues['EMAIL'] <> null) and (Trim(IBQuery1.FieldValues['EMAIL']) <> '') then
  begin
    AddColoredLine('Электронная почта:', clMaroon, 10, 'Tahoma', [fsBold]);
    EmailAll := IBQuery1.FieldValues['EMAIL'];
    if Length(EmailAll) > 0 then
    begin
      if EmailAll[Length(EmailAll)] <> ',' then
        EmailAll := EmailAll + ',';
      while pos(',', EmailAll) > 0 do
      begin
        EmailCurrent := copy(EmailAll, 0, pos(',', EmailAll));
        delete(EmailAll, 1, length(EmailCurrent));
        EmailCurrent := Trim(EmailCurrent);
        delete(EmailCurrent, length(EmailCurrent), 1);
        AddColoredLine(EmailCurrent, clBlack, 10, 'Tahoma', []);
      end;
    end;
    AddColoredLine('', clNone, 8, 'Tahoma', []);
    FormFirmInfo.btnSendEmail.Enabled := True;
  end
  else
    FormFirmInfo.btnSendEmail.Enabled := False;

  if IBQuery1.FieldValues['REKLAMA'] <> null then
  begin
    ReklamaStr := IBQuery1.FieldByName('REKLAMA').AsString;
    if pos('bannermain=1', ReklamaStr) > 0 then
    begin
      BannerMain := ReklamaStr;
      delete(BannerMain, 1, pos('bannermain=1', ReklamaStr) + 11);
      delete(BannerMain, pos('$', BannerMain), length(BannerMain));
      BannerMain := AnsiReplaceStr(BannerMain, '<[>', '');
      BannerMain := AnsiReplaceStr(BannerMain, '<]>', '');
    end;
    if pos('site=1', ReklamaStr) > 0 then
    begin
      Site := ReklamaStr;
      delete(Site, 1, pos('site=1', ReklamaStr) + 5);
      delete(Site, pos('$', Site), length(Site));
      Site := AnsiReplaceStr(Site, '<[>', '');
      Site := AnsiReplaceStr(Site, '<]>', '');
    end;
  end;

  if FormDocs.SGDoc.FindText(0, ID, [soCaseInsensitive, soExactMatch]) then
  begin
    FormFirmInfo.BtnDocs.Visible := True;
    FormFirmInfo.BtnDocs.Hint := FormDocs.SGDoc.Cells[2, FormDocs.SGDoc.SelectedRow];
  end
  else
  begin
    FormFirmInfo.BtnDocs.Visible := False;
    FormFirmInfo.BtnDocs.Hint := '';
  end;

  FormFirmInfo.reFirmInfo.Lines.EndUpdate;
  IBQuery1.Close;
  IBDatabase1.Close;
  if ShowForm then
  begin
    FormFirmInfo.Show;
    if Trim(BannerMain) <> '' then
      if FileExists(AppPic + BannerMain) then
        CreateRekalamForm(BannerMain);
    if Trim(Site) <> '' then
      ShellExecute(Handle, 'open', PAnsiChar(Site), nil, nil, SW_Normal);
  end;
end;

procedure TFormMain.SGFirmDblClick(Sender: TObject);
var
  ID: string;
begin
  if SGFirm.SelectedCount = 0 then
    exit;
  ID := SGFirm.Cells[0, SGFirm.SelectedRow];
  if Trim(ID) = '' then
    exit;
  OpenFirmByID(ID, True);
end;

procedure TFormMain.SGNaprDblClick(Sender: TObject);
var
  ID: string;
  i: integer;
begin
  if SGNapr.SelectedCount = 0 then
    exit;
  ID := SGNapr.Cells[0, SGNapr.SelectedRow];
  if Trim(ID) = '' then
    exit;
  IBQuery1.Close;
  IBQuery1.SQL.Text := 'select * from BASE where NAPRAVLENIE like :NAPRAVLENIE';
  IBQuery1.Params[0].AsString := '%#' + ID + '$%';
  IBQuery1.Open;
  IBQuery1.FetchAll := True;
  if IBQuery1.RecordCount = 0 then
  begin
    MessageBox(Handle, 'Не удалось найти фирму с данным видом деятельности.', 'Информация', MB_OK or MB_ICONINFORMATION);
    IBQuery1.Close;
    exit;
  end;
  if IBQuery1.RecordCount = 1 then
  begin
    OpenFirmByID(IBQuery1.FieldByName('ID').AsString, True);
    IBQuery1.Close;
    exit;
  end;
  if IBQuery1.RecordCount > 1 then
  begin
    FormSearch.SGSearch.BeginUpdate;
    FormSearch.ClearEdits;
    for i := 1 to IBQuery1.RecordCount do
    begin
      FormSearch.SGSearch.AddRow;
      FormSearch.SGSearch.Cells[0, FormSearch.SGSearch.LastAddedRow] := IBQuery1.FieldValues['ID'];
      FormSearch.SGSearch.Cells[1, FormSearch.SGSearch.LastAddedRow] := IBQuery1.FieldValues['NAME'];
      IBQuery1.Next;
    end;
    FormSearch.sStatusBar.Panels[0].Text := 'Найдено фирм: ' + IntToStr(IBQuery1.RecordCount);
    IBQuery1.Close;
    IBDatabase1.Close;
    FormSearch.SGSearch.Resort;
    FormSearch.SGSearch.EndUpdate;
    FormSearch.Show;
    FormSearch.SGSearch.SetFocus;
  end;
end;

function TFormMain.GetNameByID(table, id: string): string;
var
  Q: TIBCQuery;
begin
  result := '';
  if (Trim(table) = '') or (Trim(id) = '') then
    exit;
  Q := QueryCreate;
  Q.Close;
  Q.Sql.Text := 'select * from ' + table + ' where id = ' + id;
  Q.Open;
  Q.FetchAll := True;
  if Q.RecordCount > 0 then
    result := Q.FieldValues['NAME'];
  Q.Close;
  Q.Free;
end;

procedure TFormMain.SGAfterSort(Sender: TObject; ACol: Integer);
var
  i, n, z: integer;
  C: TColor;
begin
  with Sender as TNextGrid do
  begin
    BeginUpdate;
    n := 0;
    for i := 0 to RowCount - 1 do
    begin
      if RowVisible[i] then
        inc(n, 1);
      if Odd(n) then
        C := $00F0F0F0 {clBtnFace}
      else
        C := clWindow;
      for z := 0 to Columns.Count - 1 do
        Cell[z, i].Color := C;
    end;
    EndUpdate;
  end;
end;

procedure TFormMain.BtnResetDataClick(Sender: TObject);
begin
  if (editRubrikator.ItemIndex = 0) and (editGorod.ItemIndex = 0) and
    (editType.ItemIndex = 0) and (Trim(editSearch.Text) = '') then
    exit;
  editRubrikator.ItemIndex := 0;
  editRubrikator.Tag := 0;
  editGorod.ItemIndex := 0;
  editGorod.Tag := 0;
  editType.ItemIndex := 0;
  editType.Tag := 0;
  editSearch.Text := '';
  GetData;
end;

procedure TFormMain.editSearchChange(Sender: TObject);
var
  s, t: string;
  RowVisible: Boolean;
  i: integer;
  SG: TNextGrid;
begin
  SG := nil;
  if sPageControl1.ActivePageIndex = 0 then
    SG := SGFirm;
  if sPageControl1.ActivePageIndex = 1 then
    SG := SGNapr;
  SG.BeginUpdate;
  s := AnsiUpperCase(editSearch.Text);
  for i := 0 to SG.RowCount - 1 do
  begin
    t := AnsiUpperCase(SG.Cells[1, i]);
    RowVisible := (s = '') or (pos(s, t) > 0);
    SG.RowVisible[i] := RowVisible;
  end;
  SG.EndUpdate;
  SG.Resort;
  SG.SelectFirstRow;
end;

procedure TFormMain.BtnSearchClick(Sender: TObject);
begin
  if FormSearch.Visible then
  begin
    FormSearch.Show;
    exit;
  end;
  FormSearch.ClearEdits;
  FormSearch.Show;
  FormSearch.editSearch.SetFocus;
end;

procedure TFormMain.sPageControl1PageChanging(Sender: TObject;
  NewPage: TsTabSheet; var AllowChange: Boolean);
begin
  editSearch.Clear;
end;

// ************************* REKLAMA PIC PROC *************************

procedure TFormMain.TimerReklamaPicTimer(Sender: TObject);
var
  tmp, FileName, FirmID: string;
  LastImage: integer;
begin
  if REKLAMA_PIC_ListALL.Count = 0 then
    exit; // Нету рекламы для ротации
  TimerReklamaPic.Interval := ReklamaPic_Interval;
  LastImage := REKLAMA_PIC_ListALL.Count - 1;
  tmp := REKLAMA_PIC_ListALL[ReklamaPic_CurrentNO];
  FileName := copy(tmp, 0, pos('*', tmp) - 1);
  FirmID := copy(tmp, pos('*', tmp) + 1, length(tmp));
  ImageReklama.Picture.LoadFromFile(AppPic + FileName);
  ImageReklama.Hint := FirmID;
  if ReklamaPic_CurrentNO = LastImage then
    ReklamaPic_CurrentNO := 0
  else
    INC(ReklamaPic_CurrentNO);
end;

procedure TFormMain.BtnImagePrevClick(Sender: TObject);
var
  tmp, FileName, FirmID: string;
  LastImage: integer;
begin
  if REKLAMA_PIC_ListALL.Count < 2 then
    exit; // Нету рекламы или всего 1 фирма
  TimerReklamaPic.Enabled := False;
  LastImage := REKLAMA_PIC_ListALL.Count - 1;
  if (ReklamaPic_CurrentNO = 0) and (TimerReklamaPic.Interval = ReklamaPic_Interval) then
    ReklamaPic_CurrentNO := LastImage - 1
  else {// потому что TimerReklamaPicTimer показал LastImage и сделал Inc(Pic) на 0}if ReklamaPic_CurrentNO = 0 then
      ReklamaPic_CurrentNO := LastImage
    else
      Dec(ReklamaPic_CurrentNO);
  tmp := REKLAMA_PIC_ListALL[ReklamaPic_CurrentNO];
  FileName := copy(tmp, 0, pos('*', tmp) - 1);
  FirmID := copy(tmp, pos('*', tmp) + 1, length(tmp));
  ImageReklama.Picture.LoadFromFile(AppPic + FileName);
  ImageReklama.Hint := FirmID;
  TimerReklamaPic.Interval := 10000; // посл. было нажатие этой кнопки
  TimerReklamaPic.Enabled := True;
end;

procedure TFormMain.BtnImageNextClick(Sender: TObject);
var
  tmp, FileName, FirmID: string;
  LastImage: integer;
begin
  if REKLAMA_PIC_ListALL.Count < 2 then
    exit; // Нету рекламы или всего 1 фирма
  TimerReklamaPic.Enabled := False;
  LastImage := REKLAMA_PIC_ListALL.Count - 1;
  // потому что TimerReklamaPicTimer показал Pic=0 и сделал Inc(Pic)
  if TimerReklamaPic.Interval = ReklamaPic_Interval then
    ReklamaPic_CurrentNO := ReklamaPic_CurrentNO - 1; // посл. тикал Таймер
  if ReklamaPic_CurrentNO = LastImage then
    ReklamaPic_CurrentNO := 0
  else
    INC(ReklamaPic_CurrentNO);
  tmp := REKLAMA_PIC_ListALL[ReklamaPic_CurrentNO];
  FileName := copy(tmp, 0, pos('*', tmp) - 1);
  FirmID := copy(tmp, pos('*', tmp) + 1, length(tmp));
  ImageReklama.Picture.LoadFromFile(AppPic + FileName);
  ImageReklama.Hint := FirmID;
  TimerReklamaPic.Interval := 10000; // посл. было нажатие этой кнопки
  TimerReklamaPic.Enabled := True;
end;

procedure TFormMain.BtnImageStopClick(Sender: TObject);
begin
  if REKLAMA_PIC_ListALL.Count = 0 then
    exit; // Нету рекламы для ротации
  TimerReklamaPic.Enabled := not TimerReklamaPic.Enabled;
  TimerReklamaPic.Interval := ReklamaPic_Interval + 1; // > ReklamaPic_Interval
end;

procedure TFormMain.ImageReklamaClick(Sender: TObject);
var
  ID: string;
begin
  ID := ImageReklama.Hint;
  if Trim(ID) <> '' then
    OpenFirmByID(ID, True);
end;

procedure TFormMain.CreateRekalamForm(Pic: string);
var
  FormReklama: TForm;
  PanelReklama: TsPanel;
  PicReklama: TImage; {916(w) x 695(h)}
begin
  FormReklama := Application.FindComponent('FormReklama') as TForm;
  if Assigned(FormReklama) then
    FormReklama.Free;
  FormReklama := TForm.Create(Application);
  FormReklama.Name := 'FormReklama';
  FormReklama.OnClose := FormLogo.FormClose;
  FormReklama.Caption := '';
  FormReklama.Left := FormMain.Left;
  FormReklama.Top := FormMain.Top;
  FormReklama.Width := FormMain.Width;
  FormReklama.Height := FormMain.Height;
  FormReklama.BorderStyle := bsNone;
  FormReklama.BorderIcons := [biSystemMenu];
  PanelReklama := TsPanel.Create(FormReklama);
  PanelReklama.Parent := FormReklama;
  PanelReklama.Align := alClient;
  PanelReklama.Caption := '';
  PanelReklama.BorderWidth := 2;
  PanelReklama.Visible := True;
  PicReklama := TImage.Create(PanelReklama);
  PicReklama.Parent := PanelReklama;
  PicReklama.OnClick := PicReklamaClick;
  PicReklama.Align := alClient;
  PicReklama.AutoSize := True;
  PicReklama.Stretch := True;
  if FileExists(AppPic + Pic) then
    PicReklama.Picture.LoadFromFile(AppPic + Pic);
  PicReklama.Visible := True;
  FormReklama.Visible := True;
end;

procedure TFormMain.PicReklamaClick(Sender: TObject);
var
  FormReklama: TForm;
begin
  FormReklama := Application.FindComponent('FormReklama') as TForm;
  if Assigned(FormReklama) then
    FormReklama.Close;
end;

procedure TFormMain.ImageLogoClick(Sender: TObject);
begin
  ShellExecute(Handle, 'open', 'http://www.shd.com.ua/', nil, nil, SW_NORMAL);
end;

// ************************* REKLAMA PIC PROC *************************

// ************************* REKLAMA TEXT PROC *************************

procedure TFormMain.TimerReklamaTextTimer(Sender: TObject);
var
  tW: integer;
  Text, FirmID: string;
begin
  // Увеличивает канвас ImageReklama_String
 { ImageReklama_TEXT.Picture.Bitmap.Width := ImageReklama_TEXT.Width;
  ImageReklama_TEXT.Picture.Bitmap.Height := ImageReklama_TEXT.Height;
  ImageReklama_TEXT.Canvas.FillRect(ImageReklama_TEXT.ClientRect);}
  Text := copy(ReklamaText_CurentText, 0, pos('#ID$', ReklamaText_CurentText) - 1);
  FirmID := copy(ReklamaText_CurentText, pos('#ID$', ReklamaText_CurentText) + 4, Length(ReklamaText_CurentText));
  DEC(tX, 1);
  if tX > ImageReklama_TEXT.Picture.Bitmap.Width then
    tX := ImageReklama_TEXT.Picture.Bitmap.Width;
  tW := ImageReklama_TEXT.Canvas.TextWidth(ReklamaText_CurentText);
  ImageReklama_TEXT.Canvas.TextOut(tX, 13, Text);
  ImageReklama_TEXT.Hint := FirmID;
  if tX < (0 - (tW + 20)) then
  begin // если текст уехал из видимости
    tX := ImageReklama_TEXT.Width;
    if ReklamaText_CurrentNO = REKLAMA_TEXT_ListALL.Count - 1 then
      ReklamaText_CurrentNO := 0
    else
      INC(ReklamaText_CurrentNO);
    ReklamaText_CurentText := REKLAMA_TEXT_ListALL[ReklamaText_CurrentNO];
  end;
end;

procedure TFormMain.ImageReklama_TEXTClick(Sender: TObject);
var
  ID: string;
begin
  ID := ImageReklama_TEXT.Hint;
  if Trim(ID) <> '' then
    OpenFirmByID(ID, True);
end;

// ************************* REKLAMA TEXT PROC *************************

procedure TFormMain.BtnFirmOpenInfoClick(Sender: TObject);
begin
  if sPageControl1.ActivePageIndex = 0 then
    SGFirmDblClick(SGFirm);
  if sPageControl1.ActivePageIndex = 1 then
    SGNaprDblClick(SGNapr);
end;

procedure TFormMain.btnDocsClick(Sender: TObject);
begin
  FormDocs.Show;
end;

procedure TFormMain.BtnPrintClick(Sender: TObject);
var
  L: TStrings;
begin
  if sPageControl1.ActivePageIndex <> 0 then
    exit;
  if SGFirm.SelectedCount = 0 then
  begin
    MessageBox(Handle, 'Выберите фирму для печати.', 'Информация', MB_OK or MB_ICONINFORMATION);
    exit;
  end;
  if Trim(SGFirm.Cells[0, SGFirm.SelectedRow]) <> '' then
  begin
    if FormFirmInfo.Visible then
      FormFirmInfo.Close;
    L := TStringList.Create;
    L.Add(SGFirm.Cells[0, SGFirm.SelectedRow]);
    FormNoteBook.PrintRecords(L);
    L.Free;
  end;
end;

procedure TFormMain.BtnNotebookClick(Sender: TObject);
begin
  FormNoteBook.TVRubr.OnChange := nil;
  if FormNoteBook.TVRubr.Selected = nil then
    if FormNoteBook.TVRubr.Items.Count > 0 then
      FormNoteBook.TVRubr.Items[0].Selected := True;
  FormNoteBook.TVRubrChange(FormNoteBook.TVRubr, FormNoteBook.TVRubr.Selected);
  FormNoteBook.TVRubr.OnChange := FormNoteBook.TVRubrChange;
  FormNoteBook.Show;
  FormNoteBook.SGNotebook.SetFocus;
end;

procedure TFormMain.NBtnNBAddRecClick(Sender: TObject);
var
  ID: string;
begin
  if SGFirm.SelectedCount = 0 then
  begin
    MessageBox(Handle, 'Выберите фирму для добавления в записную книгу.', 'Информация', MB_OK or MB_ICONINFORMATION);
    exit;
  end;
  ID := SGFirm.Cells[0, SGFirm.SelectedRow];
  if Trim(ID) = '' then
    exit;
  FormNotebookAdd.lblID.Caption := ID;
  FormNotebookAdd.GetRubrList;
  FormNotebookAdd.ClearEdits;
  FormNoteBookAdd.Show;
  FormNotebookAdd.editRubr.SetFocus;
end;

procedure TFormMain.NBtnSendEmailCurrentClick(Sender: TObject);
var
  ID: string;
begin
  if sPageControl1.ActivePageIndex <> 0 then
    exit;
  if SGFirm.SelectedCount = 0 then
  begin
    MessageBox(Handle, 'Выберите фирму для рассылки почты.', 'Информация', MB_OK or MB_ICONINFORMATION);
    exit;
  end;
  MailSend.EMailScan_Break := False;
  ID := SGFirm.Cells[0, SGFirm.SelectedRow];
  FormMailSend.ClearEdits;
  FormMailSend.GetEmailList(1, nil, ID, FormMailSend.editEmailList, True);
  FormMailSend.Show;
  FormMailSend.editTo.SetFocus;
end;

procedure TFormMain.NBtnSendEmailAllClick(Sender: TObject);
var
  i, n: integer;
  ID: string;
begin
  if sPageControl1.ActivePageIndex <> 0 then
    exit;
  if SGFirm.RowCount = 0 then
  begin
    MessageBox(Handle, 'Список фирм для рассылки почты пуст.', 'Информация', MB_OK or MB_ICONINFORMATION);
    exit;
  end;
  MailSend.EMailScan_Break := False;
  FormMailSend.ClearEdits;
  FormMain.Enabled := False;
  FormMailSend.btnSend.Enabled := False;
  FormMailSend.sGauge1.MinValue := 0;
  FormMailSend.sGauge1.MaxValue := SGFirm.VisibleRows - 1;
  FormMailSend.sGauge1.Progress := 0;
  FormMailSend.sGauge1.Visible := True;
  FormMailSend.Show;
  try
    n := 0;
    for i := 0 to SGFirm.RowCount - 1 do
    begin
      if MailSend.EMailScan_Break then
        Break;
      if not SGFirm.Row[i].Visible then
        Continue;
      ID := SGFirm.Cells[0, i];
      Inc(n, 1);
      if Trim(ID) <> '' then
      begin
        FormMailSend.GetEmailList(1, nil, ID, FormMailSend.editEmailList, False);
        FormMailSend.sGauge1.Progress := n;
      end;
      Application.ProcessMessages;
    end;
  finally
    FormMailSend.sGauge1.Visible := False;
    FormMailSend.btnSend.Enabled := True;
    FormMain.Enabled := True;
    if MailSend.EMailScan_Break then
      FormMain.SetFocus; // баг меинформа не фокусируется
  end;
end;

procedure TFormMain.sSkinProvider1TitleButtons0MouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  if Button = mbLeft then
    showmessage('Справка ...');
end;

end.
