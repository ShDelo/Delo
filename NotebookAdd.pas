unit NotebookAdd;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, sSpeedButton, ExtCtrls, sPanel, StdCtrls, sCheckBox,
  sEdit, sComboBox, IniFiles, ComCtrls, sLabel, NxScrollControl,
  NxCustomGridControl, NxCustomGrid, NxGrid;

type
  TFormNotebookAdd = class(TForm)
    panelGeneral: TsPanel;
    btnAdd: TsSpeedButton;
    btnCancel: TsSpeedButton;
    btnCreateRubr: TsSpeedButton;
    editRubr: TsComboBox;
    editNotes: TsEdit;
    cbOpenAfterAdding: TsCheckBox;
    lblID: TsLabel;
    procedure IniLoad;
    procedure IniSave;
    procedure ClearEdits;
    procedure GetRubrList;
    procedure FormCreate(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure btnCreateRubrClick(Sender: TObject);
    procedure btnAddClick(Sender: TObject);
  private
    { Private declarations }
  public
    procedure CreateParams(var Params: TCreateParams); override;
    { Public declarations }
  end;

var
  FormNotebookAdd: TFormNotebookAdd;

implementation

uses Main, Notebook, DBAccess;

{$R *.dfm}

procedure TFormNotebookAdd.CreateParams(var Params: TCreateParams);
begin
  inherited CreateParams(Params);
  Params.ExStyle := Params.ExStyle or WS_Ex_AppWindow;
end;

function CustomSortProc(Node1, Node2: TTreeNode; iUpToThisLevel: Integer): Integer; stdcall;
begin
  Result := AnsiStrIComp(PChar(Node1.Text), PChar(Node2.Text));
end;

procedure TFormNotebookAdd.FormCreate(Sender: TObject);
begin
  IniLoad;
  ClearEdits;
end;

procedure TFormNotebookAdd.ClearEdits;
begin
  if editRubr.Items.Count > 0 then
    editRubr.ItemIndex := 0
  else
    editRubr.ItemIndex := -1;
  editNotes.Text := '';
end;

procedure TFormNotebookAdd.GetRubrList;
var
  i: integer;
begin
  with FormNotebook.QueryNotebook do
  begin
    Close;
    SQL.Text := 'select * from NOTE_RUBR order by lower(NAME)';
    Open;
    FetchAll := True;
    if RecordCount = 0 then
      exit;
    editRubr.Clear;
    for i := 1 to RecordCount do
    begin
      editRubr.AddItem(FieldValues['NAME'], Pointer(Integer(FieldValues['ID'])));
      Next;
    end;
    Close;
    FormNotebook.IBDatabase1.Close;
  end;
end;

procedure TFormNotebookAdd.IniLoad;
begin
  Ini := TIniFile.Create(AppData + IniFile);
  cbOpenAfterAdding.Checked := Ini.ReadBool('params', 'nbadd_cb1', False);
  Ini.Free;
end;

procedure TFormNotebookAdd.IniSave;
begin
  Ini := TIniFile.Create(AppData + IniFile);
  Ini.WriteBool('params', 'nbadd_cb1', cbOpenAfterAdding.Checked);
  Ini.Free;
end;

procedure TFormNotebookAdd.btnCancelClick(Sender: TObject);
begin
  FormNotebookAdd.Close;
end;

procedure TFormNotebookAdd.btnCreateRubrClick(Sender: TObject);
var
  Rubr_name: string;
  ID: integer;
  tmp: TTreeNode;
begin
  Rubr_name := InputBox('Добавить рубрику', 'Название рубрики:', '');
  if Trim(Rubr_name) <> '' then
    with FormNoteBook.QueryNotebook do
    begin
      Rubr_name := Trim(Rubr_name);
      Close;
      SQL.Text := 'insert into NOTE_RUBR (NAME) values (:NAME) returning ID';
      ParamByName('NAME').AsString := Rubr_name;
      try
        Execute;
      except
        begin
          showmessage('ERROR! Operation terminated.');
          exit;
        end;
      end;
      ID := ParamByName('RET_ID').AsInteger;
      tmp := FormNotebook.TVRubr.Items.AddChildObject(nil, Rubr_name, Pointer(ID));
      tmp.ImageIndex := 21;
      tmp.SelectedIndex := 22;
      FormNotebook.TVRubr.CustomSort(@CustomSortProc, 0, True);
      editRubr.AddItem(Rubr_name, Pointer(Integer(ID)));
      editRubr.ItemIndex := editRubr.Items.Count - 1;
    end;
end;

procedure TFormNotebookAdd.btnAddClick(Sender: TObject);
var
  Rubr_ID, ID: string;
  Node: TTreeNode;
begin
  if editRubr.ItemIndex = -1 then
  begin
    MessageBox(handle, 'Необходимо указать рубрику для записи', 'Информация', mb_OK or MB_ICONINFORMATION);
    exit;
  end;
  Rubr_ID := IntToStr(Integer(editRubr.Items.Objects[editRubr.ItemIndex]));
  ID := lblID.Caption;
  with FormNoteBook.QueryNotebook do
  begin
    Close;
    SQL.Text := 'insert into NOTE_BASE (ID_BASE,ID_RUBRIKA,NOTE_DATA) values (:ID_BASE,:ID_RUBRIKA,:NOTE_DATA)';
    ParamByName('ID_BASE').AsString := ID;
    ParamByName('ID_RUBRIKA').AsString := RUBR_ID;
    ParamByName('NOTE_DATA').AsString := Trim(editNotes.Text);
    try
      Execute;
    except
      begin
        showmessage('ERROR! Operation terminated.');
        exit;
      end;
    end;
    Close;
    FormNotebookAdd.Close;
  end;
  if cbOpenAfterAdding.Checked then
  begin
    Node := FormMain.SearchNode(FormNoteBook.TVRubr, StrToInt(Rubr_ID));
    FormNoteBook.TVRubr.OnChange := nil;
    FormNoteBook.TVRubr.Selected := Node;
    FormNoteBook.TVRubr.OnChange := FormNoteBook.TVRubrChange;
    FormNoteBook.TVRubrChange(FormNoteBook.TVRubr, Node);
    FormNoteBook.SGNotebook.FindText(1, ID, [soCaseInsensitive, soExactMatch]);
    FormNoteBook.Show;
    FormNoteBook.SGNotebook.SetFocus;
  end;
end;

end.
