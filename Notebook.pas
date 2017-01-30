unit Notebook;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, NxColumns, NxColumnClasses, NxScrollControl, NxCustomGridControl,
  NxCustomGrid, NxGrid, ComCtrls, sTreeView, ExtCtrls, sPanel, IBDatabase,
  DB, IBCustomDataSet, IBQuery, sSplitter, Buttons, sSpeedButton,
  sStatusBar, IniFiles, ShellApi, Menus, DBClient, frxClass, frxDBSet,
  frxRich, frxGradient, StdCtrls, sSkinProvider;

type
  TFormNoteBook = class(TForm)
    panelTree: TsPanel;
    panelGrid: TsPanel;
    panelToolbar: TsPanel;
    TVRubr: TsTreeView;
    sSplitter1: TsSplitter;
    BtnAddRubr: TsSpeedButton;
    sStatusBar1: TsStatusBar;
    BtnDeleteRubr: TsSpeedButton;
    BtnRenameRubr: TsSpeedButton;
    PopupMenu1: TPopupMenu;
    nBtnFirmOpenInfo: TMenuItem;
    NBtnNBPrintFirm: TMenuItem;
    N3: TMenuItem;
    NBtnNBDeleteFirm: TMenuItem;
    PopupMenu2: TPopupMenu;
    NBtnAddRubr: TMenuItem;
    NBtnDeleteRubr: TMenuItem;
    NBtnRenameRubr: TMenuItem;
    SGNotebook: TNextGrid;
    NxTextColumn3: TNxTextColumn;
    NxTextColumn1: TNxTextColumn;
    NxTextColumn2: TNxTextColumn;
    NxTextColumn4: TNxTextColumn;
    QueryNotebook: TIBQuery;
    IBDatabase1: TIBDatabase;
    IBTransaction1: TIBTransaction;
    nBtnNote_Data: TMenuItem;
    nBtnSendEmail: TMenuItem;
    BtnSendEmailAll: TsSpeedButton;
    nDiveider1: TMenuItem;
    nSendEmailAll: TMenuItem;
    btnPrintAll: TsSpeedButton;
    frxReport: TfrxReport;
    frxDBDataset: TfrxDBDataset;
    btnDevider1: TsSpeedButton;
    nPrintAll: TMenuItem;
    procedure AddRubr(component: TsTreeView);
    procedure RenameRubr(component: TsTreeView);
    procedure DeleteRubr(component: TsTreeView);
    procedure RebuildTree(component: TsTreeView);
    procedure IniLoad;
    procedure IniSave;
    procedure FormCreate(Sender: TObject);
    procedure TVRubrChange(Sender: TObject; Node: TTreeNode);
    procedure SGNotebookDblClick(Sender: TObject);
    procedure BtnAddRubrClick(Sender: TObject);
    procedure BtnRenameRubrClick(Sender: TObject);
    procedure BtnDeleteRubrClick(Sender: TObject);
    procedure NBtnNBDeleteFirmClick(Sender: TObject);
    procedure TVRubrContextPopup(Sender: TObject; MousePos: TPoint;
      var Handled: Boolean);
    procedure nBtnNote_DataClick(Sender: TObject);
    procedure NBtnNBPrintFirmClick(Sender: TObject);
    procedure nBtnSendEmailClick(Sender: TObject);
    procedure BtnSendEmailAllClick(Sender: TObject);
    procedure btnPrintAllClick(Sender: TObject);
    procedure PrintRecords(ID_List: TStrings);
  private
    { Private declarations }
  public
    procedure CreateParams(var Params: TCreateParams); override;
    procedure WMGetMinMaxInfo(var M: TWMGetMinMaxInfo); message WM_GetMinMaxInfo;
    { Public declarations }
  end;

var
  FormNoteBook: TFormNoteBook;

implementation

uses Main, FirmInfo, MailSend;

{$R *.dfm}

procedure TFormNoteBook.WMGetMinMaxInfo(var M: TWMGetMinMaxInfo);
begin
  M.MinMaxInfo^.PTMaxPosition.X := 0;
  M.MinMaxInfo^.PTMinTrackSize.X := 640;
  M.MinMaxInfo^.PTMaxPosition.Y := 0;
  M.MinMaxInfo^.PTMinTrackSize.Y := 480;
end;

procedure TFormNoteBook.CreateParams(var Params: TCreateParams);
begin
  inherited CreateParams(Params);
  Params.ExStyle := Params.ExStyle or WS_Ex_AppWindow;
end;

function CustomSortProc(Node1, Node2: TTreeNode;
  iUpToThisLevel: Integer): Integer; stdcall;
begin
  Result := AnsiStrIComp(PChar(Node1.Text), PChar(Node2.Text));
end;

procedure TFormNoteBook.FormCreate(Sender: TObject);
begin
  IniLoad;
  IBDatabase1.DatabaseName := AppData + NotebookDB;
  IBDatabase1.Params.Clear;
  IBDatabase1.Params.Add('user_name=' + FBUserName);
  IBDatabase1.Params.Add('password=' + FBUserPassword);
  QueryNotebook.Database := IBDatabase1;
  QueryNotebook.Transaction := IBTransaction1;
  IBTransaction1.DefaultDatabase := IBDatabase1;
  IBDatabase1.Connected := True;
  RebuildTree(TVRubr);
  SGNotebook.OnAfterSort := FormMain.SGAfterSort;
end;

procedure TFormNoteBook.IniLoad;
begin
  Ini := TIniFile.Create(AppData + IniFile);
  FormNoteBook.Left := Ini.ReadInteger('params', 'nb_wndleft', 0);
  FormNoteBook.Top := Ini.ReadInteger('params', 'nb_wndtop', 0);
  FormNoteBook.Width := Ini.ReadInteger('params', 'nb_wndwidth', 0);
  FormNoteBook.Height := Ini.ReadInteger('params', 'nb_wndheight', 0);
  panelTree.Width := Ini.ReadInteger('params', 'nb_panel1_width', 0);
  SGNotebook.Columns[2].Width := Ini.ReadInteger('params', 'nb_sg1_col2', 0);
  SGNotebook.Columns[3].Width := Ini.ReadInteger('params', 'nb_sg1_col3', 0);
  case Ini.ReadInteger('params', 'nb_wndstate', 0) of
    0: FormNoteBook.WindowState := wsNormal;
    1: FormNoteBook.WindowState := wsMaximized;
  end;
  Ini.Free;
end;

procedure TFormNoteBook.IniSave;
begin
  Ini := TIniFile.Create(AppData + IniFile);
  case FormNoteBook.WindowState of
    wsNormal:
      begin
        Ini.WriteInteger('params', 'nb_wndstate', 0);
        Ini.WriteInteger('params', 'nb_wndleft', FormNoteBook.Left);
        Ini.WriteInteger('params', 'nb_wndtop', FormNoteBook.Top);
        Ini.WriteInteger('params', 'nb_wndwidth', FormNoteBook.Width);
        Ini.WriteInteger('params', 'nb_wndheight', FormNoteBook.Height);
      end;
    wsMaximized: Ini.WriteInteger('params', 'nb_wndstate', 1);
  end;
  Ini.WriteInteger('params', 'nb_panel1_width', panelTree.Width);
  Ini.WriteInteger('params', 'nb_sg1_col2', SGNotebook.Columns[2].Width);
  Ini.WriteInteger('params', 'nb_sg1_col3', SGNotebook.Columns[3].Width);
  Ini.Free;
end;

procedure TFormNoteBook.RebuildTree(component: TsTreeView);
var
  i: integer;
  Node: TTreeNode;
begin
  component.Items.Clear;
  QueryNotebook.Close;
  QueryNotebook.SQL.Text := 'select * from NOTE_RUBR';
  QueryNotebook.Open;
  QueryNotebook.FetchAll;
  component.Items.BeginUpdate;
  for i := 1 to QueryNotebook.RecordCount do
  begin
    Node := component.Items.AddChildObject(nil,
      QueryNotebook.FieldByName('Name').AsString,
      Pointer(QueryNotebook.FieldByName('ID').AsInteger));
    Node.ImageIndex := 21;
    Node.SelectedIndex := 22;
    QueryNotebook.Next;
  end;
  component.CustomSort(@CustomSortProc, 0, True);
  component.Items.EndUpdate;
  QueryNotebook.Close;
  IBDatabase1.Close;
end;

procedure TFormNoteBook.TVRubrChange(Sender: TObject; Node: TTreeNode);
var
  i, n: integer;
  Query: TIBQuery;
begin
  if TTreeView(Sender).Selected <> nil then
  begin
    SGNotebook.BeginUpdate;
    SGNotebook.ClearRows;
    Query := TIBQuery.Create(FormNoteBook);
    Query.Database := FormMain.IBDatabase1;
    Query.Transaction := FormMain.IBTransaction1;
    QueryNotebook.Close;
    QueryNotebook.SQL.Text := 'select * from NOTE_BASE where ID_RUBRIKA = :ID_RUBRIKA';
    // ID выбраной рубрики, выводим все фирмы для этой рубрики.
    QueryNotebook.ParamByName('ID_RUBRIKA').AsInteger := Integer(TTreeView(Sender).Selected.Data);
    QueryNotebook.Open;
    QueryNotebook.FetchAll;
    if QueryNotebook.RecordCount > 0 then
    begin
      n := 0;
      for i := 1 to QueryNotebook.RecordCount do
      begin
        Query.Close;
        Query.SQL.Text := 'select * from BASE where ID = :ID';
        Query.ParamByName('ID').AsInteger := QueryNotebook.FieldValues['ID_BASE'];
        Query.Open;
        if Query.RecordCount = 0 then
        begin
          inc(n); // запись была удалена из BASE, но не из NOTE_BASE
          sStatusBar1.Panels[1].Text := 'Недействительных записей: ' + IntToStr(n);
        end
        else
        begin
          SGNotebook.AddRow(1);
          SGNotebook.Cells[0, SGNotebook.LastAddedRow] := QueryNotebook.FieldValues['ID'];
          SGNotebook.Cells[1, SGNotebook.LastAddedRow] := QueryNotebook.FieldValues['ID_BASE'];
          SGNotebook.Cells[2, SGNotebook.LastAddedRow] := Query.FieldValues['NAME'];
          SGNotebook.Cells[3, SGNotebook.LastAddedRow] := QueryNotebook.FieldValues['NOTE_DATA'];
        end;
        QueryNotebook.Next;
      end; // for i := 1 to QueryNotebook.RecordCount
    end; // if QueryNotebook.RecordCount > 0
    Query.Close;
    Query.Free;
    SGNotebook.EndUpdate;
    SGNotebook.Resort;
    QueryNotebook.Close;
    IBDatabase1.Close;
  end; // TTreeView(Sender).Selected <> nil
end;

procedure TFormNoteBook.SGNotebookDblClick(Sender: TObject);
var
  ID: string;
begin
  if SGNotebook.SelectedCount = 0 then
    exit;
  ID := SGNotebook.Cells[1, SGNotebook.SelectedRow];
  if Trim(ID) = '' then
    exit;
  FormMain.OpenFirmByID(ID, True);
end;

procedure TFormNoteBook.AddRubr(component: TsTreeView);
var
  name: string;
  ID: integer;
  tmp: TTreeNode;
begin
  name := InputBox('Добавить рубрику', 'Название рубрики:', '');
  if Trim(name) <> '' then
  begin
    QueryNotebook.Close;
    QueryNotebook.SQL.Text := 'insert into NOTE_RUBR (NAME) values (:NAME)';
    QueryNotebook.ParamByName('NAME').AsString := name;
    try
      QueryNotebook.ExecSQL;
    except
      begin
        showmessage('ERROR! Operation terminated.');
        exit;
      end;
    end;
    IBTransaction1.CommitRetaining;
    QueryNotebook.Close;
    QueryNotebook.SQL.Text := 'select MAX(ID) from NOTE_RUBR';
    QueryNotebook.Open;
    ID := QueryNotebook.Fields[0].Value;
    // нада добавлять ИД нода в ДАТУ нода, для это получаем МАХ ИД из БД
    // после создания записи
    tmp := component.Items.AddChildObject(nil, name, Pointer(ID));
    tmp.ImageIndex := 21;
    tmp.SelectedIndex := 22;
    component.CustomSort(@CustomSortProc, 0, True);
  end;
end;

procedure TFormNoteBook.BtnAddRubrClick(Sender: TObject);
begin
  AddRubr(TVRubr);
end;

procedure TFormNoteBook.RenameRubr(component: TsTreeView);
var
  old, new: string;
begin
  if component.Selected = nil then
    exit;
  old := component.Selected.Text;
  new := InputBox('Переименовать рубрику', 'Название рубрики:', old);
  if (Trim(old) <> Trim(new)) and (Trim(new) <> '') then
  begin
    QueryNotebook.Close;
    QueryNotebook.SQL.Text := 'update NOTE_RUBR set NAME = :NAME where ID = :ID';
    QueryNotebook.ParamByName('NAME').AsString := new;
    QueryNotebook.ParamByName('ID').AsInteger := Integer(component.Selected.Data);
    try
      QueryNotebook.ExecSQL;
    except
      begin
        showmessage('ERROR! Operation terminated.');
        exit;
      end;
    end;
    IBTransaction1.CommitRetaining;
    component.Selected.Text := new;
    component.CustomSort(@CustomSortProc, 0, True);
  end;
end;

procedure TFormNoteBook.BtnRenameRubrClick(Sender: TObject);
begin
  RenameRubr(TVRubr);
end;

procedure TFormNoteBook.DeleteRubr(component: TsTreeView);
var
  msg: string;
begin
  if component.Selected = nil then
    exit;
  msg := 'Рубрика "' + component.Selected.Text + '" сейчас будет удалена. Вы уверены?';
  if MessageBox(handle, PAnsiChar(msg), 'Подтверждение',
    MB_YESNO or MB_ICONQUESTION) = ID_YES then
  begin
    QueryNotebook.Close;
    QueryNotebook.SQL.Text := 'delete from NOTE_BASE where ID_RUBRIKA = :ID_RUBRIKA';
    QueryNotebook.ParamByName('ID_RUBRIKA').AsString := IntToStr(Integer(component.Selected.Data));
    try
      QueryNotebook.ExecSQL;
    except
      begin
        showmessage('ERROR! Operation terminated.');
        exit;
      end;
    end;
    IBTransaction1.CommitRetaining;
    QueryNotebook.Close;
    QueryNotebook.SQL.Text := 'delete from NOTE_RUBR where ID = :ID';
    QueryNotebook.ParamByName('ID').AsString := IntToStr(Integer(component.Selected.Data));
    try
      QueryNotebook.ExecSQL;
    except
      begin
        showmessage('ERROR! Operation terminated.');
        exit;
      end;
    end;
    IBTransaction1.CommitRetaining;
    component.Selected.Delete;
  end;
end;

procedure TFormNoteBook.BtnDeleteRubrClick(Sender: TObject);
begin
  DeleteRubr(TVRubr);
end;

procedure TFormNoteBook.nBtnNote_DataClick(Sender: TObject);
var
  old, new: string;
begin
  if SGNotebook.SelectedCount = 0 then
    exit;
  old := SGNotebook.Cells[3, SGNotebook.SelectedRow];
  new := InputBox('Изменить примечание', 'Примечание:', old);
  if Trim(old) <> Trim(new) then
  begin
    QueryNotebook.Close;
    QueryNotebook.SQL.Text := 'update NOTE_BASE set NOTE_DATA = :NOTE_DATA where ID = :ID';
    QueryNotebook.ParamByName('NOTE_DATA').AsString := new;
    QueryNotebook.ParamByName('ID').AsString := SGNotebook.Cells[0, SGNotebook.SelectedRow];
    try
      QueryNotebook.ExecSQL;
    except
      begin
        showmessage('ERROR! Operation terminated.');
        exit;
      end;
    end;
    IBTransaction1.CommitRetaining;
    SGNotebook.Cells[3, SGNotebook.SelectedRow] := new;
  end;
end;

procedure TFormNoteBook.nBtnSendEmailClick(Sender: TObject);
var
  ID: string;
begin
  if SGNotebook.SelectedCount = 0 then
    exit;
  MailSend.EMailScan_Break := False;
  ID := SGNotebook.Cells[1, SGNotebook.SelectedRow];
  FormMailSend.ClearEdits;
  FormMailSend.GetEmailList(1, nil, ID, FormMailSend.editEmailList, True);
  FormMailSend.Show;
  FormMailSend.editTo.SetFocus;
end;

procedure TFormNoteBook.NBtnNBPrintFirmClick(Sender: TObject);
var
  L: TStrings;
begin
  if SGNotebook.SelectedCount = 0 then
    exit;
  if Trim(SGNotebook.Cells[1, SGNotebook.SelectedRow]) <> '' then
  begin
    if FormFirmInfo.Visible then
      FormFirmInfo.Close;
    L := TStringList.Create;
    L.Add(SGNotebook.Cells[1, SGNotebook.SelectedRow]);
    FormNoteBook.PrintRecords(L);
    L.Free;
  end;
end;

procedure TFormNoteBook.NBtnNBDeleteFirmClick(Sender: TObject);
var
  msg: string;
begin
  if TVRubr.Selected = nil then
    exit;
  if SGNotebook.SelectedCount = 0 then
    exit;
  msg := 'Фирма "' + SGNotebook.Cells[2, SGNotebook.SelectedRow] + '" сейчас будет удалена. Вы уверены?';
  if MessageBox(handle, PAnsiChar(msg), 'Подтверждение', MB_YESNO or MB_ICONQUESTION) = ID_YES then
  begin
    QueryNotebook.Close;
    QueryNotebook.SQL.Text := 'delete from NOTE_BASE where ID = :ID';
    QueryNotebook.ParamByName('ID').AsString := SGNotebook.Cells[0, SGNotebook.SelectedRow];
    try
      QueryNotebook.ExecSQL;
    except
      begin
        showmessage('ERROR! Operation terminated.');
        exit;
      end;
    end;
    IBTransaction1.CommitRetaining;
    SGNotebook.DeleteRow(SGNotebook.SelectedRow);
    FormMain.SGAfterSort(SGNotebook, 0); // перекрашиваем таблицу
  end;
end;

procedure TFormNoteBook.TVRubrContextPopup(Sender: TObject;
  MousePos: TPoint; var Handled: Boolean);
var
  treeNode: TTreenode;
begin
  treeNode := TVRubr.GetNodeAt(MousePos.X, MousePos.Y);
  if Assigned(treeNode) then // учим TreeView понимать правый клик
    TVRubr.Selected := treeNode
  else
    Handled := true;
end;

procedure TFormNoteBook.BtnSendEmailAllClick(Sender: TObject);
var
  i: integer;
  ID: string;
begin
  if TVRubr.Selected = nil then
  begin
    MessageBox(Handle, 'Выберите рубрику для рассылки почты.', 'Информация', MB_OK or MB_ICONINFORMATION);
    exit;
  end;
  if SGNotebook.RowCount = 0 then
  begin
    MessageBox(Handle, 'Список фирм для рассылки почты пуст.', 'Информация', MB_OK or MB_ICONINFORMATION);
    exit;
  end;
  MailSend.EMailScan_Break := False;
  FormMain.Enabled := False;
  FormMailSend.btnSend.Enabled := False;
  FormMailSend.sGauge1.MinValue := 0;
  FormMailSend.sGauge1.MaxValue := SGNotebook.RowCount - 1;
  FormMailSend.sGauge1.Progress := 0;
  FormMailSend.sGauge1.Visible := True;
  FormMailSend.editEmailList.Clear;
  FormMailSend.Show;
  try
    for i := 0 to SGNotebook.RowCount - 1 do
    begin
      if MailSend.EMailScan_Break then
        Break;
      ID := SGNotebook.Cells[1, i];
      if Trim(ID) <> '' then
      begin
        FormMailSend.GetEmailList(1, nil, ID, FormMailSend.editEmailList, False);
        FormMailSend.sGauge1.Progress := i;
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

procedure TFormNoteBook.btnPrintAllClick(Sender: TObject);
var
  ID: TStrings;
  i: integer;
begin
  if TVRubr.Selected = nil then
  begin
    MessageBox(Handle, 'Выберите рубрику для печати.', 'Информация', MB_OK or MB_ICONINFORMATION);
    exit;
  end;
  if SGNotebook.RowCount = 0 then
  begin
    MessageBox(Handle, 'Список фирм для печати пуст.', 'Информация', MB_OK or MB_ICONINFORMATION);
    exit;
  end;
  ID := TStringList.Create;
  for i := 0 to SGNotebook.RowCount - 1 do
    ID.Add(SGNotebook.Cells[1, i]);
  PrintRecords(ID);
  ID.Free;
end;

procedure TFormNoteBook.PrintRecords(ID_List: TStrings);
var
  i, n: integer;
  ID: string;
  CDS: TClientDataSet;
  Q: TIBQuery;
  List1, List2: TStrings;
  FullAdresString, FullNaprString, FullWebString, FullEMailString, FullString: string;
  PhonesAll, PhonesCurrent, AdresAll, AdresCurrent, NaprAll, NaprCurrent: string;
  WEBAll, WebCurrent, EMAILAll, EMAILCurrent: string;
  city_str, country_str, ofType, zip_str, adres: string;
begin
  if ID_List.Count = 0 then
    exit;
  CDS := TClientDataSet.Create(FormNoteBook);
  CDS.FieldDefs.Add('NAME', ftString, 255);
  CDS.FieldDefs.Add('DATA', ftMemo, 0);
  CDS.CreateDataSet;
  frxDBDataset.DataSet := CDS;
  frxReport.LoadFromFile(AppPath + 'report.dat');
  Q := TIBQuery.Create(FormNoteBook);
  Q.Database := FormMain.IBDatabase1;
  Q.Transaction := FormMain.IBTransaction1;
  try
    for i := 0 to ID_List.Count - 1 do
    begin
      ID := ID_List[i];
      if Trim(ID) <> '' then
      begin
        Q.Close;
        Q.Sql.Text := 'select * from BASE where ID = :ID';
        Q.ParamByName('ID').AsString := ID;
        Q.Open;
        if Q.RecordCount = 0 then
          Continue;
        CDS.Append;
        CDS.FieldByName('NAME').AsString := Q.FieldByName('NAME').AsString;
        FullString := '';

        List1 := TStringList.Create;
        List2 := TStringList.Create;
        List1.Text := Q.FieldValues['ADRES'];
        PhonesAll := Q.FieldValues['PHONES'];
        FullAdresString := '';
        for n := 0 to List1.Count - 1 do
        begin
          AdresAll := List1[n];
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
              ofType := FormMain.GetNameByID('OFFICETYPE', ofType) + ' - ';
            if Trim(zip_str) <> '' then
              zip_str := zip_str + ', ';
            if Trim(country_str) <> '' then
              country_str := FormMain.GetNameByID('COUNTRY', country_str) + ', ';
            if Trim(city_str) <> '' then
              city_str := FormMain.GetNameByID('GOROD', city_str) + ', ';
            adres := ofType + zip_str + country_str + city_str + list2[4];
            {officetype - zip, country, city, street}
            if Trim(adres) <> '' then
              FullAdresString := FullAdresString + #13 + adres;
            if Trim(PhonesCurrent) <> '' then
              FullAdresString := FullAdresString + #13 + PhonesCurrent;
          end;
        end;
        List1.Free;
        List2.Free;
        if Length(FullAdresString) > 0 then
          if FullAdresString[1] = #13 then
            delete(FullAdresString, 1, 1);
        if Trim(FullAdresString) <> '' then
          FullString := FullString + FullAdresString + #13;

        FullNaprString := '';
        if (Q.FieldValues['NAPRAVLENIE'] <> null) and (Trim(Q.FieldValues['NAPRAVLENIE']) <> '') then
        begin
          NaprAll := Q.FieldValues['NAPRAVLENIE'];
          while pos('$', NaprAll) > 0 do
          begin
            NaprCurrent := copy(NaprAll, 0, pos('$', NaprAll));
            delete(NaprAll, 1, length(NaprCurrent));
            delete(NaprCurrent, 1, 1);
            delete(NaprCurrent, length(NaprCurrent), 1);
            if Trim(NaprCurrent) <> '' then
              FullNaprString := FullNaprString + #13 + FormMain.GetNameByID('NAPRAVLENIE', NaprCurrent);
          end;
          if Length(FullNaprString) > 0 then
            if FullNaprString[1] = #13 then
              delete(FullNaprString, 1, 1);
          if Trim(FullNaprString) <> '' then
            FullString := FullString + FullNaprString + #13;
        end;

        FullWebString := '';
        if (Q.FieldValues['WEB'] <> null) and (Trim(Q.FieldValues['WEB']) <> '') then
        begin
          WebAll := Q.FieldValues['WEB'];
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
              if Trim(WebCurrent) <> '' then
                FullWebString := FullWebString + #13 + WebCurrent;
            end;
          end;
          if Length(FullWebString) > 0 then
            if FullWebString[1] = #13 then
              delete(FullWebString, 1, 1);
          if Trim(FullWebString) <> '' then
            FullString := FullString + FullWebString + #13;
        end;

        FullEMailString := '';
        if (Q.FieldValues['EMAIL'] <> null) and (Trim(Q.FieldValues['EMAIL']) <> '') then
        begin
          EmailAll := Q.FieldValues['EMAIL'];
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
              if Trim(EmailCurrent) <> '' then
                FullEMailString := FullEMailString + #13 + EmailCurrent;
            end;
          end;
          if Length(FullEMailString) > 0 then
            if FullEMailString[1] = #13 then
              delete(FullEMailString, 1, 1);
          if Trim(FullEMailString) <> '' then
            FullString := FullString + FullEMailString + #13;
        end;
        FullString := Trim(FullString);
        if FullString <> '' then
          CDS.FieldByName('DATA').AsString := FullString;
      end; // if Trim(ID) <> ''
    end; // for i := 0 to ID_List.Count - 1
    frxReport.ShowReport(True);
  finally
    CDS.Close;
    CDS.Free;
    Q.Close;
    Q.Free;
  end;
end;

end.
